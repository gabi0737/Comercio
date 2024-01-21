create schema tiendas;
use tiendas;
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
    precio DECIMAL(10, 2)
);

-- Tabla para pedidos
CREATE TABLE Pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    fecha_pedido DATE
);

-- Tabla para detalles de pedido
CREATE TABLE DetallesPedido (
    id_detalle INT PRIMARY KEY,
    id_pedido INT,
    id_producto INT,
    cantidad INT,
    precio_unitario DECIMAL(10, 2)
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
INSERT INTO Productos (id_producto, nombre, precio)
VALUES 
    (1, 'Producto A', 20.99),
    (2, 'Producto B', 15.50),
    (3, 'Producto C', 30.25),
    (4, 'Producto D', 10.75),
    (5, 'Producto E', 25.00),
    (6, 'Producto F', 18.99),
    (7, 'Producto G', 22.50),
    (8, 'Producto H', 12.25),
    (9, 'Producto I', 28.75),
    (10, 'Producto J', 19.50);

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


