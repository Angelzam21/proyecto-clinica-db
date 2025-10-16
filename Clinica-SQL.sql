DROP TABLE IF EXISTS BRINDA;
DROP TABLE IF EXISTS OCUPA;
DROP TABLE IF EXISTS HISTORIA_CLINICA;
DROP TABLE IF EXISTS TELEFONO_MEDICO;
DROP TABLE IF EXISTS TELEFONO_PACIENTE;
DROP TABLE IF EXISTS MEDICO;
DROP TABLE IF EXISTS ESPECIALIDAD;
DROP TABLE IF EXISTS SERVICIO;
DROP TABLE IF EXISTS CONSULTORIO;
DROP TABLE IF EXISTS HABITACION;
DROP TABLE IF EXISTS TORRE;
DROP TABLE IF EXISTS PACIENTE;
DROP TABLE IF EXISTS PREPAGA;

CREATE TABLE IF NOT EXISTS PREPAGA
(
	id_prepaga INTEGER PRIMARY KEY,
	nombre_prepaga varchar(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS PACIENTE
(
	id_paciente INTEGER,
	nombre varchar(50) NOT NULL,
	fecha_nacimiento DATE,
	id_prepaga INTEGER,
	PRIMARY KEY (id_paciente),
	FOREIGN KEY (id_prepaga) REFERENCES PREPAGA (id_prepaga)
);

CREATE TABLE IF NOT EXISTS TELEFONO_PACIENTE
(
	id_paciente INTEGER,
	telefono_paciente INTEGER,
    PRIMARY KEY (id_paciente, telefono_paciente),
	FOREIGN KEY (id_paciente) REFERENCES PACIENTE (id_paciente)
);

CREATE TABLE IF NOT EXISTS TORRE
(
	id_torre INTEGER PRIMARY KEY,
	nombre_torre varchar(50),
	tipo_torre SMALLINT,
	calle varchar(50),
	numero INTEGER,
	depto varchar(10),
	piso INTEGER
);

CREATE TABLE IF NOT EXISTS HABITACION
(
	id_torre INTEGER,
	id_habitacion INTEGER PRIMARY KEY,
	cama SMALLINT,
	piso INTEGER,
	numero INTEGER,
	ancho FLOAT,
	largo FLOAT,
	bano INTEGER,
	ventana SMALLINT,
	FOREIGN KEY (id_torre) REFERENCES TORRE (id_torre)
);

CREATE TABLE IF NOT EXISTS CONSULTORIO
(
	id_torre INTEGER,
	id_consultorio INTEGER PRIMARY KEY,
	ancho FLOAT,
	largo FLOAT,
	piso INTEGER,
	numero INTEGER,
	FOREIGN KEY (id_torre) REFERENCES TORRE (id_torre)

);

CREATE TABLE IF NOT EXISTS SERVICIO
(
	id_servicio INTEGER PRIMARY KEY,
	nombre_servicio varchar(50)

);

CREATE TABLE IF NOT EXISTS ESPECIALIDAD
(
	id_especialidad INTEGER PRIMARY KEY,
	nombre_especialidad varchar(50)
);

CREATE TABLE IF NOT EXISTS MEDICO
(
	id_medico INTEGER PRIMARY KEY,
	nombre_medico varchar(50) NOT NULL,
	id_especialidad INTEGER,
    trabaja_para INTEGER,
	FOREIGN KEY (id_especialidad) REFERENCES ESPECIALIDAD (id_especialidad),
    FOREIGN KEY (trabaja_para) REFERENCES MEDICO (id_medico)
);

CREATE TABLE IF NOT EXISTS TELEFONO_MEDICO
(
	id_medico INTEGER,
	telefono_medico INTEGER,
	tipo varchar(20),
	PRIMARY KEY (id_medico, telefono_medico),
	FOREIGN KEY (id_medico) REFERENCES MEDICO (id_medico)
);

CREATE TABLE IF NOT EXISTS HISTORIA_CLINICA
(
	id_historia INTEGER PRIMARY KEY,
	fecha DATE,
	diagnostico varchar(250),
	id_servicio INTEGER,
	id_paciente INTEGER,
	id_medico INTEGER,
	FOREIGN KEY (id_paciente) REFERENCES PACIENTE (id_paciente),
	FOREIGN KEY (id_servicio) REFERENCES SERVICIO (id_servicio),
	FOREIGN KEY (id_medico) REFERENCES MEDICO (id_medico)
);

CREATE TABLE IF NOT EXISTS OCUPA
(
	id_paciente INTEGER,
	id_habitacion INTEGER,
	fecha_ingreso DATE,
	fecha_salida DATE,
    PRIMARY KEY (id_paciente, id_habitacion, fecha_ingreso),
	FOREIGN KEY (id_paciente) REFERENCES PACIENTE (id_paciente),
	FOREIGN KEY (id_habitacion) REFERENCES HABITACION (id_habitacion)
);

CREATE TABLE IF NOT EXISTS BRINDA
(
	id_servicio INTEGER,
	id_consultorio INTEGER,
    PRIMARY KEY (id_servicio, id_consultorio),
	FOREIGN KEY (id_servicio) REFERENCES SERVICIO (id_servicio),
	FOREIGN KEY (id_consultorio) REFERENCES CONSULTORIO (id_consultorio)
	
);