--CREATION DATABASE
CREATE DATABASE moviesProject;
-----------------------CREATION DES TABLES----------------------------
USE moviesProject;
-------------------------Table  subscription-----------------------------
CREATE TABLE subscription(
  SubscriptionID int AUTO_INCREMENT PRIMARY KEY
  , SubscriptionType ENUM("basics", "premium") NOT NULL
  , MonthlyFee decimal(10, 2) NOT NULL DEFAULT 0.00
);
-------------------------Table  movie-----------------------------

CREATE TABLE movie(
  MovieID int AUTO_INCREMENT PRIMARY KEY
  , Title VARCHAR(255) NOT NULL
  , Genre VARCHAR(100) NOT NULL DEFAULT 0.00
  , ReleaseYear INT NOT NULL
  , Duration INT NOT NULL
  , Rating VARCHAR (10)
);
-------------------------Table  users-----------------------------

CREATE TABLE users (
  UserID INT AUTO_INCREMENT PRIMARY KEY
  , FirstName VARCHAR (100) NOT NULL
  , LastName VARCHAR(100) NOT NULL
  , Email VARCHAR(100) NOT NULL UNIQUE
  , RegistrationDate DATE
);
-------------------------Table  review-----------------------------

CREATE TABLE review (
  ReviewID INT AUTO_INCREMENT PRIMARY KEY
  , ReviewText VARCHAR (100) NULL
  , ReviewDate DATE
);
-------------------------Table  watchHistory-----------------------------

CREATE TABLE watchHistory (
  WatchHistoryID INT AUTO_INCREMENT PRIMARY KEY
  , WatchDate DATE
  , CompletionPercentage INT NOT NULL
);
----------------------faire des update dans les tableaux + link des tableaux------------------------
ALTER TABLE users
ADD COLUMN subscriptionID INT;
ALTER TABLE users
ADD CONSTRAINT FK_subscription_ID FOREIGN KEY (subscriptionID) REFERENCES subscription(SubscriptionID);

ALTER TABLE review
ADD COLUMN UserID INT;
ALTER TABLE Review
ADD CONSTRAINT fk_Review_id FOREIGN KEY (UserID) REFERENCES users(UserID);

ALTER TABLE review
ADD COLUMN movieID INT;
ALTER TABLE review
ADD CONSTRAINT fk_movie_id FOREIGN KEY (movieID) REFERENCES movie(movieID);

ALTER TABLE watchhistory
ADD COLUMN movieID INT;
ALTER TABLE watchhistory
ADD CONSTRAINT fk_movieID FOREIGN KEY (movieID) REFERENCES movie(movieID);


ALTER TABLE watchhistory
ADD COLUMN UserID INT;
ALTER TABLE watchhistory
ADD CONSTRAINT fk_userID FOREIGN KEY (UserID) REFERENCES users(UserID);


---- insert des donnes dans les tableux---------------------
---------------------subscription--------------------
INSERT INTO
  subscription(SubscriptionID, MonthlyFee)
VALUES
  (1, 199.00)
  , (2, 299.00);


---------------------users--------------------
INSERT INTO
  users(
    FirstName
    , LastName
    , Email
    , RegistrationDate
    , SubscriptionID
  )
VALUES
  (
    'Alice'
    , 'Smith'
    , 'alice.smith@example.com'
    , '2023-01-15'
    , 1
  )
  , (
    'Bob'
    , 'Johnson'
    , 'bob.johnson@example.com'
    , '2023-02-20'
    , 1
  )
  , (
    'Charlie'
    , 'Brown'
    , 'charlie.brown@example.com'
    , '2023-03-05'
    , 2
  )
  , (
    'Diana'
    , 'Prince'
    , 'diana.prince@example.com'
    , '2023-04-10'
    , 2
  )
  , (
    'Edward'
    , 'Norton'
    , 'edward.norton@example.com'
    , '2023-05-25'
    , 1
  ) (
    'Ethan'
    , 'Williams'
    , 'ethan.williams@example.com'
    , '2023-09-01'
    , 5
  )
  , (
    'Fiona'
    , 'Davis'
    , 'fiona.davis@example.com'
    , '2023-11-12'
    , 6
  )
  , (
    'George'
    , 'Clark'
    , 'george.clark@example.com'
    , '2024-01-05'
    , 7
  )
  , (
    'Hannah'
    , 'Evans'
    , 'hannah.evans@example.com'
    , '2024-02-19'
    , 8
  )
  , (
    'Ian'
    , 'White'
    , 'ian.white@example.com'
    , '2024-03-28'
    , 9
  )
  , (
    'Julia'
    , 'Martin'
    , 'julia.martin@example.com'
    , '2024-05-06'
    , 10
  );


INSERT into
  watchhistory(
    `WatchDate`
    , `CompletionPercentage`
    , `movieID`
    , `UserID`
  )
VALUES
  ('2019-03-10', 65, 1, 2)
  , ('2019-07-25', 70, 2, 4)
  , ('2020-01-15', 80, 3, 1)
  , ('2020-06-30', 75, 1, 5)
  , ('2021-02-20', 85, 2, 3)
  , ('2021-09-10', 90, 4, 6)
  , ('2022-04-05', 95, 5, 7)
  , ('2022-08-18', 60, 5, 8)
  , ('2019-05-12', 65, 3, 7)
  , ('2019-10-25', 70, 14, 9)
  , ('2021-07-20', 85, 13, 10);


INSERT into
  review(`ReviewText`, `ReviewDate`, `UserID`, `movieID`)
VALUES
  ('Amazing documentary!', '2023-02-01', 1, 4)
  , ('Not bad, but could be better.', '2023-06-10', 2, 7)
  , ('Loved the storyline!', '2023-07-20', 3, 6)
  , ('An absolute masterpiece.', '2023-08-05', 4, 3);




------------------------add Movie ------------------------------
INSERT INTO
  movie (Title, Genre, ReleaseYear, Duration, Rating)
VALUES
  (
    " Data Science Adventures"
    , "Documentary"
    , 2020
    , 180
    , "PG-14"
  ) (
    "The Quantum Quest"
    , "Science Fiction"
    , 2019
    , 120
    , "PG-13"
  )
  , ("Ocean Mysteries", "Documentary", 2021, 90, "G")
  , ("Adventures in AI", "Thriller", 2022, 150, "PG-14")
  , ("Cosmic Wonders", "Documentary", 2020, 180, "PG-14")
  , ("Future Frontiers", "Action", 2018, 140, "R")
  , ("The Infinite Loop", "Drama", 2023, 110, "PG")
  , ("Chronicles of Laughter", "Comedy", 2023, 120, "PG")
  , (
    "Time Travelers: Comedy Edition"
    , "Comedy"
    , 2024
    , 130
    , "PG-14"
  )
  , ("Future Laughs Unlimited", "Comedy", 2025, 125, "PG")
  , (
    "The Eternal Jokesters"
    , "Comedy"
    , 2026
    , 110
    , "PG-13"
  )
  , (
    "Laughs Across Dimensions"
    , "Comedy"
    , 2027
    , 135
    , "PG-14"
  )
  , ("Hidden Realms", "Fantasy", 2022, 130, "PG-13")
  , ("Beyond the Stars", "Documentary", 2021, 95, "G")
  , ("Digital Dreams", "Animation", 2020, 105, "PG")
  , (
    "Legends of Tomorrow"
    , "Adventure"
    , 2019
    , 160
    , "PG-14"
  );
-------------------------------Rechercher des films : Lister tous les films du genre "Comedy" sortis après 2020-------------------------------
-- select title FROM movie WHERE ReleaseYear=2020;
------------------------------Mise à jour des abonnements : Passer tous les utilisateurs de "Basic" à "Premium"..-------------------------------

--  update users set subscriptionID=2 where subscriptionID=1;

-- --------------------------- _ 4 Afficher les abonnements : Joindre les utilisateurs à leurs types d'abonnements.---------------------------

-- select users.lastName,users.firstName,subscription.SubscriptionType
-- FROM users
-- INNER JOIN subscription
-- ON subscription.subscriptionID=users.subscriptionID;

------------------------------- _5 Filtrer les visionnages : Trouver tous les utilisateurs ayant terminé de regarder un film.------------------------
-- SELECT users.FirstName,users.LastName,watchhistory.CompletionPercentage
-- FROM users
-- INNER JOIN watchhistory
-- ON users.UserID=watchhistory.userID
-- AND watchhistory.CompletionPercentage=100;

-- ----------------------------  _6 Trier et limiter : Afficher les 5 films les plus longs, triés par durée.
-- SELECT title  FROM  movie
--  ORDER BY Duration
--  DESC LIMIT 5;

-------------------------------  _7 Agrégation : Calculer le pourcentage moyen de complétion pour chaque film.------------------------------------------

-- select title ,AVG(CompletionPercentage)
-- as total
-- from movie
-- INNER JOIN watchhistory
-- ON watchhistory.movieID=movie.MovieID
-- group by title;


----------------------- ------   _8 Group By : Grouper les utilisateurs par type d’abonnement et compter le nombre total d’utilisateurs par groupe.

-- select subscriptionType ,count(UserID)
-- as total
-- from subscription
-- INNER JOIN users
-- ON subscription.subscriptionID=users.subscriptionID
-- group by subscriptionType;


-------------------------------- Sous-requête (Bonus): Trouver les films ayant une note moyenne supérieure à 4.-------------------------------------------
-- SELECT title
-- FROM movie
--  WHERE movieID
--  IN (SELECT review.UserID FROM review WHERE review.Rating > 4);