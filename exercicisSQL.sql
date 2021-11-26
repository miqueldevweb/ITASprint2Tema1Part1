-- BBDD Ejercicios de tienda
USE tienda;


-- 1
SELECT nombre FROM producto;
-- 2
SELECT nombre, precio FROM producto;
-- 3
SELECT * FROM producto;
-- 4
SELECT precio AS 'euros', ROUND (precio * 1.15, 2) AS 'dolars' FROM producto;
-- 5
SELECT nombre AS 'nom de producto', precio AS 'euros', ROUND (precio * 1.15, 2) AS 'dolars' FROM producto;
-- 6
SELECT UPPER (nombre), precio FROM producto; 
-- 7
SELECT LOWER (nombre), precio FROM producto;
-- 8
SELECT nombre, UPPER(LPAD(nombre, 2)) FROM fabricante;
-- 9
SELECT nombre, ROUND(precio, 0) FROM producto;
-- 10
SELECT nombre, TRUNCATE(precio, 0) FROM producto;
-- 11
SELECT fabricante.codigo FROM fabricante JOIN producto ON producto.codigo_fabricante = fabricante.codigo;
-- 12
SELECT  DISTINCT fabricante.codigo FROM fabricante JOIN producto ON producto.codigo_fabricante = fabricante.codigo;
-- 13
SELECT nombre FROM fabricante ORDER BY nombre;
-- 14
SELECT nombre FROM fabricante ORDER BY nombre DESC;
-- 15
SELECT 	nombre, precio FROM producto ORDER BY nombre, precio DESC;
-- 16
SELECT * FROM fabricante LIMIT 5;
-- 17
SELECT * FROM fabricante LIMIT 3,2;
-- 18
SELECT nombre, precio FROM producto ORDER BY precio LIMIT 1;
-- 19
SELECT nombre, precio FROM producto ORDER BY precio DESC limit 1;
-- 20
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
-- 21
SELECT producto.nombre, precio, fabricante.nombre AS "nombre de fabricante" FROM producto, fabricante;
-- 22
SELECT producto.nombre, precio, fabricante.nombre AS "nombre de fabricante" FROM producto, fabricante ORDER BY fabricante.nombre;
-- 23
SELECT producto.codigo, producto.nombre, fabricante.codigo AS "codigo fabricante", fabricante.nombre FROM producto, fabricante;
-- 24
SELECT producto.nombre, MIN(precio), fabricante.nombre FROM producto, fabricante;
-- 25
SELECT producto.nombre, MAX(precio), fabricante.nombre FROM producto, fabricante;
-- 26
SELECT producto.nombre FROM producto, fabricante WHERE fabricante.nombre = "lenovo";
-- 27
SELECT producto.nombre FROM producto, fabricante WHERE fabricante.nombre = "crucial" AND precio > 200;
-- 28
SELECT producto.nombre FROM producto, fabricante WHERE fabricante.nombre = "asus" OR fabricante.nombre = "hewlett-packard" OR fabricante.nombre = "seagate";
-- 29
SELECT producto.nombre FROM producto, fabricante WHERE fabricante.nombre IN ("asus", "hewlett-packard", "seagate");
-- 30
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto, fabricante WHERE fabricante.nombre REGEXP 'e$';
-- 31
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto, fabricante WHERE fabricante.nombre REGEXP '[w]';
-- 32
SELECT producto.nombre, precio, fabricante.nombre FROM producto, fabricante WHERE PRECIO >= 180 ORDER BY precio DESC, fabricante.nombre;
-- 33
SELECT fabricante.codigo, fabricante.nombre FROM fabricante JOIN  producto ON fabricante.codigo = producto.codigo_fabricante;
-- 34
SELECT fabricante.nombre, producto.nombre FROM fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante;
-- 35
SELECT fabricante.nombre FROM fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE producto.codigo_fabricante IS NULL;
-- 36
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
-- 37
SELECT * FROM producto WHERE codigo_fabricante != 2;
-- 38
SELECT * FROM producto WHERE codigo_fabricante = 2 ORDER BY precio DESC LIMIT 1;
-- 39
SELECT * FROM producto WHERE codigo_fabricante = 3 ORDER BY precio LIMIT 1;
-- 40
SELECT * FROM producto WHERE precio >= (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = 2);
-- 41
SELECT * FROM producto WHERE precio > ((SELECT AVG(precio) FROM producto WHERE codigo_fabricante = 1)) AND codigo_fabricante = 1;



-- BBDD Ejercicios de universidad
USE universidad;


-- [...]visualitza el diagrama E-R en un editor i efectua les següents consultes:

-- 1
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1, apellido2, nombre;
-- 2
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;
-- 3
SELECT * FROM persona WHERE fecha_nacimiento BETWEEN "1999-1-1" AND "1999-12-31" AND tipo = 'alumno';
-- 4
SELECT * FROM persona WHERE tipo = 'profesor' AND  nif REGEXP 'K$';
-- 5
SELECT nombre FROM asignatura WHERE curso = 3 AND cuatrimestre = 1 AND id_grado = 7;
-- 6
SELECT apellido1, apellido2, persona.nombre, departamento.nombre FROM (persona JOIN profesor ON persona.id = profesor.id_profesor) INNER JOIN departamento ON profesor.id_departamento = departamento.id ORDER BY apellido1, apellido2, persona.nombre;
-- 7
SELECT persona.nif, asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM ((persona INNER JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno) INNER JOIN asignatura ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura) INNER JOIN curso_escolar ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar WHERE persona.nif = '26902806M';
-- 8
SELECT DISTINCT departamento.nombre FROM ((departamento INNER JOIN profesor ON departamento.id = profesor.id_departamento) INNER JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor) INNER JOIN grado ON asignatura.id_grado = grado.id WHERE grado.id = 4;
-- 9
SELECT DISTINCT persona.nombre, curso_escolar.anyo_inicio FROM (persona INNER JOIN alumno_se_matricula_asignatura ama ON persona.id = ama.id_alumno) INNER JOIN curso_escolar ON curso_escolar.id = ama.id_curso_escolar WHERE curso_escolar.anyo_inicio = '2018';


-- Resolgui les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.

-- 1
SELECT departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre FROM (persona JOIN profesor ON persona.id = profesor.id_profesor) LEFT JOIN departamento ON profesor.id_departamento = departamento.id ORDER BY departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre;
-- 2
SELECT persona.nombre FROM (persona JOIN profesor ON persona.id = profesor.id_profesor) LEFT JOIN departamento ON profesor.id_departamento = departamento.id WHERE profesor.id_departamento IS NULL;
-- 3
SELECT DISTINCT departamento.nombre FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento WHERE profesor.id_departamento IS NULL;
-- 4
SELECT DISTINCT persona.nombre FROM (persona JOIN profesor ON persona.id = profesor.id_profesor) LEFT JOIN  asignatura ON  asignatura.id_profesor = profesor.id_profesor WHERE asignatura.id_profesor IS NULL;
-- 5
SELECT DISTINCT asignatura.nombre FROM (persona JOIN profesor ON persona.id = profesor.id_profesor) RIGHT JOIN  asignatura ON  asignatura.id_profesor = profesor.id_profesor WHERE asignatura.id_profesor IS NULL;
-- 6
SELECT DISTINCT departamento.nombre FROM ((departamento JOIN profesor ON departamento.id = profesor.id_departamento) LEFT JOIN  asignatura ON profesor.id_profesor = asignatura.id_profesor) WHERE asignatura.id_profesor IS NULL;


-- Consultes resum:

-- 1
SELECT COUNT(persona.nombre) FROM persona WHERE tipo = 'alumno';
-- 2
SELECT COUNT(persona.nombre) FROM persona WHERE fecha_nacimiento BETWEEN '1999-1-1' AND '1999-12-31' AND tipo = 'alumno';
-- 3
SELECT departamento.nombre, COUNT(profesor.id_departamento) FROM profesor JOIN departamento ON departamento.id = profesor.id_departamento GROUP BY departamento.nombre;
-- 4
SELECT departamento.nombre, COUNT(profesor.id_departamento) FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento GROUP BY departamento.nombre;
-- 5
SELECT grado.nombre, COUNT(asignatura.nombre) FROM grado LEFT JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.nombre ORDER BY grado.nombre DESC;
-- 6 ->
SELECT grado.nombre, COUNT(asignatura.nombre) FROM grado JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.nombre HAVING COUNT(asignatura.nombre) > 40;
-- 7
SELECT grado.nombre, asignatura.tipo, SUM(creditos) FROM grado JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY asignatura.tipo, grado.nombre;
-- 8
SELECT anyo_inicio, COUNT(alumno_se_matricula_asignatura.id_alumno) FROM curso_escolar JOIN alumno_se_matricula_asignatura ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar GROUP BY curso_escolar.anyo_inicio;
-- 9
SELECT profesor.id_profesor, persona.nombre, persona.apellido1, persona.apellido2, COUNT(asignatura.id_profesor) FROM (persona JOIN profesor ON persona.id = profesor.id_profesor) LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor GROUP BY asignatura.id_profesor, persona.nombre ORDER BY COUNT(asignatura.id_profesor) DESC;
-- 10
SELECT * FROM persona WHERE persona.tipo = 'alumno' ORDER BY persona.fecha_nacimiento DESC LIMIT 1;
-- 11
SELECT * FROM (profesor JOIN departamento ON profesor.id_departamento = departamento.id) LEFT JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor WHERE asignatura.id_profesor IS NULL;














































