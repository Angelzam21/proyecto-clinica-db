
--POBLAMOS PRIMERO TABLAS SIN DEPENDENCIAS


-- PREPAGAS
INSERT INTO PREPAGA (id_prepaga, nombre_prepaga) VALUES
(1, 'OSDE'),
(2, 'Swiss Medical'),
(3, 'Galeno'),
(4, 'Medicus'),
(5, 'Sancor Salud');

-- ESPECIALIDADES
INSERT INTO ESPECIALIDAD (id_especialidad, nombre_especialidad) VALUES
(1, 'Cardiología'),
(2, 'Pediatría'),
(3, 'Traumatología'),
(4, 'Dermatología'),
(5, 'Neurología');

-- SERVICIOS
INSERT INTO SERVICIO (id_servicio, nombre_servicio) VALUES
(1, 'Guardia'),
(2, 'Laboratorio de Análisis'),
(3, 'Diagnóstico por Imágenes'),
(4, 'Vacunatorio'),
(5, 'Kinesiología');

-- TORRES
INSERT INTO TORRE (id_torre, nombre_torre, tipo_torre, calle, numero, piso, depto) VALUES
(1, 'Torre Central', 1, 'Av. Colón', 1230, NULL, NULL),
(2, 'Ala Norte', 2, 'Av. Colón', 1250, NULL, NULL),
(3, 'Torre de Consultorios', 1, 'Sarmiento', 455, NULL, NULL),
(4, 'Edificio Maternidad', 2, 'Sarmiento', 470, NULL, NULL),
(5, 'Anexo Laboratorios', 1, 'Av. Colón', 1200, NULL, NULL);