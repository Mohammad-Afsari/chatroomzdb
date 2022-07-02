-- Create a table for public "channel"
drop table if exists channel;
create table channel (
    id uuid not null primary key default uuid_generate_v4()
    ,creator_id uuid not null
    ,channel_name text unique
    ,channel_desc text
    ,avatar_url text
    ,created_at timestamp with time zone default now()

  --constraint fk_channel_id FOREIGN KEY (user_id) references public.profile(id) ON DELETE CASCADE
);
