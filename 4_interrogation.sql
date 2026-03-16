-- 4_interrogation.sql
-- =========================================================================
-- USAGE SCENARIOS (BONUS)
-- The queries below are designed to fulfill 3 distinct use cases for Paris Saint-Germain:
-- 1. Community Manager (CM): Analyzes social engagement, tracks trends and active fans.
-- 2. Data Analyst / Scouter: Evaluates pro players' physical match statistics.
-- 3. PR Manager: Bridges digital footprint with physical performance and runs re-engagement campaigns.
-- =========================================================================

-- ==========================================
-- Part A: Projections and selections
-- (Sorting, Unique data, Masks LIKE, IN, BETWEEN)
-- ==========================================

-- A1. (CM Scenario) List all unique countries of our users, sorted alphabetically, to plan international fan events.
SELECT DISTINCT country 
FROM `User_` 
ORDER BY country ASC;

-- A2. (PR Scenario) Find all PSG pro players who registered in the first half of 2023 (BETWEEN) to study early adopters.
SELECT username, full_name, registration_date 
FROM `User_` 
WHERE is_pro_player = TRUE 
  AND registration_date BETWEEN '2023-01-01' AND '2023-06-30'
ORDER BY registration_date;

-- A3. (PR Scenario) Find users whose email is from a specific provider like Gmail or Hotmail using a mask (LIKE) for mailing campaigns.
SELECT username, email 
FROM `User_` 
WHERE email LIKE '%@gmail.com' OR email LIKE '%@hotmail.com';

-- A4. (CM Scenario) List posts published on specific popular match dates using the IN operator.
SELECT post_id_, caption, publication_date 
FROM `Post` 
WHERE publication_date IN ('2023-10-01', '2023-11-01', '2024-02-15');

-- A5. (CM Scenario) List posts with a specific device type to optimize app layout.
SELECT post_id_, username, device_type
FROM `Post` 
WHERE device_type IN ('iOS', 'Web')
ORDER BY username DESC;

-- ==========================================
-- Part B: Aggregation functions
-- (GROUP BY, HAVING)
-- ==========================================

-- B1. (CM Scenario) Count the number of posts for each user to find the most active posters to reward them.
SELECT username, COUNT(post_id_) AS total_posts 
FROM `Post` 
GROUP BY username 
ORDER BY total_posts DESC;

-- B2. (Analyst Scenario) Calculate the average match rating for players who have played at least 2 matches (HAVING).
SELECT username, ROUND(AVG(rating), 2) AS avg_rating, COUNT(match_id_) AS matches_played 
FROM `Stats_Match` 
GROUP BY username 
HAVING COUNT(match_id_) >= 2 
ORDER BY avg_rating DESC;

-- B3. (CM Scenario) Count the total comments made per user, only for users with more than 1 comment, to measure deep engagement.
SELECT username, COUNT(comment_id) AS total_comments 
FROM `Comment` 
GROUP BY username 
HAVING COUNT(comment_id) > 1;

-- B4. (Analyst Scenario) Sum the total goals and assists per player to get their global offensive contribution.
SELECT username, SUM(goals) AS total_goals, SUM(assists) AS total_assists, SUM(goals + assists) AS global_contribution 
FROM `Stats_Match` 
GROUP BY username 
ORDER BY global_contribution DESC;

-- B5. (CM Scenario) Find the hashtags that are used in more than 2 posts to track community trends.
SELECT label, COUNT(post_id_) AS times_used 
FROM `Tag` 
GROUP BY label 
HAVING COUNT(post_id_) >= 2 
ORDER BY times_used DESC;

-- ==========================================
-- Part C: Joins
-- (Internal, external, simple, multiple)
-- ==========================================

-- C1. Internal Join: (CM Scenario) List comments with the content, date, and the email of the user who posted it, to moderate spam.
SELECT c.content, c.date_com, u.email 
FROM `Comment` c 
JOIN `User_` u ON c.username = u.username;

-- C2. Simple Join: (CM Scenario) Get the caption of posts and the corresponding hashtag labels.
SELECT p.caption, ph.label 
FROM `Post` p 
JOIN `Tag` ph ON p.post_id_ = ph.post_id_;

-- C3. Multiple Join: (PR Scenario) Find all likes (date) on a specific star player's posts (e.g., dembele) and the fan who liked it.
SELECT l.date_like, liker.username AS liked_by, p.caption AS post_liked
FROM `Like_` l 
JOIN `Post` p ON l.post_id_ = p.post_id_ 
JOIN `User_` liker ON l.username = liker.username
WHERE p.username = 'dembele';

-- C4. Left External Join: (PR Scenario) Show all users and the number of followings they have, even if they follow no one, to target inactive fans.
SELECT u.username, COUNT(f.username_1) AS total_following 
FROM `User_` u 
LEFT JOIN `Follow` f ON u.username = f.username 
GROUP BY u.username;

-- C5. Multiple Join with conditions: (Analyst Scenario) Show complete details of the Match stats, the full name of the player and the device they use.
SELECT ms.opponent, ms.rating, u.full_name, p.device_type
FROM `Stats_Match` ms
JOIN `User_` u ON ms.username = u.username
JOIN `Post` p ON u.username = p.username
ORDER BY ms.rating DESC;

-- ==========================================
-- Part D: Nested Queries
-- (IN, NOT IN, EXISTS, ANY, ALL, etc.)
-- ==========================================

-- D1. Nested with IN: (PR Scenario) Find the full names of users who have liked at least one post.
SELECT full_name 
FROM `User_` 
WHERE username IN (SELECT username FROM `Like_`);

-- D2. Nested with NOT EXISTS: (PR Scenario) Find 'Ghost' users who have NEVER posted anything to send them re-engagement emails.
SELECT username, full_name 
FROM `User_` u 
WHERE NOT EXISTS (
    SELECT 1 
    FROM `Post` p 
    WHERE p.username = u.username
);

-- D3. Nested with ALL: (Analyst Scenario) Find the Match Stats that have a match rating strictly greater than ALL match ratings against a specific rival ('Lyon').
SELECT username, opponent, rating 
FROM `Stats_Match` 
WHERE rating > ALL (
    SELECT rating 
    FROM `Stats_Match` 
    WHERE opponent = 'Lyon'
);

-- D4. Nested with ANY/SOME: (CM Scenario) Find normal users who have followed ANY pro player.
SELECT username, full_name 
FROM `User_` 
WHERE username = ANY (
    SELECT f.username 
    FROM `Follow` f 
    JOIN `User_` u ON f.username_1 = u.username 
    WHERE u.is_pro_player = TRUE
);

-- D5. Nested query in the SELECT clause: (CM Scenario) Display the username and the percentage of their posts compared to the total number of posts on the platform.
SELECT 
    username, 
    COUNT(post_id_) AS user_posts,
    ROUND(COUNT(post_id_) * 100.0 / (SELECT COUNT(*) FROM `Post`), 2) AS percentage_of_all_posts
FROM `Post`
GROUP BY username;
