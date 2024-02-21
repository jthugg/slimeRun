CREATE DATABASE IF NOT EXISTS slime;

USE slime;

CREATE TABLE `users` (
  `uNum` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uID` varchar(50) NOT NULL,
  `uPW` varchar(20) NOT NULL,
  `lastLogin` datetime DEFAULT NULL,
  `signUpDate` date NOT NULL,
  `highScore` int(10) unsigned DEFAULT NULL,
  `scoredDate` datetime DEFAULT NULL,
  `uType` char(1) NOT NULL COMMENT 'a/t/u',
  `logoutDate` datetime DEFAULT NULL,
  PRIMARY KEY (`uNum`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
