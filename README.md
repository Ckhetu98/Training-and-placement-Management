# Training Placement Management System (TPMS)

A comprehensive web application for managing training and placement activities in educational institutions.

## Features

### For Students
- Complete profile management with resume upload
- Browse and apply for jobs
- Track application status
- Enroll in training programs
- Real-time dashboard with statistics

### For Recruiters
- Post and manage job openings
- Review student applications
- View and download student resumes
- Shortlist and select candidates
- Analytics dashboard

### For Administrators
- Manage students and recruiters
- Oversee job postings and applications
- Manage training programs
- Handle contact inquiries
- System-wide analytics

## Technology Stack

### Backend
- **Framework**: Spring Boot 3.x
- **Database**: MySQL
- **Security**: JWT Authentication
- **Documentation**: Swagger/OpenAPI
- **Build Tool**: Maven

### Frontend
- **Framework**: React 18 with Vite
- **Styling**: Tailwind CSS
- **Icons**: React Icons (Feather Icons)
- **HTTP Client**: Axios
- **Routing**: React Router DOM

## Prerequisites

- Java 17 or higher
- Node.js 16 or higher
- MySQL 8.0 or higher
- Maven 3.6 or higher

## Setup Instructions

### Database Setup

1. Install MySQL and create a database:
```sql
CREATE DATABASE tpms_db;
```

2. Update database credentials in `training_placement_backend_tpms/src/main/resources/application.properties`:
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/tpms_db?useSSL=false&allowPublicKeyRetrieval=true
spring.datasource.username=root
spring.datasource.password=your_password
```

### Backend Setup

1. Navigate to the backend directory:
```bash
cd training_placement_backend_tpms
```

2. Install dependencies and run:
```bash
mvn clean install
mvn spring-boot:run
```

Or use the provided batch file:
```bash
start-backend.bat
```

The backend will start on `http://localhost:8080`

### Frontend Setup

1. Navigate to the frontend directory:
```bash
cd training_placement_frontend
```

2. Install dependencies:
```bash
npm install
```

3. Start the development server:
```bash
npm run dev
```

Or use the provided batch file:
```bash
start-frontend.bat
```

The frontend will start on `http://localhost:5173`

## Default Login Credentials

### Admin
- Email: `admin@demo.com`
- Password: `password`

### Student
- Email: `student@demo.com`
- Password: `password`

### Recruiter
- Email: `recruiter@demo.com`
- Password: `password`

## API Documentation

Once the backend is running, access the Swagger UI at:
`http://localhost:8080/swagger-ui.html`

## Key Features Implemented

### Real-time Data Integration
- All dashboards use live data from the backend
- No dummy/mock data in production
- Real-time application status updates

### File Management
- Resume upload and download functionality
- Secure file storage with proper validation
- Support for PDF, DOC, and DOCX formats

### Authentication & Authorization
- JWT-based authentication
- Role-based access control (Admin, Student, Recruiter)
- Secure API endpoints

### Responsive Design
- Mobile-friendly interface
- Modern UI with Tailwind CSS
- Consistent design patterns

## Project Structure

```
training_placement/
├── training_placement_backend_tpms/     # Spring Boot Backend
│   ├── src/main/java/com/tpms/
│   │   ├── config/                      # Configuration classes
│   │   ├── controller/                  # REST Controllers
│   │   ├── dto/                         # Data Transfer Objects
│   │   ├── entity/                      # JPA Entities
│   │   ├── repository/                  # Data Repositories
│   │   ├── service/                     # Business Logic
│   │   └── security/                    # Security Configuration
│   └── src/main/resources/
│       └── application.properties       # Application Configuration
├── training_placement_frontend/         # React Frontend
│   ├── src/
│   │   ├── components/                  # Reusable Components
│   │   ├── context/                     # React Context
│   │   ├── pages/                       # Page Components
│   │   ├── routes/                      # Route Guards
│   │   └── services/                    # API Services
│   └── public/                          # Static Assets
├── uploads/                             # File Upload Directory
├── start-backend.bat                    # Backend Startup Script
├── start-frontend.bat                   # Frontend Startup Script
└── README.md                            # This file
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is licensed under the MIT License.

## Support

For support and questions, please contact the development team.