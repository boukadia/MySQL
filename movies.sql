--CREATION DATABASE
CREATE DATABASE moviesProject;
-----------------------CREATION DES TABLES----------------------------

-------------------------Table  subscription-----------------------------
CREATE TABLE subscription(
SubscriptionID int AUTO_INCREMENT PRIMARY KEY,
SubscriptionType ENUM("basics","premium") NOT NULL ,
MonthlyFee decimal(10,2) NOT NULL DEFAULT 0.00
);
-------------------------Table  movie-----------------------------

CREATE TABLE movie(
MovieID int AUTO_INCREMENT PRIMARY KEY,
Title VARCHAR(255) NOT NULL ,
Genre VARCHAR(100) NOT NULL DEFAULT 0.00,
ReleaseYear INT NOT NULL ,
Duration INT NOT NULL ,
Rating VARCHAR (10)
);
-------------------------Table  users-----------------------------

CREATE TABLE users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR (100) NOT NULL ,
    LastName VARCHAR(100) NOT NULL ,
    Email VARCHAR(100) NOT NULL UNIQUE ,
    RegistrationDate DATE 
    );
-------------------------Table  review-----------------------------

    CREATE TABLE review (
    ReviewID INT AUTO_INCREMENT PRIMARY KEY,
    ReviewText VARCHAR (100) NULL,
     ReviewDate DATE 
    );
-------------------------Table  watchHistory-----------------------------

    CREATE TABLE watchHistory (
   WatchHistoryID INT AUTO_INCREMENT PRIMARY KEY,
   WatchDate DATE,
   CompletionPercentage INT NOT NULL  
    );
----------------------faire des update dans les tableaux / link des tableaux------------------------
ALTER TABLE users 
ADD COLUMN subscriptionID INT;
ALTER TABLE users 
ADD CONSTRAINT FK_subscription_ID
FOREIGN KEY (subscriptionID)
REFERENCES subscription(SubscriptionID);

ALTER TABLE review
ADD COLUMN UserID INT ; 
ALTER TABLE Review
ADD CONSTRAINT fk_Review_id
FOREIGN KEY (UserID)
REFERENCES users(UserID);

ALTER TABLE review
ADD COLUMN movieID INT;
ALTER TABLE review
ADD CONSTRAINT fk_movie_id
FOREIGN KEY (movieID)
REFERENCES movie(movieID);

ALTER TABLE watchhistory
ADD COLUMN movieID INT ; 
ALTER TABLE watchhistory
ADD CONSTRAINT fk_movieID
FOREIGN KEY (movieID)
REFERENCES movie(movieID);

