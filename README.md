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
