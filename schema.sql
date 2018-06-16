CREATE DATABASE IF NOT EXISTS `'SchoolMng'` ;

USE 'SchoolMng';

CREATE TABLE Teachers (
    idTeacher SMALLINT(3) AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(45) NOT NULL,
    lastname VARCHAR(45) NOT NULL,
    pesel VARCHAR(255) NOT NULL UNIQUE,
    gender ENUM('MALE', 'FEMALE', 'HIDDEN'),
    simpleAddress VARCHAR(70),
    dateOfBirth DATE,
    graduationInfo VARCHAR(100)
);

CREATE TABLE Forms (
    idForm SMALLINT(3) AUTO_INCREMENT PRIMARY KEY,
    formName VARCHAR(30) NOT NULL UNIQUE,
    fk_tutor_idTeacher SMALLINT(5),
    FOREIGN KEY (fk_tutor_idTeacher)
        REFERENCES Teachers (idTeacher)
);

CREATE TABLE Subjects (
    idSubject SMALLINT(3)  AUTO_INCREMENT PRIMARY KEY,
    subjectName VARCHAR(45) NOT NULL UNIQUE
);


CREATE TABLE Students (
    idStudent SMALLINT(3) AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(45) NOT NULL,
    lastname VARCHAR(45) NOT NULL,
    pesel VARCHAR(255) NOT NULL UNIQUE,
    gender ENUM('MALE', 'FEMALE', 'HIDDEN'),
    simpleAddress VARCHAR(70),
    dateOfBirth DATE,
    scholarship BOOLEAN,
    fk_idForm SMALLINT(3),
    FOREIGN KEY (fk_idForm)
        REFERENCES Forms (idForm)
);

CREATE TABLE TeachersSubjectsForms (
    fk_idTeacher SMALLINT(3),
    fk_idSubject SMALLINT(3),
    fk_idForm SMALLINT(3),
    PRIMARY KEY (fk_idTeacher , fk_idSubject , fk_idForm),
    FOREIGN KEY (fk_idTeacher)
        REFERENCES Teachers (idTeacher),
    FOREIGN KEY (fk_idSubject)
        REFERENCES Subjects (idSubject),
    FOREIGN KEY (fk_idForm)
        REFERENCES Forms (idForm)
);

 

