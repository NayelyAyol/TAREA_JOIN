-- Crear la base de datos
create database red_social;
use red_social;

-- Se crea la tabla usuarios
create table usuarios (
    usuarioID int primary key not null, -- Se define la clave primaria y demas campos de la tabla
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    edad int not null,
    ciudad varchar(50) not null,
    seguidores int not null,
    fotos_publicadas int not null
);

-- Se crea la tabla fotos
create table fotos (
    fotoID int primary key not null, -- Se define la clave primaria y demas campos de la tabla
    usuarioID int, -- Campo que almacenara el ID del usuario
    foreign key (usuarioID) references usuarios(usuarioID), -- Se establece una relacion con la tabla usuarios
    descripcion varchar(255) not null,
    fecha date not null,
    me_gusta int not null
);

-- Se crea la tabla comentarios
create table comentarios (
    comentarioID int primary key not null, -- Se define la clave primaria y demas campos de la tabla
    fotoID int, -- Campo que almacenara el ID del de las fotos
	foreign key (fotoID) references fotos(fotoID), -- Se establece una relacion con la tabla fotos
    usuarioID int, -- Campo que almacenara el ID del usuario
    foreign key (usuarioID) references usuarios(usuarioID), -- Se establece una relacion con la tabla usuarios
    comentario text not null,
    fecha date not null
);

insert into usuarios (usuarioID, nombre, apellido, edad, ciudad, seguidores, fotos_publicadas) values
(1, 'María', 'Gómez', 25, 'Madrid', 350, 12),
(2, 'Carlos', 'López', 30, 'Barcelona', 420, 8),
(3, 'Ana', 'Martínez', 22, 'Valencia', 180, 5),
(4, 'Javier', 'Sánchez', 28, 'Sevilla', 600, 15),
(5, 'Lucía', 'Fernández', 35, 'Bilbao', 290, 7),
(6, 'Pedro', 'García', 40, 'Málaga', 150, 3),
(7, 'Sofía', 'Ruiz', 27, 'Zaragoza', 380, 9),
(8, 'David', 'Hernández', 31, 'Murcia', 210, 6),
(9, 'Elena', 'Jiménez', 29, 'Palma', 470, 11),
(10, 'Pablo', 'Díaz', 33, 'Alicante', 520, 14);

insert into fotos (fotoID, usuarioID, descripcion, fecha, me_gusta) values
(101, 1, 'Atardecer en la playa', '2023-05-15', 45),
(102, 2, 'Mi nuevo perro', '2023-06-20', 78),
(103, 3, 'Comida casera', '2023-04-10', 32),
(104, 1, 'Viaje a la montaña', '2023-07-05', 91),
(105, 4, 'Concierto de verano', '2023-08-12', 120),
(106, 5, 'Día de spa', '2023-03-18', 65),
(107, 6, 'Nueva bicicleta', '2023-02-22', 43),
(108, 1, 'Libro favorito', '2023-01-30', 28),
(109, 2, 'Jardín botánico', '2023-09-14', 87),
(110, null, 'Cena con amigos', '2023-10-05', 95),
(111, null, 'Deporte al aire libre', '2023-11-11', 110),
(112, null, 'Museo de arte', '2023-12-03', 52);

insert into comentarios (comentarioID, fotoID, usuarioID, comentario, fecha) values
(1001, 101, 2, '¡Qué bonito atardecer!', '2023-05-16'),
(1002, 101, 3, 'Me encantaría estar ahí', '2023-05-17'),
(1003, 104, 1, 'Las vistas son impresionantes', '2023-07-06'),
(1004, 105, 3, '¡Qué envidia!', '2023-08-13'),
(1005, 102, 4, 'Tu perro es adorable', '2023-06-21'),
(1006, 106, 1, 'Se ve relajante', '2023-03-19'),
(1007, 107, 3, 'Buena elección de modelo', '2023-02-23'),
(1008, 108, 5, 'Lo leí el mes pasado, es genial', '2023-01-31'),
(1009, 109, 6, 'Hermosas flores', '2023-09-15'),
(1010, 110, 6, 'Se ve delicioso todo', '2023-10-06'),
(1011, null, null, 'Qué energía', '2023-11-12'),
(1012, null, null, 'Fui la semana pasada', '2023-12-04'),
(1013, null, null, 'Espectacular foto astronómica', '2023-04-26');

-- CONSULTAS
-- INNER JOIN
-- 1. Relacionar usuarios con sus fotos publicadas.
select u.usuarioID, u.nombre, u.apellido,
f.fotoID, f.descripcion, f.fecha, f.me_gusta 
from usuarios u
-- Se usa inner join para mostrar solo coincidencias exactas entre ambas tablas
inner join fotos f on u.usuarioID = f.usuarioID; 

-- 2.	Relacionar fotos con los comentarios recibidos.
select f.fotoID, f.descripcion as Descripcion_foto, f.fecha as fecha_foto,
c.comentarioID, c.comentario, c.fecha as fecha_comentario 
from fotos f
-- Solo se mostraran fotos que tienen comentarios y comentarios que tienen fotos válidas
inner join comentarios c on f.fotoID=c.fotoID; 
-- Se relaciona las fotos con sus comentarios

-- 3. Relacionar usuarios con sus comentarios realizados.
select u.usuarioID, u.nombre, u.apellido, 
c.comentarioID, c.comentario, c.fecha as fecha_comentario 
from usuarios u
-- Solo se muestran los usuarios con comentarios
inner join comentarios c on u.usuarioID = c.usuarioID; 
-- Relaciona usuarios con sus comentarios a traves del ID


-- LEFT JOIN
-- 1. Mostrar todos los usuarios, incluyendo aquellos que no han subido ninguna foto.
-- Se muestran todos los registros, incluso los que no se relacionan
select u.usuarioID, u.nombre, u.apellido,
f.fotoID, f.descripcion, f.fecha, f.me_gusta 
from usuarios u -- Se mantienen todos los registros de esta tabla
-- Mantiene todos los usuarios aunque no tengan fotos
left join fotos f -- Esta tabla solo contiene coincidencias
on u.usuarioID = f.usuarioID; 

-- 2. Mostrar todas las fotos, incluyendo las que no tienen comentarios.
select f.fotoID, f.descripcion, f.fecha, f.me_gusta, 
c.comentarioID, c.comentario, c.fecha as fecha_comentario 
from fotos f -- Se mantienen todos los registros de esta tabla
-- Mantiene todas las fotos aunque no tengan comentarios
left join comentarios c -- Solo contiene coincidencias
on f.fotoID = c.fotoID;

-- 3. Mostrar todos los usuarios, incluyendo aquellos que no han realizado ningún comentario.
select u.usuarioID, u.nombre, u.apellido,
c.comentarioID, c.comentario, c.fecha as fecha_comentario
from usuarios u -- Se mantienen todos los registros de esta tabla
-- Mantiene todos los usuarios aunque no tengan comentarios
left join comentarios c -- Solo contiene coincidencias
on u.usuarioID = c.usuarioID;

-- RIGHT JOIN
-- 1) Mostrar todas las fotos, incluso las que no están asociadas a ningún usuario
select 
u.usuarioID, u.nombre, u.apellido, -- Datos del usuario pueden salir nulos si no hay relación
f.fotoID, f.descripcion, f.fecha, f.me_gusta -- Datos de las fotos siempre se muestran
from usuarios u
-- Se usa right join para mantener todas las fotos aunque no tengan usuario
right join fotos f on u.usuarioID = f.usuarioID;

-- 2)  Mostrar todos los comentarios, incluso los que no están asociados a ninguna foto
select 
    f.fotoID, f.descripcion, f.fecha, -- Datos de la foto,pueden salir nulos si no hay relación
    c.comentarioID, c.comentario, c.fecha as fecha_comentario -- Datos del comentario,siempre se muestran
from fotos f
-- righ join mantiene todos los comentarios aunque no tengan foto válida
right join comentarios c on f.fotoID = c.fotoID;

-- 3) Mostrar todos los comentarios, incluso los que no están asociados a ningún usuario
select 
    u.usuarioID, u.nombre, u.apellido, -- Datos del usuario, pueden ser nulos
    c.comentarioID, c.comentario, c.fecha as fecha_comentario -- Datos del comentario, siempre se muestran
from usuarios u
-- Se usa RIGHT JOIN para asegurar que todos los comentarios aparezcan aunque no tengan autor
right join comentarios c on u.usuarioID = c.usuarioID;

-- FULL OUTER JOIN
-- 1) Mostrar todos los usuarios y fotos, incluidas las que no tienen relación entre sí.
-- Usuarios que tienen o no tienen fotos
select 
u.usuarioID, u.nombre, u.apellido, 
f.fotoID, f.descripcion, f.fecha, f.me_gusta
from usuarios u
left join fotos f on u.usuarioID = f.usuarioID;

-- Fotos que tienen o no tienen usuario, por si hay fotos sin autor
select 
u.usuarioID, u.nombre, u.apellido, 
f.fotoID, f.descripcion, f.fecha, f.me_gusta
from usuarios u
right join fotos f on u.usuarioID = f.usuarioID;

-- 2) Mostrar todas las fotos y comentarios, incluidos los no relacionados entre sí
-- Fotos que pueden tener comentarios o no
select 
f.fotoID, f.descripcion, f.fecha, f.me_gusta,
c.comentarioID, c.comentario, c.fecha as fecha_comentario
from fotos f
left join comentarios c on f.fotoID = c.fotoID;

-- Comentarios que pueden no estar relacionados con ninguna foto
select 
f.fotoID, f.descripcion, f.fecha, f.me_gusta,
c.comentarioID, c.comentario, c.fecha as fecha_comentario
from fotos f
right join comentarios c on f.fotoID = c.fotoID;


-- 3) Mostrar todos los usuarios y comentarios, incluidos los no relacionados entre sí
-- Usuarios que pueden tener o no tener comentarios
select 
u.usuarioID, u.nombre, u.apellido,
c.comentarioID, c.comentario, c.fecha as fecha_comentario
from usuarios u
left join comentarios c on u.usuarioID = c.usuarioID;

-- Comentarios que pueden no tener usuario
select 
u.usuarioID, u.nombre, u.apellido,
c.comentarioID, c.comentario, c.fecha as fecha_comentario
from usuarios u
right join comentarios c on u.usuarioID = c.usuarioID;