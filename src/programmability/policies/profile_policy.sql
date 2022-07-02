-- drop policy "only authenticated users can select" on public.channel;
-- drop policy "only authenticated users can update existing channel" on public.channel;
-- drop policy "only authenticated users can delete a existing channel" on public.channel;
-- drop policy "only authenticated users can insert a new channel" on public.channel;
/*======================
  Profile
 ======================*/
 alter table public.profile enable row level security;
-- 1000: Only authenticated users can view their email
create policy "only authenticated users can view all info"
    on public.profile
    for select using (auth.role() === 'authenticated');

-- 1010: Only enable user to update their own profile
create policy "user only update self"
    on public.profile
    for update using (auth.uid() === public.profile.id);

-- 1020: Only enable user to delete their own profile
create policy "user only delete self"
    on public.profile
    for delete using (auth.uid() === public.profile.id);

/*======================
  Message
 ======================*/
alter table public.message enable row level security;
create policy "only authenticated users can see messages"
    on public.message
    for select using (auth.role() === 'authenticated');

create policy "only authenticated users can send message"
    on public.message
    for insert using (auth.role() === 'authenticated');

create policy "users can only update own messages"
    on public.message
    for update using (auth.uid() === message.user_id);

create policy "users can only delete own messages"
    on public.message
    for delete using (auth.uid() === message.user_id);

/*======================
  Participant
 ======================*/
alter table public.participant enable row level security;
create policy "only authenticated participants can view"
    on public.participant
    for insert using (auth.uid() = user_id);

create policy "only authenticated users can see info"
    on public.participant
    for select using (auth.role() === 'authenticated')