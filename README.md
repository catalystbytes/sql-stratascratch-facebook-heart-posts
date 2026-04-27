# SQL Case Study: Facebook Posts with Heart Reactions

## 📌 Problem
Find all Facebook posts that received at least one **'heart' reaction**.

---

## 🧠 Business Context
In social platforms, not all engagement is equal. A "heart" reaction signals stronger emotional interest than a "like" or "laugh".

This analysis identifies posts that generated high-value engagement.

---

## 🗂️ Dataset
- facebook_posts
- facebook_reactions

---

## 🧩 Approach

### Method 1 — GROUP BY (Basic)
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
