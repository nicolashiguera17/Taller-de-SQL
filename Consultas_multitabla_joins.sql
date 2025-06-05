--1. Encuentra los nombres de los clientes y los detalles de sus pedidos.--  

SELECT usuarios.nombre, 
    detalles_pedidos.pedido_id, 
    detalles_pedidos.cantidad, 
    detalles_pedidos.precio_unitario
FROM usuarios
JOIN pedidos 
ON pedidos.cliente_id = usuarios.usuario_id
JOIN detalles_pedidos 

--2. Lista todos los productos pedidos junto con el precio unitario de cada pedido --
SELECT pedidos.pedido_id,
       GROUP_CONCAT(CONCAT(productos.nombre, ',', productos.categoria)),
       SUM(detalles_pedidos.cantidad * detalles_pedidos.precio_unitario)
FROM pedidos
INNER JOIN detalles_pedidos ON pedidos.pedido_id = detalles_pedidos.pedido_id
INNER JOIN productos ON detalles_pedidos.producto_id = productos.producto_id
GROUP BY pedidos.pedido_id;

--3.Encuentra los nombres de los clientes y los nombres de los empleados que gestionaron sus pedidos--

SELECT clientes.nombre cliente, empleados.nombre empleado, pedidos.fecha_pedido
FROM pedidos
JOIN usuarios clientes ON pedidos.cliente_id = clientes.usuario_id
JOIN usuarios empleados ON pedidos.empleado_id = empleados.usuario_id;

-- 4. Muestra todos los pedidos y, si existen, los productos en cada pedido, incluyendo los pedidos sin productos usando LEFT JOIN --

SELECT 
    productos.nombre AS Producto,
    pedidos.cliente_id AS Cliente,
    pedidos.empleado_id AS Empleado,
    detalles_pedidos.cantidad AS Cantidad,
    pedidos.fecha_pedido AS Fecha,
    pedidos.estado AS Estado
FROM pedidos
LEFT JOIN detalles_pedidos ON pedidos.pedido_id = detalles_pedidos.pedido_id
LEFT JOIN productos ON detalles_pedidos.producto_id = productos.producto_id;

--5. Encuentra los productos y, si existen, los detalles de pedidos en los que no se ha incluido el producto usando `RIGHT JOIN`. --
SELECT
    productos.producto_id AS Product,
    productos.nombre AS Nombre,
    productos.precio AS Precio,
    detalles_pedidos.cantidad AS Cantidad,
    detalles_pedidos.detalle_id AS Detalle_Pedido
FROM detalles_pedidos
RIGHT JOIN productos
ON detalles_pedidos.producto_id = productos.producto_id;

--6 Lista todos los empleados junto con los pedidos que han gestionado, si existen, usando `LEFT JOIN` para ver los empleados sin pedidos.--


SELECT
    empleados.empleado_id,
    empleados.puesto ,
    empleados.fecha_contratacion ,
    empleados.salario ,
    pedidos.fecha_pedido ,
    pedidos.estado 
FROM empleados
LEFT JOIN pedidos
ON empleados.empleado_id = pedidos.empleado_id;


--7 Encuentra los empleados que no han gestionado ningún pedido usando un `LEFT JOIN` combinado con `WHERE`. --

SELECT
    empleados.empleado_id,
    empleados.puesto Puesto,
    empleados.fecha_contratacion FechaContratacion,
    empleados.salario Salario,
    pedidos.fecha_pedido FechaPedido,
    pedidos.estado Estado
FROM empleados
LEFT JOIN pedidos
ON empleados.empleado_id = pedidos.empleado_id
WHERE pedidos.empleado_id IS NULL;

 -- 8.alcula el total gastado en cada pedido, mostrando el ID del pedido y el total, usando `JOIN`.
SELECT 
    pedidos.pedido_id AS PedidoID,
    pedidos.fecha_pedido AS FechaPedido,
    SUM(detalles_pedidos.precio_unitario * detalles_pedidos.cantidad) AS TotalGastado
FROM pedidos
JOIN detalles_pedidos
ON pedidos.pedido_id = detalles_pedidos.pedido_id
GROUP BY pedidos.pedido_id, pedidos.fecha_pedido;

--9.Realiza un `CROSS JOIN` entre clientes y productos para mostrar todas las combinaciones posibles de clientes y productos.--

SELECT * FROM usuarios CROSS JOIN productos;

--10 Encuentra los nombres de los clientes y los productos que han comprado, si existen, incluyendo los clientes que no han realizado pedidos usando `LEFT JOIN`.

SELECT
    usuarios.nombre AS Nombre,
    pedidos.estado AS Estado
FROM usuarios
LEFT JOIN pedidos ON usuarios.usuario_id = pedidos.cliente_id;

-- 11 Listar todos los proveedores que suministran un determinado producto. --
SELECT
    proveedores.nombre AS Proveedor,
    productos.nombre AS Producto,
    productos.categoria AS Categoria,
    productos.precio AS Precio
FROM proveedores
JOIN proveedores_productos
    ON proveedores.proveedor_id = proveedores_productos.proveedor_id
JOIN productos
    ON proveedores_productos.producto_id = productos.producto_id
WHERE productos.nombre = 'Teclado';


--12 Obtener todos los productos que ofrece un proveedor específico.-- 

SELECT
    proveedores.nombre AS Proveedor,
    productos.nombre AS Producto,
    productos.categoria AS Categoria,
    productos.precio AS Precio
FROM proveedores
JOIN proveedores_productos
    ON proveedores.proveedor_id = proveedores_productos.proveedor_id
JOIN productos
    ON proveedores_productos.producto_id = productos.producto_id
WHERE proveedores.nombre = 'Electrodomésticos del Norte'; 

-- 13 Lista los proveedores que no están asociados a ningún producto (es decir, que aún no suministran).--

SELECT
    proveedores.nombre AS Proveedor
FROM proveedores
JOIN proveedores_productos ON proveedores.proveedor_id = proveedores_productos.proveedor_id
WHERE proveedores_productos.producto_id IS NULL;

--14 Contar cuántos proveedores tiene cada producto. --

SELECT 
    productos.nombre AS Producto,
    COUNT(proveedores_productos.proveedor_id) AS Cantidad_Proveedores
FROM productos
JOIN proveedores_productos ON productos.producto_id = proveedores_productos.producto_id GROUP BY productos.nombre;


