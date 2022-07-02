-- Create a table for public "profiles"
drop table if exists profile;
create table profile (
    id uuid not null primary key default uuid_generate_v4()
    ,username text unique
    ,description text
    ,email text unique
    ,avatar_url text
    ,channel_id uuid
    ,created_at timestamp with time zone default now()
    ,updated_at timestamp with time zone

  -- constraints on fields
    ,constraint username_length check (char_length(username) >= 3)
    ,constraint fk_channel_id FOREIGN KEY (channel_id) references public.channel(id) ON DELETE CASCADE
);
