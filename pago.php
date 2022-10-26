<?php
    require 'config.php';
    require 'conexionPDO.php';
    $db = new Database();
    $con = $db->conectar();

    $menus = isset($_SESSION['carrito']['menus']) ? $_SESSION['carrito']['menus'] : null;

    $lista_carrito = array();
    if($menus != null){
        foreach($menus as $clave => $cantidad){
             //creo la consulta
            $sql = $con->prepare("SELECT DISTINCT menu.id_menu, menu.nombre_menu, menu.precio, $cantidad AS cantidad FROM menu, productos, menu_productos WHERE menu.id_menu=? AND menu_productos.id_menu = menu.id_menu and menu_productos.id_producto = productos.id_producto;");
            $sql->execute([$clave]);
            $lista_carrito[] = $sql->fetch(PDO::FETCH_ASSOC);
        }
    }
    else{
        header("Location:index.php");
        exit();
    }
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>STOP & EAT</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
    <header>
        <div class="header_titulo"> 
            <img src="menu-img/logo.jfif" alt="">
        </div>
        <nav class="navegacion" id="navegacion">
            <ul class="menu">
                <li><a class="texto_nav" href="registro_clientes/registro.html">Registrarse</a> </li>
                <li><a class="texto_nav" href="admins/comprobarSiEsEmpleado.php">Registro/Inicio Secion Empleados</a></li>
            </ul>
            <a href="carrito.php" class="button" >Carrito <span id="num_cart"> <?php echo $num_cart; ?> </span> </a>
        </nav>
    </header>

<main>
    <article class="secundario">
        <div class="row">
            <div class="col-6">
                <h4>Detalles de pago</h4>
            </div>
            <div class="col-6">
                <div>
                    <table>
                        <thead>
                            <tr>
                                <th>Menu</th>
                                <th>Subtotal</th>
                            </tr>
                        </thead>
                     <tbody>
                        <?php if($lista_carrito == null){
                            echo '<tr><td colspan = "5">  <b>Lista Vacia</b> </td></tr>';
                        }
                        else{
                            $_total = 0;
                            foreach($lista_carrito as $menu){
                                $_id_menu = $menu['id_menu'];
                                $_nombre_menu = $menu['nombre_menu'];
                                $cantidad = $menu['cantidad'];
                                $_precio = $menu['precio'];
                                $_subtotal = $cantidad * $_precio;
                                $_total += $_subtotal;
                            ?>
                    
                        <tr>
                            <td> <?php echo $_nombre_menu; ?> </td>
                            <td>  
                                <div id="subtotal_<?php echo $_id_menu;?>" name="subtotal[]">
                                    <?php echo $_subtotal; ?>
                                </div>
                            </td>
                        </tr>
                        <?php } ?>
                        <tr>
                            <?php if($_SESSION['esClienteRegistrado'] == true){?>
                            <td colspan="3">Total </td>
                            <td colspan="2">
                                <p id="total">
                                    <?php echo  $_total -= ($_total * 20)/100; 
                                    $_SESSION['totalFinal'] = $_total;?>
                                </p>
                            </td>
                            <?php }else{?>
                                <td colspan="3">Total </td>
                                <td colspan="2">
                                <p id="total">
                                    <?php echo $_total; $_SESSION['totalFinal'] = $_total;?>
                                </p>
                            </td>
                            <?php }?>
                        </tr>
                    </tbody>
                    <?php } ?>
                </table>
            </div>
        </div>
    </article>

    <section id="formulario">
        <div class="columnas_de_contacto">
            <h2>Procesar pago</h2>
            <form action="captura.php" method="post">
                <div class="nombreyapellido">
                    <label > Metodo de pago </label>  
                    <select id="seleccionar" name="metodo_pago">
                        <option  value="efectivo" class="selectitemAmi1">Efectivo</option>
                        <option  value="tarjeta" class="selectitemAmi1">Tarjeta</option>
                    </select>
                </div>
                
                <div class="submit"> 
                    <input type="submit" value="Finalizar pedido"/>	
                </div>   
            </form>
            <div>
            <div id="hola" class="nombreyapellido">
                <label> Numero tarjeta </label>  
                <input type="number" placeholder="Numero tarjeta" required>
                <label> PIN </label>  
                <input type="number" placeholder="Ingrese su PIN" required>
            </div>
        </div>
        </div> 
    </section>
    <script src="scripts.js"></script>
</main>

    

<footer>
    
</footer>
   
    
</body>
</html>
