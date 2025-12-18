USE tpms_db;

CREATE TABLE IF NOT EXISTS users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    role ENUM('ADMIN', 'STUDENT', 'RECRUITER') NOT NULL,
    status ENUM('ACTIVE', 'INACTIVE') DEFAULT 'ACTIVE',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE student_details (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT UNIQUE,
    gender ENUM('MALE', 'FEMALE', 'OTHER'),
    enrollment_no VARCHAR(50),
    department VARCHAR(50),
    passing_year VARCHAR(10),
    dob VARCHAR(20),
    age VARCHAR(5),
    address_line1 VARCHAR(255),
    address_line2 VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    pincode VARCHAR(10),
    nationality VARCHAR(50),
    profile_photo TEXT,
    linkedin_url TEXT,
    github_url TEXT,
    portfolio_url TEXT,
    education_json TEXT,
    experience_json TEXT,
    skills_json TEXT,
    projects_json TEXT,
    resume_links_json TEXT,
    career_interests TEXT,
    preferred_job_location VARCHAR(255),
    placement_status VARCHAR(50),
    profile_completed BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS training_enrollments (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    student_id BIGINT NOT NULL,
    training_id BIGINT NOT NULL,
    enrolled_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('ENROLLED', 'COMPLETED', 'DROPPED') DEFAULT 'ENROLLED',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (training_id) REFERENCES trainings(id) ON DELETE CASCADE,
    UNIQUE KEY unique_enrollment (student_id, training_id)
);

CREATE TABLE IF NOT EXISTS companies (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    website VARCHAR(255),
    address TEXT,
    description TEXT,
    owner_id BIGINT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (owner_id) REFERENCES users(id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS jobs (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    location VARCHAR(255),
    employment_type VARCHAR(50),
    status ENUM('OPEN', 'CLOSED', 'DRAFT') DEFAULT 'OPEN',
    posted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    salary VARCHAR(255),
    skills_required TEXT,
    deadline VARCHAR(20),
    company_id BIGINT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (company_id) REFERENCES companies(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS applications (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    student_id BIGINT NOT NULL,
    job_id BIGINT NOT NULL,
    status ENUM('APPLIED', 'SHORTLISTED', 'REJECTED', 'SELECTED') DEFAULT 'APPLIED',
    applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (job_id) REFERENCES jobs(id) ON DELETE CASCADE,
    UNIQUE KEY unique_application (student_id, job_id)
);

CREATE TABLE IF NOT EXISTS trainings (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    start_date VARCHAR(20),
    end_date VARCHAR(20),
    max_participants INT DEFAULT 0,
    enrolled_count INT DEFAULT 0,
    status ENUM('ACTIVE', 'INACTIVE', 'UPCOMING', 'COMPLETED') DEFAULT 'ACTIVE',
    trainer_id BIGINT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (trainer_id) REFERENCES users(id) ON DELETE SET NULL
);

INSERT IGNORE INTO users (full_name, email, password, phone, role, status) VALUES
('Student User', 'student@demo.com', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '+91 9876543211', 'STUDENT', 'ACTIVE'),
('Admin User', 'admin@demo.com', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '+91 9876543210', 'ADMIN', 'ACTIVE'),
('Recruiter User', 'recruiter@demo.com', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '+91 9876543212', 'RECRUITER', 'ACTIVE');

INSERT IGNORE INTO companies (name, website, address, description, owner_id) VALUES
('TechCorp Solutions', 'https://techcorp.com', 'Tech Park, Pune', 'Leading software company', 3);

INSERT IGNORE INTO jobs (title, description, location, salary, skills_required, company_id) VALUES
('Software Developer', 'Full stack developer position', 'Pune', '₹6,00,000 - ₹8,00,000', 'Java, React, Spring Boot', 1);

INSERT IGNORE INTO trainings (title, description, start_date, end_date, max_participants, enrolled_count, status) VALUES
('Full Stack Development', 'Complete training on React, Node.js, and MongoDB', '2024-03-01', '2024-05-31', 30, 0, 'ACTIVE'),
('Data Science & Analytics', 'Python, Machine Learning, and Data Visualization', '2024-04-01', '2024-07-31', 25, 0, 'UPCOMING');

INSERT IGNORE INTO applications (student_id, job_id, status) VALUES
(1, 1, 'APPLIED');