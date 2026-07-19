# 🏏 ICC Men's T20 World Cup 2024 Database Management System

## Overview

This project is a relational database developed in **MySQL** to model the ICC Men's T20 World Cup 2024 tournament. The database stores information about teams, players, matches, innings, batting and bowling performances, team roles, and player achievements. It demonstrates the principles of database normalization, relational design, and SQL querying.

---

## Objectives

* Design a normalized relational database for a real-world cricket tournament.
* Store and manage tournament data efficiently.
* Maintain relationships using primary and foreign keys.
* Generate meaningful insights using SQL queries.
* Demonstrate database design and SQL skills through a complete project.

---

## Technologies Used

* **Database:** MySQL
* **Development Tool:** MySQL Workbench
* **Version Control:** Git & GitHub

---

## Database Structure

The project consists of the following tables:

* `team`
* `player`
* `t20_match`
* `playing_xi`
* `innings`
* `batting_scorecard`
* `bowling_details`
* `match_team_role`
* `achievement_type`
* `match_achievement`
* `ball_by_ball` *(if included)*

The database is designed using primary keys, foreign keys, and normalized relationships to minimize redundancy and maintain data integrity.

---

## Repository Structure

```text
T20-World-Cup-2024-Database/
│
├── README.md
├── ER_Diagram.png
├── Relational_Schema.png
│
├── DATA FILES/
│   ├── achievement type_import.csv
│   ├── batting_scorecard_import.csv
│   ├── bowling_scorecard_import.csv
│   ├── innings_import.csv
│   ├── match_achievement_import.csv
│   ├── match_role_import.csv
│   ├── playing_xi_import.csv
│   ├── t20_match_import.csv
│   ├── players.csv
│ 
│   └── sample_queries.sql
│
├── Readable_Data/
│   ├── t20_match_readable.csv
│   ├── playing_xi_readable.csv
│   ├── batting_scorecard_readable.csv
│   ├── bowling_details_readable.csv
│   └── match_achievement_readable.csv
│
└── Screenshots/
```

---

## Features

* Relational database design with normalized tables.
* Match scheduling and results.
* Team and player management.
* Playing XI records.
* Innings-wise match information.
* Batting scorecards.
* Bowling statistics.
* Match achievements such as:

  * Player of the Match
  * Highest Run Scorer
  * Highest Wicket Taker
  * Best Bowling Figures
  * Half Century
  * Century
  * Five Wicket Haul
* Team captain and wicketkeeper information.

---

## Sample SQL Queries

The project includes SQL queries to perform analyses such as:

* Tournament winner
* Match results
* Highest run scorers
* Highest wicket takers
* Player of the Match winners
* Team-wise wins
* Batting statistics
* Bowling statistics

These queries demonstrate the use of:

* INNER JOIN
* GROUP BY
* ORDER BY
* Aggregate functions (`SUM`, `COUNT`, `AVG`)
* Filtering with `WHERE`
* Result limiting using `LIMIT`

---

## How to Use

1. Clone this repository.
2. Open MySQL Workbench.
3. Create a new database.
4. Execute `database_creation.sql`.
5. Import the remaining SQL files in the `SQL` folder.
6. Run the queries in `sample_queries.sql` to explore the database.

---

## Learning Outcomes

This project demonstrates practical knowledge of:

* Relational database design
* Entity-Relationship (ER) modeling
* Database normalization
* Primary and foreign key relationships
* SQL data manipulation and querying
* Aggregate functions and reporting
* GitHub project organization

---

## Future Improvements

* Complete ball-by-ball data for every match.
* Create SQL views for common reports.
* Add stored procedures and triggers.
* Build a web interface for visualizing tournament statistics.
* Develop interactive dashboards using Power BI or Tableau.

---

## Author

**Niharika Namade**

This project was created as a database management system project to demonstrate SQL, relational database design, and data analysis skills using the ICC Men's T20 World Cup 2024 tournament as the case study.
