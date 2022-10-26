<?php session_start();



$esClienteRegistrado = $_POST['esClienteRegistrado'];
if($esClienteRegistrado == true){
    $id=$_POST['id'];
    $password= md5($_POST['password']);
    $estado_pedido = "en proceso";

    $_SESSION['esClienteRegistrado'] = $esClienteRegistrado;
    
    include("registro_clientes/conexion.php");
    
    $consulta=mysqli_query($conexion, "SELECT apellido, nombre FROM clientes_registrados WHERE id_cliente='$id' AND contraseña='$password'");
    
    $resultado=mysqli_num_rows($consulta);
    echo $resultado;
    if($resultado != 0){
        $respuesta=mysqli_fetch_array($consulta);
        $_SESSION['id_cliente'] = $id;
        $_SESSION['apellido_cliente'] = $respuesta['apellido'];
        $_SESSION['nombre_cliente'] = $respuesta['nombre'];
        header("Location:menu.php");
        exit();
    }
    else{
        Session_destroy();
        header("Location:falloLogin.php");
        exit();
    }
}
else{
    //$esClienteNoRegistradoConsulta = mysqli_query($conexion, "SELECT id_cliente FROM clientes_registrados WHERE apellido= 'cliente no registrado'");
    //$esClienteNoRegistrado = mysqli_fetch_array($esClienteNoRegistradoConsulta);
    //$_SESSION['id_cliente'] = $esClienteNoRegistrado['id_cliente'];
    $_SESSION['id_cliente'] = 7;
    $_SESSION['esClienteRegistrado'] = $esClienteRegistrado;
    header("Location:menu.php");
}

?>
