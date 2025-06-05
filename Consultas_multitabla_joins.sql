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

