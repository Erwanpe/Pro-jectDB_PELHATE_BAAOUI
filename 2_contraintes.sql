-- 2_contraintes.sql
-- Validation constraints for the FanConnect Database

-- 1. Email format validation
ALTER TABLE `User_`
ADD CONSTRAINT chk_email_format CHECK (email LIKE '%_@__%.__%');

-- 2. Password length constraint
ALTER TABLE `User_`
ADD CONSTRAINT chk_password_length CHECK (LENGTH(password) >= 8);

-- 3. Match Statistics logic
ALTER TABLE `Stats_Match`
ADD CONSTRAINT chk_goals_positive CHECK (goals >= 0),
ADD CONSTRAINT chk_assists_positive CHECK (assists >= 0),
ADD CONSTRAINT chk_km_positive CHECK (km_traveled >= 0),
ADD CONSTRAINT chk_match_rating_range CHECK (rating >= 0 AND rating <= 10.0);

-- 4. Hashtag format (starts with '#')
ALTER TABLE `Hashtag`
ADD CONSTRAINT chk_no_spaces_in_hashtag CHECK (label NOT LIKE '% %');

-- 5. Comment Content Validation
ALTER TABLE `Comment`
ADD CONSTRAINT chk_comment_not_empty CHECK (LENGTH(TRIM(content)) > 0);

-- 6. Device Type Validation
ALTER TABLE `Post`
ADD CONSTRAINT chk_device_type CHECK (device_type IN ('iOS', 'Android', 'Web', 'Other', NULL));
