# 🧠 Taller de SQL: Consultas Básicas y Subconsultas en MySQL

¡Bienvenid@ al **Taller de SQL**! En esta sesión aprenderás a trabajar con bases de datos relacionales mediante **consultas básicas** y **subconsultas** usando MySQL.

---

## 🎯 Objetivos del Taller

Durante este taller, serás capaz de:

1. Realizar **consultas SQL básicas** para extraer, filtrar y ordenar datos.
2. Comprender y aplicar **subconsultas** para resolver problemas complejos.
3. Utilizar subconsultas dentro de cláusulas como `WHERE` y `FROM` para realizar análisis más avanzados.
4. Construir **consultas reales y útiles** sobre una base de datos relacional.

---

## 📚 ¿Qué Vamos a Aprender?

Este taller está dividido en secciones prácticas:

1. **Consultas Básicas**
   - Uso de `SELECT`, `WHERE`, `ORDER BY`, `GROUP BY`.

2. **Subconsultas en `WHERE`**
   - Para filtrar registros con condiciones dependientes de otras consultas.

3. **Subconsultas en `FROM`**
   - Para crear tablas derivadas y realizar operaciones más complejas.

4. **Ejercicios Prácticos**
   - Resolverás situaciones reales de negocio usando SQL.

---

## 🧩 Estructura de la Base de Datos

La base de datos del taller incluye las siguientes tablas:

- **tipos_usuarios**: Define si un usuario es cliente o empleado.
- **usuarios**: Contiene información común de personas (clientes o empleados).
- **empleados**: Información laboral de los empleados.
- **proveedores**: Empresas proveedoras.
- **productos**: Catálogo de productos.
- **proveedores_productos**: Relación entre productos y proveedores.
- **pedidos**: Encabezado de cada pedido realizado por un cliente.
- **detalles_pedidos**: Detalle de productos en cada pedido.

---

## 🏗️ Scripts de Creación de Tablas

Ejemplo de estructura:

```sql
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
