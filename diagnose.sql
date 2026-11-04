-- Aab-e-Khizri: Supabase SQL Editor mein ye 2 queries chalayen aur nateeja (text) Claude ko bhej dein.
-- Is mein koi password ya key nahi hoti. Agar kisi function mein koi secret/key likhi ho to wo hissa chhupa kar bhejein.

-- 1) In functions ka code (website order error, site settings, video, chat)
select proname as function_name, pg_get_functiondef(oid) as code
from pg_proc
where pronamespace = 'public'::regnamespace
  and proname in ('aab_web_place','aab_set_site','aab_site','aab_shop_video_set','aab_shop_video_get',
                  'aab_chat_send','aab_chat_list','aab_chat_threads','aab_set_shop_img')
order by proname;

-- 2) Chat / site / website tables ke columns
select table_name, column_name, data_type
from information_schema.columns
where table_schema = 'public'
  and (table_name ilike '%chat%' or table_name ilike '%site%' or table_name ilike '%web%' or table_name ilike '%shop%')
order by table_name, ordinal_position;
