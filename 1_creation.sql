-- 1_creation.sql
-- Drop tables if they already exist to ensure a clean creation
CREATE DATABASE IF NOT EXISTS FanConnect_DB;
USE FanConnect_DB;

DROP TABLE IF EXISTS `Tag`;
DROP TABLE IF EXISTS `Like_`;
DROP TABLE IF EXISTS `Follow`;
DROP TABLE IF EXISTS `Stats_Match`;
DROP TABLE IF EXISTS `Hashtag`;
DROP TABLE IF EXISTS `Comment`;
DROP TABLE IF EXISTS `Post`;
DROP TABLE IF EXISTS `User_`;

-- 1. Table User_
CREATE TABLE `User_` (
    username VARCHAR(50) PRIMARY KEY,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(128) NOT NULL,
    bio VARCHAR(255),
    photo_url VARCHAR(200),
    registration_date DATE NOT NULL,
    is_pro_player BOOLEAN NOT NULL DEFAULT FALSE,
    full_name VARCHAR(80),
    phone VARCHAR(15),
    country VARCHAR(30),
    city VARCHAR(50),
    is_private BOOLEAN NOT NULL DEFAULT FALSE
);

-- 2. Table Post
CREATE TABLE `Post` (
    post_id_ SERIAL PRIMARY KEY,
    caption VARCHAR(500),
    media_url VARCHAR(200),
    publication_date DATE NOT NULL,
    device_type VARCHAR(20),
    username VARCHAR(50) NOT NULL,
    FOREIGN KEY (username) REFERENCES `User_`(username) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 3. Table Comment
CREATE TABLE `Comment` (
    comment_id SERIAL PRIMARY KEY,
    content VARCHAR(300) NOT NULL,
    date_com DATE NOT NULL,
    time_com TIME NOT NULL,
    post_id_ BIGINT UNSIGNED NOT NULL,
    username VARCHAR(50) NOT NULL,
    FOREIGN KEY (post_id_) REFERENCES `Post`(post_id_) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (username) REFERENCES `User_`(username) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 4. Table Hashtag
CREATE TABLE `Hashtag` (
    label VARCHAR(50) PRIMARY KEY
);

-- 5. Table Stats_Match
CREATE TABLE `Stats_Match` (
    username VARCHAR(50),
    match_id_ SERIAL,
    opponent VARCHAR(50) NOT NULL,
    goals INT DEFAULT 0,
    assists INT DEFAULT 0,
    km_traveled NUMERIC(5, 2),
    rating NUMERIC(3, 1),
    match_date DATE,
    PRIMARY KEY (username, match_id_),
    FOREIGN KEY (username) REFERENCES `User_`(username) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 6. Table Follow
CREATE TABLE `Follow` (
    username VARCHAR(50),
    username_1 VARCHAR(50),
    date_follow DATE NOT NULL,
    PRIMARY KEY (username, username_1),
    FOREIGN KEY (username) REFERENCES `User_`(username) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (username_1) REFERENCES `User_`(username) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 7. Table Like_
CREATE TABLE `Like_` (
    username VARCHAR(50),
    post_id_ BIGINT UNSIGNED,
    date_like DATE NOT NULL,
    PRIMARY KEY (username, post_id_),
    FOREIGN KEY (username) REFERENCES `User_`(username) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (post_id_) REFERENCES `Post`(post_id_) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 8. Table Tag
CREATE TABLE `Tag` (
    post_id_ BIGINT UNSIGNED,
    label VARCHAR(50),
    PRIMARY KEY (post_id_, label),
    FOREIGN KEY (post_id_) REFERENCES `Post`(post_id_) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (label) REFERENCES `Hashtag`(label) ON DELETE CASCADE ON UPDATE CASCADE
);
