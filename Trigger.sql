-- Active: 1716011690015@@localhost@3306@restaurante
/* Trigger que calcula la edad de un mesero antes de insertar información 
en la respectiva tabla */
CREATE TRIGGER edad_meseros BEFORE INSERT ON meseros FOR EACH ROW
BEGIN
    SET NEW.Mesero_Edad = TIMESTAMPDIFF(YEAR, NEW.Mesero_Fecha_Nacimiento, CURDATE());
END;

/* Trigger que inserta el precio de un producto antes de insertar en la tabla detalle_pedido */
CREATE TRIGGER busca_precio_producto BEFORE INSERT ON detalle_pedido FOR EACH ROW
BEGIN
    DECLARE Precio_Producto INT;

    SELECT p.`Producto_Precio` INTO Precio_Producto FROM productos p WHERE p.`Producto_ID` = NEW.`Producto_ID`;

    SET NEW.Producto_Precio = Precio_Producto;
END;

/* Trigger que calcula el valor total de la venta en un pedido */
CREATE TRIGGER valor_pedido AFTER INSERT ON detalle_pedido FOR EACH ROW
BEGIN
    DECLARE Valor_Producto INT;

    SELECT SUM(dp.`Cantidad` * dp.`Producto_Precio`) INTO Valor_Producto FROM detalle_pedido dp
    WHERE NEW.`Orden_ID` = `Orden_ID`;

    UPDATE pedidos SET `Valor_Pedido` = Valor_Producto WHERE NEW.`Orden_ID` = `Orden_ID`;
END;

/* Trigger que cambia el estado de un pedido a entregado cuando se inserta en la tabla entrega_pedido */
CREATE TRIGGER modifica_pedido_finalizado AFTER INSERT ON entrega_pedido FOR EACH ROW
BEGIN
    UPDATE pedidos SET `Estado_ID` = 2 WHERE `Orden_ID` = NEW.`Orden_ID`; 
END;

/* Trigger que evita insertar nuevamente un pedido entregado en la tabla de entrega_pedido
   el Estado_Pedido = 2 indica que un pedido fue entregado */
CREATE TRIGGER no_modificar_pedidos_entregados BEFORE INSERT ON entrega_pedido FOR EACH ROW
BEGIN
    DECLARE Estado_Pedido INT;
    SELECT p.`Estado_ID` INTO estado_pedido FROM pedidos p WHERE NEW.`Orden_ID` = p.`Orden_ID`;
    IF Estado_Pedido = 2 THEN SIGNAL SQLSTATE '45000'
    SET 
        MESSAGE_TEXT = 'No es posible insertar un pedido que ya fue entregado';
    END IF;
END;

/* El trigger evita que se haga un UPDATE sobre un pedido que ya ha sido entregado */
CREATE TRIGGER prohibir_modificacion_pedidos_entregados BEFORE UPDATE ON pedidos FOR EACH ROW
BEGIN
    DECLARE Estado_Viaje INT;
    SET Estado_Viaje = OLD.Estado_ID;
    IF Estado_Viaje = 2 THEN SIGNAL SQLSTATE '45000'
    SET 
        MESSAGE_TEXT = 'No es posible modificar un pedido que ya fue entregado';
    END IF;
END;

/* El siguiente trigger tiene como objetivo editar la dirección del pedido en caso de que el pedido de un
   cliente sea para consumir en el restaurante, por ejemplo, en caso de que haya información de un mesero
   que atendió se confirma que el cliente recibió su orden en el restaurante */
CREATE TRIGGER corrige_direccion BEFORE INSERT ON pedidos FOR EACH ROW
BEGIN
    IF NEW.`Mesero_ID` IS NOT NULL THEN
        SET NEW.Direccion = 'Carrera 66 #30 - 66 (Restaurante)';
    END IF;
END;

CREATE TRIGGER corrige_id_domiciliario BEFORE INSERT ON pedidos FOR EACH ROW
BEGIN
    IF NEW.`Mesero_ID` IS NOT NULL THEN
        SET NEW.Domiciliario_ID = NULL;
    END IF;
END;

/* Trigger que evita ingresar fechas de entrega menores que las fechas en la que se hizó un
   respectivo pedido */
CREATE TRIGGER evita_fechas_entrega_inconsistentes BEFORE INSERT ON entrega_pedido FOR EACH ROW
BEGIN
    DECLARE Fecha_De_Entrega DATETIME;
    DECLARE Fecha_De_Pedido DATETIME;
    SET Fecha_De_Entrega = NEW.Fecha_Entrega;

    SELECT p.`Fecha_Pedido` INTO Fecha_De_Pedido FROM pedidos p WHERE NEW.`Orden_ID` = p.`Orden_ID`;

    IF Fecha_De_Entrega < Fecha_De_Pedido THEN SIGNAL SQLSTATE '45000'
       SET MESSAGE_TEXT = 'La fecha de entrega no puede ser menor que la fecha 
       en la que se realizó el pedido';
    END IF;
END;

/* Trigger que cuenta la cantidad de pedidos que ha solicitado un cliente */
CREATE TRIGGER cantidad_ordenes AFTER INSERT ON pedidos FOR EACH ROW
BEGIN
    DECLARE Cantidad_De_Ordenes INT;
    SELECT COUNT(p.`Cliente_ID`) INTO Cantidad_De_Ordenes FROM pedidos p 
    WHERE `Cliente_ID` = NEW.`Cliente_ID`;

    UPDATE clientes SET `Cantidad_Ordenes` = Cantidad_De_Ordenes WHERE `Cliente_ID` = NEW.`Cliente_ID`;
END;

/* Trigger que inserta el precio anterior de un producto antes de actualizar en la tabla productos
CREATE TRIGGER busca_precio_anterior AFTER UPDATE ON productos FOR EACH ROW
BEGIN
    DECLARE Precio_Producto_Anterior INT;
    DECLARE Precio_Producto_Actual INT;
    
    SET Precio_Producto_Anterior = OLD.Producto_Precio;
    SET Precio_Producto_Actual= NEW.Producto_Precio;

    IF Precio_Producto_Actual = Precio_Producto_Anterior THEN SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El nuevo precio no debe ser igual al precio anterior';
    ELSE
        INSERT INTO precio_anterior
        (`Producto_ID`, `Precio_Producto`)
        VALUES
        (OLD.`Producto_ID`, OLD.Producto_Precio);
    END IF;
END;
*/

/* Trigger que cuenta la cantidad de domicilios que ha entregado un domiciliario o repartidor */
CREATE TRIGGER ordenes_entregadas_domiciliarios AFTER INSERT ON pedidos FOR EACH ROW
BEGIN
    DECLARE Ordenes_Entregadas INT;
    SELECT COUNT(p.`Domiciliario_ID`) INTO Ordenes_Entregadas FROM pedidos p 
    WHERE `Domiciliario_ID` = NEW.`Domiciliario_ID`;

    UPDATE domiciliarios SET `Cantidad_Pedidos_Entregados` = Ordenes_Entregadas 
    WHERE `Domiciliario_ID` = NEW.`Domiciliario_ID`;
END;

/* El presente añade el valor adicional cuando un pedido se entrega en el domicilio de un cliente,
   el valor adicional por el domicilio equivale a $3000. 
   El estado del pedido tiene que ser diferente a entregado, debido a que si se realiza una actualización
   en los pedidos (el estado) vuelve a sumar $3000 en el valor del pedido y no es lo que se desea*/
CREATE TRIGGER aplica_valor_adicional BEFORE UPDATE ON pedidos FOR EACH ROW
BEGIN
    DECLARE Aplica_Domicilio BOOLEAN;
    SET Aplica_Domicilio = NEW.Domicilio;

    IF Aplica_Domicilio = TRUE AND NEW.`Estado_ID` <> 2 THEN
        SET NEW.Valor_Pedido = NEW.Valor_Pedido + 3000;
    END IF;
END;

/* Trigger que evita ingresar la llegada de un pedido en caso de que aún no tenga 
   la información del valor del pedido */
CREATE TRIGGER no_insertar_llegadas_sin_valor_pedido BEFORE INSERT ON entrega_pedido FOR EACH ROW
BEGIN
    DECLARE Valor_De_Pedido INT;
    SELECT p.`Valor_Pedido` INTO Valor_De_Pedido FROM pedidos p WHERE p.`Orden_ID` = NEW.`Orden_ID`;

    IF Valor_De_Pedido IS NULL THEN SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No es posible registrar llegada de pedido sino hay información 
                            del valor del pedido.';
    END IF;
END;


CREATE TRIGGER Ordenes_Productos AFTER INSERT ON detalle_pedido FOR EACH ROW
BEGIN
    DECLARE Cantidad_Pedido_Producto INT;

    SELECT SUM(dp.`Cantidad`) INTO Cantidad_Pedido_Producto FROM detalle_pedido dp
    WHERE dp.`Producto_ID` = NEW.`Producto_ID`;

    UPDATE productos SET `Cantidad_Pedidos` = Cantidad_Pedido_Producto 
    WHERE `Producto_ID` = NEW.`Producto_ID`;
END;