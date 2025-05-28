-- creamos nuestra base de datos llamada cursos
create database cursos;
use cursos;

-- Creamos la tabla instructores
create table instructores(
-- Definimos como tal la clave primaria y los demás campos
instructorID int primary key auto_increment not null,
nombre varchar(100) not null,
especialidad varchar(100) not null
);

-- Creamos la tabla estudiantes
create table estudiantes(
-- Definimos la clave primaria y los demás campos
estudianteID int primary key auto_increment not null,
nombreEstudiante varchar(100) not null,
fechaInscripcion date not null
);

-- Creamos la tabla cursos
create table cursos(
-- Definimos la clave primaria y los demás campos
cursoID int primary key auto_increment not null,
nombreCurso varchar(100) not null,
fechaInscripcion date not null,
instructorID int,
foreign key(instructorID) references instructores(instructorID)
);

-- Creamos la tabla inscripciones
create table inscripciones(
-- Definimos la clave primaria y los demás campos
inscripcionID int primary key auto_increment not null,
estudianteID int,
foreign key(estudianteID) references estudiantes(estudianteID),
cursoID int,
foreign key(cursoID) references cursos(cursoID)
);

-- Creamos la tabla leccionescompletadas
create table leccionescompletadas(
-- Definimos la clave primaria y los demás campos
leccionID int primary key auto_increment not null,
leccionesCompletadas int not null,
estudianteID int,
foreign key(estudianteID) references estudiantes(estudianteID),
cursoID int,
foreign key(cursoID) references cursos(cursoID)
);

-- Se inserta datos en la tabla instructores
insert into instructores (nombre,especialidad) values
('Damián Ríos', 'Culinaria'),
('Jack Navarro', 'Psicología'),
('Magnus Silva', 'Desarrollo de Software'),
('Jaziel Cruz', 'Psicología Forense'),
('Aitana Vega', 'Inteligencia Artificial'),
('Zoe Medina', 'Pastelería'),
('Thiago Pérez', 'Bases de Datos'),
('Alma Delgado', 'Neuropsicología'),
('Iván Herrera', 'Ciberseguridad'),
('Noa Estrada', 'Educación Infantil');

-- Se inserta datos en la tabla estudiantes
insert into estudiantes(nombreEstudiante,fechaInscripcion) values
('Isabela Torres', '2024-09-01'),
('Carlos Molina', '2024-09-03'),
('Luna Márquez', '2024-09-05'),
('Tomás Jiménez', '2024-09-07'),
('Camila Solís', '2024-09-08'),
('Martín Duarte', '2024-09-10'),
('Daniela Ávila', '2024-09-12'),
('Andrés Roldán', '2024-09-15'),
('Florencia Peña', '2024-09-17'),
('Benjamín León', '2024-09-20');

-- Se inserta datos en la tabla cursos
insert into cursos(nombreCurso,fechaInscripcion,instructorId)values
('Culinaria Profesional', '2024-09-01', 1),
('Psicología General', '2024-09-02', 2),
('Desarrollo de Software', '2024-09-03', 3),
('Psicología Forense', '2024-09-04', 4),
('Inteligencia Artificial', '2024-09-05', 5),
('Repostería Creativa', '2024-09-06', 6),
('Diseño de Bases de Datos', '2024-09-07', 7),
('Neuropsicología Aplicada', '2024-09-08', 8),
('Hacking Ético', '2024-09-09', 9),
('Didáctica Infantil', '2024-09-10', 10);

-- Se inserta datos en la tabla inscripciones
insert into inscripciones(estudianteID, cursoID) values
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10);

-- Se inserta datos en la tabla leccionescompletadas
insert into leccionescompletadas(leccionesCompletadas, estudianteID, cursoID) values
(5, 1, 1), (3, 2, 2), (4, 3, 3), (6, 4, 4), (2, 5, 5),
(7, 6, 6), (5, 7, 7), (8, 8, 8), (6, 9, 9), (9, 10, 10);


-- CONSULTAS
-- INNER JOIN
-- 1) Relacionar estudiantes con cursos en los que están inscritos.
select e.nombreEstudiante, c.nombreCurso
from estudiantes e
inner join inscripciones i on e.estudianteID = i.estudianteID
inner join cursos c on i.cursoID = c.cursoID;
-- 2) Relacionar cursos con sus instructores.
select c.nombreCurso, i.nombre as nombreInstructor
from cursos c
inner join instructores i on c.instructorID = i.instructorID;
-- 3) Relacionar estudiantes con lecciones completadas.
select e.nombreEstudiante, lc.leccionesCompletadas, c.nombreCurso
from leccionescompletadas lc
inner join estudiantes e on lc.estudianteID = e.estudianteID
inner join cursos c on lc.cursoID = c.cursoID;
-- LEFT JOIN 
-- 1) Mostrar todos los estudiantes, incluso aquellos que no están inscritos en ningún curso.
select e.nombreEstudiante, c.nombreCurso
from estudiantes e
left join inscripciones i on e.estudianteID = i.estudianteID
left join cursos c on i.cursoID = c.cursoID;
-- 2) Mostrar todos los cursos, incluyendo aquellos sin instructor asignado.
select c.nombreCurso, i.nombre as nombreInstructor
from cursos c
left join instructores i on c.instructorID = i.instructorID;
-- 3) Mostrar todos los estudiantes, incluso aquellos que no han completado ninguna lección.
select e.nombreEstudiante, c.nombreCurso, lc.leccionesCompletadas
from estudiantes e
left join leccionescompletadas lc on e.estudianteID = lc.estudianteID
left join cursos c on lc.cursoID = c.cursoID;
-- RIGHT JOIN 
-- 1) Mostrar todos los cursos, incluso aquellos que no tienen estudiantes inscritos.
select e.nombreEstudiante, c.nombreCurso
from estudiantes e
right join inscripciones i on e.estudianteID = i.estudianteID
right join cursos c on i.cursoID = c.cursoID;
-- 2) Mostrar todos los instructores, incluso aquellos que no tienen cursos a su cargo.
select c.nombreCurso, i.nombre as nombreInstructor
from cursos c
right join instructores i on c.instructorID = i.instructorID;
-- 3) Mostrar todas las lecciones, incluyendo las que no han sido completadas por ningún estudiante.
select e.nombreEstudiante, c.nombreCurso, lc.leccionesCompletadas
from estudiantes e
right join leccionescompletadas lc on e.estudianteID = lc.estudianteID
right join cursos c on lc.cursoID = c.cursoID;
-- FULL OUTER JOIN
-- 1) Mostrar todos los estudiantes y cursos, incluso los no relacionados entre sí.
-- Estudiantes con sus cursos (incluso si no están inscritos)
select e.nombreEstudiante, c.nombreCurso
from estudiantes e
left join inscripciones i on e.estudianteID = i.estudianteID
left join cursos c on i.cursoID = c.cursoID
union
select e.nombreEstudiante, c.nombreCurso
from estudiantes e
right join inscripciones i on e.estudianteID = i.estudianteID
right join cursos c on i.cursoID = c.cursoID;
-- 2) Mostrar todos los cursos y instructores, incluidos los no relacionados entre sí.
select c.nombreCurso, i.nombre as nombreInstructor
from cursos c
left join instructores i on c.instructorID = i.instructorID
union
select c.nombreCurso, i.nombre as nombreInstructor
from cursos c
right join instructores i on c.instructorID = i.instructorID;
-- 3) Mostrar todos los estudiantes y lecciones, incluso las no relacionadas entre sí.
select e.nombreEstudiante, c.nombreCurso, lc.leccionesCompletadas
from estudiantes e
left join leccionescompletadas lc on e.estudianteID = lc.estudianteID
left join cursos c on lc.cursoID = c.cursoID
union
select e.nombreEstudiante, c.nombreCurso, lc.leccionesCompletadas
from estudiantes e
right join leccionescompletadas lc on e.estudianteID = lc.estudianteID
right join cursos c on lc.cursoID = c.cursoID;