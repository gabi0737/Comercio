CREATE SCHEMA tiendas;
USE tiendas;

-- Tabla de auditoria de ventas
CREATE TABLE AuditoriaVentas (
    id_log INT PRIMARY KEY AUTO_INCREMENT,
    id_venta INT,
    accion VARCHAR(50),
    fecha_accion DATETIME,
    usuario VARCHAR(50)
);

-- Tabla para clientes
CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    fecha_nacimiento DATE
);

-- Tabla para productos
CREATE TABLE Productos (
    id_producto INT PRIMARY KEY,
    nombre VARCHAR(50),
    precio DECIMAL(10, 2),
    cantidad INT
);

-- Tabla para pedidos
CREATE TABLE Pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    fecha_pedido DATE,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- Tabla para detalles de pedido
CREATE TABLE DetallesPedido (
    id_detalle INT PRIMARY KEY,
    id_pedido INT,
    id_producto INT,
    cantidad INT,
    precio_unitario DECIMAL(10, 2),
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

-- Crear la tabla Proveedor
CREATE TABLE Proveedor (
    id_compra INT PRIMARY KEY,
    id_producto INT,
    cantidad INT,
    precio_unitario DECIMAL(10, 2),
    fecha_compra DATE,
    proveedor VARCHAR(50),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

-- Crear la tabla ComprasProveedor
CREATE TABLE ComprasProveedor (
    id_compra_proveedor INT PRIMARY KEY,
    id_compra INT,
    id_producto INT,
    cantidad INT,
    precio_unitario DECIMAL(10, 2),
    fecha_compra DATE,
    FOREIGN KEY (id_compra) REFERENCES Proveedor(id_compra),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

-- Agregar claves foráneas
ALTER TABLE Pedidos
ADD CONSTRAINT fk_cliente_pedido
FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente);

ALTER TABLE DetallesPedido
ADD CONSTRAINT fk_pedido_detalle
FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido);

ALTER TABLE DetallesPedido
ADD CONSTRAINT fk_producto_detalle
FOREIGN KEY (id_producto) REFERENCES Productos(id_producto);

-- Datos en la tabla Clientes
INSERT INTO Clientes (id_cliente, nombre, apellido, fecha_nacimiento)
VALUES 
    (1, 'Juan', 'Perez', '1990-05-15'),
    (2, 'Maria', 'Gomez', '1985-08-20'),
    (3, 'Carlos', 'Rodriguez', '1992-02-10'),
    (4, 'Ana', 'Martinez', '1988-11-25'),
    (5, 'Luis', 'Lopez', '1995-04-30'),
    (6, 'Laura', 'Hernandez', '1998-09-05'),
    (7, 'Javier', 'Sanchez', '1980-03-12'),
    (8, 'Gabriela', 'Fernandez', '1982-07-18'),
    (9, 'Roberto', 'Ramirez', '1993-12-22'),
    (10, 'Isabel', 'Torres', '1997-06-08');

-- Datos en la tabla Productos
INSERT INTO Productos (id_producto, nombre, precio, cantidadproductosagotadosproductosagotados)
VALUES 
    (1, 'Samsung Galaxy S21', 20.99,10),
    (2, 'iPhone 13', 15.50,10),
    (3, 'Google Pixel 6', 30.25,30),
    (4, 'OnePlus 9', 10.75,20),
    (5, 'Xiaomi Mi 11', 25.00,15),
    (6, 'Huawei P40', 18.99,1),
    (7, 'Sony Xperia 5 II', 22.50,0),
    (8, 'LG Velvet', 12.25,2),
    (9, 'Motorola Moto G Power', 28.75,5),
    (10, 'Nokia 8.3', 19.50,3);

-- Datos en la tabla Pedidos
INSERT INTO Pedidos (id_pedido, id_cliente, fecha_pedido)
VALUES 
    (1, 3, '2024-01-01'),
    (2, 7, '2024-01-02'),
    (3, 2, '2024-01-03'),
    (4, 5, '2024-01-04'),
    (5, 8, '2024-01-05'),
    (6, 1, '2024-01-06'),
    (7, 9, '2024-01-07'),
    (8, 4, '2024-01-08'),
    (9, 10, '2024-01-09'),
    (10, 6, '2024-01-10');

-- Datos en la tabla DetallesPedido
INSERT INTO DetallesPedido (id_detalle, id_pedido, id_producto, cantidad, precio_unitario)
VALUES 
    (1, 1, 3, 2, 30.25),
    (2, 2, 8, 1, 12.25),
    (3, 3, 5, 3, 25.00),
    (4, 4, 2, 4, 15.50),
    (5, 5, 10, 2, 19.50),
    (6, 6, 1, 1, 20.99),
    (7, 7, 4, 3, 10.75),
    (8, 8, 9, 2, 28.75),
    (9, 9, 7, 1, 22.50),
    (10, 10, 6, 4, 18.99);
    
-- Insertar datos adicionales en la tabla Proveedor
INSERT INTO Proveedor (id_compra, id_producto, cantidad, precio_unitario, fecha_compra, proveedor)
VALUES 
    (8, 6, 60, 17.25, '2024-02-27', 'TechHub Distributors'),
    (9, 9, 110, 25.50, '2024-03-05', 'Mobile World Suppliers'),
    (10, 3, 30, 28.75, '2024-03-10', 'ConnectX Electronics'),
    (11, 7, 80, 21.00, '2024-03-15', 'Innovative Devices Co.'),
    (12, 5, 55, 24.99, '2024-03-20', 'GlobeTech Solutions'),
    (13, 1, 70, 18.99, '2024-03-25', 'SmartDeals Limited'),
    (14, 8, 45, 12.25, '2024-03-30', 'TechConnect Ventures'),
    (15, 10, 100, 19.50, '2024-04-05', 'Global Mobile Distributors'),
    (16, 2, 25, 15.50, '2024-04-10', 'TopTech Solutions'),
    (17, 3, 50, 30.25, '2024-04-15', 'Future Gadgets Inc.');
    
-- Insertar más datos en la tabla ComprasProveedor
INSERT INTO ComprasProveedor (id_compra_proveedor, id_compra, id_producto, cantidad, precio_unitario, fecha_compra)
VALUES 
    (6, 8, 6, 20, 15.75, '2024-06-01'),
    (7, 9, 1, 35, 28.50, '2024-06-05'),
    (8, 10, 4, 50, 10.50, '2024-06-10'),
    (9, 11, 7, 15, 23.00, '2024-06-15'),
    (10, 12, 2, 25, 14.25, '2024-06-20');


-- Vista que muestra los clientes que realizaron compras y el nombre del producto
CREATE VIEW clientes_compras AS
SELECT
    c.id_cliente,
    c.nombre AS nombre_cliente,
    p.nombre AS nombre_producto
FROM
    Clientes c
JOIN
    Pedidos pe ON c.id_cliente = pe.id_cliente
JOIN
    DetallesPedido dp ON pe.id_pedido = dp.id_pedido
JOIN
    Productos p ON dp.id_producto = p.id_producto;
    
-- Vista que muestra la cantidad de ventas realizadas por producto
CREATE VIEW ventas_por_producto AS
SELECT
    dp.id_producto,
    p.nombre AS nombre_producto,
    COUNT(dp.id_detalle) AS cantidad_ventas
FROM
    DetallesPedido dp
JOIN
    Productos p ON dp.id_producto = p.id_producto
GROUP BY
    dp.id_producto, p.nombre;

DELIMITER //

CREATE FUNCTION f_calcular_porcentaje_ganancia(
    id_detalle_pedido INT
) RETURNS DECIMAL(5, 2) DETERMINISTIC
BEGIN
    DECLARE precio_compra DECIMAL(10, 2);
    DECLARE precio_venta DECIMAL(10, 2);
    DECLARE porcentaje_ganancia DECIMAL(5, 2);

    -- Obtener el precio de compra
    SELECT precio_unitario
    INTO precio_compra
    FROM DetallesPedido
    WHERE id_detalle = id_detalle_pedido;

    -- Obtener el precio de venta (asumiendo que hay una tabla con precios de venta)
    SELECT precio
    INTO precio_venta
    FROM Productos
    WHERE id_producto = (
        SELECT id_producto
        FROM DetallesPedido
        WHERE id_detalle = id_detalle_pedido
    );

    -- Calcular el porcentaje de ganancia
    SET porcentaje_ganancia = ((precio_venta - precio_compra) / precio_compra) * 100;

    RETURN porcentaje_ganancia;
END //

DELIMITER ;

-- Crear un procedimiento almacenado para ajustar los precios de los productos
DELIMITER //

CREATE PROCEDURE sp_ajustar_precios_ganancia()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE id_prod INT;
    DECLARE precio_compra DECIMAL(10, 2);
    DECLARE precio_venta DECIMAL(10, 2);
    DECLARE porcentaje_ganancia DECIMAL(5, 2);
    
    -- Cursor para obtener productos
    DECLARE cur_prod CURSOR FOR
        SELECT id_producto, precio FROM Productos;
    
    -- Manejo de errores
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur_prod;

    read_loop: LOOP
        FETCH cur_prod INTO id_prod, precio_compra;

        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Obtener el precio de venta actual
        SELECT precio INTO precio_venta
        FROM Productos
        WHERE id_producto = id_prod;

        -- Calcular el porcentaje de ganancia actual
        SET porcentaje_ganancia = ((precio_venta - precio_compra) / precio_compra) * 100;

        -- Si la ganancia es menor al 25%, ajustar el precio de venta
        IF porcentaje_ganancia < 25 THEN
            UPDATE Productos
            SET precio = precio_compra * 1.25
            WHERE id_producto = id_prod;
        END IF;
    END LOOP;

    CLOSE cur_prod;
END //

DELIMITER ;

-- Modificar el procedimiento almacenado para aplicar un 10% de descuento
DELIMITER //

CREATE PROCEDURE sp_aplicar_descuento_productos()
BEGIN
    DECLARE id_prod INT;
    DECLARE cantidad_ventas INT;
    
    -- Cursor para obtener la cantidad de ventas por producto
    DECLARE cur_ventas CURSOR FOR
        SELECT dp.id_producto, COUNT(dp.id_detalle) AS cantidad_ventas
        FROM DetallesPedido dp
        GROUP BY dp.id_producto;

    OPEN cur_ventas;

    read_loop: LOOP
        FETCH cur_ventas INTO id_prod, cantidad_ventas;

        IF id_prod IS NULL THEN
            LEAVE read_loop;
        END IF;

        -- Imprimir información para depuración
        SELECT CONCAT('Producto ID: ', id_prod, ', Cantidad de Ventas: ', cantidad_ventas) AS InfoDebug;

        -- Verificar si la cantidad de ventas es menor o igual a 1 (menos vendido)
        IF cantidad_ventas <= 1 THEN
            -- Aplicar un descuento del 10%
            UPDATE Productos
            SET precio = precio * 0.90
            WHERE id_producto = id_prod;
        END IF;
    END LOOP;

    CLOSE cur_ventas;
END //

DELIMITER ;

-- Trigger para auditar ventas después de realizarlas
DELIMITER //
CREATE TRIGGER after_insert_venta
AFTER INSERT ON Pedidos
FOR EACH ROW
BEGIN
    DECLARE usuario_actual VARCHAR(50);
    SET usuario_actual = USER();

    INSERT INTO AuditoriaVentas (id_venta, accion, fecha_accion, usuario)
    VALUES (NEW.id_pedido, 'Inserción (Venta realizada)', NOW(), usuario_actual);
END //
DELIMITER ;

-- Trigger para auditar antes de borrar una venta
DELIMITER //
CREATE TRIGGER before_delete_venta
BEFORE DELETE ON Pedidos
FOR EACH ROW
BEGIN
    DECLARE usuario_actual VARCHAR(50);
    SET usuario_actual = USER();

    INSERT INTO AuditoriaVentas (id_venta, accion, fecha_accion, usuario)
    VALUES (OLD.id_pedido, 'Eliminación (Venta cancelada)', NOW(), usuario_actual);
END //
DELIMITER ;


-- Trigger para actualizar el stock después de una venta
DELIMITER //
CREATE TRIGGER after_insert_venta_actualizar_stock
AFTER INSERT ON DetallesPedido
FOR EACH ROW
BEGIN
    DECLARE stock_actual INT;
    DECLARE cantidad_vendida INT;
    
    -- Obtener el stock actual del producto
    SELECT cantidad INTO stock_actual
    FROM Productos
    WHERE id_producto = NEW.id_producto;

    -- Obtener la cantidad vendida en esta transacción
    SET cantidad_vendida = NEW.cantidad;

    -- Actualizar el stock del producto
    UPDATE Productos
    SET cantidad = stock_actual - cantidad_vendida
    WHERE id_producto = NEW.id_producto;
END //
DELIMITER ;

-- Función para calcular el total de ventas de un cliente
DELIMITER //

CREATE FUNCTION calcular_total_ventas_cliente(
    cliente_id INT
) RETURNS DECIMAL(10, 2) DETERMINISTIC
BEGIN
    DECLARE total_ventas DECIMAL(10, 2);

    -- Calcular el total de ventas del cliente
    SELECT SUM(dp.cantidad * p.precio_unitario)
    INTO total_ventas
    FROM Pedidos pe
    JOIN DetallesPedido dp ON pe.id_pedido = dp.id_pedido
    JOIN Productos p ON dp.id_producto = p.id_producto
    WHERE pe.id_cliente = cliente_id;

    RETURN total_ventas;
END //

DELIMITER ;

-- Vista de Compras Recientes
CREATE VIEW ComprasRecientes AS
SELECT c.nombre AS nombre_cliente, p.nombre AS nombre_producto, dp.cantidad, pe.fecha_pedido
FROM Clientes c
JOIN Pedidos pe ON c.id_cliente = pe.id_cliente
JOIN DetallesPedido dp ON pe.id_pedido = dp.id_pedido
JOIN Productos p ON dp.id_producto = p.id_producto
ORDER BY pe.fecha_pedido DESC;


-- Vista de Productos Agotados
CREATE VIEW ProductosAgotados AS
SELECT id_producto, nombre AS nombre_producto, precio, cantidad
FROM Productos
WHERE cantidad = 0;


CREATE SCHEMA tiendas;
USE tiendas;

-- Tabla de auditoria de ventas
CREATE TABLE AuditoriaVentas (
    id_log INT PRIMARY KEY AUTO_INCREMENT,
    id_venta INT,
    accion VARCHAR(50),
    fecha_accion DATETIME,
    usuario VARCHAR(50)
);

-- Tabla para clientes
CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    fecha_nacimiento DATE
);

-- Tabla para productos
CREATE TABLE Productos (
    id_producto INT PRIMARY KEY,
    nombre VARCHAR(50),
    precio DECIMAL(10, 2),
    cantidad INT
);

-- Tabla para pedidos
CREATE TABLE Pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    fecha_pedido DATE,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- Tabla para detalles de pedido
CREATE TABLE DetallesPedido (
    id_detalle INT PRIMARY KEY,
    id_pedido INT,
    id_producto INT,
    cantidad INT,
    precio_unitario DECIMAL(10, 2),
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

-- Crear la tabla Proveedor
CREATE TABLE Proveedor (
    id_compra INT PRIMARY KEY,
    id_producto INT,
    cantidad INT,
    precio_unitario DECIMAL(10, 2),
    fecha_compra DATE,
    proveedor VARCHAR(50),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

-- Crear la tabla ComprasProveedor
CREATE TABLE ComprasProveedor (
    id_compra_proveedor INT PRIMARY KEY,
    id_compra INT,
    id_producto INT,
    cantidad INT,
    precio_unitario DECIMAL(10, 2),
    fecha_compra DATE,
    FOREIGN KEY (id_compra) REFERENCES Proveedor(id_compra),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

-- Agregar claves foráneas
ALTER TABLE Pedidos
ADD CONSTRAINT fk_cliente_pedido
FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente);

ALTER TABLE DetallesPedido
ADD CONSTRAINT fk_pedido_detalle
FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido);

ALTER TABLE DetallesPedido
ADD CONSTRAINT fk_producto_detalle
FOREIGN KEY (id_producto) REFERENCES Productos(id_producto);

-- Datos en la tabla Clientes
INSERT INTO Clientes (id_cliente, nombre, apellido, fecha_nacimiento)
VALUES 
    (1, 'Juan', 'Perez', '1990-05-15'),
    (2, 'Maria', 'Gomez', '1985-08-20'),
    (3, 'Carlos', 'Rodriguez', '1992-02-10'),
    (4, 'Ana', 'Martinez', '1988-11-25'),
    (5, 'Luis', 'Lopez', '1995-04-30'),
    (6, 'Laura', 'Hernandez', '1998-09-05'),
    (7, 'Javier', 'Sanchez', '1980-03-12'),
    (8, 'Gabriela', 'Fernandez', '1982-07-18'),
    (9, 'Roberto', 'Ramirez', '1993-12-22'),
    (10, 'Isabel', 'Torres', '1997-06-08');

-- Datos en la tabla Productos
INSERT INTO Productos (id_producto, nombre, precio, cantidadproductosagotadosproductosagotados)
VALUES 
    (1, 'Samsung Galaxy S21', 20.99,10),
    (2, 'iPhone 13', 15.50,10),
    (3, 'Google Pixel 6', 30.25,30),
    (4, 'OnePlus 9', 10.75,20),
    (5, 'Xiaomi Mi 11', 25.00,15),
    (6, 'Huawei P40', 18.99,1),
    (7, 'Sony Xperia 5 II', 22.50,0),
    (8, 'LG Velvet', 12.25,2),
    (9, 'Motorola Moto G Power', 28.75,5),
    (10, 'Nokia 8.3', 19.50,3);

-- Datos en la tabla Pedidos
INSERT INTO Pedidos (id_pedido, id_cliente, fecha_pedido)
VALUES 
    (1, 3, '2024-01-01'),
    (2, 7, '2024-01-02'),
    (3, 2, '2024-01-03'),
    (4, 5, '2024-01-04'),
    (5, 8, '2024-01-05'),
    (6, 1, '2024-01-06'),
    (7, 9, '2024-01-07'),
    (8, 4, '2024-01-08'),
    (9, 10, '2024-01-09'),
    (10, 6, '2024-01-10');

-- Datos en la tabla DetallesPedido
INSERT INTO DetallesPedido (id_detalle, id_pedido, id_producto, cantidad, precio_unitario)
VALUES 
    (1, 1, 3, 2, 30.25),
    (2, 2, 8, 1, 12.25),
    (3, 3, 5, 3, 25.00),
    (4, 4, 2, 4, 15.50),
    (5, 5, 10, 2, 19.50),
    (6, 6, 1, 1, 20.99),
    (7, 7, 4, 3, 10.75),
    (8, 8, 9, 2, 28.75),
    (9, 9, 7, 1, 22.50),
    (10, 10, 6, 4, 18.99);
    
-- Insertar datos adicionales en la tabla Proveedor
INSERT INTO Proveedor (id_compra, id_producto, cantidad, precio_unitario, fecha_compra, proveedor)
VALUES 
    (8, 6, 60, 17.25, '2024-02-27', 'TechHub Distributors'),
    (9, 9, 110, 25.50, '2024-03-05', 'Mobile World Suppliers'),
    (10, 3, 30, 28.75, '2024-03-10', 'ConnectX Electronics'),
    (11, 7, 80, 21.00, '2024-03-15', 'Innovative Devices Co.'),
    (12, 5, 55, 24.99, '2024-03-20', 'GlobeTech Solutions'),
    (13, 1, 70, 18.99, '2024-03-25', 'SmartDeals Limited'),
    (14, 8, 45, 12.25, '2024-03-30', 'TechConnect Ventures'),
    (15, 10, 100, 19.50, '2024-04-05', 'Global Mobile Distributors'),
    (16, 2, 25, 15.50, '2024-04-10', 'TopTech Solutions'),
    (17, 3, 50, 30.25, '2024-04-15', 'Future Gadgets Inc.');
    
-- Insertar más datos en la tabla ComprasProveedor
INSERT INTO ComprasProveedor (id_compra_proveedor, id_compra, id_producto, cantidad, precio_unitario, fecha_compra)
VALUES 
    (6, 8, 6, 20, 15.75, '2024-06-01'),
    (7, 9, 1, 35, 28.50, '2024-06-05'),
    (8, 10, 4, 50, 10.50, '2024-06-10'),
    (9, 11, 7, 15, 23.00, '2024-06-15'),
    (10, 12, 2, 25, 14.25, '2024-06-20');


-- Vista que muestra los clientes que realizaron compras y el nombre del producto
CREATE VIEW clientes_compras AS
SELECT
    c.id_cliente,
    c.nombre AS nombre_cliente,
    p.nombre AS nombre_producto
FROM
    Clientes c
JOIN
    Pedidos pe ON c.id_cliente = pe.id_cliente
JOIN
    DetallesPedido dp ON pe.id_pedido = dp.id_pedido
JOIN
    Productos p ON dp.id_producto = p.id_producto;
    
-- Vista que muestra la cantidad de ventas realizadas por producto
CREATE VIEW ventas_por_producto AS
SELECT
    dp.id_producto,
    p.nombre AS nombre_producto,
    COUNT(dp.id_detalle) AS cantidad_ventas
FROM
    DetallesPedido dp
JOIN
    Productos p ON dp.id_producto = p.id_producto
GROUP BY
    dp.id_producto, p.nombre;

DELIMITER //

CREATE FUNCTION f_calcular_porcentaje_ganancia(
    id_detalle_pedido INT
) RETURNS DECIMAL(5, 2) DETERMINISTIC
BEGIN
    DECLARE precio_compra DECIMAL(10, 2);
    DECLARE precio_venta DECIMAL(10, 2);
    DECLARE porcentaje_ganancia DECIMAL(5, 2);

    -- Obtener el precio de compra
    SELECT precio_unitario
    INTO precio_compra
    FROM DetallesPedido
    WHERE id_detalle = id_detalle_pedido;

    -- Obtener el precio de venta (asumiendo que hay una tabla con precios de venta)
    SELECT precio
    INTO precio_venta
    FROM Productos
    WHERE id_producto = (
        SELECT id_producto
        FROM DetallesPedido
        WHERE id_detalle = id_detalle_pedido
    );

    -- Calcular el porcentaje de ganancia
    SET porcentaje_ganancia = ((precio_venta - precio_compra) / precio_compra) * 100;

    RETURN porcentaje_ganancia;
END //

DELIMITER ;

-- Crear un procedimiento almacenado para ajustar los precios de los productos
DELIMITER //

CREATE PROCEDURE sp_ajustar_precios_ganancia()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE id_prod INT;
    DECLARE precio_compra DECIMAL(10, 2);
    DECLARE precio_venta DECIMAL(10, 2);
    DECLARE porcentaje_ganancia DECIMAL(5, 2);
    
    -- Cursor para obtener productos
    DECLARE cur_prod CURSOR FOR
        SELECT id_producto, precio FROM Productos;
    
    -- Manejo de errores
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur_prod;

    read_loop: LOOP
        FETCH cur_prod INTO id_prod, precio_compra;

        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Obtener el precio de venta actual
        SELECT precio INTO precio_venta
        FROM Productos
        WHERE id_producto = id_prod;

        -- Calcular el porcentaje de ganancia actual
        SET porcentaje_ganancia = ((precio_venta - precio_compra) / precio_compra) * 100;

        -- Si la ganancia es menor al 25%, ajustar el precio de venta
        IF porcentaje_ganancia < 25 THEN
            UPDATE Productos
            SET precio = precio_compra * 1.25
            WHERE id_producto = id_prod;
        END IF;
    END LOOP;

    CLOSE cur_prod;
END //

DELIMITER ;

-- Modificar el procedimiento almacenado para aplicar un 10% de descuento
DELIMITER //

CREATE PROCEDURE sp_aplicar_descuento_productos()
BEGIN
    DECLARE id_prod INT;
    DECLARE cantidad_ventas INT;
    
    -- Cursor para obtener la cantidad de ventas por producto
    DECLARE cur_ventas CURSOR FOR
        SELECT dp.id_producto, COUNT(dp.id_detalle) AS cantidad_ventas
        FROM DetallesPedido dp
        GROUP BY dp.id_producto;

    OPEN cur_ventas;

    read_loop: LOOP
        FETCH cur_ventas INTO id_prod, cantidad_ventas;

        IF id_prod IS NULL THEN
            LEAVE read_loop;
        END IF;

        -- Imprimir información para depuración
        SELECT CONCAT('Producto ID: ', id_prod, ', Cantidad de Ventas: ', cantidad_ventas) AS InfoDebug;

        -- Verificar si la cantidad de ventas es menor o igual a 1 (menos vendido)
        IF cantidad_ventas <= 1 THEN
            -- Aplicar un descuento del 10%
            UPDATE Productos
            SET precio = precio * 0.90
            WHERE id_producto = id_prod;
        END IF;
    END LOOP;

    CLOSE cur_ventas;
END //

DELIMITER ;

-- Trigger para auditar ventas después de realizarlas
DELIMITER //
CREATE TRIGGER after_insert_venta
AFTER INSERT ON Pedidos
FOR EACH ROW
BEGIN
    DECLARE usuario_actual VARCHAR(50);
    SET usuario_actual = USER();

    INSERT INTO AuditoriaVentas (id_venta, accion, fecha_accion, usuario)
    VALUES (NEW.id_pedido, 'Inserción (Venta realizada)', NOW(), usuario_actual);
END //
DELIMITER ;

-- Trigger para auditar antes de borrar una venta
DELIMITER //
CREATE TRIGGER before_delete_venta
BEFORE DELETE ON Pedidos
FOR EACH ROW
BEGIN
    DECLARE usuario_actual VARCHAR(50);
    SET usuario_actual = USER();

    INSERT INTO AuditoriaVentas (id_venta, accion, fecha_accion, usuario)
    VALUES (OLD.id_pedido, 'Eliminación (Venta cancelada)', NOW(), usuario_actual);
END //
DELIMITER ;


-- Trigger para actualizar el stock después de una venta
DELIMITER //
CREATE TRIGGER after_insert_venta_actualizar_stock
AFTER INSERT ON DetallesPedido
FOR EACH ROW
BEGIN
    DECLARE stock_actual INT;
    DECLARE cantidad_vendida INT;
    
    -- Obtener el stock actual del producto
    SELECT cantidad INTO stock_actual
    FROM Productos
    WHERE id_producto = NEW.id_producto;

    -- Obtener la cantidad vendida en esta transacción
    SET cantidad_vendida = NEW.cantidad;

    -- Actualizar el stock del producto
    UPDATE Productos
    SET cantidad = stock_actual - cantidad_vendida
    WHERE id_producto = NEW.id_producto;
END //
DELIMITER ;

-- Función para calcular el total de ventas de un cliente
DELIMITER //

CREATE FUNCTION calcular_total_ventas_cliente(
    cliente_id INT
) RETURNS DECIMAL(10, 2) DETERMINISTIC
BEGIN
    DECLARE total_ventas DECIMAL(10, 2);

    -- Calcular el total de ventas del cliente
    SELECT SUM(dp.cantidad * p.precio_unitario)
    INTO total_ventas
    FROM Pedidos pe
    JOIN DetallesPedido dp ON pe.id_pedido = dp.id_pedido
    JOIN Productos p ON dp.id_producto = p.id_producto
    WHERE pe.id_cliente = cliente_id;

    RETURN total_ventas;
END //

DELIMITER ;

-- Vista de Compras Recientes
CREATE VIEW ComprasRecientes AS
SELECT c.nombre AS nombre_cliente, p.nombre AS nombre_producto, dp.cantidad, pe.fecha_pedido
FROM Clientes c
JOIN Pedidos pe ON c.id_cliente = pe.id_cliente
JOIN DetallesPedido dp ON pe.id_pedido = dp.id_pedido
JOIN Productos p ON dp.id_producto = p.id_producto
ORDER BY pe.fecha_pedido DESC;


-- Vista de Productos Agotados
CREATE VIEW ProductosAgotados AS
SELECT id_producto, nombre AS nombre_producto, precio, cantidad
FROM Productos
WHERE cantidad = 0;


CREATE SCHEMA tiendas;
USE tiendas;

-- Tabla de auditoria de ventas
CREATE TABLE AuditoriaVentas (
    id_log INT PRIMARY KEY AUTO_INCREMENT,
    id_venta INT,
    accion VARCHAR(50),
    fecha_accion DATETIME,
    usuario VARCHAR(50)
);

-- Tabla para clientes
CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    fecha_nacimiento DATE
);

-- Tabla para productos
CREATE TABLE Productos (
    id_producto INT PRIMARY KEY,
    nombre VARCHAR(50),
    precio DECIMAL(10, 2),
    cantidad INT
);

-- Tabla para pedidos
CREATE TABLE Pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    fecha_pedido DATE,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- Tabla para detalles de pedido
CREATE TABLE DetallesPedido (
    id_detalle INT PRIMARY KEY,
    id_pedido INT,
    id_producto INT,
    cantidad INT,
    precio_unitario DECIMAL(10, 2),
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

-- Crear la tabla Proveedor
CREATE TABLE Proveedor (
    id_compra INT PRIMARY KEY,
    id_producto INT,
    cantidad INT,
    precio_unitario DECIMAL(10, 2),
    fecha_compra DATE,
    proveedor VARCHAR(50),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

-- Crear la tabla ComprasProveedor
CREATE TABLE ComprasProveedor (
    id_compra_proveedor INT PRIMARY KEY,
    id_compra INT,
    id_producto INT,
    cantidad INT,
    precio_unitario DECIMAL(10, 2),
    fecha_compra DATE,
    FOREIGN KEY (id_compra) REFERENCES Proveedor(id_compra),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

-- Agregar claves foráneas
ALTER TABLE Pedidos
ADD CONSTRAINT fk_cliente_pedido
FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente);

ALTER TABLE DetallesPedido
ADD CONSTRAINT fk_pedido_detalle
FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido);

ALTER TABLE DetallesPedido
ADD CONSTRAINT fk_producto_detalle
FOREIGN KEY (id_producto) REFERENCES Productos(id_producto);

-- Datos en la tabla Clientes
INSERT INTO Clientes (id_cliente, nombre, apellido, fecha_nacimiento)
VALUES 
    (1, 'Juan', 'Perez', '1990-05-15'),
    (2, 'Maria', 'Gomez', '1985-08-20'),
    (3, 'Carlos', 'Rodriguez', '1992-02-10'),
    (4, 'Ana', 'Martinez', '1988-11-25'),
    (5, 'Luis', 'Lopez', '1995-04-30'),
    (6, 'Laura', 'Hernandez', '1998-09-05'),
    (7, 'Javier', 'Sanchez', '1980-03-12'),
    (8, 'Gabriela', 'Fernandez', '1982-07-18'),
    (9, 'Roberto', 'Ramirez', '1993-12-22'),
    (10, 'Isabel', 'Torres', '1997-06-08');

-- Datos en la tabla Productos
INSERT INTO Productos (id_producto, nombre, precio, cantidadproductosagotadosproductosagotados)
VALUES 
    (1, 'Samsung Galaxy S21', 20.99,10),
    (2, 'iPhone 13', 15.50,10),
    (3, 'Google Pixel 6', 30.25,30),
    (4, 'OnePlus 9', 10.75,20),
    (5, 'Xiaomi Mi 11', 25.00,15),
    (6, 'Huawei P40', 18.99,1),
    (7, 'Sony Xperia 5 II', 22.50,0),
    (8, 'LG Velvet', 12.25,2),
    (9, 'Motorola Moto G Power', 28.75,5),
    (10, 'Nokia 8.3', 19.50,3);

-- Datos en la tabla Pedidos
INSERT INTO Pedidos (id_pedido, id_cliente, fecha_pedido)
VALUES 
    (1, 3, '2024-01-01'),
    (2, 7, '2024-01-02'),
    (3, 2, '2024-01-03'),
    (4, 5, '2024-01-04'),
    (5, 8, '2024-01-05'),
    (6, 1, '2024-01-06'),
    (7, 9, '2024-01-07'),
    (8, 4, '2024-01-08'),
    (9, 10, '2024-01-09'),
    (10, 6, '2024-01-10');

-- Datos en la tabla DetallesPedido
INSERT INTO DetallesPedido (id_detalle, id_pedido, id_producto, cantidad, precio_unitario)
VALUES 
    (1, 1, 3, 2, 30.25),
    (2, 2, 8, 1, 12.25),
    (3, 3, 5, 3, 25.00),
    (4, 4, 2, 4, 15.50),
    (5, 5, 10, 2, 19.50),
    (6, 6, 1, 1, 20.99),
    (7, 7, 4, 3, 10.75),
    (8, 8, 9, 2, 28.75),
    (9, 9, 7, 1, 22.50),
    (10, 10, 6, 4, 18.99);
    
-- Insertar datos adicionales en la tabla Proveedor
INSERT INTO Proveedor (id_compra, id_producto, cantidad, precio_unitario, fecha_compra, proveedor)
VALUES 
    (8, 6, 60, 17.25, '2024-02-27', 'TechHub Distributors'),
    (9, 9, 110, 25.50, '2024-03-05', 'Mobile World Suppliers'),
    (10, 3, 30, 28.75, '2024-03-10', 'ConnectX Electronics'),
    (11, 7, 80, 21.00, '2024-03-15', 'Innovative Devices Co.'),
    (12, 5, 55, 24.99, '2024-03-20', 'GlobeTech Solutions'),
    (13, 1, 70, 18.99, '2024-03-25', 'SmartDeals Limited'),
    (14, 8, 45, 12.25, '2024-03-30', 'TechConnect Ventures'),
    (15, 10, 100, 19.50, '2024-04-05', 'Global Mobile Distributors'),
    (16, 2, 25, 15.50, '2024-04-10', 'TopTech Solutions'),
    (17, 3, 50, 30.25, '2024-04-15', 'Future Gadgets Inc.');
    
-- Insertar más datos en la tabla ComprasProveedor
INSERT INTO ComprasProveedor (id_compra_proveedor, id_compra, id_producto, cantidad, precio_unitario, fecha_compra)
VALUES 
    (6, 8, 6, 20, 15.75, '2024-06-01'),
    (7, 9, 1, 35, 28.50, '2024-06-05'),
    (8, 10, 4, 50, 10.50, '2024-06-10'),
    (9, 11, 7, 15, 23.00, '2024-06-15'),
    (10, 12, 2, 25, 14.25, '2024-06-20');


-- Vista que muestra los clientes que realizaron compras y el nombre del producto
CREATE VIEW clientes_compras AS
SELECT
    c.id_cliente,
    c.nombre AS nombre_cliente,
    p.nombre AS nombre_producto
FROM
    Clientes c
JOIN
    Pedidos pe ON c.id_cliente = pe.id_cliente
JOIN
    DetallesPedido dp ON pe.id_pedido = dp.id_pedido
JOIN
    Productos p ON dp.id_producto = p.id_producto;
    
-- Vista que muestra la cantidad de ventas realizadas por producto
CREATE VIEW ventas_por_producto AS
SELECT
    dp.id_producto,
    p.nombre AS nombre_producto,
    COUNT(dp.id_detalle) AS cantidad_ventas
FROM
    DetallesPedido dp
JOIN
    Productos p ON dp.id_producto = p.id_producto
GROUP BY
    dp.id_producto, p.nombre;

DELIMITER //

CREATE FUNCTION f_calcular_porcentaje_ganancia(
    id_detalle_pedido INT
) RETURNS DECIMAL(5, 2) DETERMINISTIC
BEGIN
    DECLARE precio_compra DECIMAL(10, 2);
    DECLARE precio_venta DECIMAL(10, 2);
    DECLARE porcentaje_ganancia DECIMAL(5, 2);

    -- Obtener el precio de compra
    SELECT precio_unitario
    INTO precio_compra
    FROM DetallesPedido
    WHERE id_detalle = id_detalle_pedido;

    -- Obtener el precio de venta (asumiendo que hay una tabla con precios de venta)
    SELECT precio
    INTO precio_venta
    FROM Productos
    WHERE id_producto = (
        SELECT id_producto
        FROM DetallesPedido
        WHERE id_detalle = id_detalle_pedido
    );

    -- Calcular el porcentaje de ganancia
    SET porcentaje_ganancia = ((precio_venta - precio_compra) / precio_compra) * 100;

    RETURN porcentaje_ganancia;
END //

DELIMITER ;

-- Crear un procedimiento almacenado para ajustar los precios de los productos
DELIMITER //

CREATE PROCEDURE sp_ajustar_precios_ganancia()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE id_prod INT;
    DECLARE precio_compra DECIMAL(10, 2);
    DECLARE precio_venta DECIMAL(10, 2);
    DECLARE porcentaje_ganancia DECIMAL(5, 2);
    
    -- Cursor para obtener productos
    DECLARE cur_prod CURSOR FOR
        SELECT id_producto, precio FROM Productos;
    
    -- Manejo de errores
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur_prod;

    read_loop: LOOP
        FETCH cur_prod INTO id_prod, precio_compra;

        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Obtener el precio de venta actual
        SELECT precio INTO precio_venta
        FROM Productos
        WHERE id_producto = id_prod;

        -- Calcular el porcentaje de ganancia actual
        SET porcentaje_ganancia = ((precio_venta - precio_compra) / precio_compra) * 100;

        -- Si la ganancia es menor al 25%, ajustar el precio de venta
        IF porcentaje_ganancia < 25 THEN
            UPDATE Productos
            SET precio = precio_compra * 1.25
            WHERE id_producto = id_prod;
        END IF;
    END LOOP;

    CLOSE cur_prod;
END //

DELIMITER ;

-- Modificar el procedimiento almacenado para aplicar un 10% de descuento
DELIMITER //

CREATE PROCEDURE sp_aplicar_descuento_productos()
BEGIN
    DECLARE id_prod INT;
    DECLARE cantidad_ventas INT;
    
    -- Cursor para obtener la cantidad de ventas por producto
    DECLARE cur_ventas CURSOR FOR
        SELECT dp.id_producto, COUNT(dp.id_detalle) AS cantidad_ventas
        FROM DetallesPedido dp
        GROUP BY dp.id_producto;

    OPEN cur_ventas;

    read_loop: LOOP
        FETCH cur_ventas INTO id_prod, cantidad_ventas;

        IF id_prod IS NULL THEN
            LEAVE read_loop;
        END IF;

        -- Imprimir información para depuración
        SELECT CONCAT('Producto ID: ', id_prod, ', Cantidad de Ventas: ', cantidad_ventas) AS InfoDebug;

        -- Verificar si la cantidad de ventas es menor o igual a 1 (menos vendido)
        IF cantidad_ventas <= 1 THEN
            -- Aplicar un descuento del 10%
            UPDATE Productos
            SET precio = precio * 0.90
            WHERE id_producto = id_prod;
        END IF;
    END LOOP;

    CLOSE cur_ventas;
END //

DELIMITER ;

-- Trigger para auditar ventas después de realizarlas
DELIMITER //
CREATE TRIGGER after_insert_venta
AFTER INSERT ON Pedidos
FOR EACH ROW
BEGIN
    DECLARE usuario_actual VARCHAR(50);
    SET usuario_actual = USER();

    INSERT INTO AuditoriaVentas (id_venta, accion, fecha_accion, usuario)
    VALUES (NEW.id_pedido, 'Inserción (Venta realizada)', NOW(), usuario_actual);
END //
DELIMITER ;

-- Trigger para auditar antes de borrar una venta
DELIMITER //
CREATE TRIGGER before_delete_venta
BEFORE DELETE ON Pedidos
FOR EACH ROW
BEGIN
    DECLARE usuario_actual VARCHAR(50);
    SET usuario_actual = USER();

    INSERT INTO AuditoriaVentas (id_venta, accion, fecha_accion, usuario)
    VALUES (OLD.id_pedido, 'Eliminación (Venta cancelada)', NOW(), usuario_actual);
END //
DELIMITER ;


-- Trigger para actualizar el stock después de una venta
DELIMITER //
CREATE TRIGGER after_insert_venta_actualizar_stock
AFTER INSERT ON DetallesPedido
FOR EACH ROW
BEGIN
    DECLARE stock_actual INT;
    DECLARE cantidad_vendida INT;
    
    -- Obtener el stock actual del producto
    SELECT cantidad INTO stock_actual
    FROM Productos
    WHERE id_producto = NEW.id_producto;

    -- Obtener la cantidad vendida en esta transacción
    SET cantidad_vendida = NEW.cantidad;

    -- Actualizar el stock del producto
    UPDATE Productos
    SET cantidad = stock_actual - cantidad_vendida
    WHERE id_producto = NEW.id_producto;
END //
DELIMITER ;

-- Función para calcular el total de ventas de un cliente
DELIMITER //

CREATE FUNCTION calcular_total_ventas_cliente(
    cliente_id INT
) RETURNS DECIMAL(10, 2) DETERMINISTIC
BEGIN
    DECLARE total_ventas DECIMAL(10, 2);

    -- Calcular el total de ventas del cliente
    SELECT SUM(dp.cantidad * p.precio_unitario)
    INTO total_ventas
    FROM Pedidos pe
    JOIN DetallesPedido dp ON pe.id_pedido = dp.id_pedido
    JOIN Productos p ON dp.id_producto = p.id_producto
    WHERE pe.id_cliente = cliente_id;

    RETURN total_ventas;
END //

DELIMITER ;

-- Vista de Compras Recientes
CREATE VIEW ComprasRecientes AS
SELECT c.nombre AS nombre_cliente, p.nombre AS nombre_producto, dp.cantidad, pe.fecha_pedido
FROM Clientes c
JOIN Pedidos pe ON c.id_cliente = pe.id_cliente
JOIN DetallesPedido dp ON pe.id_pedido = dp.id_pedido
JOIN Productos p ON dp.id_producto = p.id_producto
ORDER BY pe.fecha_pedido DESC;


-- Vista de Productos Agotados
CREATE VIEW ProductosAgotados AS
SELECT id_producto, nombre AS nombre_producto, precio, cantidad
FROM Productos
WHERE cantidad = 0;
