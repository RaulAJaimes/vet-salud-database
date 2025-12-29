**Professional PostgreSQL Database for Veterinary Clinic Management**

[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-18.1-336791?logo=postgresql)](https://www.postgresql.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Status: Production Ready](https://img.shields.io/badge/Status-Production%20Ready-brightgreen)]()
# 🏥 VetSalud Database System

**Enterprise PostgreSQL Database for Veterinary Clinic Management**

> **📁 Navigation Note:** This repository contains the complete database system within the `Desktop/vet-salud-database/` directory structure, organized for real-world development environments.

## 🚀 Quick Access

### **Direct Links to Key Components:**
- **[📂 Database Schema](./Desktop/vet-salud-database/database/schema/)** - Core table definitions, constraints, and indexes
- **[📂 Sample Data](./Desktop/vet-salud-database/database/seeds/)** - Production-like test data for development and testing
- **[📂 Documentation](./Desktop/vet-salud-database/docs/)** - Technical documentation, guides, and architecture diagrams
- **[📂 Utility Scripts](./Desktop/vet-salud-database/scripts/)** - Deployment, backup, and maintenance automation
- **[📂 Database Tests](./Desktop/vet-salud-database/tests/)** - Data integrity and validation tests


## 📊 Core Database Features

### **Clinical Management**
- **Patient Registry** – Complete pet and owner tracking
- **Medical Appointments** – Scheduling with constraints and validations
- **Vaccination History** – Full immunization tracking with automatic reminders
- **Prescription Management** – Medication tracking and dosage instructions

### **Technical Excellence**
- **Normalized Schema** – Third normal form compliance
- **Referential Integrity** – Comprehensive foreign key constraints
- **Performance Optimized** – Strategic indexing for production workloads
- **Audit Ready** – Timestamp tracking and user accountability patterns

### **Business Logic**
- **Appointment Validation** – Business hour enforcement, no double-booking
- **Medical Safety** – Vaccine scheduling rules, medication dosage validation
- **Data Quality** – Phone format validation, ID verification patterns

---

## 🔧 Technology Stack

| Component       | Technology   | Version   |
|-----------------|--------------|-----------|
| Database        | PostgreSQL   | 15+       |
| Version Control | Git & GitHub | –         |
| License         | MIT          | –         |
| Status          | Production Ready | ✅      |

---

## 🛠️ Getting Started for Developers

### 1. **Database Deployment**
```sql
-- Deploy the complete schema
\i database/schema/01_core_schema.sql
\i database/schema/02_constraints_indexes.sql

-- Load sample data for testing
\i database/seeds/01_sample_data.sql
```


## 2. Common Queries

-- Today's appointments
```sql
SELECT * FROM vista_agenda_diaria WHERE fecha = CURRENT_DATE;
```
-- Vaccination due in next 7 days  
```sql
SELECT * FROM vista_recordatorios_vacunacion WHERE dias_para_proxima <= 7;
```

-- Patient medical history
```sql
SELECT * FROM vista_historial_medico WHERE id_mascota = 1;
```

## 📁 File Structure Details

| Directory | Purpose | Key Files |
|-----------|---------|-----------|
| `database/schema/` | Database structure | `01_core_schema.sql`, `02_constraints_indexes.sql` |
| `database/seeds/` | Test data | `01_sample_data.sql` |
| `database/functions/` | Business logic | *Planned:* Stored procedures, triggers |
| `docs/` | Documentation | Architecture decisions, ER diagrams |
| `scripts/` | Automation | *Planned:* Deployment, backup, migration |
| `tests/` | Quality assurance | *Planned:* Data validation, constraint testing |

## 👥 Contributing

1. Fork the repository
2. Navigate to `Desktop/vet-salud-database/` for core development
3. Create a feature branch (`git checkout -b feature/amazing-feature`)
4. Commit changes (`git commit -m 'Add amazing feature'`)
5. Push to branch (`git push origin feature/amazing-feature`)
6. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Designed for real-world veterinary clinic operations
- Implements industry best practices for database design
- Includes comprehensive audit trails for compliance
- Structured for team collaboration and scalability

---

**VetSalud Database System** • Enterprise Veterinary Practice Management  
Architected for scalability, maintainability, and real-world clinical workflows

> **Note:** This structure reflects a professional development environment organization where `Desktop/vet-salud-database/` represents the project workspace root.


### **Quick Start Commands:**
```bash
# Clone the repository
git clone https://github.com/RaulAJaimes/vet-salud-database.git

# Navigate to the project core
cd vet-salud-database/Desktop/vet-salud-database

# Explore the database structure
ls -la database/schema/

vet-salud-database/                          # Repository Root
└── Desktop/vet-salud-database/              # Project Core (Development Environment)
    ├── 📁 database/                         # Database Layer
    │   ├── schema/                          # SQL Schema Definitions
    │   │   ├── 01_core_schema.sql          # Main table structures
    │   │   └── 02_constraints_indexes.sql  # Business rules & optimizations
    │   ├── seeds/                           # Data Population
    │   │   └── 01_sample_data.sql          # Realistic sample data
    │   └── functions/                       # PostgreSQL Functions (Planned)
    │       └── README.md                    # Functions roadmap
    ├── 📁 docs/                             # Documentation Hub
    │   ├── README.md                        # Documentation plan
    │   └── diagrama_bd.md                   # Database diagram
    ├── 📁 scripts/                          # Automation & DevOps
    │   └── README.md                        # Scripts roadmap
    ├── 📁 tests/                            # Quality Assurance
    │   └── README.md                        # Testing strategy
    ├── 📄 .gitignore                        # Version control configuration
    ├── 📄 LICENSE                           # MIT License
    └── 📄 README.md                         # This file
```
