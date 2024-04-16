CREATE DATABASE MOVIE
USE MOVIE
CREATE TABLE Actors
(
Id INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR (230)
)
--GENRE
CREATE TABLE Genres
(
Id INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR (230)
)
--DIRECTORS
CREATE TABLE Directors
(
Id INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR (230)
)
--MOVIES
CREATE TABLE Movies
(
Id INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR (230),
Imdb decimal (18,2),
Times  INT ,
DirectorId INT FOREIGN KEY REFERENCES Directors (Id)
)
--GenreMovies
CREATE TABLE GenreMovies
(
Id INT PRIMARY KEY IDENTITY,
MovieId INT FOREIGN KEY REFERENCES Movies (Id),
GenresId INT FOREIGN KEY REFERENCES Genres (Id)
)
--Actors Movie
CREATE TABLE ActorsMovie
(
Id INT PRIMARY KEY IDENTITY,
MovieId INT FOREIGN KEY REFERENCES Movies (Id),
ActorId INT FOREIGN KEY REFERENCES Actors (Id),
)
INSERT INTO Directors(Name)VALUES
('Howard Hawks'),
('Martin Scorsese'),
('Akira Kurosawa'),
('Buster Keaton'),
('Ingmar Bergman');
INSERT INTO Actors (Name) VALUES
('Robert De Niro'),
('Denzel Washington'),
('Katharine Hepburn'),
('Sidney Poitier'),
('Clark Gable')
INSERT INTO Genres (Name) VALUES
('Drama'),					
('Crime'),					
('Action'),					
('History'),
('Romantic')
INSERT INTO Movies ([Name], Imdb,Times, DirectorId) VALUES
('Kill Bill', 5.6, 120, 1),
('Deadpool', 8, 5, 2),
('Spiderman', 7.5, 130, 3),
('Like',6.7,100,4),
('Friends', 8.9, 130, 5);
INSERT INTO ActorsMovie (MovieId,ActorId) VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5)
--GENRE ID YERINE SEHFEN ACTOR ID YAZMSAM  SILEMEDM
INSERT INTO GenreMovies (MovieId,ActorId) VALUES
(1,2),
(2,1),
(3,5),
(4,3),
(5,4)
--Tapsrg
SELECT m.Name AS [Movie Name], d.Name AS [Director Name], g.Name  [Genres Name]
FROM Movies m
JOIN Directors d ON m.DirectorId = d.Id
JOIN GenreMovies gm ON m.Id = gm.MovieId
JOIN Genres g ON g.Id = ActorId
JOIN ActorsMovie am on am.ID = am.MovieId
JOIN Actors a ON a.Id = a.Id
WHERE m.Imdb > 6;
--a herf
SELECT m.[Name] AS [Movie Name], m.Imdb, g.[Name] AS [Genres Name]
FROM Movies m
JOIN GenreMovies gm ON m.Id = gm.MovieId
JOIN Genres g ON gm.ActorId = g.Id
WHERE m.[Name] LIKE '%a%';
--10 uznlg
SELECT m.Name AS [Movie Name], m.Imdb AS Imdb, m.Times AS 'Times', g.Name AS 'Genres'
FROM   Movies m
JOIN GenreMovies gm ON m.Id = gm.MovieId
JOIN Genres g ON gm.ActorId = g.Id
WHERE LEN(m.Name) > 10 AND   m.Name LIKE '%t';
--4
SELECT m.Name AS [Movie Name],  m.Imdb AS [IMDb],  g.Name AS [Genre],  d.Name AS [Director],  a.Name AS [Actor]
FROM  Movies m
JOIN GenreMovies gm ON m.Id = gm.MovieId
JOIN Genres g ON gm.ActorId = g.Id
JOIN Directors d ON m.DirectorId = d.Id
JOIN ActorsMovie am ON m.Id = am.MovieId
JOIN Actors a ON am.ActorId = a.Id
WHERE  m.Imdb > (SELECT AVG(Imdb) FROM Movies) 
ORDER BY m.Imdb DESC; 