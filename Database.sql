/* THIS QUERY IS USED TO MAKE A NEW NETFLIX STATISTIX DATABASE. 
IF THERE IS ALREADY AN DATABASE, IT WILL BE REPLACED WITH A NEW 
ONE*/

/*IF A COMMENT SAYS TO EXECUTE BEFORE CONTINUE, YOU REALLY NEED 
TO EXECUTE OTHERWISE THERE ARE PROBLEMS WITH THE DIFFERENT KEYS
INSIDE THE DATABASE*/

DROP DATABASE IF EXISTS [Netflix Statistix Database];
CREATE DATABASE [Netflix Statistix Database];

/*EXECUTE BEFORE CONTINUE*/

USE [Netflix Statistix Database]

CREATE TABLE Account (
Email NVARCHAR(50) NOT NULL PRIMARY KEY,
[Name] NVARCHAR(25) NOT NULL,
[Address] NVARCHAR(50) NOT NULL,
Postalcode NCHAR(6) NOT NULL,
Password NVARCHAR(32) NOT NULL,
Admin bit DEFAULT 0)

/*EXECUTE BEFORE CONTINUE*/

CREATE TABLE Profile (
ProfileID int NOT NULL PRIMARY KEY,
Email NVARCHAR(50) FOREIGN KEY REFERENCES Account(Email)
 ON UPDATE CASCADE
 ON DELETE CASCADE,
Name NVARCHAR(25),
BirthDate DATE,
)


/*EXECUTE BEFORE CONTINUE*/

CREATE TABLE NetflixContent (
ContentID INT NOT NULL PRIMARY KEY,
Title NVARCHAR(50),
DurationInMinutes INT,
[Type] NVARCHAR(30),
TitleOfSerie NVARCHAR(50) NULL,
NumberOfSeason INT NULL,
NumberOfEpisode INT NULL,
Genre NVARCHAR(20),
AgeIndication INT,
Related NVARCHAR(50) NOT NULL)

/*EXECUTE BEFORE CONTINUE*/

CREATE TABLE RecentlyWatched(
Email NVARCHAR(50) NOT NULL,
[Name] NVARCHAR(25) NOT NULL,
ContentID INT NOT NULL,
TypeOfContent NVARCHAR(30) NOT NULL,
WatchedPercentage INT NOT NULL,
PRIMARY KEY (Email, [Name], ContentID),
FOREIGN KEY ([Name])
REFERENCES [Profile]([Name])
ON UPDATE CASCADE
ON DELETE CASCADE,
FOREIGN KEY(ContentID)
REFERENCES NetflixContent(ContentID)
ON UPDATE CASCADE
ON DELETE CASCADE);