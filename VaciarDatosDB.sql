-- =================================================================
-- SCRIPT PARA VACIAR TODOS LOS DATOS DE LA BASE DE DATOS
-- Se ejecuta en orden inverso a las dependencias para evitar
-- errores de clave foránea.
-- =================================================================

-- 1. Eliminar datos de las tablas de relación (las más dependientes)
DELETE FROM BRINDA;
DELETE FROM OCUPA;
DELETE FROM HISTORIA_CLINICA;

-- 2. Eliminar datos de las tablas de detalle
DELETE FROM TELEFONO_MEDICO;
DELETE FROM TELEFONO_PACIENTE;

-- 3. Eliminar datos de las tablas principales que son referenciadas
-- (ej: no puedes borrar un médico si una historia clínica aún lo referencia)
DELETE FROM MEDICO;
DELETE FROM PACIENTE;
DELETE FROM CONSULTORIO;
DELETE FROM HABITACION;

-- 4. Finalmente, eliminar datos de las tablas maestras (sin dependencias)
DELETE FROM ESPECIALIDAD;
DELETE FROM SERVICIO;
DELETE FROM TORRE;
DELETE FROM PREPAGA;
