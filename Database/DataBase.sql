/********Creacion de la base de datos********/ 
CREATE DATABASE buksdb;
/*selecciona la base de datos*/
USE buksdb;

/******** Definicion de las tablas **********/
/* Tabla Producto */
CREATE TABLE producto(
         ID_Producto MEDIUMINT NOT NULL AUTO_INCREMENT,
         Producto VARCHAR(50) NOT NULL,
         Costo DECIMAL(5,2) NOT NULL,
         ImagenUrl VARCHAR(100),
         PRIMARY KEY (ID_Producto));
         
/* Tabla Usuario */
CREATE TABLE usuario(
         ID_Usuario MEDIUMINT NOT NULL AUTO_INCREMENT,
         Nombre VARCHAR(50) NOT NULL,
         Apellidos VARCHAR(50) NOT NULL,
         Celular VARCHAR(15) NOT NULL,
         Correo VARCHAR(50) NOT NULL,
         Pass VARCHAR(50) NOT NULL,
         esCocinero BOOLEAN DEFAULT FALSE,
         esAdmin BOOLEAN DEFAULT FALSE,
         esActivo BOOLEAN DEFAULT FALSE,
         PRIMARY KEY (ID_Usuario)/*,
         CONSTRAINT UC_Usuario UNIQUE (Celular, Correo)*/ );

/* Tabla Venta */
CREATE TABLE venta(
         ID_Venta SMALLINT NOT NULL AUTO_INCREMENT,
         FechaIncio DATE NOT NULL,
         FechaFinal DATE,
         Total DECIMAL(7,2),
         PRIMARY KEY (ID_Venta));
         
/* Tabla Venta-Producto-Detail */
CREATE TABLE venta_producto_detail(
         ID_VentaProductoDetail MEDIUMINT NOT NULL AUTO_INCREMENT,
         ID_Producto MEDIUMINT NOT NULL,
         CantidadInicial SMALLINT NOT NULL,
         CantidadActual SMALLINT,
         PRIMARY KEY (ID_VentaProductoDetail),
         FOREIGN KEY (ID_Producto) REFERENCES producto(ID_Producto));
         
/* Tabla Pedido */
CREATE TABLE pedido(
         ID_Pedido MEDIUMINT NOT NULL AUTO_INCREMENT,
         ID_Usuario MEDIUMINT NOT NULL,
         FechaPedido DATETIME,
         TotalPedido DECIMAL(6,2),
         NecesitaCambio BOOLEAN DEFAULT FALSE,
         CantidadCambio SMALLINT,
         PRIMARY KEY (ID_Pedido),
         FOREIGN KEY (ID_Usuario) REFERENCES usuario(ID_Usuario));

/* Tabla Pedido-Detail */
CREATE TABLE pedido_detail(
         ID_PedidoDetail MEDIUMINT NOT NULL AUTO_INCREMENT,
         ID_Producto MEDIUMINT NOT NULL,
         Cantidad SMALLINT NOT NULL,
         HoraPedido TIME,
         EstadoPedido TINYINT,
         PRIMARY KEY (ID_PedidoDetail),
         FOREIGN KEY (ID_Producto) REFERENCES producto(ID_Producto));