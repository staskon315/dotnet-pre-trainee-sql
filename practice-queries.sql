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
