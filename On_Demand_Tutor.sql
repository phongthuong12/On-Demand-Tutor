
CREATE TABLE roles(
    role_id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE users(
    user_id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    phone_number VARCHAR(15),
    address VARCHAR(255),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    role_id INT,
    FOREIGN KEY (role_id) REFERENCES roles(role_id)  
);

CREATE TABLE subjects (
    subject_id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(255) NOT NULL,
    description TEXT
);

CREATE TABLE grade (
    grade_id INT PRIMARY KEY IDENTITY(1,1),
    subject_id INT NOT NULL,
    grade_level INT NOT NULL, 
    description TEXT,
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);

CREATE TABLE tutors (
    tutor_id INT PRIMARY KEY IDENTITY(1,1), 
    first_name VARCHAR(255) NOT NULL,         
    last_name VARCHAR(255) NOT NULL,          
    email VARCHAR(255) NOT NULL UNIQUE,       
    password VARCHAR(100) NOT NULL,           
    phone_number VARCHAR(15),                 
    address VARCHAR(255),                    
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE students (
    student_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    phone_number VARCHAR(15),
    address VARCHAR(255),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE schedule(
	schedule_id Int primary key IDENTITY(1,1),


)
