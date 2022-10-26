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
            $sql = $con->prepare("SELECT DISTINCT menu.id_menu, menu.nombre_menu, menu.precio, productos.stock, $cantidad AS cantidad FROM menu, productos, menu_productos WHERE menu.id_menu=? AND menu_productos.id_menu = menu.id_menu and menu_productos.id_producto = productos.id_producto;");
            $sql->execute([$clave]);                                                                        
            $lista_carrito[] = $sql->fetch(PDO::FETCH_ASSOC);
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
        <div>
            <table>
                <thead>
                    <tr>
                        <th>Menu</th>
                        <th>Precio</th>
                        <th>Cantidad</th>
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
                            $stock_menu = $menu['stock'];
                            $_subtotal = $cantidad * $_precio;
                            $_total += $_subtotal;
                        ?>
                    
                    <tr>
                        <td> <?php echo $_nombre_menu; ?> </td>
                        <td> <?php echo $_precio; ?> </td>
                        <td> <input type="number" min="1" max="<?php echo $stock_menu;?>" step="1" value="<?php echo $cantidad; ?>" size="5" id_menu="cantidad_<?php echo $_id_menu;?>" onchange="actualizaCantidad(this.value, <?php echo $_id_menu;?>)"> </td>
                        <td>  
                            <div id="subtotal_<?php echo $_id_menu;?>" name="subtotal[]">
                                <?php echo $_subtotal; ?>
                            </div>
                        </td>
                        <td> <a id="eliminar" class="btn btn-warning btn-sm" data-bs-id="<?php echo $_id_menu;?>" data-bs-toggle="modal" data-bs-target="#eliminaModal">Eliminar</a> </td>

                    </tr>
                    <?php } ?>
                    <tr>
                        <td colspan="3">Total </td>
                        <td colspan="2">
                            <p id="total">
                                <?php echo $_total;?>
                            </p>
                        </td>
                    </tr>
                </tbody>
                <?php } ?>
            </table>
            <?php if($lista_carrito != null){?>
            <div class="submit" >
                <a href="pago.php">Realizar pago</a>
            </div>
            <?php } ?>
            <form action="menu.php">
            <div class="submit">
                <input type="submit" value="Volver"/>	
            </div>
        </form>
        </div>
    </article>
</main>

<!-- Modal -->
<div class="modal fade" id="eliminaModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Alerta</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ¿DESEA ELIMINAR EL MENU DE LA LISTA?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
        <button id="btn-elimina" type="button" class="btn btn-danger" onclick="eliminar()">Eliminar</button>
      </div>
    </div>
  </div>
</div>

    <script>

        let eliminarModal = document.getElementById('eliminaModal')
        eliminarModal.addEventListener('show.bs.modal', function(event){
            let button = event.relatedTarget
            let id = button.getAttribute('data-bs-id')
            let buttonElimina = eliminarModal.querySelector('.modal-footer #btn-elimina')
            buttonElimina.value = id
        })

        function actualizaCantidad(cantidad, id_menu){
            let url = 'actualizar_carrito.php'
            let formData = new FormData()
            formData.append('accion', 'agregar')
            formData.append('id_menu', id_menu)
            formData.append('cantidad', cantidad)

            fetch(url, { method: 'POST', body: formData, mode: 'cors'}).then(response => response.json())
            .then(data =>{ 
                if(data.validar){// si es verdadero es xq se guardaron menus
                    let divsubtotal = document.getElementById('subtotal_' + id_menu)
                    divsubtotal.innerHTML = data.sub

                    let total = 0.00;
                    let list = document.getElementsByName('subtotal[]');

                    for(let i=0; i < list.length; i++){
                        total += parseFloat(list[i].innerHTML)
                    }
                    document.getElementById('total').innerHTML = total;
                }
            })
        }

        function eliminar(){

            let botonElimina = document.getElementById('btn-elimina')
            let id = botonElimina.value
            let url = 'actualizar_carrito.php'
            let formData = new FormData()
            formData.append('accion', 'eliminar')
            formData.append('id_menu', id)

            fetch(url, { method: 'POST', body: formData, mode: 'cors'}).then(response => response.json())
            .then(data =>{ 
                if(data.validar){// si es verdadero es xq se guardaron menus
                    location.reload()
                }
            })
        }
    </script>

<footer>
    
</footer>
   
    
</body>
</html>
