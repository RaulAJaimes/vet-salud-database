-- ============================================
-- VETSALUD - CORE DATABASE SCHEMA
-- Table structure definition
-- Version: 1.0.0
-- ============================================

-- Enable UUID extension if needed
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- OWNERS TABLE
CREATE TABLE dueños (
    cedula VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    email VARCHAR(100),
    fecha_registro DATE DEFAULT CURRENT_DATE,
    
    CONSTRAINT ck_cedula_formato CHECK (cedula ~ '^[0-9]{10}$')
);

-- VETERINARIANS TABLE  
CREATE TABLE veterinarios (
    cedula VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(50) NOT NULL,
    telefono VARCHAR(15),
    email VARCHAR(100),
    fecha_contratacion DATE DEFAULT CURRENT_DATE,
    activo BOOLEAN DEFAULT TRUE
);

-- PETS TABLE
CREATE TABLE mascotas (
    id_mascota SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    especie VARCHAR(30) NOT NULL,
    raza VARCHAR(50),
    fecha_nacimiento DATE,
    peso_kg DECIMAL(5,2),
    cedula_dueño VARCHAR(20) NOT NULL,
    
    CONSTRAINT fk_mascota_dueño FOREIGN KEY (cedula_dueño) 
        REFERENCES dueños(cedula) ON DELETE CASCADE,
    
    CONSTRAINT ck_especie_valida CHECK (especie IN 
        ('Perro', 'Gato', 'Ave', 'Conejo', 'Hámster', 'Tortuga', 'Otro'))
);

-- OWNER PHONES TABLE
CREATE TABLE telefonos_dueño (
    id_telefono SERIAL PRIMARY KEY,
    cedula_dueño VARCHAR(20) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    tipo VARCHAR(20) DEFAULT 'Personal',
    
    CONSTRAINT fk_telefono_dueño FOREIGN KEY (cedula_dueño) 
        REFERENCES dueños(cedula) ON DELETE CASCADE,
    
    CONSTRAINT uq_telefono UNIQUE (telefono)
);

-- VACCINES TABLE
CREATE TABLE vacunas (
    id_vacuna SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    laboratorio VARCHAR(100),
    periodicidad_meses INTEGER,
    
    CONSTRAINT ck_periodicidad_positiva CHECK (periodicidad_meses > 0)
);

-- MEDICATIONS TABLE
CREATE TABLE medicamentos (
    id_medicamento SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT,
    dosis_recomendada VARCHAR(50)
);

-- APPOINTMENTS TABLE
CREATE TABLE citas (
    id_cita SERIAL PRIMARY KEY,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    motivo VARCHAR(200) NOT NULL,
    diagnostico TEXT,
    id_mascota INTEGER NOT NULL,
    cedula_veterinario VARCHAR(20) NOT NULL,
    
    CONSTRAINT fk_cita_mascota FOREIGN KEY (id_mascota) 
        REFERENCES mascotas(id_mascota) ON DELETE CASCADE,
    
    CONSTRAINT fk_cita_veterinario FOREIGN KEY (cedula_veterinario) 
        REFERENCES veterinarios(cedula) ON DELETE RESTRICT,
    
    CONSTRAINT ck_fecha_cita_futura CHECK (fecha >= CURRENT_DATE),
    CONSTRAINT ck_hora_valida CHECK (hora BETWEEN '08:00:00' AND '20:00:00')
);

-- PRESCRIPTIONS TABLE
CREATE TABLE recetas (
    id_receta SERIAL PRIMARY KEY,
    id_cita INTEGER NOT NULL,
    id_medicamento INTEGER NOT NULL,
    instrucciones TEXT NOT NULL,
    cantidad_dias INTEGER NOT NULL,
    
    CONSTRAINT fk_receta_cita FOREIGN KEY (id_cita) 
        REFERENCES citas(id_cita) ON DELETE CASCADE,
    
    CONSTRAINT fk_receta_medicamento FOREIGN KEY (id_medicamento) 
        REFERENCES medicamentos(id_medicamento) ON DELETE RESTRICT,
    
    CONSTRAINT ck_cantidad_dias_positiva CHECK (cantidad_dias > 0)
);

-- VACCINATION HISTORY TABLE
CREATE TABLE historial_vacunacion (
    id_historial SERIAL PRIMARY KEY,
    id_mascota INTEGER NOT NULL,
    id_vacuna INTEGER NOT NULL,
    fecha_aplicacion DATE DEFAULT CURRENT_DATE NOT NULL,
    proxima_dosis DATE,
    observaciones TEXT,
    
    CONSTRAINT fk_historial_mascota FOREIGN KEY (id_mascota) 
        REFERENCES mascotas(id_mascota) ON DELETE CASCADE,
    
    CONSTRAINT fk_historial_vacuna FOREIGN KEY (id_vacuna) 
        REFERENCES vacunas(id_vacuna) ON DELETE RESTRICT,
    
    CONSTRAINT ck_fechas_consistentes CHECK (proxima_dosis > fecha_aplicacion)
);

-- ============================================
-- INDEXES FOR PERFORMANCE
-- ============================================
CREATE INDEX idx_mascotas_dueño ON mascotas(cedula_dueño);
CREATE INDEX idx_citas_fecha ON citas(fecha);
CREATE INDEX idx_citas_mascota ON citas(id_mascota);
CREATE INDEX idx_citas_veterinario ON citas(cedula_veterinario);
CREATE INDEX idx_historial_mascota ON historial_vacunacion(id_mascota);
CREATE INDEX idx_historial_fecha ON historial_vacunacion(fecha_aplicacion);
