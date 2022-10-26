<?php 

define("KEY_TOKEN", "A.B*C.20*");
session_start();

$num_cart=0;

if(isset($_SESSION['carrito']['menus'])){
    $num_cart = count($_SESSION['carrito']['menus']);
}
?>