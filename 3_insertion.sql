-- 3_insertion.sql
-- Mock Data Insertion based on the AI Prompt

-- 1. Insert User_
INSERT INTO "User_" (username, email, password, bio, photo_url, registration_date, is_pro_player, full_name, phone, country, city, is_private) VALUES
('dembele', 'ousmane@psg.fr', 'ousmane_d10', 'Dribbler', 'http://url/dembele.jpg', '2023-01-10', TRUE, 'Ousmane Dembele', '+33600000001', 'France', 'Paris', FALSE),
('marquinhos', 'marqui@psg.fr', 'marqui1234', 'Captain', 'http://url/marq.jpg', '2023-01-12', TRUE, 'Marquinhos', '+33600000002', 'Brazil', 'Paris', FALSE),
('hakimi', 'a.hakimi@psg.fr', 'pass_ah02', 'Speed is key', 'http://url/ah.jpg', '2023-02-15', TRUE, 'Achraf Hakimi', '+33600000003', 'Morocco', 'Paris', FALSE),
('neves', 'joao.neves@psg.fr', 'joaon_pass', 'Midfield Maestro', 'http://url/jneves.jpg', '2024-07-01', TRUE, 'Joao Neves', '+33600000004', 'Portugal', 'Paris', FALSE),
('barcola', 'b.barcola@psg.fr', 'bradley29', 'Fast runner', 'http://url/barcola.jpg', '2023-05-20', TRUE, 'Bradley Barcola', '+33600000005', 'France', 'Paris', FALSE),
('fan123', 'fan123@gmail.com', 'psgfanforlife', 'Die hard fan', NULL, '2023-08-10', FALSE, 'Jean Dupont', NULL, 'France', 'Lyon', FALSE),
('ultra_psg', 'ultrap@yahoo.com', 'ultrastand23', 'CUP Member', NULL, '2023-08-15', FALSE, 'Lucas Bernard', NULL, 'France', 'Paris', TRUE),
('football_lover', 'fb_lover@hotmail.com', 'ilovefoot11', 'Football is life', NULL, '2023-09-01', FALSE, 'Sophie Martin', NULL, 'France', 'Marseille', FALSE),
('psg_news', 'news@psgfan.net', 'news12345', 'Best news source', NULL, '2023-09-05', FALSE, 'Admin News', NULL, 'France', 'Paris', FALSE),
('sarah99', 's99@gmail.com', 'sarahpass99', 'Just a girl from Paris', NULL, '2023-10-10', FALSE, 'Sarah Kone', NULL, 'France', 'Paris', TRUE),
('barcola_fan', 'b_fan@gmail.com', 'missney2023', 'Best winger', NULL, '2023-11-20', FALSE, 'Pedro Silva', NULL, 'Portugal', 'Lisbon', FALSE),
('luis_enrique_stan', 'lucho@gmail.com', 'luchogoat', 'Tactics', NULL, '2024-01-05', FALSE, 'Marc Dubois', NULL, 'France', 'Toulouse', FALSE),
('paris_magic', 'magic@live.fr', 'parismagic00', 'Photography of matches', NULL, '2024-01-15', FALSE, 'Elsa Leroy', NULL, 'France', 'Paris', FALSE),
('stadium_tour', 'tour@psg.fr', 'tourguide00', 'Parc des Princes lover', NULL, '2024-02-10', FALSE, 'Guide Paul', NULL, 'France', 'Paris', FALSE),
('casual_watcher', 'casual@mail.com', 'watchingdbz', 'I like goals', NULL, '2024-03-01', FALSE, 'Leo', NULL, 'France', 'Bordeaux', FALSE);

-- 2. Insert Follow Relationships
INSERT INTO "Follow" (username, username_1, date_follow) VALUES
('fan123', 'dembele', '2023-08-11'),
('fan123', 'marquinhos', '2023-08-11'),
('ultra_psg', 'dembele', '2023-08-16'),
('ultra_psg', 'barcola', '2023-08-16'),
('football_lover', 'hakimi', '2023-09-02'),
('sarah99', 'marquinhos', '2023-10-11'),
('barcola_fan', 'barcola', '2023-11-21'),
('luis_enrique_stan', 'dembele', '2024-01-06'),
('paris_magic', 'dembele', '2024-01-16'),
('stadium_tour', 'dembele', '2024-02-11'),
('casual_watcher', 'neves', '2024-03-02'),
('dembele', 'barcola', '2023-05-21'),
('barcola', 'dembele', '2023-05-22'),
('marquinhos', 'dembele', '2023-01-15'),
('hakimi', 'dembele', '2023-02-16');

-- 3. Insert Posts
INSERT INTO "Post" (caption, media_url, publication_date, device_type, username) VALUES
('Great win tonight! Merci Paris', 'http://url/post1.jpg', '2023-10-01', 'iOS', 'dembele'),
('Focused on the next match', 'http://url/post2.jpg', '2023-10-05', 'iOS', 'marquinhos'),
('Training hard!', 'http://url/post3.jpg', '2023-10-10', 'Android', 'hakimi'),
('Clean sheet! Bravo les gars', 'http://url/post4.jpg', '2023-10-15', 'iOS', 'neves'),
('Proud of my first goal', 'http://url/post5.jpg', '2023-11-01', 'Android', 'barcola'),
('At the Parc des Princes, amazing atmosphere', 'http://url/post6.jpg', '2023-11-05', 'Web', 'fan123'),
('Ici cest Paris!', 'http://url/post7.jpg', '2023-11-10', 'iOS', 'ultra_psg'),
('Who is the MOTM?', 'http://url/post8.jpg', '2023-11-12', 'Web', 'psg_news'),
('Beautiful view of the stadium', 'http://url/post9.jpg', '2024-01-20', 'iOS', 'paris_magic'),
('Match day! Let go', 'http://url/post10.jpg', '2024-02-15', 'iOS', 'sarah99');

-- 4. Insert Like_
INSERT INTO "Like_" (username, post_id_, date_like) VALUES
('fan123', 1, '2023-10-02'),
('ultra_psg', 1, '2023-10-02'),
('sarah99', 1, '2023-10-03'),
('football_lover', 2, '2023-10-06'),
('barcola_fan', 2, '2023-10-06'),
('luis_enrique_stan', 3, '2023-10-11'),
('casual_watcher', 4, '2023-10-16'),
('dembele', 5, '2023-11-02'),
('marquinhos', 5, '2023-11-02'),
('hakimi', 5, '2023-11-02'),
('neves', 5, '2023-11-03'),
('paris_magic', 6, '2023-11-06'),
('ultra_psg', 8, '2023-11-13'),
('fan123', 8, '2023-11-13'),
('dembele', 9, '2024-01-21');

-- 5. Insert Comments
INSERT INTO "Comment" (content, date_com, time_com, username, post_id_) VALUES
('What a goal Ousmane!', '2023-10-02', '10:00:00', 'fan123', 1),
('Always the best!', '2023-10-02', '11:30:00', 'ultra_psg', 1),
('Vamos El Capitan', '2023-10-06', '09:15:00', 'barcola_fan', 2),
('Hakimi speed!', '2023-10-11', '14:20:00', 'football_lover', 3),
('Great passes Joao', '2023-10-16', '18:45:00', 'casual_watcher', 4),
('Bravo Bradley', '2023-11-02', '08:00:00', 'dembele', 5),
('Proud of you bro', '2023-11-02', '08:15:00', 'marquinhos', 5),
('Future star', '2023-11-03', '12:00:00', 'luis_enrique_stan', 5),
('Nice shot from the virage', '2023-11-06', '20:10:00', 'paris_magic', 6),
('Ultras always there', '2023-11-11', '22:30:00', 'sarah99', 7),
('I voted for Barcola', '2023-11-13', '09:00:00', 'fan123', 8),
('Dembele for sure', '2023-11-13', '10:05:00', 'casual_watcher', 8),
('Incredible picture', '2024-01-21', '14:40:00', 'stadium_tour', 9),
('Cant wait for the match', '2024-02-15', '09:00:00', 'dembele', 10),
('Allez Paris!', '2024-02-15', '09:10:00', 'ultra_psg', 10);

-- 6. Insert Hashtags
INSERT INTO "Hashtag" (label) VALUES
('Paris'),
('IcicestParis'),
('Champion'),
('Football'),
('PSG'),
('Ligue1'),
('UCL'),
('MatchDay'),
('ParcDesPrinces'),
('Titi');

-- 7. Insert Tag
INSERT INTO "Tag" (post_id_, label) VALUES
(1, 'PSG'),
(1, 'IcicestParis'),
(2, 'Champion'),
(2, 'Paris'),
(3, 'Football'),
(3, 'PSG'),
(4, 'PSG'),
(5, 'Titi'),
(5, 'IcicestParis'),
(6, 'ParcDesPrinces'),
(7, 'IcicestParis'),
(8, 'Ligue1'),
(8, 'PSG'),
(9, 'ParcDesPrinces'),
(10, 'MatchDay');

-- 8. Insert Stats_Match (For Pro Players only)
INSERT INTO "Stats_Match" (username, opponent, goals, assists, km_traveled, rating, match_date) VALUES
('dembele', 'Marseille', 2, 0, 9.5, 9.0, '2023-10-01'),
('dembele', 'Lyon', 1, 1, 10.1, 8.5, '2023-11-05'),
('marquinhos', 'Marseille', 0, 0, 11.2, 8.0, '2023-10-01'),
('marquinhos', 'Lyon', 1, 0, 10.8, 8.2, '2023-11-05'),
('hakimi', 'Marseille', 1, 1, 12.0, 8.8, '2023-10-01'),
('hakimi', 'Lyon', 0, 2, 11.5, 8.5, '2023-11-05'),
('neves', 'Marseille', 0, 1, 12.0, 8.5, '2023-10-01'),
('neves', 'Lyon', 0, 2, 11.8, 8.0, '2023-11-05'),
('barcola', 'Marseille', 1, 1, 11.0, 8.5, '2023-10-01'),
('barcola', 'Lyon', 1, 0, 10.5, 9.0, '2023-11-05');
