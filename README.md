
🧠 Taller de SQL: Consultas Básicas y Subconsultas en MySQL
¡Bienvenid@ al Taller de SQL! En esta sesión aprenderás a trabajar con bases de datos relacionales mediante consultas básicas y subconsultas usando MySQL.

🎯 Objetivos del Taller
Durante este taller, serás capaz de:

Realizar consultas SQL básicas para extraer, filtrar y ordenar datos.

Comprender y aplicar subconsultas para resolver problemas complejos.

Utilizar subconsultas dentro de cláusulas como WHERE y FROM para realizar análisis más avanzados.

Construir consultas reales y útiles sobre una base de datos relacional.

📚 ¿Qué Vamos a Aprender?
Este taller está dividido en secciones prácticas:

Consultas Básicas

Uso de SELECT, WHERE, ORDER BY, GROUP BY.

Subconsultas en WHERE

Para filtrar registros con condiciones dependientes de otras consultas.

Subconsultas en FROM

Para crear tablas derivadas y realizar operaciones más complejas.

Ejercicios Prácticos

Resolverás situaciones reales de negocio usando SQL.

🧩 Estructura de la Base de Datos
La base de datos del taller incluye las siguientes tablas:

tipos_usuarios: Define si un usuario es cliente o empleado.

usuarios: Contiene información común de personas (clientes o empleados).

empleados: Información laboral de los empleados.

proveedores: Empresas proveedoras.

productos: Catálogo de productos.

proveedores_productos: Relación entre productos y proveedores.

pedidos: Encabezado de cada pedido realizado por un cliente.

detalles_pedidos: Detalle de productos en cada pedido.

🏗️ Scripts de Creación de Tablas
El esquema de base de datos está definido con claves foráneas, índices y restricciones. Aquí tienes algunos ejemplos clave:

sql
Copiar
Editar
-- Tabla de tipos de usuario
CREATE TABLE tipos_usuarios (
    tipo_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- Tabla de usuarios
CREATE TABLE usuarios (
    usuario_id INT AUTO_INCREMENT PRIMARY KEY,
    tipo_id INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    telefono VARCHAR(15),
    direccion VARCHAR(100),
    ciudad VARCHAR(50),
    pais VARCHAR(50),
    fecha_registro DATE NOT NULL DEFAULT (CURRENT_DATE),
    FOREIGN KEY (tipo_id) REFERENCES tipos_usuarios(tipo_id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);
(El resto del script está bien estructurado, por lo que no hace falta repetirlo completo aquí.)

💾 Carga de Datos
Aquí tienes datos precargados para el taller:

Tipos de Usuarios
sql
Copiar
Editar
INSERT INTO tipos_usuarios(nombre)
VALUES ('Cliente'), ('Empleado');
Clientes
Clientes de distintos lugares de España y Colombia:

sql
Copiar
Editar
INSERT INTO usuarios (tipo_id, nombre, email, telefono, direccion, ciudad, pais, fecha_registro)
VALUES
(1, 'Ana Pérez', 'ana.perez@gmail.com', '555-1234', 'Calle 123', 'Madrid', 'España', '2022-01-15'),
(1, 'Juan Quiroga', 'juan.quiroga@gmail.com', '+57 3001234567', 'Cra 10 #45-20', 'Bogotá', 'Colombia', '2025-06-01');
(...otros registros de clientes...)

Empleados y Datos Laborales
sql
Copiar
Editar
INSERT INTO usuarios (tipo_id, nombre, email, fecha_registro)
VALUES
(2, 'Carlos López', 'carlos.lopez@empresa.com', '2020-05-10');
Luego se relacionan con la tabla empleados:

sql
Copiar
Editar
INSERT INTO empleados (usuario_id, puesto, fecha_contratacion, salario)
VALUES (
  (SELECT usuario_id FROM usuarios WHERE email = 'carlos.lopez@empresa.com'),
  'Gerente de Ventas', '2020-05-10', 3500000.00
);
(...continúa con otros registros...)