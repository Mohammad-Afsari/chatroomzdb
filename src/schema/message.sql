-- Chats table for all relevant messages sent by users
drop table if exists message;
create table message (
    id uuid not null primary key default uuid_generate_v4()
    ,user_id uuid not null
    ,channel_id uuid not null
    ,message text
    ,message_sent_at timestamp with time zone default now()

    -- constraints
  ,constraint fk_user_id FOREIGN KEY (user_id) references public.profile(id) ON DELETE CASCADE
  ,constraint fk_channel_id FOREIGN KEY (channel_id) references public.channel(id) ON DELETE CASCADE
)