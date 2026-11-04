# dotnet-pre-trainee-sql

An educational project focused on designing and working with a relational database using **SQL Server**.
The project demonstrates skills in creating a database schema, ensuring referential integrity, populating the database with test data, and writing complex analytical queries.

## Project Structure

The project is organized into the following files:
* `create-database.sql` — script for creating the database.
* `create-tables.sql` — script for creating tables, relationships, and indexes.
* `seed-data.sql` — script for populating the database with test data.
* `practice-queries.sql` — file containing all completed practical exercises.

## Database Schema

The database consists of two related tables:

**1. `Users`**
* `Id` — primary key (INT, IDENTITY).
* `Name` — user's name (NVARCHAR, NOT NULL).
* `Email` — email address (NVARCHAR, NOT NULL, UNIQUE).
* `CreatedAt` — registration date (DATETIME2, DEFAULT GETDATE()).

**2. `Tasks`**
* `Id` — primary key (INT, IDENTITY).
* `Title` — task title (NVARCHAR, NOT NULL).
* `Description` — task description (NVARCHAR, NULL).
* `IsCompleted` — completion status (BIT, NOT NULL, DEFAULT 0).
* `CreatedAt` — creation date (DATETIME2, DEFAULT GETDATE()).
* `UserId` — foreign key referencing `Users.Id`.

## Relationships

A **"one-to-many"** relationship is implemented between the tables:
* One user can have **many** tasks.
* Each task belongs to **exactly one** user.
* This is implemented via a foreign key (`Tasks.UserId` -> `Users.Id`). ## Instructions for Creating the Database

To create the database and its structure, follow these steps:
1. Open **SQL Server Management Studio (SSMS)** and connect to your server.
2. Open the `create-database.sql` file and click **Execute (F5)**. This will create an empty database named `TaskManagementDb`.
3. Open the `create-tables.sql` file and click **Execute (F5)**. This will create the `Users` and `Tasks` tables, and set up primary keys, foreign keys, and indexes.

## Instructions for Adding Test Data

1. Open the `seed-data.sql` file in SSMS.
2. Click **Execute (F5)**.
3. The script will automatically add 3 users (Anna, John, Michael) and 10 tasks, distributed among them.

## Brief Explanation of the Queries Practiced

* **Basic SELECT & Filtering:** Includes retrieving all data (`SELECT *`), selecting specific columns, and filtering rows using `WHERE`, `AND`, and the `LIKE` operator (for substring searches).
* **Sorting:** Uses the `ORDER BY` operator to sort tasks by date and users in alphabetical order.
* **CRUD Operations:**
* `INSERT` — adding new users and tasks.
* `UPDATE` — changing the status of a task and updating a user's email. 
* `DELETE` — removing a specific test task (with a preliminary check using `SELECT`).
* **JOINs:**
* `INNER JOIN` — used to display tasks only when associated with a user. 
* `LEFT JOIN` — used to display **all** users (including those who have no tasks). * **Aggregate Functions and Grouping:** Queries using `COUNT` and `GROUP BY` have been written to calculate the total number of tasks for each user.
* **Transactions:** A business operation has been modeled using `BEGIN TRANSACTION`, `COMMIT`, and `ROLLBACK` within a `TRY...CATCH` block to ensure data integrity.
* **Most Active User:** A combination of `TOP 1` and `ORDER BY COUNT(...) DESC` has been used to identify the user with the highest number of tasks.
* **Indexes:** A non-clustered index, `IX_Tasks_UserId`, has been created to optimize frequent queries that search for tasks by user; additionally, a composite index has been implemented to streamline filtering by status and sorting by date.
---
