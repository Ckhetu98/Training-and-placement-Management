USE tpms_db;

-- Create student_profiles table if it doesn't exist
CREATE TABLE IF NOT EXISTS student_profiles (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT UNIQUE NOT NULL,
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

-- Insert users if they don't exist
INSERT IGNORE INTO users (full_name, email, password, phone, role, status) VALUES
('System Admin', 'admin@demo.com', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '+91 9876543210', 'ADMIN', 'ACTIVE'),
('Student User', 'student@demo.com', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '+91 9876543211', 'STUDENT', 'ACTIVE'),
('Recruiter User', 'recruiter@demo.com', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '+91 9876543212', 'RECRUITER', 'ACTIVE');