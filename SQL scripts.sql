-- CREATE DATABASE SDG_8;
-- USE SDG_8;

-- Create Province table
-- CREATE TABLE Province (
--     ProvinceID INT PRIMARY KEY,
--     ProvinceName VARCHAR(255) NOT NULL,
--     Population INT NOT NULL
-- );

-- Create Employment Data table
-- CREATE TABLE EmploymentData (
--     DataID INT PRIMARY KEY,
--     ProvinceID INT,
--     Year INT NOT NULL,
--     UnemploymentRate DECIMAL(5,2),
--     EmploymentRate DECIMAL(5,2),
--     FOREIGN KEY (ProvinceID) REFERENCES Province(ProvinceID)
-- );

-- Create Job Sector table
-- CREATE TABLE JobSector (
--     SectorID INT PRIMARY KEY,
--     ProvinceID INT,
--     SectorName VARCHAR(255),
--     EmployedPopulation INT,
--     UnemployedPopulation INT,
--     FOREIGN KEY (ProvinceID) REFERENCES Province(ProvinceID)
--     );

 -- Create Gender table
-- CREATE TABLE Gender (
--     GenderID INT PRIMARY KEY,
--     GenderName VARCHAR(50) NOT NULL
-- );

-- Create AgeGroup table
-- CREATE TABLE AgeGroup (
--     AgeGroupID INT PRIMARY KEY,
--     AgeGroupName VARCHAR(50) NOT NULL
-- );

-- ALTER TABLE EmploymentData
-- ADD COLUMN GenderID INT;

-- ALTER TABLE EmploymentData
-- ADD COLUMN AgeGroupID INT;

-- ALTER TABLE EmploymentData
-- ADD CONSTRAINT FK_Gender
-- FOREIGN KEY (GenderID) REFERENCES Gender(GenderID);

-- ALTER TABLE EmploymentData
-- ADD CONSTRAINT FK_AgeGroup
-- FOREIGN KEY (AgeGroupID) REFERENCES AgeGroup(AgeGroupID);

-- Insert sample data into Gender table
-- INSERT INTO Gender (GenderID, GenderName) VALUES
-- (1, 'Male'),
-- (2, 'Female');

-- Insert sample data into AgeGroup table
-- INSERT INTO AgeGroup (AgeGroupID, AgeGroupName) VALUES
-- (1, '15-24'),
-- (2, '25-34'),
-- (3, '35-44'),
-- (4, '45-54'),
-- (5, '55-64'),
-- (6, '65+');

-- Insert sample data into Province table
-- INSERT INTO Province (ProvinceID, ProvinceName, Population) VALUES
-- (1, 'Gauteng', 15300000),
-- (2, 'Western Cape', 7000000),
-- (3, 'KwaZulu-Natal', 11400000),
-- (4, 'Eastern Cape', 6000000),
-- (5, 'Limpopo', 5400000),
-- (6, 'Mpumalanga', 1556222),
-- (7, 'Northern cape', 5540022),
-- (8, 'Freestate', 1256666),
-- (9, 'North west', 5001222);

-- Insert sample data into EmploymentData with gender and age group
-- INSERT INTO EmploymentData (DataID, ProvinceID, Year, UnemploymentRate, EmploymentRate, GenderID, AgeGroupID) VALUES
-- (1, 1, 2024, 34.00, 16.00, 1, 1),
-- (2, 1, 2024, 32.00, 15.00, 2, 1),
-- (3, 1, 2024, 30.00, 14.00, 1, 2),
-- (4, 1, 2024, 28.00, 13.00, 2, 2),
-- (5, 2, 2024, 20.00, 10.00, 1, 3),
-- (6, 2, 2024, 18.00, 9.00, 2, 3),
-- (7, 2, 2024, 22.00, 11.00, 1, 4),
-- (8, 2, 2024, 20.00, 10.00, 2, 4);

-- SELECT * FROM  sdg_8.jobsector;

-- Retrieve unemployment rate by gender for each province
-- SELECT p.ProvinceName, g.GenderName, AVG(e.UnemploymentRate) AS AvgUnemploymentRate
-- FROM Province p
-- JOIN EmploymentData e ON p.ProvinceID = e.ProvinceID
-- JOIN Gender g ON e.GenderID = g.GenderID
-- GROUP BY p.ProvinceName, g.GenderName
-- ORDER BY p.ProvinceName, g.GenderName;

-- Insert sample data into Job Sector
-- INSERT INTO JobSector (SectorID, ProvinceID, SectorName, EmployedPopulation) VALUES
-- (1, 1, 'Technology', 3000000),
-- (2, 1, 'Manufacturing', 1500000),
-- (3, 2, 'Tourism', 1200000),
-- (4, 2, 'Agriculture', 500000),
-- (5, 3, 'Services', 2500000),
-- (6, 3, 'Construction', 1000000),
-- (7, 4, 'Agriculture', 800000),
-- (8, 4, 'Education', 600000),
-- (9, 5, 'Mining', 600000),
-- (10, 5, 'Agriculture', 700000);

-- Create Interventions table
-- CREATE TABLE Interventions (
--     InterventionID INT PRIMARY KEY,
--     ProvinceID INT,
--     InterventionType VARCHAR(255),
--     StartDate DATE,
--     EndDate DATE,
--     FOREIGN KEY (ProvinceID) REFERENCES Province(ProvinceID)
-- );

-- Insert sample data into Interventions
-- INSERT INTO Interventions (InterventionID, ProvinceID, InterventionType, StartDate, EndDate) VALUES
-- (1, 1, 'Youth Employment Program', '2024-01-01', '2024-12-31'),
-- (2, 2, 'Skill Development Workshops', '2024-03-01', '2024-12-31'),
-- (3, 3, 'Small Business Support', '2024-02-01', '2024-12-31'),
-- (4, 4, 'Agricultural Development Project', '2024-04-01', '2024-12-31'),
-- (5, 5, 'Mining Industry Skills Training', '2024-05-01', '2024-12-31');

-- Verify Gender data
-- SELECT * FROM Gender;

-- Verify AgeGroup data
-- SELECT * FROM AgeGroup;

-- Verify Province data
-- SELECT * FROM Province;

-- Retrieve unemployment rate by gender for each province
-- SELECT p.ProvinceName, g.GenderName, AVG(e.UnemploymentRate) AS AvgUnemploymentRate
-- FROM Province p
-- JOIN EmploymentData e ON p.ProvinceID = e.ProvinceID
-- JOIN Gender g ON e.GenderID = g.GenderID
-- GROUP BY p.ProvinceName, g.GenderName
-- ORDER BY p.ProvinceName, g.GenderName;

-- Retrieve unemployment rate by age group for each province
-- SELECT p.ProvinceName, a.AgeGroupName, AVG(e.UnemploymentRate) AS AvgUnemploymentRate
-- FROM Province p
-- JOIN EmploymentData e ON p.ProvinceID = e.ProvinceID
-- JOIN AgeGroup a ON e.AgeGroupID = a.AgeGroupID
-- GROUP BY p.ProvinceName, a.AgeGroupName
-- ORDER BY p.ProvinceName, a.AgeGroupName;

-- Retrieve employment data for each province
-- SELECT p.ProvinceName, e.Year, e.UnemploymentRate, e.EmploymentRate
-- FROM Province p
-- JOIN EmploymentData e ON p.ProvinceID = e.ProvinceID
-- ORDER BY p.ProvinceName, e.Year;

-- Retrieve job sector data for each province
-- SELECT p.ProvinceName, j.SectorName, j.EmployedPopulation
-- FROM Province p
-- JOIN JobSector j ON p.ProvinceID = j.ProvinceID;

-- Retrieve interventions planned in each province
-- SELECT p.ProvinceName, i.InterventionType, i.StartDate, i.EndDate
-- FROM Province p
-- JOIN Interventions i ON p.ProvinceID = i.ProvinceID;

-- Calculate average unemployment and underemployment rates by province
-- SELECT p.ProvinceName, AVG(e.UnemploymentRate) AS AvgUnemploymentRate, AVG(e.employmentRate) AS AvgUnderemploymentRate
-- FROM Province p
-- JOIN EmploymentData e ON p.ProvinceID = e.ProvinceID
-- GROUP BY p.ProvinceName;

-- Total employed population by job sector in each province
-- SELECT p.ProvinceName, j.SectorName, SUM(j.EmployedPopulation) AS TotalEmployedPopulation
-- FROM Province p
-- JOIN JobSector j ON p.ProvinceID = j.ProvinceID
-- GROUP BY p.ProvinceName, j.SectorName;


