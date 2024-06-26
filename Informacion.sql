-- Active: 1716011690015@@localhost@3306@restaurante
INSERT INTO metodo_pago
(`Metodo_Pago_Nombre`)
VALUES
('Efectivo'),
('Transferencia');

INSERT INTO estado_pedido
(`Estado_Nombre`)
VALUES
('En proceso de entrega'),
('Entregado');

INSERT INTO categoria_producto
(`Categoria_Nombre`, `Categoria_Foto`)
VALUES
('Asados', 'https://asadacho.com/wp-content/uploads/2015/01/asado-parrilla.jpg'),
('Salchipapas', 'https://vivirenelpoblado.com/wp-content/uploads/2022/02/Salchipapa-Fest-2022-la-busqueda-del-mejor-salchipapas-de-Colombia.jpg'),
('Pizzas', 'https://theobjective.com/wp-content/uploads/2023/06/como-hacer-pizzas-caseras-saludables.jpg'),
('Perros calientes', 'https://farm8.staticflickr.com/7284/8736746203_f36516b9a7_c.jpg'),
('Desgranados', 'https://media-cdn.tripadvisor.com/media/photo-s/0f/da/fa/fd/tradicional-chuzo-desgranado.jpg'),
('Jugos naturales', 'https://k-listo.com/wp-content/uploads/2020/04/JUGOS_NATURALES.jpg.webp'),
('Bebidas gaseosas', 'https://kosante.s3.us-east-2.amazonaws.com/users/3/9AdTOSInSVprHoG1rHKGIWSJvTfPFFSP92obv6Wptc08PdfoCc.png'),
('Sandwiches', 'https://hips.hearstapps.com/hmg-prod/images/delish-200511-seo-club-sandwich-h-14383-eb-1590780714.jpg?crop=1xw:0.8435280189423836xh;center,top&resize=1200:*');

INSERT INTO productos
(`Producto_Nombre`, `Producto_Foto`, `Producto_Precio`, `Categoria_ID`)
VALUES
('Salchipapa sencilla', 'https://pbs.twimg.com/media/FydQKn6X0AABsOx.jpg', 12000, 2),
('Salchipapa suiza', 'https://taurusfastfood.wcorp.com.co/wp-content/uploads/2022/08/salchipapa-suiza.jpg', 15000, 2),
('Perro caliente sencillo', 'https://www.elheraldo.co/sites/default/files/styles/widht_760/public/articulo/2020/05/14/perro.jpg', 6500, 4),
('Perro caliente suizo', 'https://www.las2orillas.co/wp-content/uploads/2023/12/1-107.jpg', 10000, 4),
('Pizza sencilla', 'https://www.comedera.com/wp-content/uploads/2014/04/como-hacer-pizza-facil-en-casa.jpg', 14000, 3),
('Pizza hawaiana', 'https://cdn2.cocinadelirante.com/sites/default/files/images/2019/11/como-hacer-pizza-hawaiana.jpg', 15000, 3),
('Jugo de corozo', 'https://imagenes.eltiempo.com/files/image_1200_600/uploads/2024/02/20/65d4e89c2c395.jpeg', 5000, 6),
('Jugo de naranja', 'https://www.paulinacocina.net/wp-content/uploads/2023/06/jugo-de-naranja-receta-y-propiedades-800x450.jpg', 5000, 6),
('Desgranado sencillo', 'https://atrium.com.co/sites/default/files/images/productos/20220830-chuzo-mixto.jpg', 9000, 5),
('Desgranado mixto', 'https://i.ytimg.com/vi/xLKP8jSM9OA/maxresdefault.jpg', 11000, 5),
('Pechuga asada', 'https://elantojo.co/wp-content/uploads/2023/11/Pechuga-1.jpg', 12500, 1),
('Carne asada', 'https://www.onionringsandthings.com/wp-content/uploads/2016/09/carneasada1.jpg', 14000, 1),
('Chuleta de cerdo asada', 'https://www.recetasnestle.com.ec/sites/default/files/styles/recipe_detail_desktop/public/srh_recipes/1349f4c100c0c19653814efb94986dbc.jpg?itok=ZErqH6D-', 14500, 1),
('Gaseosa Postobon manzana personal', 'https://locatelcolombia.vtexassets.com/arquivos/ids/229577/7702090031928_1_GASEOSA-POSTOBON-MANZANA-X-400ML.jpg?v=637316403960800000', 3500, 7),
('Gaseosa Postobon uva personal', 'https://vaquitaexpress.com.co/media/catalog/product/cache/e89ece728e3939ca368b457071d3c0be/7/7/7702090031942_38.jpg', 3500, 7),
('Gaseosa Pepsi personal', 'https://marcallanera.com/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsiZGF0YSI6MzAzOTQsInB1ciI6ImJsb2JfaWQifX0=--8f052b4d9d6d2773d9758794e9dd455a71abfb12/eyJfcmFpbHMiOnsiZGF0YSI6eyJmb3JtYXQiOiJqcGciLCJyZXNpemVfdG9fZml0IjpbODAwLDgwMF19LCJwdXIiOiJ2YXJpYXRpb24ifX0=--1420d7fd3d20057726f0ef3c0043db24ca0403be/Z-PEPSI-PER.jpg?locale=es', 4500, 7),
('Gaseosa Coca Cola personal', 'https://lavaquita.co/cdn/shop/products/supermercados_la_vaquita_supervaquita_gaseosa_coca_cola_600_ml_bebidas_liquidas_1024x1024.jpg?v=1620489414', 5000, 7),
('Sandwich de atún', 'https://tuny.mx/wp-content/uploads/2021/10/Las-5-mejores-recetas-de-Atun-Tuny.jpg', 10000, 8),
('Sandwich de pollo', 'https://assets.elgourmet.com/wp-content/uploads/2023/03/s-ndw_AfsS859PRoHcJpKwd6r4Me0FUBDtCg-1024x683.png.webp', 14000, 8),
('Sandwich de jamón', 'https://www.paulinacocina.net/wp-content/uploads/2022/12/recetario-de-sandwiches-1200x800.jpg', 9500, 8);

INSERT INTO meseros
(`Mesero_Nombre`, `Mesero_Genero`, `Mesero_Fecha_Nacimiento`, `Fecha_Contratacion`)
VALUES
('Marcela Bermudez', 'Femenino', '1992-05-15', '2023-06-10'),
('Luis Jaramillo', 'Masculino', '1995-03-10', '2023-06-10'),
('Janneth Becerra', 'Femenino', '2000-03-24', '2023-06-10');

INSERT INTO clientes
(`Cliente_Nombre`, `Cliente_Genero`, `Cliente_Telefono`)
VALUES
('Paulina Rodriguez', 'Femenino', '3200521015'),
('Juan Gutierrez', 'Masculino', '3114560258'),
('Alberto Garcia', 'Masculino', '3107532636'),
('Lucia Fuentes', 'Femenino', '3201526203'),
('Paola Ruiz', 'Femenino', '3014567295'),
('Miguel Agudelo', 'Masculino', '3219569999'),
('Gonzalo Cubillos', 'Masculino', '3201568426'),
('Luis Cevallos', 'Masculino', '3110253015'),
('Susana Ortega', 'Femenino', '3102564896'),
('Geovanny Ramirez', 'Masculino', '3110256382'),
('Andres Lopez', 'Masculino', '3112568749'),
('Karina Arcos', 'Femenino', '3156058943'),
('Wilson Valencia', 'Masculino', '3004231489'),
('Monica Vargas', 'Femenino', '3001526546'),
('Luis Garcia', 'Masculino', '3015689766'),
('Claudia Becerra', 'Femenino', '3201562436'),
('Esmeralda Jaramillo', 'Femenino', '3101287992'),
('Juliana Gaviria', 'Femenino', '3014587962'),
('Clemente Orjuela', 'Masculino', '3014789652'),
('Antonio Becerra', 'Masculino', '3201560936'),
('Marcelo Salazar', 'Masculino', '3201463629'),
('Miralva Gaviria', 'Femenino', '3014789636'),
('Juliana Salazar', 'Femenino', '3203654123'),
('Jeronimo Fuentes', 'Masculino', '3115672036'),
('Alejandro Cantillo', 'Masculino', '3146988701'),
('Lorena Fernandez', 'Femenino', '3201453369'),
('Paola Monsalva', 'Femenino', '3014597752'),
('Daniela Muñoz', 'Femenino', '3025842652'),
('Edward Valdez', 'Masculino', '3012569632'),
('Minerva Fuentes', 'Femenino', '3015489631'),
('Alexander Soto', 'Masculino', '3201589621'),
('Angelina Mejia', 'Femenino', '3046589625'),
('Mariana Galan', 'Femenino', '3054126852'),
('Emilio Mejia', 'Masculino', '3104578936'),
('Lucia Ordoñez', 'Femenino', '3104578231'),
('Monica Garces', 'Femenino', '3123248966'),
('Luis Carmona', 'Masculino', '3014520365'),
('Pablo Pineda', 'Masculino', '3142025465'),
('Paola Jaramillo', 'Femenino', '3014571261'),
('Diana Hurtado', 'Femenino', '3147859601'),
('Arnold Gomez', 'Masculino', '3021456982');

/*
INSERT INTO clientes
(`Cliente_Nombre`, `Cliente_Genero`, `Cliente_Telefono`)
VALUES
*/

INSERT INTO domiciliarios
(`Domiciliario_Nombre`, `Domiciliario_Fecha_Nacimiento`)
VALUES
('Pedro Alvarado', '1992-11-08'),
('Pablo Velazques', '1992-01-11');