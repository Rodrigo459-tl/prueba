DROP DATABASE IF EXISTS bdpdo;
CREATE DATABASE IF NOT EXISTS bdpdo DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE bdpdo;
CREATE USER 'userpdo'@'localhost' IDENTIFIED BY 'passodo123';
GRANT ALL PRIVILEGES ON bdpdo.* TO 'userpdo'@'localhost';

CREATE TABLE roles
(
    id_rol INT(5) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    rol VARCHAR(10) NOT NULL
);

-- ROLES
--  --128 : ADMINISTRADOR
--  --18 : OPERADOR

INSERT INTO roles (id_rol, rol) 
VALUES 
    (128, 'Administrador'),
    (18, 'Operador');

CREATE TABLE usuarios
(
    id_usuario INT(5) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    estatus_usuario TINYINT(1) NULL DEFAULT 0 COMMENT '0: Deshabilitado, 1 Habilitado',
    nombre_usuario VARCHAR(45) NOT NULL,
    ap_usuario VARCHAR(45) NOT NULL,
    am_usuario VARCHAR(45) NULL,
    sexo_usuario TINYINT(1) NOT NULL DEFAULT 0 COMMENT '0: Femenino, 1: Masculino', 
    email_usuario VARCHAR(50) NOT NULL,
    password_usuario VARCHAR(64) NOT NULL,
    imagen_usuario VARCHAR(100) NULL COMMENT 'Unicamente guarda la ruta del archivo o nombre del archivo',
    id_rol INT(5) NOT NULL, 
    FOREIGN KEY (id_rol) REFERENCES roles(id_rol) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO usuarios (id_usuario, estatus_usuario, nombre_usuario, ap_usuario, am_usuario, sexo_usuario, email_usuario, password_usuario, imagen_usuario, id_rol) 
VALUES 
    (NULL, NULL, 'Administrador', 'Administrador', NULL, 0, 'superadmin@pdo.com', SHA2('superadmin123',0), NULL, 128),
    (NULL, NULL, 'Operador', 'Operador', NULL, 0, 'operador@pdo.com', SHA2('operador',0), NULL, 18);