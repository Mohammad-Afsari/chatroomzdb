-- 0000: select columns / table from information schema
select *
from information_schema.columns
where table_name = 'users' and column_name like '%meta%'

-- 1000: Auth table
select *
from auth.users

-- 1010: Delete specific id
delete from auth.users
where id = 'b5fb9880-0c61-4a4f-8b84-08e29929ca7e'

-- 1020: testing
select raw_user_meta_data ->>'username'
from auth.users
where id = 'a13cd520-bbe4-4400-9fcc-b01d6db6a24e'


select *
from public.message
where channel_id = '310bd129-9c7d-4210-9e9f-073fad714b9d'