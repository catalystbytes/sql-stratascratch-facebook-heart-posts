select fp.post_id,
fp.poster,
fp.post_text,
fp.post_keywords,
fp.post_date

from facebook_posts fp

join (select post_id from facebook_reactions where reaction = 'heart' group by post_id) fr
    on fp.post_id = fr.post_id;
