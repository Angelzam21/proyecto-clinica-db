-- =================================================================
-- SCRIPT COMPLETO PARA POBLAR LA BASE DE DATOS DE LA CLÍNICA
-- =================================================================

-- PASO 1: INSERTAR DATOS EN TABLAS MAESTRAS (SIN DEPENDENCIAS)
-- -----------------------------------------------------------------

INSERT INTO PREPAGA (id_prepaga, nombre_prepaga) VALUES
(10, 'OSDE'),
(20, 'Swiss Medical'),
(30, 'Galeno'),
(40, 'Medicus'),
(50, 'PAMI');

INSERT INTO ESPECIALIDAD (id_especialidad, nombre_especialidad) VALUES
(101, 'Cardiología'),
(102, 'Pediatría'),
(103, 'Traumatología'),
(104, 'Dermatología'),
(105, 'Neurología');

INSERT INTO SERVICIO (id_servicio, nombre_servicio) VALUES
(1, 'Guardia 24hs'),
(2, 'Laboratorio de Análisis'),
(3, 'Diagnóstico por Imágenes'),
(4, 'Vacunatorio'),
(5, 'Kinesiología');

INSERT INTO TORRE (id_torre, nombre_torre, tipo_torre, calle, numero, piso, depto) VALUES
(1, 'Torre Central', 1, 'Av. Colón', 1230, NULL, NULL),
(2, 'Ala Norte', 2, 'Av. Colón', 1250, NULL, NULL),
(3, 'Torre de Consultorios', 1, 'Sarmiento', 455, NULL, NULL),
(4, 'Edificio Maternidad', 2, 'Sarmiento', 470, NULL, NULL),
(5, 'Anexo Laboratorios', 1, 'Av. Colón', 1200, NULL, NULL);

-- PASO 2: INSERTAR DATOS EN TABLAS DEPENDIENTES
-- -----------------------------------------------------------------

INSERT INTO PACIENTE (id_paciente, nombre, fecha_nacimiento, id_prepaga) VALUES
(1001, 'Carlos Sánchez', '1980-05-15', 10),
(1002, 'Laura Fernández', '1992-11-23', 20),
(1003, 'Martín Gómez', '1975-01-30', 10),
(1004, 'Sofía Rodríguez', '2015-08-10', 30),
(1005, 'Ricardo Díaz', '1950-03-03', 50);

INSERT INTO MEDICO (id_medico, nombre_medico, id_especialidad, trabaja_para) VALUES
(201, 'Dra. Ana Torres', 101, NULL),
(202, 'Dr. Juan García', 102, NULL),
(203, 'Dr. Roberto Cruz', 103, NULL),
(204, 'Dra. Elena Paez', 101, 201),
(205, 'Dr. Luis Vega', 102, 202);

INSERT INTO HABITACION (id_habitacion, id_torre, cama, piso, numero, ancho, largo, bano, ventana) VALUES
(101, 1, 2, 1, 1, 3.5, 4.0, 1, 1),
(102, 1, 1, 1, 2, 3.0, 4.0, 1, 1),
(201, 2, 2, 2, 1, 4.0, 4.5, 1, 2),
(202, 2, 1, 2, 2, 3.0, 4.5, 1, 1),
(401, 4, 3, 4, 1, 5.0, 6.0, 2, 2);

INSERT INTO CONSULTORIO (id_consultorio, id_torre, ancho, largo, piso, numero) VALUES
(10, 3, 4.0, 4.0, 1, 10),
(11, 3, 4.0, 4.0, 1, 11),
(12, 3, 4.0, 4.0, 1, 12),
(20, 3, 4.5, 5.0, 2, 20),
(21, 3, 4.5, 5.0, 2, 21);

-- PASO 3: INSERTAR DATOS DE DETALLE (TELÉFONOS)
-- -----------------------------------------------------------------

INSERT INTO TELEFONO_PACIENTE (id_paciente, telefono_paciente) VALUES
(1001, 1155443322),
(1001, 2233445566),
(1002, 1199887766),
(1003, 3511223344),
(1004, 1122334455);

INSERT INTO TELEFONO_MEDICO (id_medico, telefono_medico, tipo) VALUES
(201, 1165432109, 'Móvil'),
(201, 54321098, 'Consultorio'),
(202, 1176543210, 'Móvil'),
(203, 1187654321, 'Móvil'),
(204, 1198765432, 'Móvil');

-- PASO 4: INSERTAR DATOS EN TABLAS DE RELACIÓN
-- -----------------------------------------------------------------

INSERT INTO HISTORIA_CLINICA (id_historia, fecha, diagnostico, id_servicio, id_paciente, id_medico) VALUES
(1, '2025-10-10', 'Control cardiológico anual.', 1, 1001, 201),
(2, '2025-10-11', 'Anginas virales.', 1, 1004, 202),
(3, '2025-10-12', 'Toma de muestra para análisis de sangre.', 2, 1002, NULL),
(4, '2025-10-13', 'Esguince de tobillo derecho.', 1, 1003, 203),
(5, '2025-10-14', 'Radiografía de tórax.', 3, 1001, NULL);

INSERT INTO OCUPA (id_paciente, id_habitacion, fecha_ingreso, fecha_salida) VALUES
(1003, 201, '2025-10-13', '2025-10-15'),
(1005, 101, '2025-09-01', '2025-09-10'),
(1002, 102, '2025-08-20', '2025-08-21'),
(1001, 401, '2025-10-01', NULL),
(1004, 202, '2025-10-11', '2025-10-11');

INSERT INTO BRINDA (id_servicio, id_consultorio) VALUES
(1, 10),
(2, 20),
(3, 21),
(4, 11),
(5, 12);