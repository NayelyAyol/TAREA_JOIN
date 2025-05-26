create database clinicas; -- Se crea la base de datos clinica
use clinicas;

-- Se crea la tabla pacientes
create table pacientes(
	pacientesID int primary key not null, -- Se define la clave primaria y demas campos de la tabla
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    edad int not null,
    ciudad varchar(50) not null,
    direccion varchar(100) not null
);

-- Se crea la tabla doctores
create table doctores(
	doctorID int primary key not null, -- Se define la clave primaria y demas campos de la tabla
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    especialidad varchar(50) not null
);

-- Se crea la tabla medicamentos
create table medicamentos(
	medicamentoID int primary key not null, -- Se define la clave primaria y demas campos de la tabla
    nombre varchar(50) not null,
    descripcion varchar(100) not null
);

-- Se crea la tabla consultas
create table consultas(
	consultaID int primary key not null, -- Se define la clave primaria y demas campos de la tabla
    pacienteID int, -- Campo que almacenara el ID del paciente
    foreign key (pacienteID) references pacientes(pacientesID), -- Se establece una relacion con la tabla pacientes
    doctorID int,
    foreign key (doctorID) references doctores(doctorID),
    fecha date not null
);

-- Se crea la tabla recetas
create table recetas(
	recetaID int primary key not null, -- Se define la clave primaria y demas campos de la tabla
    pacienteID int, -- Campo que almacenará el ID del paciente
    foreign key (pacienteID) references pacientes(pacientesID), -- Se establece una relacion con la tabla pacientes
    medicamentoID int, -- Campo que almacenará el ID del medicamento
    foreign key (medicamentoID) references medicamentos(medicamentoID), -- Se establece relación con la tabla medicamentos
    doctorID int, -- Campo que almacenará el ID del doctor
    foreign key (doctorID) references doctores(doctorID), -- Se establece una relacion con la tabla doctores
    fecha date not null
);

-- Se insertan datos en la tabla pacientes
insert into pacientes(pacientesID, nombre, apellido, edad, ciudad, direccion) values
(101, 'Laura', 'García', 28, 'Madrid', 'Calle Alcalá 123'),
(102, 'Carlos', 'Martínez', 35, 'Barcelona', 'Avenida Diagonal 456'),
(103, 'Ana', 'López', 42, 'Valencia', 'Calle Colón 789'),
(104, 'Javier', 'Sánchez', 50, 'Sevilla', 'Plaza Nueva 321'),
(105, 'Marta', 'Fernández', 22, 'Málaga', 'Calle Larios 654'),
(106, 'David', 'Pérez', 65, 'Zaragoza', 'Paseo Independencia 101'),
(107, 'Sofía', 'Gómez', 38, 'Bilbao', 'Gran Vía 202'),
(108, 'Daniel', 'Ruiz', 29, 'Murcia', 'Plaza Circular 303'),
(109, 'Elena', 'Hernández', 45, 'Palma', 'Paseo Marítimo 404'),
(110, 'Pablo', 'Díaz', 31, 'Alicante', 'Explanada España 505'),
(111, 'Alejandro', 'Martín', 29, 'Alicante', 'Avenida de Denia 210'),
(112, 'Sara', 'González', 33, 'Alicante', 'Calle San Fernando 75'),
(113, 'Jorge', 'Soler', 30, 'Alicante', 'Paseo de la Explanada 12');

-- Se insertan datos en la tabla doctores
insert into doctores(doctorID, nombre, apellido, especialidad) values
(201, 'Juan', 'Rodríguez', 'Cardiología'),
(202, 'María', 'Gutiérrez', 'Pediatría'),
(203, 'Luis', 'Moreno', 'Traumatología'),
(204, 'Carmen', 'Jiménez', 'Dermatología'),
(205, 'Pedro', 'Navarro', 'Neurología'),
(206, 'Teresa', 'Romero', 'Ginecología'),
(207, 'Alberto', 'Torres', 'Oftalmología'),
(208, 'Isabel', 'Serrano', 'Endocrinología'),
(209, 'Francisco', 'Molina', 'Psiquiatría'),
(210, 'Rosa', 'Ortega', 'Medicina General'),
(211, 'Gabriela', 'Méndez', 'Oncología'),
(212, 'Ricardo', 'Fernández', 'Cardiología Pediátrica'),
(213, 'Patricia', 'Silva', 'Medicina Interna');

-- Se insertan datos en la tabla medicamentos
insert into medicamentos(medicamentoID, nombre, descripcion) values
(301, 'Ibuprofeno', 'Antiinflamatorio no esteroideo'),
(302, 'Paracetamol', 'Analgésico y antipirético'),
(303, 'Amoxicilina', 'Antibiótico betalactámico'),
(304, 'Omeprazol', 'Inhibidor de la bomba de protones'),
(305, 'Loratadina', 'Antihistamínico para alergias'),
(306, 'Simvastatina', 'Para reducir el colesterol'),
(307, 'Metformina', 'Antidiabético oral'),
(308, 'Salbutamol', 'Broncodilatador para el asma'),
(309, 'Diazepam', 'Ansiolítico y relajante muscular'),
(310, 'Atorvastatina', 'Hipolipemiante'),
(311, 'Rosuvastatina', 'Hipolipemiante de última generación'),
(312, 'Metoprolol', 'Bloqueador beta para hipertensión'),
(313, 'Losartán', 'Antihipertensivo antagonista de receptores de angiotensina II');

-- Se insertan datos en la tabla consultas
insert into consultas(consultaID, pacienteID, doctorID, fecha) values
(401, 101, 201, '2025-05-10'),
(402, 102, 202, '2025-05-11'),
(403, 103, 203, '2025-05-12'),
(404, 104, 204, '2025-05-13'),
(405, 105, 205, '2025-05-14'),
(406, 106, 206, '2025-05-15'),
(407, 107, 207, '2025-05-16'),
(408, 108, 208, '2025-05-17'),
(409, 109, 209, '2025-05-18'),
(410, 110, 210, '2025-05-19'),
(411, null, null, '2025-05-12'),
(412, null, null, '2025-05-15'),
(413, null, null, '2025-05-19');

-- Se insertan datos en la tabla recetas
insert into recetas(recetaID, pacienteID, medicamentoID, doctorID, fecha) values
(501, 101, 301, 201, '2025-05-10'),
(502, 101, 302, 201, '2025-05-10'),
(503, 102, 303, 202, '2025-05-11'),
(504, 103, 304, 203, '2025-05-12'),
(505, 104, 305, 204, '2025-05-13'),
(506, 105, 306, 205, '2025-05-14'),
(507, 106, 307, 206, '2025-05-15'),
(508, 107, 308, 207, '2025-05-16'),
(509, 108, 309, 208, '2025-05-17'),
(510, 109, 310, 209, '2025-05-18'),
(511, 110, 301, 210, '2025-05-19'),
(512, 110, 302, 210, '2025-05-20'),
(513, null, null, 211, '2025-05-21'), 
(514, null, null, 212, '2025-05-22'),  
(515, null, null, 210, '2025-05-23');


-- CONSULTAS
-- INNER JOIN
-- Se usa inner join para combinar los registros de dos o mas tablas(con una condicion de relacion entre ellas), en este caso la tabla pacientes y la tabla consultas

-- 1. Relacionar pacientes con consultas cuando ambos están registrados.
-- En este caso la relacion es encontrar pacientes con consultas registradas
select p.pacientesID, p.nombre as nombre_paciente, p.apellido as apellido_paciente,
c.consultaID, c.fecha as fecha_consulta from pacientes p
inner join consultas c on p.pacientesID = c.pacienteID; 

-- 2. Relacionar consultas con doctores asignados.
-- La relacion que comparten las tablas consultas y doctores es:
-- "los doctores asigandos a cada consulta"
select c.consultaID, c.fecha as fecha_consulta,
d.doctorID, d.nombre as nombre_doctor, 
d.apellido as apellido_doctor, d.especialidad as especialidad_doctor
from doctores d inner join consultas c on d.doctorID = c.doctorID;  

-- 3.	Relacionar medicamentos recetados con los pacientes que los reciben.
-- Se relacionan cuatro tablas (medicamentos, recetas, pacientes y doctores)
select r.recetaID, r.fecha as fecha_receta, p.pacientesID, p.nombre as nombre_paciente,
p.apellido as apellido_paciente, m.medicamentoID, 
m.nombre as nombre_medicamento, d.nombre as nombre_doctor, 
d.apellido as apellido_doctor from recetas r
-- Se relaciona una receta con el paciente al que le corresponde
inner join pacientes p on r.pacienteID = p.pacientesID
-- Relacion entre la receta y el medicamento que se ha prescrito
inner join medicamentos m on r.medicamentoID = m.medicamentoID
-- La receta se conecta con el doctor que la ha emitido
inner join doctores d on r.doctorID = d.doctorID;

-- LEFT JOIN
-- Sirve para combinar los datos de las dos tablas manteniendo los registros de la tabla izquierda
-- incluso cuando no hay coincidencias en la tabla derecha

-- 1.	Mostrar todos los pacientes, incluyendo aquellos que aún no tienen consultas agendadas.
select p.pacientesID, p.nombre as nombre_paciemte, p.apellido as apellido_paciente,
c.consultaID, c.fecha as fecha_consulta 
from pacientes p -- Esta es la tabla izquierda (primera tabla mencionada) de la cual todos los registros se mantienen
left join consultas c -- Esta tabla derecha solo contiene coincidencias
on p.pacientesID = c.pacienteID; 

-- 2.	Mostrar todas las consultas, incluyendo las que no tienen doctor asignado.
-- Si una consulta no tiene un doctor asignado se mostraran las columnas con los datos de los doctores llena valores nulos
select c.consultaID, c.fecha as fecha_consulta, 
d.nombre as nombre_doctor, d.apellido as apellido_doctor, d.especialidad as especialidad_doctor
from consultas c -- Tabla principal con todas las consultas
left join doctores d -- Tabla secundaria con las coincidencias
on c.doctorID =d.doctorID;

-- 3.	Mostrar todos los pacientes, incluyendo aquellos que no reciben medicamentos.
-- Si un paciente no tiene una receta entonces el ID de la receta y el medicamento se mostraran con valores nulos
select p.pacientesID, p.nombre as nombre_paciente, p.apellido as apellido_paciente,
r.recetaID, m.nombre as nombre_medicamento
from pacientes p -- Tabla principal de la cual se mostraran todos los registros 
-- Se conecta a los pacientes con las recetas, se mantienen todos los pacientes aunque no tengan recetas
left join recetas r on p.pacientesID = r.pacienteID
-- Se conecta recetas con medicamentos, se aplica solo a los pacientes que tienen recetas
left join medicamentos m on r.medicamentoID = m.medicamentoID;


-- RIGHT JOIN
-- Es una operacion de union entre tablas que mantiene todos los registros de la tabla principal (segunda tabla mencionada)
-- y solo muestra los registros de coincidencias de la tabla secundaria (primera tabla mencionada)

-- 1.	Mostrar todas las consultas, incluso aquellas que no están asignadas a un paciente.
-- Se muestran todas las consultas medicas y las que no tienen un paciente asignado se muestran con valores nulos
select c.consultaID, c.fecha as fecha_consulta,
p.pacientesID, p.nombre as nombre_paciente, p.apellido as apellido_paciente
from pacientes p -- Tabla secundaria que contiene los datos de los pacientes
right join consultas c -- Tabla principal con todos los datos de las consultas
on p.pacientesID = c.pacienteID;

-- 2.	Mostrar todos los doctores, incluso aquellos que no tienen consultas asignadas.
-- Se mantienen todos los registros de la tabla doctores y se relacionan con la tabla consultas
-- Si no hay consultas asignadas a un doctor se muestran valores nulos
select d.doctorID, d.nombre as nombre_doctor, d.apellido as apellido_doctor, 
d.especialidad as especialidad_doctor,
c.consultaID, c.fecha as fecha_consulta
from consultas c -- Tabla secundaria
right join doctores d -- Tabla principal
on d.doctorID = c.doctorID;

-- 3.	Mostrar todos los medicamentos, incluso los que no han sido recetados.
-- Se mantienen todos los registros de la tabla medicamentos y se relacionan con la tabla recetas
-- Si los medicamentos no tienen una receta se muestran valores nulos
select m.medicamentoID, m.nombre as nombre_medicamento,
r.recetaID, r.fecha as fecha_receta
from recetas r -- Tabla secundaria
right join medicamentos m -- Tabla principal
on m.medicamentoID = r.medicamentoID;

-- FULL OUTER JOIN
-- Es una operacion de union que preserva todos los registros de ambas tablas
-- MySQL no soporta directamente FULL OUTER JOIN, por lo que debemos simularlo con una combinación de LEFT JOIN y RIGHT JOIN.

-- 1.	Mostrar todos los pacientes y consultas, incluidas las que no están relacionadas entre sí.
-- Todos los pacientes con sus consultas si existen
select p.pacientesID, p.nombre as nombre_paciente, p.apellido as apellido_paciente,
c.consultaID, c.fecha as fecha_consulta, d.nombre as doctor
from pacientes p -- Tabla principal, todos los registros se mantienen
left join consultas c on p.pacientesID = c.pacienteID -- Une con consultas si existen
left join doctores d on c.doctorID = d.doctorID -- Une doctor si hay consultas
union -- Combina resultados eliminando duplicados
-- Consultas sin pacientes
select p.pacientesID, p.nombre as nombre_paciente, p.apellido as apellido_paciente,
c.consultaID, c.fecha as fecha_consulta, d.nombre as nombre_doctor
from pacientes p
-- Prioriza todas las consultas (incluso sin pacientes)
right join consultas c on p.pacientesID = c.pacienteID
-- Añade información del doctor para cada consulta
left join doctores d on c.doctorID = d.doctorID
where p.pacientesID is null; 


-- 2.	Mostrar todas las consultas y doctores, incluso las no relacionadas.
-- Muestra todos los doctores y los relacionan con la tabla consultas
-- Si no tienen consultas los valores se llenaran con null
select d.doctorID, d.nombre as nombre_doctor, d.apellido as apellido_doctor,
d.especialidad, c.consultaID, c.fecha as fecha_consulta, p.nombre as nombre_paciente
from doctores d
left join consultas c on d.doctorID = c.doctorID
left join pacientes p on c.pacienteID = p.pacientesID
union
-- Muestra consultas que no tienen un doctor asignado
select null as doctorID, null as nombre_doctor,
null as apellido_doctor, null as especialidad,
c.consultaID, c.fecha as fecha_consulta,
p.nombre as nombre_paciente
from consultas c
left join pacientes p on c.pacienteID = p.pacientesID
where c.doctorID is null; -- Se filtran los registros de consultas sin doctor


-- 3.	Mostrar todos los pacientes y medicamentos, incluso los no relacionados entre sí.
select p.pacientesID, p.nombre as nombre_pacientes, p.apellido as apellido_paciente,
m.medicamentoID, m.nombre as medicamento
from pacientes p -- Tabla principal
-- Conecta a los pacientes con las recetas
left join recetas r on p.pacientesID = r.pacienteID 
-- Conecta recetas con medicamentos
left join medicamentos m on r.medicamentoID = m.medicamentoID
union -- Combina resultados eliminando duplicados
select null as pacientesID, null as nombre_paciente,
null as apellido_paciente, m.medicamentoID, m.nombre as medicamento
from medicamentos m -- Todos los medicamentos
-- filtra solo medicamentos sin registros en recetas
where not exists (select 1 from recetas r where r.medicamentoID = m.medicamentoID)

