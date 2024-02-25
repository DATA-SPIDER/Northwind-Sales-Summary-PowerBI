USE test

-- Create LoanOfficers table
CREATE TABLE LoanOfficers (
    LoanOfficerID INT PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50)
);


-- Insert data for 8 Loan Officers with explicit IDs
INSERT INTO LoanOfficers (LoanOfficerID, firstname, lastname) VALUES
(1, 'John', 'Doe'),
(2, 'Jane', 'Smith'),
(3, 'Robert', 'Johnson'),
(4, 'Emily', 'Davis'),
(5, 'Michael', 'Wilson'),
(6, 'Laura', 'Brown'),
(7, 'Daniel', 'Miller'),
(8, 'Amanda', 'Anderson');


-- Create LoanIssued table
CREATE TABLE LoanIssued (
    LoanIssuedID INT PRIMARY KEY IDENTITY(1,1),
    OfficerID INT,
    AmountOfLoan DECIMAL(10, 2),
    Currency VARCHAR(10),
    FOREIGN KEY (OfficerID) REFERENCES LoanOfficers(LoanOfficerID)
);


-- Insert data for 20 Loan Issued entries
INSERT INTO LoanIssued (OfficerID, AmountOfLoan, Currency) VALUES
(1, 50000.00, 'GEL'),
(2, 75000.00, 'EURO'),
(3, 100000.00, 'USD'),
(4, 60000.00, 'STERLING'),
(5, 80000.00, 'GEL'),
(1, 120000.00, 'EURO'),
(6, 90000.00, 'STERLING'),
(7, 55000.00, 'USD'),
(2, 70000.00, 'EURO'),
(8, 95000.00, 'STERLING'),
(1, 30000.00, 'USD'),
(3, 85000.00, 'EURO'),
(4, 110000.00, 'STERLING'),
(5, 40000.00, 'GEL'),
(6, 60000.00, 'EURO'),
(7, 75000.00, 'STERLING'),
(8, 90000.00, 'USD'),
(1, 100000.00, 'EURO'),
(2, 48000.00, 'GEL'),
(3, 65000.00, 'USD');


-- and selecting loan officer(s) who have exclusively given loans in GEL
SELECT lo.*
FROM LoanOfficers lo
WHERE NOT EXISTS (
    SELECT 1
    FROM LoanIssued li
    WHERE lo.LoanOfficerID = li.OfficerID
    AND li.Currency <> 'GEL'
);