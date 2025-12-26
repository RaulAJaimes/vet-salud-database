-- ============================================
-- VETSALUD - CONSTRAINTS AND INDEXES
-- Additional business rules and optimizations
-- ============================================

-- Unique constraints to prevent duplicates
ALTER TABLE citas ADD CONSTRAINT uq_cita_horario_veterinario 
    UNIQUE (fecha, hora, cedula_veterinario);

ALTER TABLE citas ADD CONSTRAINT uq_cita_mascota_horario 
    UNIQUE (fecha, hora, id_mascota);

ALTER TABLE recetas ADD CONSTRAINT uq_cita_medicamento 
    UNIQUE (id_cita, id_medicamento);

ALTER TABLE historial_vacunacion ADD CONSTRAINT uq_vacunacion_mascota_fecha 
    UNIQUE (id_mascota, id_vacuna, fecha_aplicacion);

-- Additional check constraints
ALTER TABLE telefonos_dueño ADD CONSTRAINT ck_formato_telefono 
    CHECK (telefono ~ '^\+?[0-9\s\-\(\)]{8,}$');

ALTER TABLE telefonos_dueño ADD CONSTRAINT ck_tipo_telefono 
    CHECK (tipo IN ('Personal', 'Trabajo', 'Emergencia', 'Otro'));

ALTER TABLE mascotas ADD CONSTRAINT ck_fecha_nacimiento_valida 
    CHECK (fecha_nacimiento <= CURRENT_DATE);

ALTER TABLE veterinarios ADD CONSTRAINT ck_vet_cedula_formato 
    CHECK (cedula ~ '^[0-9]+$');

ALTER TABLE dueños ADD CONSTRAINT ck_cedula_formato_detailed 
    CHECK (cedula ~ '^[0-9]+$');
