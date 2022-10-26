<?php
    require 'config.php';
    require 'conexionPDO.php';
    $db = new Database();
    $con = $db->conectar();
    include("registro_clientes/conexion.php");

    $timezoneId = "America/Argentina/Buenos_Aires";
    date_default_timezone_set($timezoneId);
    $fecha = date("Y") . date("m") . date("d") . date("h") . date("i") . date("s");

    $totalFinal = $_SESSION['totalFinal'];
    $metodo_de_pago = $_POST['metodo_pago'];

    $registroPago = mysqli_query($conexion, "INSERT INTO pago(monto, metodo_de_pago) VALUES('$totalFinal', '$metodo_de_pago')");
    
    //obtengo el ultimo id_pago
    $idpago = "SELECT id_pago FROM pago ORDER by id_pago desc;";
    $idPago = mysqli_query($conexion, $idpago);

    $id_pago = mysqli_fetch_array($idPago);
    $_SESSION['id_pago'] = $id_pago['id_pago'];


    $id_cliente = $_SESSION['id_cliente']; 
    $estado_pedido = "Completado";
    $id_pago = $_SESSION['id_pago'];

    $registroPedido = mysqli_query($conexion, "INSERT INTO pedidos(fecha, estado, id_cliente, id_pago) VALUES('$fecha', '$estado_pedido', '$id_cliente', '$id_pago')");

    //obtengo el ultimo id_pedido
    $idpedido = "SELECT id_pedido FROM pedidos ORDER by id_pedido desc;";
    $id_pedido = mysqli_query($conexion, $idpedido);

    $idPedido = mysqli_fetch_array($id_pedido);
    $_SESSION['id_pedido'] = $idPedido['id_pedido'];
    $id_pedido = $_SESSION['id_pedido'];

    $menus = isset($_SESSION['carrito']['menus']) ? $_SESSION['carrito']['menus'] : null;
    if($menus != null){
        foreach($menus as $clave => $cantidad){
             //creo la consulta
            $sql = $con->prepare("SELECT DISTINCT menu.id_menu, menu.nombre_menu, menu.precio, $cantidad AS cantidad FROM menu, productos, menu_productos WHERE menu.id_menu=? AND menu_productos.id_menu = menu.id_menu and menu_productos.id_producto = productos.id_producto;");
            $sql->execute([$clave]);
            $row_menu[] = $sql->fetch(PDO::FETCH_ASSOC);

            $pedido_menu_consulta = $con->prepare("INSERT INTO pedido_menu(id_pedido, id_menu, cantidad_menu) VALUES('$id_pedido', ?, ?)");
            $pedido_menu_consulta->execute([$clave, $cantidad]);

            //restar stocks
            $reducir_stock_consulta = $con->prepare("UPDATE productos SET stock = stock - ? WHERE productos.id_producto = ?");
            $reducir_stock_consulta->execute([$cantidad, $clave]);

            //genero ticket
            $generoTicket = mysqli_query($conexion, "INSERT INTO ticket(fecha, id_pedido) VALUES('$fecha', '$id_pedido')");
            session_destroy();
            header("Location:generarTicketPDF.php");
        }
    }
?>
