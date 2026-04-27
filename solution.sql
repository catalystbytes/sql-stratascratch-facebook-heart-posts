SELECT
    fp.post_id,
    fp.poster,
    fp.post_text,
    fp.post_keywords,
    fp.post_date

FROM facebook_posts fp

JOIN (select post_id from facebook_reactions where reaction = 'heart' group by post_id) fr
    on fp.post_id = fr.post_id;
