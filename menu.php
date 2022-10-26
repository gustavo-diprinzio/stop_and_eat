<?php
    require 'config.php';
    require 'conexionPDO.php';
    $db = new Database();
    $con = $db->conectar();

    //creo la consulta
    $sql = $con->prepare("SELECT menu.id_menu, menu.nombre_menu, menu.precio, productos.stock FROM menu, productos, menu_productos WHERE menu_productos.id_menu = menu.id_menu and menu_productos.id_producto = productos.id_producto;");
    $sql->execute();
    $resultado = $sql->fetchAll(PDO::FETCH_ASSOC);

?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>STOP & EAT</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
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
            <a href="checkout.php" class="boton_carrito">Carrito <span id="num_cart"> <?php echo $num_cart; ?> </span> </a>
        </nav>
    </header>

<main>
    <h2>Hamburguesas</h2>
    <article class="secundario">
    <?php foreach($resultado as $row){ ?>
        <div> 
            <?php 
                $id_menu = $row['id_menu'];
               
                $imagen = "menu-img/" . $id_menu . ".jpg";
                if(!file_exists($imagen)){
                    $imagen = "menu-img/noFoto.jpg";
                }
            ?>
            <?php if($row['stock'] >0){?>
                <h3> <?php echo $row['nombre_menu']; ?> </h3> 
                <img class="circulo" src="<?php echo $imagen; ?>">
                <h3> <?php echo $row['precio']; ?> </h3>
            <div class="botonMenu">
                <a class="btn btn-warning" href="detalles.php?id_menu=<?php echo $row['id_menu'];?>&token=<?php echo hash_hmac('sha1', $row['id_menu'], KEY_TOKEN);?>">DETALLES</a>
                <a class="btn btn-warning" type="button" onclick="añadirProducto('<?php echo $row['id_menu'];?>', '<?php echo hash_hmac('sha1', $row['id_menu'], KEY_TOKEN);?>' )">Agregar al carrito</a>
            </div>
            
            <?php }else{ ?>
                <?php 
                if(!file_exists($imagen)){
                    $imagen = "menu-img/noFoto.jpg";
                }
            ?>
                <h3> <?php echo $row['nombre_menu']; ?> </h3> 
                <img class="circulo" src="<?php echo $imagen; ?>">
                <h3> <?php echo $row['precio']; ?> </h3>
                <div class="botonMenu">
                    <a class="btn btn-warning">NO STOCK</a>
                </div>
            <?php } ?>
        </div>
        <?php } ?>
        <?php if($_SESSION['esClienteRegistrado'] == true){ ?>
            <form action="cerrarSesionClientes.php" method="post" >
                    <div class="submit"> 
                        <input id="selecionarMenu" type="submit" value="Cerrar Sesion">
                    </div>   
            </form> 
        <?php } ?>
    </article>
</main>


    <script>
        function añadirProducto(id_menu, token){
            let url = 'carrito.php'
            let formData = new FormData()
            formData.append('id_menu', id_menu)
            formData.append('token', token)

            fetch(url, { method: 'POST', body: formData, mode: 'cors'}).then(response => response.json())
            .then($data =>{
                if(data.validar){// si es verdadero es xq se guardaron menus
                    let elemento = document.getElementById("num_cart")
                    elemento.innerHTML = data.numero
                }
            })
        }
    </script>
    
<footer>
    
</footer>
   
    
</body>
</html>
