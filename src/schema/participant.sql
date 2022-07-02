-- Create a table for public "channel_details"
drop table if exists participant;
create table participant (
  id uuid not null primary key default uuid_generate_v4()
  ,user_id uuid not null
  ,channel_id uuid not null unique

  -- constraints
  ,constraint fk_user_id FOREIGN KEY (user_id) references public.profile(id) ON DELETE CASCADE
  ,constraint fk_channel_id FOREIGN KEY (channel_id) references public.channel(id) ON DELETE CASCADE
);
