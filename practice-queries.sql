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

SELECT COUNT(*) FROM Users;
SELECT COUNT(*) FROM Tasks;
SELECT COUNT(*) FROM Tasks WHERE IsCompleted=1;
SELECT COUNT(*) FROM Tasks WHERE IsCompleted=0;
SELECT u.Id,u.Name, COUNT(t.Id) FROM Users u LEFT JOIN Tasks t ON t.UserId=u.Id GROUP BY u.Id, u.Name;

SELECT U.Id, U.Name FROM Users U LEFT JOIN Tasks T ON U.Id=T.UserId WHERE T.UserId IS NULL;

SELECT * FROM Tasks WHERE Title='More on Indexes' ;
BEGIN TRY
    BEGIN TRANSACTION;
        UPDATE Tasks SET IsCompleted=1 WHERE Title='More on Indexes';
        INSERT INTO Tasks(Title, Description, IsCompleted, UserId) 
        VALUES('B-TRANSACTION','TRANSACTION',0,4);
        COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
END CATCH
SELECT * FROM Tasks WHERE Title='More on Indexes' ;
SELECT * FROM Tasks WHERE Title='B-TRANSACTION' ;

INSERT INTO Users(Name, Email) 
VALUES('IVAN','IVAN@gmail.com');
SELECT Name, Title FROM Users LEFT JOIN Tasks ON Users.Id=Tasks.UserId ;
