-- BBDD Ejercicios de tienda
USE tienda;
DESCRIBE producto;
-- 1
SELECT nombre FROM producto;
-- 2
SELECT nombre, precio FROM producto;
-- 3
SELECT * FROM producto;
-- 4
SELECT precio AS 'euros', ROUND (precio * 1.15, 2) AS 'dolars' FROM producto;
-- 5
SELECT nombre, precio AS 'euros', ROUND (precio * 1.15, 2) AS 'dolars' FROM producto;
-- 6
SELECT UPPER (nombre), precio AS 'euros', ROUND (precio * 1.15, 2) AS 'dolars' FROM producto; 
-- 7
SELECT LOWER (nombre), precio AS 'euros', ROUND (precio * 1.15, 2) AS 'dolars' FROM producto;
-- 8
SELECT nombre, UPPER(LPAD(nombre, 2)) FROM fabricante;
-- 9
SELECT nombre, ROUND(precio, 2) FROM producto; 
-- 10
SELECT nombre, TRUNCATE(precio, 0) FROM producto;
-- 11
SELECT fabricante.codigo FROM fabricante INNER JOIN producto ON producto.codigo_fabricante = fabricante.codigo;

