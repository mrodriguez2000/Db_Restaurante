-- Active: 1716011690015@@localhost@3306@restaurante
CREATE DATABASE restaurante;
USE restaurante;

CREATE TABLE meseros (
    Mesero_ID INT AUTO_INCREMENT PRIMARY KEY,
    Mesero_Nombre VARCHAR(30) NOT NULL,
    Mesero_Genero VARCHAR(30),
    Mesero_Fecha_Nacimiento VARCHAR(30) NOT NULL,
    Mesero_Edad INT,
    Fecha_Contratacion DATE
);

CREATE TABLE categoria_producto (
    Categoria_ID INT AUTO_INCREMENT PRIMARY KEY,
    Categoria_Nombre VARCHAR(30),
    Categoria_Foto TEXT
);

CREATE TABLE productos (
    Producto_ID INT AUTO_INCREMENT PRIMARY KEY,
    Producto_Nombre VARCHAR(100) NOT NULL,
    Producto_Foto TEXT,
    Producto_Precio INT,
    Categoria_ID INT,
    Cantidad_Pedidos INT,
    CONSTRAINT FK_CATEGORIA FOREIGN KEY (Categoria_ID) REFERENCES categoria_producto(Categoria_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE metodo_pago (
    Metodo_ID INT AUTO_INCREMENT PRIMARY KEY,
    Metodo_Pago_Nombre VARCHAR(30)
);

CREATE TABLE clientes (
    Cliente_ID INT AUTO_INCREMENT PRIMARY KEY,
    Cliente_Nombre VARCHAR(30) NOT NULL,
    Cliente_Genero VARCHAR(30),
    Cliente_Telefono VARCHAR(15),
    Cantidad_Ordenes INT
);

CREATE TABLE estado_pedido (
    Estado_ID INT AUTO_INCREMENT PRIMARY KEY,
    Estado_Nombre VARCHAR(30)
);

CREATE TABLE domiciliarios (
    Domiciliario_ID INT AUTO_INCREMENT PRIMARY KEY,
    Domiciliario_Nombre VARCHAR(30),
    Domiciliario_Fecha_Nacimiento DATE,
    Cantidad_Pedidos_Entregados INT 
);

CREATE TABLE pedidos (
    Orden_ID INT AUTO_INCREMENT PRIMARY KEY,
    Cliente_ID INT NOT NULL,
    Mesero_ID INT,
    Domiciliario_ID INT,
    Domicilio BOOLEAN,
    Direccion VARCHAR(100), /*Es la dirección del restaurante
    aplica cuando no se hacen domicilios */
    Fecha_Pedido DATETIME,
    Valor_Pedido INT,
    Metodo_ID INT,
    Estado_ID INT DEFAULT 1,
    CONSTRAINT FK_CLIENTE_PEDIDO FOREIGN KEY (Cliente_ID) REFERENCES clientes(Cliente_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT FK_MESERO_ATIENDE FOREIGN KEY (Mesero_ID) REFERENCES meseros(Mesero_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT FK_DOMICILIARIO FOREIGN KEY (Domiciliario_ID) REFERENCES domiciliarios(Domiciliario_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT FK_METODO_PAGO FOREIGN KEY (Metodo_ID) REFERENCES metodo_pago(Metodo_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT FK_ESTADO_PEDIDO FOREIGN KEY (Estado_ID) REFERENCES estado_pedido(Estado_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE detalle_pedido (
    Detalle_ID INT AUTO_INCREMENT PRIMARY KEY,
    Orden_ID INT NOT NULL,
    Producto_ID INT NOT NULL,
    Cantidad INT,
    Producto_Precio INT,
    CONSTRAINT FK_ORDEN FOREIGN KEY (Orden_ID) REFERENCES pedidos(Orden_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT FK_PRODUCTO FOREIGN KEY (Producto_ID) REFERENCES productos(Producto_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE entrega_pedido (
    Entrega_ID INT AUTO_INCREMENT PRIMARY KEY,
    Orden_ID INT NOT NULL UNIQUE,
    Fecha_Entrega DATETIME,
    CONSTRAINT FK_PEDIDO_LLEGADA FOREIGN KEY (Orden_ID) REFERENCES pedidos(Orden_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

/*
CREATE TABLE Precio_Anterior (
    Registro_ID INT AUTO_INCREMENT PRIMARY KEY,
    Producto_ID INT,
    Precio_Producto INT
);
*/