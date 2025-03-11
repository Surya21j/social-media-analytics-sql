CREATE DATABASE SocialMediaAnalytics;
USE SocialMediaAnalytics;
CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50)  NOT NULL UNIQUE,
    Email VARCHAR(100) NOT NULL  UNIQUE,
    JoinDate timestamp DEFAULT current_timestamp,
    Country VARCHAR(50)
);
CREATE TABLE Posts (
    PostID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    Content TEXT,
    PostDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    LikesCount INT DEFAULT 0,
    CommentsCount INT DEFAULT 0,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);
CREATE TABLE Likes (
    LikeID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    PostID INT,
    LikeDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (PostID) REFERENCES Posts(PostID) ON DELETE CASCADE
);
CREATE TABLE Comments (
    CommentID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT NOT NULL,
    PostID INT NOT NULL,
    CommentText TEXT,
    CommentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (PostID) REFERENCES Posts(PostID) ON DELETE CASCADE
);
CREATE TABLE Followers (
    FollowerID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT NOT NULL,  
    FollowedUserID INT NOT NULL,  
    FollowDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (FollowedUserID) REFERENCES Users(UserID) ON DELETE CASCADE
);
INSERT INTO Users (Username, Email, Country) VALUES 
('_sur_ya06', 'surya21@gmail.com', 'India'),
('_jan_san05', 'janani21@gmail.com', 'India');
INSERT INTO Posts (UserID, Content) VALUES 
(1, 'Excited to start my new job!'),
(2, 'Just visited the Eiffel Tower!');
INSERT INTO Likes (UserID, PostID) VALUES 
(1, 1), (2, 1), (1, 2), (2, 2);
select * from Users;
select * from Posts;
select * from Likes;
select * from Comments;
select * from Followers;







