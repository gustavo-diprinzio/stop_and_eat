<?php

class Database{
    private $hostname = "localhost";
    private $databse = "STOP_AND_EAT";
    private $username = "root";
    private $password = "";
    private $charset = "utf8";
    function conectar(){
        try{
            $conection = "mysql:host=". $this->hostname . "; dbname=". $this->databse .  "; charset=" . $this->charset;
            $options = [
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_EMULATE_PREPARES => false
            ];

            $pdo = new PDO($conection, $this->username, $this->password, $options);
            return $pdo;
        }
        catch(PDOException $e){
            echo "erro de conexion" . $e->getMessage();
            exit;
        }
    }
}

?>