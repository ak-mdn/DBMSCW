-- Oracle Live SQL script
CREATE TABLE Country (
    countryId INT PRIMARY KEY,
    countryName VARCHAR2(20) NOT NULL
);

CREATE TABLE County (
    countyId INT PRIMARY KEY,
    countyName VARCHAR2(100) NOT NULL,
    countryId INT,
    FOREIGN KEY (countryId) REFERENCES Country(countryId)
);

CREATE TABLE District (
    districtId INT PRIMARY KEY,
    districtName VARCHAR2(255) NOT NULL,
    countyId INT,
    FOREIGN KEY (countyId) REFERENCES County(countyId)
);

CREATE TABLE Person (
    Id INT PRIMARY KEY,
    firstName VARCHAR2(100) NOT NULL,
    lastName VARCHAR2(100) NOT NULL,
    dateOfBirth DATE NOT NULL,
    gender VARCHAR2(50) NOT NULL,
    employment VARCHAR2(255),
    profession VARCHAR2(255),
    districtId INT,
    FOREIGN KEY (districtId) REFERENCES District(districtId)
);

CREATE TABLE Minister (
    ministerId INT PRIMARY KEY,
    Id INT UNIQUE,
    countryId INT NOT NULL,
    FOREIGN KEY (countryId) REFERENCES Country(countryId),
    FOREIGN KEY (Id) REFERENCES Person(Id)
);

CREATE TABLE Statement (
    statementId INT PRIMARY KEY,
    ministerId INT NOT NULL,
    statementContent VARCHAR2(3000) NOT NULL,
    dateCreated TIMESTAMP NOT NULL,
    FOREIGN KEY (ministerId) REFERENCES Minister(ministerId)
);

CREATE TABLE WaitingList (
    waitingListId INT PRIMARY KEY,
    personId INT NOT NULL,
    estimatedWait INTERVAL DAY TO SECOND NOT NULL,
    type VARCHAR2(255) NOT NULL,
    dateAdded DATE NOT NULL,
    FOREIGN KEY (personId) REFERENCES Person(Id)
);

CREATE TABLE Appointment (
    appointmentId INT PRIMARY KEY,
    personId INT NOT NULL,
    waitingListId INT,
    appointmentDate TIMESTAMP NOT NULL,
    type VARCHAR2(255) NOT NULL,
    location VARCHAR2(255) NOT NULL,
    FOREIGN KEY (personId) REFERENCES Person(Id),
    FOREIGN KEY (waitingListId) REFERENCES WaitingList(waitingListId)
);

CREATE TABLE Professional (
    professionalId INT PRIMARY KEY,
    Id INT UNIQUE,
    specialisation VARCHAR2(255) NOT NULL,
    FOREIGN KEY (Id) REFERENCES Person(Id)
);

CREATE TABLE AssignedProfessionals (
    appointmentId INT,
    professionalId INT,
    PRIMARY KEY (appointmentId, professionalId),
    FOREIGN KEY (appointmentId) REFERENCES Appointment(appointmentId),
    FOREIGN KEY (professionalId) REFERENCES Professional(professionalId)
);

INSERT INTO Country VALUES (1, 'England');
INSERT INTO Country VALUES (2, 'Wales');
INSERT INTO Country VALUES (3, 'Scotland');
INSERT INTO Country VALUES (4, 'Northern Ireland');

INSERT INTO County VALUES (1, 'Greater London', 1);
INSERT INTO County VALUES (2, 'Essex', 1);
INSERT INTO County VALUES (3, 'Cardiff', 2);
INSERT INTO County VALUES (4, 'Glasgow', 3);
INSERT INTO County VALUES (5, 'Belfast', 4);
INSERT INTO County VALUES (6, 'Surrey', 1);
INSERT INTO County VALUES (7, 'Kent', 1);
INSERT INTO County VALUES (8, 'Edinburgh City', 3);
INSERT INTO County VALUES (9, 'Newport', 2);
INSERT INTO County VALUES (10, 'Antrim County', 4);

INSERT INTO District VALUES (1, 'City of London', 1);
INSERT INTO District VALUES (2, 'Chelmsford', 2);
INSERT INTO District VALUES (3, 'Cardiff Central', 3);
INSERT INTO District VALUES (4, 'West End', 4);
INSERT INTO District VALUES (5, 'Antrim', 5);
INSERT INTO District VALUES (6, 'Tower Hamlets', 1);
INSERT INTO District VALUES (7, 'Southend', 2);
INSERT INTO District VALUES (8, 'Edinburgh Central', 3);
INSERT INTO District VALUES (9, 'Manchester', 1);
INSERT INTO District VALUES (10, 'Birmingham', 1);


INSERT INTO Person VALUES (1, 'Alice', 'Green', TO_DATE('1980-05-01', 'YYYY-MM-DD'), 'Female', 'Employed', 'Teacher', 1);
INSERT INTO Person VALUES (2, 'Bob', 'Brown', TO_DATE('1990-06-15', 'YYYY-MM-DD'), 'Male', 'Self-employed', 'Doctor', 2);
INSERT INTO Person VALUES (3, 'Charlie', 'Black', TO_DATE('1985-09-20', 'YYYY-MM-DD'), 'Male', 'Unemployed', 'Nurse', 3);
INSERT INTO Person VALUES (4, 'Daisy', 'White', TO_DATE('1992-07-04', 'YYYY-MM-DD'), 'Female', 'Employed', 'Dentist', 4);
INSERT INTO Person VALUES (5, 'Eve', 'Jones', TO_DATE('1998-11-06', 'YYYY-MM-DD'), 'Female', 'Unemployed', 'Researcher', 5);
INSERT INTO Person VALUES (6, 'Frank', 'Smith', TO_DATE('1975-02-18', 'YYYY-MM-DD'), 'Male', 'Employed', 'Surgeon', 6);
INSERT INTO Person VALUES (7, 'Grace', 'Taylor', TO_DATE('1995-09-30', 'YYYY-MM-DD'), 'Female', 'Employed', 'Chef', 7);
INSERT INTO Person VALUES (8, 'Henry', 'Adams', TO_DATE('1983-03-22', 'YYYY-MM-DD'), 'Male', 'Self-employed', 'Engineer', 8);
INSERT INTO Person VALUES (9, 'Ivy', 'Clark', TO_DATE('1987-06-12', 'YYYY-MM-DD'), 'Female', 'Employed', 'Therapist', 9);
INSERT INTO Person VALUES (10, 'Jack', 'Wilson', TO_DATE('1991-12-01', 'YYYY-MM-DD'), 'Male', 'Self-employed', 'Consultant', 10);

INSERT INTO Person VALUES (11, 'Olivia', 'King', TO_DATE('1984-01-10', 'YYYY-MM-DD'), 'Female', 'Employed', 'Pediatrician', 1);
INSERT INTO Person VALUES (12, 'Lucas', 'Martin', TO_DATE('1990-11-11', 'YYYY-MM-DD'), 'Male', 'Self-employed', 'Oncologist', 2);
INSERT INTO Person VALUES (13, 'Sophia', 'Lee', TO_DATE('1987-08-23', 'YYYY-MM-DD'), 'Female', 'Unemployed', 'Radiologist', 3);
INSERT INTO Person VALUES (14, 'James', 'Harris', TO_DATE('1995-04-07', 'YYYY-MM-DD'), 'Male', 'Employed', 'Orthopedic Surgeon', 4);
INSERT INTO Person VALUES (15, 'Isabella', 'Young', TO_DATE('1992-02-01', 'YYYY-MM-DD'), 'Female', 'Self-employed', 'Neurologist', 5);
INSERT INTO Person VALUES (16, 'Mason', 'Scott', TO_DATE('1981-07-16', 'YYYY-MM-DD'), 'Male', 'Employed', 'Psychiatrist', 6);
INSERT INTO Person VALUES (17, 'Lily', 'Green', TO_DATE('1993-03-29', 'YYYY-MM-DD'), 'Female', 'Unemployed', 'General Practitioner', 7);
INSERT INTO Person VALUES (18, 'William', 'Adams', TO_DATE('1990-09-18', 'YYYY-MM-DD'), 'Male', 'Self-employed', 'Surgeon', 8);
INSERT INTO Person VALUES (19, 'Ella', 'Mitchell', TO_DATE('1996-04-09', 'YYYY-MM-DD'), 'Female', 'Employed', 'Dentist', 9);
INSERT INTO Person VALUES (20, 'Benjamin', 'Moore', TO_DATE('1988-05-14', 'YYYY-MM-DD'), 'Male', 'Employed', 'Cardiologist', 10);

INSERT INTO Person VALUES (21, 'Aiden', 'Baker', TO_DATE('1994-12-15', 'YYYY-MM-DD'), 'Male', 'Employed', 'Physiotherapist', 1);
INSERT INTO Person VALUES (22, 'Chloe', 'Garcia', TO_DATE('1988-02-04', 'YYYY-MM-DD'), 'Female', 'Self-employed', 'Dermatologist', 4);
INSERT INTO Person VALUES (23, 'Ethan', 'Miller', TO_DATE('1992-06-21', 'YYYY-MM-DD'), 'Male', 'Employed', 'Therapist', 3);
INSERT INTO Person VALUES (24, 'Amelia', 'Carter', TO_DATE('1985-11-30', 'YYYY-MM-DD'), 'Female', 'Self-employed', 'Ophthalmologist', 4);
INSERT INTO Person VALUES (25, 'Liam', 'Davis', TO_DATE('1991-03-08', 'YYYY-MM-DD'), 'Male', 'Employed', 'Cardiologist', 5);
INSERT INTO Person VALUES (26, 'Zoe', 'Parker', TO_DATE('1983-10-25', 'YYYY-MM-DD'), 'Female', 'Unemployed', 'Pediatrician', 1);
INSERT INTO Person VALUES (27, 'Oliver', 'Nelson', TO_DATE('1986-07-30', 'YYYY-MM-DD'), 'Male', 'Employed', 'Surgeon', 7);
INSERT INTO Person VALUES (28, 'Harper', 'Robinson', TO_DATE('1990-12-20', 'YYYY-MM-DD'), 'Female', 'Employed', 'General Practitioner', 9);
INSERT INTO Person VALUES (29, 'Mason', 'Walker', TO_DATE('1984-09-12', 'YYYY-MM-DD'), 'Male', 'Self-employed', 'Engineer', 9);
INSERT INTO Person VALUES (30, 'Ella', 'Lopez', TO_DATE('1997-05-13', 'YYYY-MM-DD'), 'Female', 'Unemployed', 'Artist', 9);

-- Insert Prime Minister of the United Kingdom (England)
INSERT INTO Person VALUES (31, 'Keir', 'Starmer', TO_DATE('1962-09-02', 'YYYY-MM-DD'), 'Male', 'Employed', 'Politician', 1);

-- Insert First Minister of Scotland
INSERT INTO Person VALUES (32, 'John', 'Swinney', TO_DATE('1964-04-13', 'YYYY-MM-DD'), 'Male', 'Employed', 'Politician', 8);

-- Insert First Minister of Wales
INSERT INTO Person VALUES (33, 'Eluned', 'Morgan', TO_DATE('1967-02-16', 'YYYY-MM-DD'), 'Female', 'Employed', 'Politician', 3);

-- Insert First Minister of Northern Ireland
INSERT INTO Person VALUES (34, 'Michelle', 'O\'Neill', TO_DATE('1977-01-10', 'YYYY-MM-DD'), 'Female', 'Employed', 'Politician', 5);


INSERT INTO Minister VALUES (1, 31, 1);
INSERT INTO Minister VALUES (2, 32, 2);
INSERT INTO Minister VALUES (3, 33, 3);
INSERT INTO Minister VALUES (4, 34, 4);


INSERT INTO Statement VALUES (1, 1, 'NHS reforms are critical', TO_TIMESTAMP('2024-01-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Statement VALUES (2, 2, 'Improving rural healthcare', TO_TIMESTAMP('2024-02-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Statement VALUES (3, 3, 'Funding increase for hospitals', TO_TIMESTAMP('2024-03-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Statement VALUES (4, 4, 'Better healthcare for all', TO_TIMESTAMP('2024-04-01 11:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Statement VALUES (5, 1, 'NHS budget increased by 10%', TO_TIMESTAMP('2024-05-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Statement VALUES (6, 2, 'Mental health awareness campaign launched', TO_TIMESTAMP('2024-06-01 08:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Statement VALUES (7, 3, 'New hospitals planned for rural areas', TO_TIMESTAMP('2024-07-15 10:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Statement VALUES (8, 4, 'New healthcare partnership announced', TO_TIMESTAMP('2024-08-10 11:15:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Statement VALUES (9, 1, 'Staff shortages being addressed', TO_TIMESTAMP('2024-09-05 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Statement VALUES (10, 2, 'Emergency response teams expanded', TO_TIMESTAMP('2024-10-10 13:45:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Statement VALUES (11, 3, 'Focus on cancer research funding', TO_TIMESTAMP('2024-11-20 09:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Statement VALUES (12, 4, 'Vaccination drive sees success', TO_TIMESTAMP('2024-12-05 14:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Statement VALUES (13, 1, 'Digital transformation in healthcare', TO_TIMESTAMP('2025-01-10 08:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Statement VALUES (14, 2, 'NHS supports AI-based diagnostics', TO_TIMESTAMP('2025-02-15 10:15:00', 'YYYY-MM-DD HH24:MI:SS'));


INSERT INTO WaitingList VALUES (1, 1, INTERVAL '30' MINUTE, 'Consultation', TO_DATE('2024-01-15', 'YYYY-MM-DD'));
INSERT INTO WaitingList VALUES (2, 2, INTERVAL '75' MINUTE, 'Surgery', TO_DATE('2024-01-20', 'YYYY-MM-DD'));
INSERT INTO WaitingList VALUES (3, 3, INTERVAL '45' MINUTE, 'Therapy', TO_DATE('2024-02-01', 'YYYY-MM-DD'));
INSERT INTO WaitingList VALUES (4, 4, INTERVAL '25' MINUTE, 'Dental Check', TO_DATE('2024-02-10', 'YYYY-MM-DD'));
INSERT INTO WaitingList VALUES (5, 5, INTERVAL '60' MINUTE, 'Follow-up', TO_DATE('2024-02-20', 'YYYY-MM-DD'));
INSERT INTO WaitingList VALUES (6, 6, INTERVAL '40' MINUTE, 'Consultation', TO_DATE('2024-02-25', 'YYYY-MM-DD'));
INSERT INTO WaitingList VALUES (7, 7, INTERVAL '90' MINUTE, 'Surgery', TO_DATE('2024-03-01', 'YYYY-MM-DD'));
INSERT INTO WaitingList VALUES (8, 8, INTERVAL '50' MINUTE, 'Therapy', TO_DATE('2024-03-10', 'YYYY-MM-DD'));
INSERT INTO WaitingList VALUES (9, 9, INTERVAL '55' MINUTE, 'Consultation', TO_DATE('2024-03-15', 'YYYY-MM-DD'));
INSERT INTO WaitingList VALUES (10, 10, INTERVAL '120' MINUTE, 'Follow-up', TO_DATE('2024-03-20', 'YYYY-MM-DD'));


INSERT INTO Appointment VALUES (1, 1, 1, TO_TIMESTAMP('2024-02-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Consultation', 'St. Thomas Hospital');
INSERT INTO Appointment VALUES (2, 2, 2, TO_TIMESTAMP('2024-02-15 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Surgery', 'Royal London Hospital');
INSERT INTO Appointment VALUES (3, 3, 3, TO_TIMESTAMP('2024-02-25 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Therapy', 'Bristol Clinic');
INSERT INTO Appointment VALUES (4, 4, 4, TO_TIMESTAMP('2024-03-05 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Dental Surgery', 'Central Dental Clinic');
INSERT INTO Appointment VALUES (5, 5, 5, TO_TIMESTAMP('2024-03-10 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Psychiatric Consultation', 'South Mental Health Center');
INSERT INTO Appointment VALUES (6, 6, 6, TO_TIMESTAMP('2024-03-15 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Orthopedic Checkup', 'Westfield Hospital');
INSERT INTO Appointment VALUES (7, 7, 7, TO_TIMESTAMP('2024-03-20 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'General Consultation', 'Highland Clinic');
INSERT INTO Appointment VALUES (8, 8, 8, TO_TIMESTAMP('2024-03-25 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Eye Surgery', 'VisionCare Center');
INSERT INTO Appointment VALUES (9, 9, 9, TO_TIMESTAMP('2024-04-01 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Therapy Session', 'City Wellness Center');
INSERT INTO Appointment VALUES (10, 10, 10, TO_TIMESTAMP('2024-04-05 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Cardiac Checkup', 'St. Mary Hospital');
INSERT INTO Appointment VALUES (11, 1, 1, TO_TIMESTAMP('2024-04-10 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Dental Cleaning', 'Bright Smile Dental');
INSERT INTO Appointment VALUES (12, 2, 2, TO_TIMESTAMP('2024-04-15 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Skin Consultation', 'DermCare Clinic');
INSERT INTO Appointment VALUES (13, 3, 3, TO_TIMESTAMP('2024-04-20 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Physiotherapy', 'Sports Rehab Center');

INSERT INTO Professional VALUES (1, 1, 'General Practitioner');
INSERT INTO Professional VALUES (2, 2, 'Surgeon');
INSERT INTO Professional VALUES (3, 3, 'Nurse');
INSERT INTO Professional VALUES (4, 4, 'Dentist');
INSERT INTO Professional VALUES (5, 5, 'Researcher');
INSERT INTO Professional VALUES (6, 6, 'Surgeon');
INSERT INTO Professional VALUES (7, 7, 'Chef');
INSERT INTO Professional VALUES (8, 8, 'Engineer');
INSERT INTO Professional VALUES (9, 9, 'Therapist');
INSERT INTO Professional VALUES (10, 10, 'Consultant');
INSERT INTO Professional VALUES (11, 11, 'Pediatrician');
INSERT INTO Professional VALUES (12, 12, 'Oncologist');
INSERT INTO Professional VALUES (13, 13, 'Radiologist');
INSERT INTO Professional VALUES (14, 14, 'Orthopedic Surgeon');
INSERT INTO Professional VALUES (15, 15, 'Neurologist');
INSERT INTO Professional VALUES (16, 16, 'Psychiatrist');
INSERT INTO Professional VALUES (17, 17, 'General Practitioner');
INSERT INTO Professional VALUES (18, 18, 'Surgeon');
INSERT INTO Professional VALUES (19, 19, 'Dentist');
INSERT INTO Professional VALUES (20, 20, 'Cardiologist');


INSERT INTO AssignedProfessionals VALUES (1, 1);
INSERT INTO AssignedProfessionals VALUES (2, 2);
INSERT INTO AssignedProfessionals VALUES (3, 3);
INSERT INTO AssignedProfessionals VALUES (4, 4);
INSERT INTO AssignedProfessionals VALUES (5, 8);
INSERT INTO AssignedProfessionals VALUES (6, 7);
INSERT INTO AssignedProfessionals VALUES (7, 1);
INSERT INTO AssignedProfessionals VALUES (8, 10);
INSERT INTO AssignedProfessionals VALUES (9, 6);
INSERT INTO AssignedProfessionals VALUES (10, 4);
INSERT INTO AssignedProfessionals VALUES (11, 3);
INSERT INTO AssignedProfessionals VALUES (12, 5);
INSERT INTO AssignedProfessionals VALUES (13, 6);

--basic
-- Find all appointments with a waiting time longer than 60 minutes

SELECT A.appointmentId, A.type, W.estimatedWait
FROM Appointment A
JOIN WaitingList W ON A.waitingListId = W.waitingListId
WHERE W.estimatedWait > INTERVAL '60' MINUTE;

-- Show the total number of people in each district

SELECT D.districtName, COUNT(P.Id) AS totalPeople
FROM District D
LEFT JOIN Person P ON D.districtId = P.districtId
GROUP BY D.districtName;

--medium
-- List all districts and the number of people who have at least one appointment

SELECT D.districtName, COUNT(DISTINCT P.Id) AS peopleWithAppointments
FROM District D
LEFT JOIN Person P ON D.districtId = P.districtId
LEFT JOIN Appointment A ON P.Id = A.personId
GROUP BY D.districtName
HAVING COUNT(DISTINCT P.Id) > 0;

-- List all counties with their total number of appointments, including counties with no appointments

SELECT C.countyName, COUNT(A.appointmentId) AS totalAppointments
FROM County C
LEFT JOIN District D ON C.countyId = D.countyId
LEFT JOIN Person P ON D.districtId = P.districtId
LEFT JOIN Appointment A ON P.Id = A.personId
GROUP BY C.countyName;

-- list the average waiting time (in months) for each type and the number of appointments associated with that type.

SELECT WL.type, ROUND(AVG(MONTHS_BETWEEN(SYSDATE, WL.dateAdded)), 1) AS avg_months, COUNT(A.personId) AS appointmentCount
FROM WaitingList WL
LEFT JOIN Appointment A ON WL.waitingListId = A.waitingListId 
GROUP BY WL.type;

-- advanced
-- find the ministers who have made more statements than the average number of statements made by all ministers
SELECT M.ministerId, P.firstName, P.lastName, COUNT(S.statementId) AS numberOfStatements
FROM Minister M
JOIN Person P ON M.Id = P.Id
JOIN Statement S ON M.ministerId = S.ministerId
GROUP BY M.ministerId, P.firstName, P.lastName
HAVING COUNT(S.statementId) > (
    SELECT AVG(statementCount)
    FROM (
        SELECT COUNT(statementId) AS statementCount
        FROM Statement
        GROUP BY ministerId
    )
);

-- Find professionals who are assigned to more than one appointment
SELECT Pr.professionalId, Pr.specialisation, COUNT(AP.appointmentId) AS numberOfAssignments
FROM Professional Pr
JOIN AssignedProfessionals AP ON Pr.professionalId = AP.professionalId
GROUP BY Pr.professionalId, Pr.specialisation
HAVING COUNT(AP.appointmentId) > 1;

-- List ministers who made statements in the last year
SELECT M.ministerId, COUNT(S.statementId) AS totalStatements
FROM Minister M
JOIN Statement S ON M.ministerId = S.ministerId
WHERE S.dateCreated >= ADD_MONTHS(SYSDATE, -12)
GROUP BY M.ministerId
HAVING COUNT(S.statementId) > 0;
