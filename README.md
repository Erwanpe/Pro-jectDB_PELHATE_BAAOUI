## I. Step 1: Requirements Analysis 
### I.A. 
RICARDO Prompt Engineering 
To obtain the necessary information, the following prompt framework was used:

R (Role): You work for the Paris Saint-Germain administration.

C (Context): We are designing "FanConnect," a social platform for supporters and pro players.

A (Additional Constraints): Provide business rules and a dictionary of exactly 30 data items.

R (References): Inspired by Instagram (social) and Transfermarkt (stats).

D (Desired Output): A bulleted list of rules and a raw data table.
### I.B. 
Business Rules 

•	Users: Each user has a unique profile; a user can follow other users (recursive relationship).

•	Posts: Users publish content (photos/videos); a post belongs to only one author.

•	Engagement: Users can like posts (recording the timestamp) or write comments.

•	Player Performance: For pro players, we track Match Stats (goals, assists, rating) linked directly to their profile.

•	Organization: Posts are tagged with Hashtags for indexing and search.
### I.C. 
Data Dictionary (30 Items) 
Data Item	Type	Size	Data Item	Type	Size
username	Text	30	publication_date	Date	10
email	Text	100	device_type	Text	20
password	Text	128	comment_id	Num.	10
bio	Text	255	content	Text	300
photo_url	Text	200	date_com	Date	10
registration_date	Date	10	time_com	Time	8
is_pro_player	Bool.	1	date_follow	Date	10
full_name	Text	80	date_like	Date	10
phone	Text	15	hashtag_label	Text	50
country	Text	30	match_id	Num.	10
city	Text	50	opponent	Text	50
is_private	Bool.	1	goals	Num.	2
post_id	Num.	10	assists	Num.	2
caption	Text	500	km_traveled	Num.	5
media_url	Text	200	match_rating	Num.	3
________________________________________
## II. 
Step 2: Conceptual Data Model (MCD) 
### II.A. 
Advanced Modeling Justification 
The MCD complies with 3NF and includes two advanced elements:
1.	Recursive Relationship: The Follow association links the User entity to itself (0,n to 0,n).
2.	Weak Entity: The Stats_Match entity is identified relatively to the User entity (1,1(R)), as match statistics cannot exist without a specific player.
### II.B. 
Graphical Export 

## III. Step 3: Logical Data Model (LDM)
Based on the Conceptual Data Model, here is the relational schema (LDM) representing our physical database:

User_ = (username VARCHAR(50), email VARCHAR(50), password VARCHAR(50), bio VARCHAR(50), photo_url VARCHAR(50), registration_date VARCHAR(50), is_pro_player VARCHAR(50), full_name VARCHAR(50), phone VARCHAR(50), country VARCHAR(50), city VARCHAR(50), is_private VARCHAR(50));
Post = (post_id_ VARCHAR(50), caption VARCHAR(50), media_url VARCHAR(50), publication_date VARCHAR(50), device_type VARCHAR(50), #username);
Comment = (comment_id VARCHAR(50), content VARCHAR(50), date_com VARCHAR(50), time_com VARCHAR(50), #post_id_, #username);
Hashtag = (label VARCHAR(50));
Stats_Match = (#username, match_id_ VARCHAR(50), opponent VARCHAR(50), goals VARCHAR(50), assists VARCHAR(50), km_traveled VARCHAR(50), rating VARCHAR(50), match_date VARCHAR(50));
Follow = (#username, #username_1, date_follow VARCHAR(50));
Like_ = (#username, #post_id_, date_like VARCHAR(50));
Tag = (#post_id_, #label);


## IV. Step 5: Database Querying
### IV.A. Usage Scenarios (Bonus)
To maximize the utility of the database, we have designed **3 distinct usage scenarios**, each tailored to a specific role within the Paris Saint-Germain organization:

**Scenario 1: The Community Manager (Social Engagement)**
The CM analyzes fan engagement on the "FanConnect" platform. They extract data to:
- Find the most active users and superfans for reward programs (stadium tours).
- Observe which device types are most prevalent amongst the fanbase.
- Track trending hashtags and see which posts generate the most interaction (likes and comments).

**Scenario 2: The Data Analyst / Scouter (Player Performance)**
The Data Analyst focuses on the physical impact of the pro players on the pitch. They extract data to:
- Evaluate the global offensive contribution (goals + assists).
- Compare players' average ratings over several matches.
- Identify players who have high ratings against specific opponents.

**Scenario 3: The PR Manager (Brand Reputation)**
The Public Relations Manager bridges the gap between digital footprint and physical performance. They extract data to:
- Identify players who have both high match ratings and high social media engagement.
- Find inactive users or fans who have never posted anything, to target them with re-engagement email campaigns.
- See the full names and details of fans who follow all the pro players.

These three scenarios drove the creation of the 20 queries found in `4_interrogation.sql`, covering advanced selections, aggregations, joins, and nested subqueries.
