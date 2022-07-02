/*======================
  Message
 ======================*/
alter table public.message enable row level security;
create policy "only authenticated users can see messages"
    on public.message
    for select using (auth.role() = 'authenticated');

create policy "only authenticated users can send message"
    on public.message
    for insert with check (auth.role() = 'authenticated');

create policy "users can only update own messages"
    on public.message
    for update using (auth.uid() = message.user_id);

create policy "users can only delete own messages"
    on public.message
    for delete using (auth.uid() = message.user_id);