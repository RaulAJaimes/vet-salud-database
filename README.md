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

