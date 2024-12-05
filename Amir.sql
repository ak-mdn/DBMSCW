CREATE TABLE Country (
    countryId NUMBER PRIMARY KEY,
    countryName VARCHAR2(15)
);

CREATE TABLE County (
    countyId NUMBER PRIMARY KEY,
    countyName VARCHAR2(100),
    countryId NUMBER,
    FOREIGN KEY (countryId) REFERENCES Country(countryId)
);

CREATE TABLE District (
    districtId NUMBER PRIMARY KEY,
    districtName VARCHAR2(255),
    countyId NUMBER,
    FOREIGN KEY (countyId) REFERENCES County(countyId)
);

CREATE TABLE Person (
    personId NUMBER PRIMARY KEY,
    firstName VARCHAR2(100),
    lastName VARCHAR2(100),
    dateOfBirth DATE,
    gender VARCHAR2(255),
    employment VARCHAR2(255),
    profession VARCHAR2(255),
    districtId NUMBER,
    FOREIGN KEY (districtId) REFERENCES District(districtId)
);

CREATE TABLE Minister (
    ministerId NUMBER PRIMARY KEY,
    countryId NUMBER,
    FOREIGN KEY (countryId) REFERENCES Country(countryId)
);

CREATE TABLE MinisterStatement (
    statementId NUMBER PRIMARY KEY,
    ministerId NUMBER,
    statementContent VARCHAR2(3000),
    dateCreated DATE,
    FOREIGN KEY (ministerId) REFERENCES Minister(ministerId)
);

CREATE TABLE WaitingList (
    waitingListId NUMBER PRIMARY KEY,
    personId NUMBER,
    estimatedWait INTERVAL DAY TO SECOND,
    listType VARCHAR2(255),
    dateAdded DATE,
    FOREIGN KEY (personId) REFERENCES Person(personId)
);

CREATE TABLE Appointment (
    appointmentId NUMBER PRIMARY KEY,
    personId NUMBER,
    waitingListId NUMBER,
    appointmentDate TIMESTAMP,
    appointmentType VARCHAR2(255),
    location VARCHAR2(255),
    FOREIGN KEY (personId) REFERENCES Person(personId),
    FOREIGN KEY (waitingListId) REFERENCES WaitingList(waitingListId)
);

CREATE TABLE Professional (
    professionalId NUMBER PRIMARY KEY,
    specialisation VARCHAR2(255),
    FOREIGN KEY (professionalId) REFERENCES Person(personId)
);

CREATE TABLE AssignedProfessionals (
    appointmentId NUMBER,
    professionalId NUMBER,
    PRIMARY KEY (appointmentId, professionalId),
    FOREIGN KEY (appointmentId) REFERENCES Appointment(appointmentId),
    FOREIGN KEY (professionalId) REFERENCES Professional(professionalId)
);


-- Insert into Country
INSERT INTO Country VALUES (1, 'CountryA');
INSERT INTO Country VALUES (2, 'CountryB');
INSERT INTO Country VALUES (3, 'CountryC');
INSERT INTO Country VALUES (4, 'CountryD');
INSERT INTO Country VALUES (5, 'CountryE');
INSERT INTO Country VALUES (6, 'CountryF');
INSERT INTO Country VALUES (7, 'CountryG');
INSERT INTO Country VALUES (8, 'CountryH');
INSERT INTO Country VALUES (9, 'CountryI');
INSERT INTO Country VALUES (10, 'CountryJ');

-- Insert into County
INSERT INTO County VALUES (1, 'CountyA', 1);
INSERT INTO County VALUES (2, 'CountyB', 1);
INSERT INTO County VALUES (3, 'CountyC', 2);
INSERT INTO County VALUES (4, 'CountyD', 3);
INSERT INTO County VALUES (5, 'CountyE', 4);
INSERT INTO County VALUES (6, 'CountyF', 5);
INSERT INTO County VALUES (7, 'CountyG', 6);
INSERT INTO County VALUES (8, 'CountyH', 7);
INSERT INTO County VALUES (9, 'CountyI', 8);
INSERT INTO County VALUES (10, 'CountyJ', 9);

-- Insert into District
INSERT INTO District VALUES (1, 'DistrictA', 1);
INSERT INTO District VALUES (2, 'DistrictB', 2);
INSERT INTO District VALUES (3, 'DistrictC', 3);
INSERT INTO District VALUES (4, 'DistrictD', 4);
INSERT INTO District VALUES (5, 'DistrictE', 5);
INSERT INTO District VALUES (6, 'DistrictF', 6);
INSERT INTO District VALUES (7, 'DistrictG', 7);
INSERT INTO District VALUES (8, 'DistrictH', 8);
INSERT INTO District VALUES (9, 'DistrictI', 9);
INSERT INTO District VALUES (10, 'DistrictJ', 10);

-- Insert into Person
INSERT INTO Person VALUES (1, 'John', 'Doe', TO_DATE('1980-01-01', 'YYYY-MM-DD'), 'Male', 'Employed', 'Engineer', 1);
INSERT INTO Person VALUES (2, 'Jane', 'Smith', TO_DATE('1985-06-15', 'YYYY-MM-DD'), 'Female', 'Self-employed', 'Doctor', 2);
INSERT INTO Person VALUES (3, 'Sam', 'Wilson', TO_DATE('1990-09-20', 'YYYY-MM-DD'), 'Non-binary', 'Unemployed', 'Student', 3);
INSERT INTO Person VALUES (4, 'Chris', 'Evans', TO_DATE('1982-07-04', 'YYYY-MM-DD'), 'Male', 'Employed', 'Actor', 4);
INSERT INTO Person VALUES (5, 'Emma', 'Stone', TO_DATE('1988-11-06', 'YYYY-MM-DD'), 'Female', 'Employed', 'Artist', 5);
INSERT INTO Person VALUES (6, 'Liam', 'Jones', TO_DATE('1995-02-18', 'YYYY-MM-DD'), 'Male', 'Unemployed', 'Teacher', 6);
INSERT INTO Person VALUES (7, 'Olivia', 'Taylor', TO_DATE('1992-09-30', 'YYYY-MM-DD'), 'Female', 'Self-employed', 'Chef', 7);
INSERT INTO Person VALUES (8, 'Noah', 'Brown', TO_DATE('1987-03-22', 'YYYY-MM-DD'), 'Male', 'Employed', 'Lawyer', 8);
INSERT INTO Person VALUES (9, 'Mia', 'Davis', TO_DATE('1993-06-12', 'YYYY-MM-DD'), 'Female', 'Employed', 'Nurse', 9);
INSERT INTO Person VALUES (10, 'Ethan', 'Clark', TO_DATE('1984-12-01', 'YYYY-MM-DD'), 'Male', 'Self-employed', 'Engineer', 10);

-- Insert into Minister
INSERT INTO Minister VALUES (1, 1);
INSERT INTO Minister VALUES (2, 2);
INSERT INTO Minister VALUES (3, 3);
INSERT INTO Minister VALUES (4, 4);
INSERT INTO Minister VALUES (5, 5);
INSERT INTO Minister VALUES (6, 6);
INSERT INTO Minister VALUES (7, 7);
INSERT INTO Minister VALUES (8, 8);
INSERT INTO Minister VALUES (9, 9);
INSERT INTO Minister VALUES (10, 10);

-- Insert into MinisterStatement
INSERT INTO MinisterStatement VALUES (1, 1, 'Economic reform needed', TO_DATE('2023-01-01', 'YYYY-MM-DD'));
INSERT INTO MinisterStatement VALUES (2, 2, 'Health is priority', TO_DATE('2023-02-01', 'YYYY-MM-DD'));
INSERT INTO MinisterStatement VALUES (3, 3, 'Education improvement', TO_DATE('2023-03-01', 'YYYY-MM-DD'));
INSERT INTO MinisterStatement VALUES (4, 4, 'Infrastructure development', TO_DATE('2023-04-01', 'YYYY-MM-DD'));
INSERT INTO MinisterStatement VALUES (5, 5, 'Housing reforms', TO_DATE('2023-05-01', 'YYYY-MM-DD'));
INSERT INTO MinisterStatement VALUES (6, 6, 'Climate change initiative', TO_DATE('2023-06-01', 'YYYY-MM-DD'));
INSERT INTO MinisterStatement VALUES (7, 7, 'Healthcare investment', TO_DATE('2023-07-01', 'YYYY-MM-DD'));
INSERT INTO MinisterStatement VALUES (8, 8, 'Defense strategy', TO_DATE('2023-08-01', 'YYYY-MM-DD'));
INSERT INTO MinisterStatement VALUES (9, 9, 'Technology advancements', TO_DATE('2023-09-01', 'YYYY-MM-DD'));
INSERT INTO MinisterStatement VALUES (10, 10, 'Economic growth focus', TO_DATE('2023-10-01', 'YYYY-MM-DD'));

-- Insert into WaitingList
INSERT INTO WaitingList VALUES (1, 1, INTERVAL '0 0:30:00' DAY TO SECOND, 'Consultation', TO_DATE('2023-03-01', 'YYYY-MM-DD'));
INSERT INTO WaitingList VALUES (2, 2, INTERVAL '0 1:00:00' DAY TO SECOND, 'Surgery', TO_DATE('2023-03-05', 'YYYY-MM-DD'));
INSERT INTO WaitingList VALUES (3, 3, INTERVAL '0 0:45:00' DAY TO SECOND, 'Checkup', TO_DATE('2023-03-10', 'YYYY-MM-DD'));
INSERT INTO WaitingList VALUES (4, 4, INTERVAL '0 0:20:00' DAY TO SECOND, 'Dental', TO_DATE('2023-03-15', 'YYYY-MM-DD'));
INSERT INTO WaitingList VALUES (5, 5, INTERVAL '0 1:30:00' DAY TO SECOND, 'Operation', TO_DATE('2023-03-20', 'YYYY-MM-DD'));
INSERT INTO WaitingList VALUES (6, 6, INTERVAL '0 0:25:00' DAY TO SECOND, 'Vaccination', TO_DATE('2023-03-25', 'YYYY-MM-DD'));
INSERT INTO WaitingList VALUES (7, 7, INTERVAL '0 0:15:00' DAY TO SECOND, 'Consultation', TO_DATE('2023-03-30', 'YYYY-MM-DD'));
INSERT INTO WaitingList VALUES (8, 8, INTERVAL '0 1:00:00' DAY TO SECOND, 'Surgery', TO_DATE('2023-04-01', 'YYYY-MM-DD'));
INSERT INTO WaitingList VALUES (9, 9, INTERVAL '0 0:50:00' DAY TO SECOND, 'Checkup', TO_DATE('2023-04-05', 'YYYY-MM-DD'));
INSERT INTO WaitingList VALUES (10, 10, INTERVAL '0 0:35:00' DAY TO SECOND, 'Dental', TO_DATE('2023-04-10', 'YYYY-MM-DD'));

-- Insert into Appointment
INSERT INTO Appointment VALUES (1, 1, 1, TO_TIMESTAMP('2023-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Consultation', 'City Hospital');
INSERT INTO Appointment VALUES (2, 2, 2, TO_TIMESTAMP('2023-04-02 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Checkup', 'General Clinic');
INSERT INTO Appointment VALUES (3, 3, 3, TO_TIMESTAMP('2023-04-03 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Surgery', 'Private Hospital');
INSERT INTO Appointment VALUES (4, 4, 4, TO_TIMESTAMP('2023-04-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Dental', 'Dental Center');
INSERT INTO Appointment VALUES (5, 5, 5, TO_TIMESTAMP('2023-04-05 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Operation', 'Surgery Clinic');
INSERT INTO Appointment VALUES (6, 6, 6, TO_TIMESTAMP('2023-04-06 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Vaccination', 'Health Center');
INSERT INTO Appointment VALUES (7, 7, 7, TO_TIMESTAMP('2023-04-07 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Checkup', 'General Hospital');
INSERT INTO Appointment VALUES (8, 8, 8, TO_TIMESTAMP('2023-04-08 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Consultation', 'Clinic 8');
INSERT INTO Appointment VALUES (9, 9, 9, TO_TIMESTAMP('2023-04-09 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Dental', 'Health Clinic');
INSERT INTO Appointment VALUES (10, 10, 10, TO_TIMESTAMP('2023-04-10 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Surgery', 'Private Health Center');

-- Insert into Professional
INSERT INTO Professional VALUES (1, 'General Practitioner');
INSERT INTO Professional VALUES (2, 'Surgeon');
INSERT INTO Professional VALUES (3, 'Dentist');
INSERT INTO Professional VALUES (4, 'Therapist');
INSERT INTO Professional VALUES (5, 'Cardiologist');
INSERT INTO Professional VALUES (6, 'Orthopedist');
INSERT INTO Professional VALUES (7, 'Psychologist');
INSERT INTO Professional VALUES (8, 'Radiologist');
INSERT INTO Professional VALUES (9, 'Pediatrician');
INSERT INTO Professional VALUES (10, 'Neurologist');

-- Insert into AssignedProfessionals
INSERT INTO AssignedProfessionals VALUES (1, 1);
INSERT INTO AssignedProfessionals VALUES (2, 2);
INSERT INTO AssignedProfessionals VALUES (3, 3);
INSERT INTO AssignedProfessionals VALUES (4, 4);
INSERT INTO AssignedProfessionals VALUES (5, 5);
INSERT INTO AssignedProfessionals VALUES (6, 6);
INSERT INTO AssignedProfessionals VALUES (7, 7);
INSERT INTO AssignedProfessionals VALUES (8, 8);
INSERT INTO AssignedProfessionals VALUES (9, 9);
INSERT INTO AssignedProfessionals VALUES (10, 10);

SELECT * FROM Country;

SELECT * FROM County;

SELECT * FROM District;

SELECT * FROM Person;

SELECT * FROM Minister;

SELECT * FROM MinisterStatement;

SELECT * FROM WaitingList;

SELECT * FROM Appointment;

SELECT * FROM Professional;

SELECT * FROM AssignedProfessionals;

-- Basic Queries
-- 
SELECT M.ministerId, M.countryId, S.statementContent, S.dateCreated
FROM Minister M
JOIN MinisterStatement S ON M.ministerId = S.ministerId
WHERE S.dateCreated >= TO_DATE('2023-06-01', 'YYYY-MM-DD');

SELECT S.statementId, S.statementContent, M.ministerId
FROM MinisterStatement S
JOIN Minister M ON S.ministerId = M.ministerId
WHERE S.statementContent LIKE '%Economic%';

-- Meduim Queries 

-- Show the total estimated waiting time grouped by appointment type.

SELECT A.appointmentType, SUM(EXTRACT(HOUR FROM W.estimatedWait) * 60 + EXTRACT(MINUTE FROM W.estimatedWait)) AS totalWaitMinutes
FROM Appointment A
JOIN WaitingList W ON A.waitingListId = W.waitingListId
GROUP BY A.appointmentType;

-- Most Common Profession Among People

SELECT P.profession, COUNT(*) AS professionCount
FROM Person P
GROUP BY P.profession
ORDER BY professionCount DESC
FETCH FIRST 1 ROWS ONLY;

-- Total Number of Appointments by Type

SELECT A.appointmentType, COUNT(*) AS totalAppointments
FROM Appointment A
GROUP BY A.appointmentType
ORDER BY totalAppointments DESC;


-- Advanced Queries

-- Ministers Who Made Statements Containing "Economic" After June 2023


SELECT M.ministerId, M.countryId, S.statementContent, S.dateCreated
FROM Minister M
JOIN MinisterStatement S ON M.ministerId = S.ministerId
WHERE S.statementContent LIKE '%Economic%'
  AND S.dateCreated > TO_DATE('2023-06-01', 'YYYY-MM-DD');
