<?php
    require 'config.php';
    require 'conexionPDO.php';

    if(isset($_POST['accion'])){
        $accion = $_POST['accion'];
        $id_menu = isset($_POST['id_menu']) ? $_POST['id_menu'] : 0;

        if($accion == 'agregar'){
            $cantidad = isset($_POST['cantidad']) ? $_POST['cantidad'] : 0;
            $resultado = agregar($id_menu, $cantidad);
            if($resultado > 0){
                $datos['validar'] = true;
            }
            else{
                $datos['validar'] = false;
            }
            $datos['sub'] = $resultado;
        }else if($accion == 'eliminar'){
            $datos['validar'] = eliminar($id_menu);
        }
        else {
            $datos['validar'] = false;
        }
    }
    else{
        $datos['validar'] = false;
    }
    echo json_encode($datos);
    function agregar($id_menu, $cantidad){
        $respuesta = 0;
        if($id_menu > 0 && $cantidad > 0 && is_numeric($cantidad)){
            if(isset($_SESSION['carrito']['menus'][$id_menu])){
                $_SESSION['carrito']['menus'][$id_menu] = $cantidad;

                $db = new Database();
                $conexion = $db->conectar();
                $sql = $conexion->prepare("SELECT precio FROM menu WHERE id_menu=? LIMIT 1");
                $sql->execute([$id_menu]);
                $row = $sql->fetch(PDO::FETCH_ASSOC);
                $precio_menu = $row['precio'];
                $respuesta = $cantidad * $precio_menu;

                return $respuesta;
            }
        }
        else{
            return $respuesta = 0;
        }
    }

    function eliminar($id_menu){
        if($id_menu > 0){
            if(isset($_SESSION['carrito']['menus'][$id_menu])){
                unset($_SESSION['carrito']['menus'][$id_menu]);
                return true;
            }
        }
        else{
            return false;
        }
    }
?>