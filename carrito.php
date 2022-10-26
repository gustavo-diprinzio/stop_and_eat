<?php
    require 'config.php';

    if(isset($_POST['id_menu'])){
        $id_menu = $_POST['id_menu'];
        $cantidad = $_POST['cantidad'];
        $token = $_POST['token'];

        $token_tmp = hash_hmac('sha1', $id_menu, KEY_TOKEN);
        //si el token del usuario es igual al generado sigo
        if($token == $token_tmp){
            
            //si ya se agrego uno verifico si existe y agrego de uno en uno
            if(isset($_SESSION['carrito']['menus'][$id_menu])){
                $_SESSION['carrito']['menus'][$id_menu] += $cantidad;
            }// si no existe entonces agrego 1
            else{
                $_SESSION['carrito']['menus'][$id_menu] = 1;
            }

            $datos['numero'] = count($_SESSION['carrito']['menus']);//cuento los menus
            $datos['validar'] = true;
        }   
        else{
            $datos['validar'] = false;
        }
    }
    else{
        $datos['validar'] = false;
    }

    echo json_encode($datos);

?>