CREATE TABLE Country (
    countryId INT PRIMARY KEY,
    countryName VARCHAR(15)
);

CREATE TABLE County (
    countyId INT PRIMARY KEY,
    countyName VARCHAR(100),
    countryId INT,
    FOREIGN KEY (countryId) REFERENCES Country(countryId)
);

CREATE TABLE District (
    districtId INT PRIMARY KEY,
    districtName VARCHAR(255),
    countyId INT,
    FOREIGN KEY (countyId) REFERENCES County(countyId)
);

CREATE TABLE Person (
    Id INT PRIMARY KEY,
    firstName VARCHAR(100),
    lastName VARCHAR(100),
    dateOfBirth DATE,
    gender VARCHAR(255),
    employment VARCHAR(255),
    profession VARCHAR(255),
    districtId INT,
    FOREIGN KEY (districtId) REFERENCES District(districtId)
);

CREATE TABLE Minister (
    ministerId INT PRIMARY KEY,
    countryId INT,
    FOREIGN KEY (countryId) REFERENCES Country(countryId)
);

CREATE TABLE Statement (
    statementId INT PRIMARY KEY,
    ministerId INT,
    statementContent VARCHAR(3000),
    dateCreated DATE,
    FOREIGN KEY (ministerId) REFERENCES Minister(ministerId)
);

CREATE TABLE WaitingList (
    waitingListId INT PRIMARY KEY,
    personId INT,
    estimatedWait TIME,
    type VARCHAR(255),
    dateAdded DATE,
    FOREIGN KEY (personId) REFERENCES Person(Id)
);

CREATE TABLE Appointment (
    appointmentId INT PRIMARY KEY,
    personId INT(7),
    waitingListId INT,
    date DATE,
    type VARCHAR(255),
    location VARCHAR(255),
    FOREIGN KEY (personId) REFERENCES Person(Id),
    FOREIGN KEY (waitingListId) REFERENCES WaitingList(waitingListId)
);

CREATE TABLE Professional (
    professionalId INT PRIMARY KEY,
    specialisation VARCHAR(255),
    FOREIGN KEY (professionalId) REFERENCES Person(Id)
);

CREATE TABLE AssignedProfessionals (
    appointmentId INT,
    professionalId INT,
    PRIMARY KEY (appointmentId, professionalId),
    FOREIGN KEY (appointmentId) REFERENCES Appointment(appointmentId),
    FOREIGN KEY (professionalId) REFERENCES Professional(professionalId)
);

INSERT INTO Country VALUES 
(1, 'CountryA'), 
(2, 'CountryB'), 
(3, 'CountryC'), 
(4, 'CountryD'), 
(5, 'CountryE'), 
(6, 'CountryF'), 
(7, 'CountryG'), 
(8, 'CountryH'), 
(9, 'CountryI'), 
(10, 'CountryJ');

INSERT INTO County VALUES 
(1, 'CountyA', 1), 
(2, 'CountyB', 1), 
(3, 'CountyC', 2), 
(4, 'CountyD', 3), 
(5, 'CountyE', 4), 
(6, 'CountyF', 5), 
(7, 'CountyG', 6), 
(8, 'CountyH', 7), 
(9, 'CountyI', 8), 
(10, 'CountyJ', 9);

INSERT INTO District VALUES 
(1, 'DistrictA', 1), 
(2, 'DistrictB', 2), 
(3, 'DistrictC', 3), 
(4, 'DistrictD', 4), 
(5, 'DistrictE', 5), 
(6, 'DistrictF', 6), 
(7, 'DistrictG', 7), 
(8, 'DistrictH', 8), 
(9, 'DistrictI', 9), 
(10, 'DistrictJ', 10);

INSERT INTO Person VALUES
(1, 'John', 'Doe', '1980-01-01', 'Male', 'Employed', 'Engineer', 1),
(2, 'Jane', 'Smith', '1985-06-15', 'Female', 'Self-employed', 'Doctor', 2),
(3, 'Sam', 'Wilson', '1990-09-20', 'Non-binary', 'Unemployed', 'Student', 3),
(4, 'Chris', 'Evans', '1982-07-04', 'Male', 'Employed', 'Actor', 4),
(5, 'Emma', 'Stone', '1988-11-06', 'Female', 'Employed', 'Artist', 5),
(6, 'Liam', 'Jones', '1995-02-18', 'Male', 'Unemployed', 'Teacher', 6),
(7, 'Olivia', 'Taylor', '1992-09-30', 'Female', 'Self-employed', 'Chef', 7),
(8, 'Noah', 'Brown', '1987-03-22', 'Male', 'Employed', 'Lawyer', 8),
(9, 'Mia', 'Davis', '1993-06-12', 'Female', 'Employed', 'Nurse', 9),
(10, 'Ethan', 'Clark', '1984-12-01', 'Male', 'Self-employed', 'Engineer', 10);

INSERT INTO Minister VALUES 
(1, 1), 
(2, 2), 
(3, 3), 
(4, 4), 
(5, 5), 
(6, 6), 
(7, 7), 
(8, 8), 
(9, 9), 
(10, 10);

INSERT INTO Statement VALUES
(1, 1, 'Economic reform needed', '2023-01-01'),
(2, 2, 'Health is priority', '2023-02-01'),
(3, 3, 'Education improvement', '2023-03-01'),
(4, 4, 'Infrastructure development', '2023-04-01'),
(5, 5, 'Housing reforms', '2023-05-01'),
(6, 6, 'Climate change initiative', '2023-06-01'),
(7, 7, 'Healthcare investment', '2023-07-01'),
(8, 8, 'Defense strategy', '2023-08-01'),
(9, 9, 'Technology advancements', '2023-09-01'),
(10, 10, 'Economic growth focus', '2023-10-01');

INSERT INTO WaitingList VALUES
(1, 1, '00:30:00', 'Consultation', '2023-03-01'),
(2, 2, '01:00:00', 'Surgery', '2023-03-05'),
(3, 3, '00:45:00', 'Checkup', '2023-03-10'),
(4, 4, '00:20:00', 'Dental', '2023-03-15'),
(5, 5, '01:30:00', 'Operation', '2023-03-20'),
(6, 6, '00:25:00', 'Vaccination', '2023-03-25'),
(7, 7, '00:50:00', 'Therapy', '2023-03-30'),
(8, 8, '00:40:00', 'Diagnosis', '2023-04-05'),
(9, 9, '01:20:00', 'Consultation', '2023-04-10'),
(10, 10, '00:55:00', 'Follow-up', '2023-04-15');

INSERT INTO Appointment VALUES
(1, 1, 1, '2023-04-01', 'Consultation', 'City Hospital'),
(2, 2, 2, '2023-05-01', 'Surgery', 'County Clinic'),
(3, 3, 3, '2023-06-01', 'Checkup', 'Central Clinic'),
(4, 4, 4, '2023-07-01', 'Dental', 'Downtown Dental'),
(5, 5, 5, '2023-08-01', 'Operation', 'Regional Hospital'),
(6, 6, 6, '2023-09-01', 'Vaccination', 'Health Center'),
(7, 7, 7, '2023-10-01', 'Therapy', 'Wellness Center'),
(8, 8, 8, '2023-11-01', 'Diagnosis', 'Diagnostic Lab'),
(9, 9, 9, '2023-12-01', 'Consultation', 'General Hospital'),
(10, 10, 10, '2024-01-01', 'Follow-up', 'Specialist Clinic');

INSERT INTO Professional VALUES 
(1, 'General Practitioner'), 
(2, 'Surgeon'), 
(3, 'Dentist'), 
(4, 'Therapist'), 
(5, 'Cardiologist'), 
(6, 'Orthopedist'), 
(7, 'Psychologist'), 
(8, 'Radiologist'), 
(9, 'Pediatrician'), 
(10, 'Neurologist');

INSERT INTO AssignedProfessionals VALUES 
(1, 1), 
(2, 2), 
(3, 3), 
(4, 4), 
(5, 5), 
(6, 6), 
(7, 7), 
(8, 8), 
(9, 9), 
(10, 10);

SELECT M.ministerId, M.countryId, S.statementContent, S.dateCreated
FROM Minister M
JOIN Statement S ON M.ministerId = S.ministerId
WHERE S.dateCreated >= '2023-06-01';

SELECT S.statementId, S.statementContent, M.ministerId
FROM Statement S
JOIN Minister M ON S.ministerId = M.ministerId
WHERE S.statementContent LIKE '%Economic%';
