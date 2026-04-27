# ❤️ SQL Case Study: Facebook Posts with Heart Reactions

## 📌 Problem
Find all Facebook posts that received at least one **'heart' reaction**.

---

## 🧠 Business Context
In social media platforms, not all engagement is equal.  
A "heart" reaction indicates stronger emotional engagement compared to "like" or "laugh".

This analysis identifies posts that generated **high-value engagement**.

---

## 🗂️ Schema

> Note: Schema and sample data are simplified for demonstration purposes.

### facebook_posts

| post_id | poster | post_text                                      | post_keywords                  | post_date  |
|--------|--------|-----------------------------------------------|-------------------------------|-----------|
| 0      | 2      | The Lakers game from last night was great.     | [basketball,lakers,nba]       | 2019-01-01 |
| 1      | 1      | Lebron James is top class.                     | [basketball,lebron_james,nba] | 2019-01-02 |
| 2      | 2      | Asparagus tastes OK.                           | [asparagus,food]              | 2019-01-01 |
| 3      | 1      | Spaghetti is an Italian food.                  | [spaghetti,food]              | 2019-01-02 |
| 4      | 3      | User 3 is not sharing interests                | [#spam#]                      | 2019-01-01 |
| 5      | 3      | User 3 posts SPAM content a lot                | [#spam#]                      | 2019-01-02 |

---

### facebook_reactions

| poster | friend | reaction | date_day | post_id |
|--------|--------|----------|----------|---------|
| 2      | 1      | like     | 1        | 0       |
| 2      | 6      | like     | 1        | 0       |
| 1      | 2      | like     | 1        | 1       |
| 1      | 3      | heart    | 1        | 1       |
| 1      | 4      | like     | 1        | 1       |
| 1      | 5      | heart    | 1        | 1       |
| 1      | 6      | like     | 1        | 1       |
| 2      | 1      | like     | 2        | 2       |
| 2      | 6      | like     | 2        | 2       |
| 1      | 2      | like     | 2        | 3       |
| 1      | 3      | like     | 2        | 3       |
| 1      | 4      | like     | 2        | 3       |
| 1      | 5      | like     | 2        | 3       |
| 1      | 6      | like     | 2        | 3       |
| 2      | 1      | laugh    | 1        | 0       |
| 2      | 6      | laugh    | 1        | 1       |
| 1      | 2      | laugh    | 1        | 0       |
| 1      | 3      | laugh    | 1        | 3       |
| 1      | 4      | laugh    | 1        | 4       |

---

## 🧩 Approach

### Method 1 — GROUP BY (Baseline)
Uses aggregation to identify posts with heart reactions.

### Method 2 — EXISTS (Optimized)
Checks for existence of at least one heart reaction per post.

---

## ⚡ Final Solution (Optimized)

```sql
SELECT 
    fp.post_id,
    fp.poster,
    fp.post_text,
    fp.post_keywords,
    fp.post_date
FROM facebook_posts fp
WHERE EXISTS (
    SELECT 1
    FROM facebook_reactions fr
    WHERE fr.post_id = fp.post_id
      AND fr.reaction = 'heart'
);
```
---

##  Initial Solution (GROUP BY)

```sql
SELECT
    fp.post_id,
    fp.poster,
    fp.post_text,
    fp.post_keywords,
    fp.post_date

FROM facebook_posts fp

JOIN (select post_id from facebook_reactions where reaction = 'heart' group by post_id) fr
    on fp.post_id = fr.post_id;
