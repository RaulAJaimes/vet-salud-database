-- ============================================
-- 04_datos_prueba.sql
-- Datos de prueba VetSalud
-- ============================================

-- 1. LIMPIAR DATOS EXISTENTES (OPCIONAL - COMENTADO)
-- DELETE FROM historial_vacunacion;
-- DELETE FROM recetas;
-- DELETE FROM telefonos_dueño;
-- DELETE FROM citas;
-- DELETE FROM mascotas;
-- DELETE FROM medicamentos;
-- DELETE FROM vacunas;
-- DELETE FROM veterinarios;
-- DELETE FROM dueños;

-- 2. INSERTAR DUEÑOS (primeros 10 de 51)
INSERT INTO dueños (cedula, nombre, direccion) VALUES
('1000000001', 'Carlos Castillo', 'Barranquilla'),
('1000000002', 'Laura Torres', 'Medellín'),
('1000000003', 'Oscar Martinez', 'Bucaramanga'),
('1000000004', 'David Gomez', 'Barranquilla'),
('1000000005', 'Marta Díaz', 'Bucaramanga'),
('1000000006', 'Laura Vargas', 'Barranquilla'),
('1000000007', 'David Martinez', 'Pereira'),
('1000000008', 'Oscar Ruiz', 'Bogotá'),
('1000000009', 'Laura Gomez', 'Bucaramanga'),
('1000000010', 'Elena Vargas', 'Bogotá')
ON CONFLICT (cedula) DO NOTHING;

-- 3. INSERTAR VETERINARIOS (primeros 3 de 10)
INSERT INTO veterinarios (cedula, nombre, especialidad) VALUES
('2000000001', 'Dr. Juan Perez', 'Cirugía'),
('2000000002', 'Dra. Maria Lopez', 'Dermatología'),
('2000000003', 'Dr. Carlos Ruiz', 'Medicina General')
ON CONFLICT (cedula) DO NOTHING;

-- 4. INSERTAR MASCOTAS (primeras 5 de 43)
INSERT INTO mascotas (nombre, especie, raza, fecha_nacimiento, cedula_dueño) VALUES
('Toby', 'Ave', 'Amazonas', '2020-01-15', '1000000011'),
('Rocky', 'Hámster', 'Sirio', '2021-03-20', '1000000002'),
('Thor', 'Gato', 'Siames', '2019-07-10', '1000000005'),
('Bella', 'Gato', 'Criollo', '2022-02-25', '1000000022'),
('Firulais', 'Perro', 'Labrador', '2018-11-30', '1000000050')
ON CONFLICT DO NOTHING;

-- 5. INSERTAR MEDICAMENTOS (3 totales)
INSERT INTO medicamentos (nombre, descripcion, dosis_recomendada) VALUES
('Amoxicilina 500mg', 'Antibiótico de amplio espectro', '10mg/kg cada 12h'),
('Ivermectina', 'Antiparasitario externo e interno', '0.2mg/kg mensual'),
('Carprofeno', 'Antiinflamatorio no esteroideo', '2mg/kg cada 24h')
ON CONFLICT (nombre) DO NOTHING;

-- 6. INSERTAR VACUNAS (3 totales)
INSERT INTO vacunas (nombre, laboratorio, periodicidad_meses) VALUES
('Antirrábica', 'Zoetis', 12),
('Polivalente Canina', 'Merial', 6),
('Triple Felina', 'Boehringer', 12)
ON CONFLICT (nombre) DO NOTHING;

-- 7. INSERTAR CITAS (5 totales)
INSERT INTO citas (fecha, hora, motivo, id_mascota, cedula_veterinario) VALUES
(CURRENT_DATE + 1, '09:00:00', 'Control anual', 1, '2000000001'),
(CURRENT_DATE + 1, '11:00:00', 'Vacunación antirrábica', 2, '2000000002'),
(CURRENT_DATE + 2, '14:00:00', 'Dermatitis', 3, '2000000001'),
(CURRENT_DATE + 2, '16:00:00', 'Chequeo general', 4, '2000000002'),
(CURRENT_DATE + 3, '10:30:00', 'Consulta por vómitos', 5, '2000000001')
ON CONFLICT DO NOTHING;

-- 8. INSERTAR RECETAS (3 totales)
INSERT INTO recetas (id_cita, id_medicamento, instrucciones, cantidad_dias) VALUES
(1, (SELECT id_medicamento FROM medicamentos WHERE nombre = 'Amoxicilina 500mg'), 
    'Tomar con comida cada 12 horas', 7),
(3, (SELECT id_medicamento FROM medicamentos WHERE nombre = 'Ivermectina'), 
    'Aplicar una vez al mes', 30),
(5, (SELECT id_medicamento FROM medicamentos WHERE nombre = 'Carprofeno'), 
    'Solo en caso de dolor', 5)
ON CONFLICT DO NOTHING;

-- 9. INSERTAR HISTORIAL VACUNACIÓN (5 totales)
INSERT INTO historial_vacunacion (id_mascota, id_vacuna, fecha_aplicacion, proxima_dosis) VALUES
(1, (SELECT id_vacuna FROM vacunas WHERE nombre = 'Antirrábica'), 
    '2024-06-15', '2025-06-15'),
(2, (SELECT id_vacuna FROM vacunas WHERE nombre = 'Antirrábica'), 
    '2024-07-20', '2025-07-20'),
(3, (SELECT id_vacuna FROM vacunas WHERE nombre = 'Polivalente Canina'), 
    '2024-08-10', '2024-11-10'),
(4, (SELECT id_vacuna FROM vacunas WHERE nombre = 'Triple Felina'), 
    '2024-09-05', '2025-09-05'),
(5, (SELECT id_vacuna FROM vacunas WHERE nombre = 'Antirrábica'), 
    '2024-10-12', '2025-10-12')
ON CONFLICT DO NOTHING;

-- 10. MENSAJE DE CONFIRMACIÓN
SELECT '✅ DATOS DE PRUEBA INSERTADOS CORRECTAMENTE' AS resultado;
SELECT 'Dueños: 10' AS tabla UNION ALL
SELECT 'Veterinarios: 3' UNION ALL
SELECT 'Mascotas: 5' UNION ALL
SELECT 'Citas: 5' UNION ALL
SELECT 'Recetas: 3' UNION ALL
SELECT 'Historial Vacunación: 5';