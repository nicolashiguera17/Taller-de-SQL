-- Active: 1749134984621@@127.0.0.1@3307@taller
-- 1. Consulta todos los datos de la tabla `usuarios` para ver la lista completa de clientes. --
SELECT * FROM usuarios;

-- 2.Muestra los nombres y correos electrónicos de todos los clientes que residen en la ciudad de Madrid.--
SELECT nombre,email,ciudad FROM usuarios
WHERE ciudad = 'Madrid';

--3.Obtén una lista de productos con un precio mayor a $100.000, mostrando solo el nombre y el precio.--
SELECT nombre,precio from productos
WHERE precio > 100000;

--4.Encuentra todos los empleados que tienen un salario superior a $2.500.000, mostrando su nombre, puesto y salario.--
SELECT usuarios.nombre, empleados.puesto,empleados.salario
FROM usuarios 
JOIN empleados
ON usuarios.usuario_id = empleados.usuario_id
WHERE empleados.salario > 2500000; 

--5.Lista los nombres de los productos en la categoría "Electrónica", ordenados alfabéticamente.--

SELECT nombre,categoria from productos
where categoria = 'Electrónica' 
ORDER BY nombre ASC;

--6.Muestra los detalles de los pedidos que están en estado "Pendiente", incluyendo el ID del pedido, el ID del cliente y la fecha del pedido.--

SELECT cliente_id, pedido_id,fecha_pedido,estado from pedidos
WHERE estado = 'Pendiente';

--7.Encuentra el nombre y el precio del producto más caro en la base de datos.--
SELECT nombre , precio 
FROM productos
WHERE precio = (SELECT MAX(precio) FROM productos);

--8. Obtén el total de pedidos realizados por cada cliente, mostrando el ID del cliente y el total de pedidos.--
SELECT cliente_id, COUNT(*) FROM pedidos GROUP BY cliente_id;

--9. Calcula el promedio de salario de todos los empleados en la empresa.--

SELECT AVG(salario) from empleados;

--10. Encuentra el número de productos en cada categoría, mostrando la categoría y el número de productos.--
SELECT categoria, count(*) FROM productos GROUP BY categoria;

--11.Obtén una lista de productos con un precio mayor a $75 USD, mostrando solo el nombre, el precio y su respectivo precio en USD.--
SELECT nombre,precio/4000 FROM productos
WHERE (precio/4000)>75;

--12.Lista todos los proveedores registrados.--
SELECT * FROM proveedores 