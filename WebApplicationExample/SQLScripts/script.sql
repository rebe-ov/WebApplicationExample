/************************DATABASE CREATION****************************/

-- Just change the Filenames paths to you paths in the local machine

CREATE DATABASE [CodeChallenge] ON  PRIMARY 
( NAME = N'Data', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\CodeChallenge.mdf' , SIZE = 2048KB , MAXSIZE = 1GB, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CodeChallenge_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\CodeChallenge_log.ldf' , SIZE = 1024KB , MAXSIZE = 2GB , FILEGROWTH = 10%)
GO

/***************************TABLES CREATION****************************/
USE CodeChallenge
CREATE TABLE [dbo].[User]
(Id INT NOT NULL IDENTITY,
 FirstName  VARCHAR(50) NOT NULL,
 LastName VARCHAR(50) NOT NULL, 
 PRIMARY KEY (Id) 
);
 CREATE TABLE [dbo].[Project]
 (Id INT NOT NULL,
 StartDate DATETIME NOT NULL,
 EndDate DATETIME NOT NULL,
 Credits INT NOT NULL,	
 PRIMARY KEY (Id)
 )

 CREATE TABLE [dbo].[UserProject]
 (
	UserProjectId INT NOT NULL IDENTITY,
	UserId INT NOT NULL,
	ProjectId INT NOT NULL,
	IsActive BIT NOT NULL,
	AssignedDate DATETIME NOT NULL,
	PRIMARY KEY (UserProjectId),
	 CONSTRAINT FK_UserId FOREIGN KEY (UserId)
    REFERENCES CodeChallenge.dbo.Project(Id),
	CONSTRAINT FK_ProjectId FOREIGN KEY (ProjectId)
    REFERENCES CodeChallenge.dbo.Project(Id),

 );

/**************************DATA INSERTION*******************************/
BEGIN TRAN
BEGIN TRY

USE CodeChallenge

INSERT INTO [dbo].[User] (FirstName, LastName)
VALUES ('Fabiana', 'Rojas'),
	   ('Jose', 'Vasquez' ),
	   ('Anabelle', 'Vargas');

INSERT INTO [dbo].[Project] (Id, StartDate,EndDate, Credits)
VALUES (1, '01-20-2018', '01-20-2019', 4 ),
		(2, '02-15-2018', '02-20-2019', 6 ),
		(3, '03-12-2018', '03-20-2019', 2 ),
		(4, '04-10-2018', '04-20-2019', 6 ),
		(5, '05-05-2018', '05-20-2019', 4 ),
		(6, '06-03-2018', '06-20-2019', 2 ),
		(7, '07-01-2018', '07-20-2019', 8 ),
		(8, '08-08-2018', '08-20-2019', 7 ),
		(9, '09-09-2018', '09-20-2019', 9 ),
		(10, '10-10-2018', '10-20-2019', 1 );


INSERT INTO [dbo].[UserProject] (UserId, ProjectId, IsActive, AssignedDate)
VALUES ((SELECT Top 1(Id) FROM [dbo].[User] WHERE FirstName = 'Fabiana' AND LastName = 'Rojas'), 1,1, GETDATE()),
		((SELECT Top 1(Id) FROM [dbo].[User] WHERE FirstName = 'Fabiana' AND LastName = 'Rojas'), 3,1, '02-12-2018'),
		((SELECT Top 1(Id) FROM  [dbo].[User] WHERE FirstName = 'Fabiana' AND LastName = 'Rojas'), 5,1, GETDATE()),
		((SELECT Top 1(Id) FROM  [dbo].[User] WHERE FirstName = 'Fabiana' AND LastName = 'Rojas'), 7,1, '06-01-2018'),
		((SELECT Top 1(Id) FROM  [dbo].[User] WHERE FirstName = 'Fabiana' AND LastName = 'Rojas'), 9,1, GETDATE()),
		((SELECT Top 1(Id) FROM  [dbo].[User] WHERE FirstName = 'Jose' AND LastName = 'Vasquez'), 2,1, '01-15-2018'),
		((SELECT Top 1(Id) FROM  [dbo].[User] WHERE FirstName = 'Jose' AND LastName = 'Vasquez'), 4,1, GETDATE()),
		((SELECT Top 1(Id) FROM  [dbo].[User] WHERE FirstName = 'Jose' AND LastName = 'Vasquez'), 6,1,'05-03-2018'),
		((SELECT Top 1(Id) FROM  [dbo].[User] WHERE FirstName = 'Jose' AND LastName = 'Vasquez'), 8,1, GETDATE()),
		((SELECT Top 1(Id) FROM  [dbo].[User] WHERE FirstName = 'Jose' AND LastName = 'Vasquez'), 10,1, '09-10-2018'),
		((SELECT Top 1(Id) FROM  [dbo].[User] WHERE FirstName = 'Anabelle' AND LastName = 'Vargas'), 4,1, GETDATE()),
		((SELECT Top 1(Id) FROM  [dbo].[User] WHERE FirstName = 'Anabelle' AND LastName = 'Vargas'), 5,1, '04-05-2018'),
		((SELECT Top 1(Id) FROM  [dbo].[User] WHERE FirstName = 'Anabelle' AND LastName = 'Vargas'), 6,1, GETDATE()),
		((SELECT Top 1(Id) FROM  [dbo].[User] WHERE FirstName = 'Anabelle' AND LastName = 'Vargas'), 7,1, '06-01-2018'),
		((SELECT Top 1(Id) FROM  [dbo].[User] WHERE FirstName = 'Anabelle' AND LastName = 'Vargas'), 8,1, GETDATE());


  COMMIT TRAN
END TRY
BEGIN CATCH

 IF @@TRANCOUNT > 0
      ROLLBACK
END CATCH


/***********************************QUERIES***********************************************/


Select * from [dbo].[User]
Select * from [dbo].[Project]
Select * from [dbo].[UserProject]