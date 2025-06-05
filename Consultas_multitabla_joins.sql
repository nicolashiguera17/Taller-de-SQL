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
