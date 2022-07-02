/*======================
  Channel
 ======================*/
alter table public.channel enable row level security;
create policy "only authenticated users can select"
    on public.channel
    for select using (auth.role() = 'authenticated');

create policy "only authenticated users can insert a new channel"
    on public.channel
    for insert with check (auth.role() = 'authenticated');

create policy "only authenticated users can update existing channel"
    on public.channel
    for update using (auth.uid() = public.channel.creator_id);

create policy "only authenticated users can delete a existing channel"
    on public.channel
    for delete using (auth.uid() = public.channel.creator_id);