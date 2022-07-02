/*======================
  Participant
 ======================*/
alter table public.participant enable row level security;
create policy "only authenticated participants can insert"
    on public.participant
    for insert with check (auth.uid() = user_id);

create policy "only authenticated users can see info"
    on public.participant
    for select using (auth.role() = 'authenticated')
