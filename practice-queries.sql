USE TaskManagementDb;
SELECT * FROM Users;
SELECT * FROM Tasks;
SELECT Title,CreatedAt FROM Tasks;
SELECT * FROM Tasks WHERE IsCompleted=0;
SELECT * FROM Tasks WHERE IsCompleted=1;
SELECT * FROM Tasks WHERE ID=7;

SELECT * FROM Tasks WHERE UserId=3;
SELECT * FROM Tasks WHERE Title LIKE '%SQL';
SELECT * FROM Tasks WHERE CreatedAt>'2026-01-26';
SELECT * FROM Tasks WHERE UserId=3 AND IsCompleted=0;
SELECT * FROM Users WHERE Name LIKE '%A';

SELECT * FROM Tasks ORDER BY CreatedAt DESC;
SELECT * FROM Tasks ORDER BY CreatedAt ASC;
SELECT * FROM Users ORDER BY Name ASC;
SELECT * FROM Tasks WHERE IsCompleted=0 ORDER BY CreatedAt DESC;

INSERT INTO Users(Name, Email)
VALUES('Sophia','sophia@gmail.com');
INSERT INTO Tasks(Title, Description, IsCompleted, UserId) 
VALUES
    ('Learn Database Normalization', '', 0, (SELECT Id FROM Users WHERE Email = 'sophia@gmail.com')),
    ('Master Subqueries', 'Correlated and non-correlated subqueries', 1, (SELECT Id FROM Users WHERE Email = 'sophia@gmail.com')),
    ('Understand Transactions', 'ACID properties and isolation levels', 0, (SELECT Id FROM Users WHERE Email = 'sophia@gmail.com'));
SELECT * FROM Users WHERE Name='Sophia';
SELECT * FROM Tasks WHERE UserId=4;

SELECT * FROM Tasks WHERE Title='Understand Transactions';
SELECT * FROM Tasks WHERE Id=33;
SELECT * FROM Users WHERE Id=3;
SELECT * FROM Tasks  WHERE UserId=2;
UPDATE Tasks SET IsCompleted=1 WHERE Title='Understand Transactions';
UPDATE Tasks SET Title='Learn db' WHERE Id=33;
UPDATE Users SET Email='john1234@gmail.com' WHERE Id=3;
UPDATE Tasks SET IsCompleted=1 WHERE UserId=2;

INSERT INTO Tasks(Title, Description, IsCompleted, UserId) 
VALUES('TEMP','',0,4);
SELECT * FROM Tasks WHERE Title='TEMP';
DELETE FROM Tasks WHERE Title='TEMP';

SELECT Title,Name,IsCompleted FROM Tasks INNER JOIN Users ON Users.Id=Tasks.UserId;

INSERT INTO Users(Name, Email) 
VALUES('IVAN','IVAN@gmail.com');
SELECT Name, Title FROM Users LEFT JOIN Tasks ON Users.Id=Tasks.UserId ;
