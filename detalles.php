<?php
    require 'config.php';
    require 'conexionPDO.php';
    $db = new Database();
    $con = $db->conectar();

    //si existe lo guarda normal sino guarda un dato vacio. evita errores
    $id_menu = isset($_GET['id_menu']) ? $_GET['id_menu'] : '';
    $token = isset($_GET['token']) ? $_GET['token'] : '';


    if($id_menu == '' || $token == ''){
        echo "Error al procesar la peticion";
        exit();
    }
    else{
        //genero el token con cifrado sha1
        $token_tmp = hash_hmac('sha1', $id_menu, KEY_TOKEN);
        //si el token del usuario es igual al generado sigo
        if($token == $token_tmp){

            $sql = $con->prepare("SELECT count(id_menu) FROM menu WHERE id_menu=?");
            $sql->execute([$id_menu]);
            if($sql->fetchColumn() > 0){
                //existe el id del menu        SELECT nombre_menu, precio FROM menu WHERE id_menu=? LIMIT 1
                $sql = $con->prepare("SELECT nombre_menu, precio, stock FROM menu, productos, menu_productos WHERE menu.id_menu=? AND menu_productos.id_producto=productos.id_producto AND menu_productos.id_menu = menu.id_menu LIMIT 1");
                $sql->execute([$id_menu]);
                $row = $sql->fetch(PDO::FETCH_ASSOC);
                $nombre_menu = $row['nombre_menu'];
                $precio_menu = $row['precio'];
                $stock_menu = $row['stock'];
            }
        }
        else{
            echo "Error al procesar la peticion";
            exit();
        }
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

    <article class="secundario">
        <div class>
            <?php 
                $imagen = "menu-img/" . $id_menu . ".jpg";
                if(!file_exists($imagen)){
                    $imagen = "menu-img/noFoto.jpg";
                }
            ?>  
            <img class="circulo" src="<?php echo $imagen; ?>">
      </div>
      <div>
        <h2><?php echo $nombre_menu;?>  </h2>
        <h2>$<?php echo $precio_menu;?> </h2>
        <div class="submit">
            <input id="cantidad" name="cantidad" type="number" min="1" max="<?php echo $stock_menu;?>" value="1">
        </div>

        <div class="botonMenu">
            <a class="btn btn-warning" type="button" onclick="añadirProducto('<?php echo $id_menu;?>', cantidad.value, '<?php echo $token_tmp;?>')">Agregar al carrito</a>
        </div>
        <form action="menu.php">
            <div class="botonMenu">
            <a href="menu.php" class="btn btn-warning" type="button">Volver</a>
            </div>
        </form>
      </div>
    </article>

    <script>
        function añadirProducto(id_menu, cantidad, token){

            let url = 'carrito.php'
            let formData = new FormData()
            formData.append('id_menu', id_menu)
            formData.append('cantidad', cantidad)
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
</main>

<footer>
    
</footer>
   
    
</body>
</html>
