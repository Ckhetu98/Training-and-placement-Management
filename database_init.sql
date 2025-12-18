-- Training Placement Management System Database Initialization
-- Run this script after the application creates the tables

USE tpms_db;

-- Insert sample users
INSERT INTO users (id, full_name, email, password, phone, role, status, created_at, updated_at) VALUES
(1, 'System Admin', 'admin@demo.com', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '+91 9876543210', 'ADMIN', 'ACTIVE', NOW(), NOW()),
(2, 'Rahul Sharma', 'student@demo.com', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '+91 9876543211', 'STUDENT', 'ACTIVE', NOW(), NOW()),
(3, 'TechCorp HR', 'recruiter@demo.com', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '+91 9876543212', 'RECRUITER', 'ACTIVE', NOW(), NOW());

-- Insert sample companies
INSERT INTO companies (id, name, website, address, description, owner_id, created_at, updated_at) VALUES
(1, 'TechCorp Solutions', 'https://techcorp.com', 'Tech Park, Hinjewadi, Pune, Maharashtra 411057', 'Leading software development company specializing in web and mobile applications.', 3, NOW(), NOW()),
(2, 'InnovateSoft Pvt Ltd', 'https://innovatesoft.com', 'Electronic City, Bangalore, Karnataka 560100', 'Innovative software solutions for enterprise clients.', 3, NOW(), NOW());

-- Insert sample jobs
INSERT INTO jobs (id, title, description, location, employment_type, status, posted_at, salary, skills_required, deadline, company_id, created_at, updated_at) VALUES
(1, 'Software Developer - Full Stack', 'We are looking for a passionate Full Stack Developer to join our dynamic team. You will be responsible for developing and maintaining web applications using modern technologies.', 'Pune, Maharashtra', 'Full-time', 'OPEN', NOW(), '₹6,00,000 - ₹8,00,000 per annum', 'Java,Spring Boot,React,MySQL,REST APIs', '2024-12-31', 1, NOW(), NOW()),
(2, 'Frontend Developer', 'Join our frontend team to create amazing user experiences. Work with React, TypeScript, and modern CSS frameworks.', 'Bangalore, Karnataka', 'Full-time', 'OPEN', NOW(), '₹5,50,000 - ₹7,50,000 per annum', 'React,TypeScript,CSS,JavaScript,HTML', '2024-12-31', 2, NOW(), NOW());

-- Insert sample student profile
INSERT INTO student_profiles (id, user_id, enrollment_no, department, passing_year, dob, age, address_line1, city, state, pincode, nationality, skills_json, career_interests, preferred_job_location, placement_status, profile_completed, created_at, updated_at) VALUES
(1, 2, 'KIT2021CSE045', 'CSE', '2025', '2003-05-15', '21', '123 MG Road', 'Pune', 'Maharashtra', '411001', 'Indian', '["Java", "React", "Spring Boot", "MySQL", "JavaScript", "Python"]', 'Full Stack Development, Cloud Computing, AI/ML', 'Pune, Mumbai, Bangalore', 'ELIGIBLE', true, NOW(), NOW());

-- Insert sample training programs
INSERT INTO trainings (id, title, description, start_date, end_date, max_participants, enrolled_count, status, created_at, updated_at) VALUES
(1, 'Full Stack Web Development', 'Complete training on React, Node.js, and MongoDB', '2024-03-01', '2024-05-31', 30, 25, 'ACTIVE', NOW(), NOW()),
(2, 'Data Science & Analytics', 'Python, Machine Learning, and Data Visualization', '2024-04-01', '2024-07-31', 25, 18, 'UPCOMING', NOW(), NOW());

-- Insert sample applications
INSERT INTO applications (id, student_id, job_id, status, applied_at, created_at, updated_at) VALUES
(1, 2, 1, 'APPLIED', NOW(), NOW(), NOW()),
(2, 2, 2, 'SHORTLISTED', NOW(), NOW(), NOW());

-- Insert sample contact inquiries
INSERT INTO contacts (id, name, email, phone, subject, message, status, created_at, updated_at) VALUES
(1, 'John Doe', 'john.doe@example.com', '+91 9876543213', 'Placement Inquiry', 'I would like to know more about the placement process.', 'PENDING', NOW(), NOW()),
(2, 'Jane Smith', 'jane.smith@example.com', '+91 9876543214', 'Training Programs', 'What training programs are available for final year students?', 'RESOLVED', NOW(), NOW());

COMMIT;