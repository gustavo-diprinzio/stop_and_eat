<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Registro Clientes</title>
</head>
<body>
    <header>
        <div class="header_titulo"> 
            <a href=""> <img src="menu-img/logo.jfif" alt=""> </a>
        </div>
    </header>

    <section class="formularioo" id="formulario">
        <div class="columnas_de_contacto">
            <h2>Login</h2>
            <form action="loginClientes.php" method="post">
                <div class="nombreyapellido">
                    <label> Numero de registro </label>
                    <input name="id" type="number" placeholder="Ingrese Numero de registro" required>
                </div>
                
                <div class="bloque_datos">
                    <label > Contraseña </label>  
                    <input type="password" name="password" placeholder=" Ingresá su contraseña" required>
                </div>
                <input type="hidden" name="esClienteRegistrado" value = <?php echo true; ?>>
                <div class="submit"> 
                    <input type="submit" value="Iniciar Secion"/>	
                </div>   
            </form>
            <form action="registro_clientes/registro.html">
                <div class="submit"> 
                    <input type="submit" value="Registrarse"/>	
                </div> 
            </form>
        </div> 
    

    <!--ARREGLAR LA COLUMNA DE PAGO-->
    <div class="columnas_de_contacto">
    <h3 class="bug" >Comprar sin registro</h3>
    <h3>(solo para clientes no registrados)</h3>
            <form action="loginClientes.php" method="post">
                 <!--<div class="nombreyapellido">
                    <label> Nombre </label>
                    <input name="nombre" type="text" placeholder="Ingresá su nombre" required>
                </div>
                <div class="nombreyapellido">
                    <label> Apellido </label>
                    <input name="apellido" type="text" placeholder="Ingresá su apellido" required>
                </div>-->
                <input type="hidden" name="esClienteRegistrado" value = <?php echo false; ?>>
                <div class="submit"> 
                    <input type="submit" value="Ver menu"/>	
                </div> 
            </form>
        </div>
    </section>
    
</body>
</html>
