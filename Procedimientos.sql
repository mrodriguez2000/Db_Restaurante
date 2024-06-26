-- Active: 1716011690015@@localhost@3306@restaurante
/* Procedimiento almacenado que inserta registros en la tabla de entrega de pedidos, con la finalidad
   de registrar la fecha y hora de llegada de un pedido solicitado por un cliente */
CREATE PROCEDURE inserta_entrega_pedido (IN Orden INT, IN Fecha_Entrega DATETIME)
BEGIN
   INSERT INTO entrega_pedido
   (`Orden_ID`, `Fecha_Entrega`)
   VALUES
   (Orden, Fecha_Entrega);
END;

-- Scripts para ejecutar pruebas con los procedimientos
call restaurante.inserta_entrega_pedido(1, '2023-06-10 20:52:00');
call restaurante.inserta_entrega_pedido(2, '2023-06-10 21:16:00');
call restaurante.inserta_entrega_pedido(3, '2023-06-10 22:32:00');
call restaurante.inserta_entrega_pedido(4, '2023-06-10 22:05:00');
call restaurante.inserta_entrega_pedido(5, '2023-06-10 22:15:00');
call restaurante.inserta_entrega_pedido(6, '2023-06-11 18:52:00');
call restaurante.inserta_entrega_pedido(7, '2023-06-11 19:10:00');
call restaurante.inserta_entrega_pedido(8, '2023-06-11 20:31:00');
call restaurante.inserta_entrega_pedido(9, '2023-06-11 20:46:00');
call restaurante.inserta_entrega_pedido(10, '2023-06-11 20:59:00');
call restaurante.inserta_entrega_pedido(11, '2023-06-11 21:02:00');
call restaurante.inserta_entrega_pedido(12, '2023-06-11 21:00:00');
call restaurante.inserta_entrega_pedido(13, '2023-06-12 21:32:00');
call restaurante.inserta_entrega_pedido(14, '2023-06-12 21:32:00');
call restaurante.inserta_entrega_pedido(15, '2023-06-12 21:50:00');
call restaurante.inserta_entrega_pedido(16, '2023-06-12 21:55:00');
call restaurante.inserta_entrega_pedido(17, '2023-06-12 22:06:00');
call restaurante.inserta_entrega_pedido(18, '2023-06-12 22:30:00');
call restaurante.inserta_entrega_pedido(19, '2023-06-13 19:15:00');
call restaurante.inserta_entrega_pedido(20, '2023-06-13 19:40:00');
call restaurante.inserta_entrega_pedido(21, '2023-06-13 19:51:00');
call restaurante.inserta_entrega_pedido(22, '2023-06-13 20:51:00');
call restaurante.inserta_entrega_pedido(23, '2023-06-13 21:42:00');
call restaurante.inserta_entrega_pedido(24, '2023-06-13 22:24:00');
call restaurante.inserta_entrega_pedido(25, '2023-06-13 23:15:00');
call restaurante.inserta_entrega_pedido(26, '2023-06-14 20:39:00');
call restaurante.inserta_entrega_pedido(27, '2023-06-14 21:50:00');
call restaurante.inserta_entrega_pedido(28, '2023-06-15 18:50:00');
call restaurante.inserta_entrega_pedido(29, '2023-06-15 19:15:00');
call restaurante.inserta_entrega_pedido(30, '2023-06-15 19:50:00');
call restaurante.inserta_entrega_pedido(31, '2023-06-15 19:55:00');
call restaurante.inserta_entrega_pedido(32, '2023-06-15 20:30:00');
call restaurante.inserta_entrega_pedido(33, '2023-06-15 21:42:00');
call restaurante.inserta_entrega_pedido(34, '2023-06-15 22:20:00');
call restaurante.inserta_entrega_pedido(35, '2023-06-16 18:29:00');
call restaurante.inserta_entrega_pedido(36, '2023-06-16 18:36:00');
call restaurante.inserta_entrega_pedido(37, '2023-06-16 20:15:00');
call restaurante.inserta_entrega_pedido(38, '2023-06-17 18:50:00');
call restaurante.inserta_entrega_pedido(39, '2023-06-17 20:32:00');
call restaurante.inserta_entrega_pedido(40, '2023-06-17 20:39:00');
call restaurante.inserta_entrega_pedido(41, '2023-06-17 21:15:00');
call restaurante.inserta_entrega_pedido(42, '2023-06-17 21:42:00');
call restaurante.inserta_entrega_pedido(43, '2023-06-18 18:42:00');
call restaurante.inserta_entrega_pedido(44, '2023-06-18 18:50:00');
call restaurante.inserta_entrega_pedido(45, '2023-06-18 20:36:00');
call restaurante.inserta_entrega_pedido(46, '2023-06-18 19:55:00');
call restaurante.inserta_entrega_pedido(47, '2023-06-18 20:12:00');
call restaurante.inserta_entrega_pedido(48, '2023-06-18 20:24:00');
call restaurante.inserta_entrega_pedido(49, '2023-06-18 20:11:00');
call restaurante.inserta_entrega_pedido(50, '2023-06-18 20:32:00');
call restaurante.inserta_entrega_pedido(51, '2023-06-18 20:52:00');
call restaurante.inserta_entrega_pedido(52, '2023-06-18 20:22:00');
call restaurante.inserta_entrega_pedido(53, '2023-06-18 20:59:00');
call restaurante.inserta_entrega_pedido(54, '2023-06-19 19:09:00');
call restaurante.inserta_entrega_pedido(55, '2023-06-19 19:01:00');
call restaurante.inserta_entrega_pedido(56, '2023-06-19 19:15:00');
call restaurante.inserta_entrega_pedido(57, '2023-06-19 18:55:00');
call restaurante.inserta_entrega_pedido(58, '2023-06-19 19:20:00');
call restaurante.inserta_entrega_pedido(59, '2023-06-19 19:39:00');
call restaurante.inserta_entrega_pedido(60, '2023-06-19 19:24:00');
call restaurante.inserta_entrega_pedido(61, '2023-06-19 19:35:00');
call restaurante.inserta_entrega_pedido(62, '2023-06-19 19:52:00');
call restaurante.inserta_entrega_pedido(63, '2023-06-19 19:39:00');
call restaurante.inserta_entrega_pedido(64, '2023-06-19 19:55:00');
call restaurante.inserta_entrega_pedido(65, '2023-06-19 20:33:00');
call restaurante.inserta_entrega_pedido(66, '2023-06-19 20:35:00');
call restaurante.inserta_entrega_pedido(67, '2023-06-19 21:05:00');
call restaurante.inserta_entrega_pedido(68, '2023-06-19 20:52:00');
call restaurante.inserta_entrega_pedido(69, '2023-06-20 18:45:00');
call restaurante.inserta_entrega_pedido(70, '2023-06-20 18:56:00');
call restaurante.inserta_entrega_pedido(71, '2023-06-20 20:16:00');
call restaurante.inserta_entrega_pedido(72, '2023-06-20 20:45:00');
call restaurante.inserta_entrega_pedido(73, '2023-06-21 20:29:00');
call restaurante.inserta_entrega_pedido(74, '2023-06-21 20:45:00');
call restaurante.inserta_entrega_pedido(75, '2023-06-21 20:52:00');
call restaurante.inserta_entrega_pedido(76, '2023-06-21 20:59:00');
call restaurante.inserta_entrega_pedido(77, '2023-06-21 21:15:00');
call restaurante.inserta_entrega_pedido(78, '2023-06-21 21:59:00');
call restaurante.inserta_entrega_pedido(79, '2023-06-22 20:15:00');
call restaurante.inserta_entrega_pedido(80, '2023-06-22 21:02:00');
call restaurante.inserta_entrega_pedido(81, '2023-06-23 18:55:00');
call restaurante.inserta_entrega_pedido(82, '2023-06-23 20:09:00');
call restaurante.inserta_entrega_pedido(83, '2023-06-23 20:39:00');
call restaurante.inserta_entrega_pedido(84, '2023-06-23 20:10:00');
call restaurante.inserta_entrega_pedido(85, '2023-06-23 20:15:00');
call restaurante.inserta_entrega_pedido(86, '2023-06-23 20:24:00');
call restaurante.inserta_entrega_pedido(87, '2023-06-23 20:50:00');
call restaurante.inserta_entrega_pedido(88, '2023-06-23 21:36:00');
call restaurante.inserta_entrega_pedido(89, '2023-06-23 21:52:00');
call restaurante.inserta_entrega_pedido(90, '2023-06-24 18:52:00');