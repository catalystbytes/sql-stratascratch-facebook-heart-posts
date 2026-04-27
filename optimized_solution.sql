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
