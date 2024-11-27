<?php
    require_once (__DIR__ ."../config/Conecct.php"); //IMPORTAR LA CLASE CONEXION

    class Tabla_usuarios{
        private $connect = null;
        private $table = "usuarios";
        private $primary_key = "idUsuario";

        public function __construct() {
            $db = new Connect() ;
            $this->connect = $db->connect;

            //---------------------------------------------
            //CONSULTAS ESPECIFICAS PARA GENERAR LOS QUERIES
            //QUERIES : PETICIONES SQL
            //CRUD : CREATE | READ | UPDATE | DELETE
            //---------------------------------------------

            
        }
    }