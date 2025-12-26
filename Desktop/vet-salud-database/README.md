# 🐾 VetSalud Database System

**Professional PostgreSQL Database for Veterinary Clinic Management**

[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-18.1-336791?logo=postgresql)](https://www.postgresql.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Status: Production Ready](https://img.shields.io/badge/Status-Production%20Ready-brightgreen)]()

## 📋 Overview

A complete, production-ready database system for veterinary clinics. Designed with scalability, auditability, and real-world business requirements in mind.

## ✨ Features

- **Complete Patient Management**: Track pets, owners, medical history
- **Appointment Scheduling**: Intelligent scheduling with constraints
- **Medical Records**: Vaccinations, prescriptions, diagnoses
- **Inventory Management**: Medication tracking with stock control
- **Professional Auditing**: Full CRUD tracking with timestamps and user info
- **Business Intelligence**: Pre-built views for reporting and analytics

## 🏗️ Database Schema

```mermaid
erDiagram
    dueños ||--o{ mascotas : owns
    dueños ||--o{ telefonos_dueño : has
    mascotas ||--o{ citas : schedules
    mascotas ||--o{ historial_vacunacion : receives
    veterinarios ||--o{ citas : attends
    citas ||--o{ recetas : prescribes
    medicamentos ||--o{ recetas : contains
    vacunas ||--o{ historial_vacunacion : administered