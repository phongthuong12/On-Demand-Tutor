CREATE DATABASE On_Demand_Tutor;
GO

USE On_Demand_Tutor;
GO

CREATE TABLE roles (
    role_id INT PRIMARY KEY,
    name VARCHAR(255)
);
GO

CREATE TABLE review (
    review_id INT PRIMARY KEY,
    review_score DECIMAL(2,1) CHECK (review_score >= 1 AND review_score <= 5),
    review_text NVARCHAR(255)
);
GO

CREATE TABLE grade (
    grade_id INT PRIMARY KEY IDENTITY(1,1),
    grade_level VARCHAR(100) NOT NULL, 
    description TEXT
);
GO

CREATE TABLE registerStatus (
    registerStatus_id INT PRIMARY KEY IDENTITY(1,1),
    status NCHAR(10) NOT NULL
);
GO

CREATE TABLE registerDetail (
    registerDetail_id INT PRIMARY KEY IDENTITY(1,1),
    registerStatus_id INT NOT NULL,
    FOREIGN KEY (registerStatus_id) REFERENCES registerStatus(registerStatus_id)
);
GO

CREATE TABLE users (
    user_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email NVARCHAR(255) NOT NULL,
    password VARCHAR(100) NOT NULL,
    phone_number VARCHAR(15),
    address VARCHAR(255),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    role_id INT,
    FOREIGN KEY (role_id) REFERENCES roles(role_id)
);
GO

CREATE TABLE moderator (
    moderator_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
GO

CREATE TABLE student (
    student_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
GO

CREATE TABLE tutor (
    tutor_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
GO

CREATE TABLE complaint (
    complaint_id INT PRIMARY KEY IDENTITY(1,1),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    user_id INT,
    complaint_text NVARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
GO

CREATE TABLE subjects (
    subject_id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(255) NOT NULL,
    description TEXT,
    grade_id INT,
    review_id INT,
    FOREIGN KEY (grade_id) REFERENCES grade(grade_id),
    FOREIGN KEY (review_id) REFERENCES review(review_id)
);
GO

CREATE TABLE service (
    service_id INT PRIMARY KEY IDENTITY(1,1),
    status VARCHAR(50),
    tutor_video VARCHAR(2048),
    tutor_id INT,
    description NVARCHAR(255),
    subject_id INT,
    grade_id INT,
    FOREIGN KEY (grade_id) REFERENCES grade(grade_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);
GO

CREATE TABLE schedule (
    schedule_id INT PRIMARY KEY IDENTITY(1,1),
    service_id INT,
    day_of_week NVARCHAR(50),
    time_slot BIT,
    FOREIGN KEY (service_id) REFERENCES service(service_id)
);
GO

CREATE TABLE register (
    register_id INT PRIMARY KEY IDENTITY(1,1),
    student_id INT,
    registerDetail_id INT,
    service_id INT,
    FOREIGN KEY (service_id) REFERENCES service(service_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (registerDetail_id) REFERENCES registerDetail(registerDetail_id)
);
GO

CREATE TABLE certificate (
    certificate_id INT PRIMARY KEY IDENTITY(1,1),
    certificate_name VARCHAR(100),
    tutor_id INT,
    certificate_img VARCHAR(2048),
    FOREIGN KEY (tutor_id) REFERENCES tutor(tutor_id)
);
GO
