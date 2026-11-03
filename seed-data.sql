USE TaskManagementDb;

INSERT INTO Users(Name, Email) 
VALUES
	('Anna', 'anna@gmail.com'),
    ('John', 'john@gmail.com'),
    ('Michael', 'michael@gmail.com')
INSERT INTO Tasks(Title, Description, IsCompleted, UserId) 
VALUES
	('Learn SQL', 'Basics of SELECT syntax', 1, (SELECT Id FROM Users WHERE Name = 'Anna')),
    ('JOIN Practice', 'INNER, LEFT, RIGHT JOINs', 1, (SELECT Id FROM Users WHERE Name = 'Anna')),
    ('More on Indexes', 'Clustered vs Non-clustered indexes', 0, (SELECT Id FROM Users WHERE Name = 'Anna')),

    ('Build Task Manager', 'Set up CI/CD pipeline', 0, (SELECT Id FROM Users WHERE Name = 'John')),
    ('Learn Dapper', 'Study micro-ORM for .NET', 1, (SELECT Id FROM Users WHERE Name = 'John')),
    ('Transaction Review', 'Understand isolation levels', 0, (SELECT Id FROM Users WHERE Name = 'John')),
    ('Write Stored Procedure', 'For generating reports', 1, (SELECT Id FROM Users WHERE Name = 'John')),

    ('Learn Entity Framework Core', 'Understand migrations', 0, (SELECT Id FROM Users WHERE Name = 'Michael')),
    ('Query Optimization', 'Review Execution Plans', 0, (SELECT Id FROM Users WHERE Name = 'Michael')),
    ('Configure Database Backup', 'Perform backup and restore', 1, (SELECT Id FROM Users WHERE Name = 'Michael'));