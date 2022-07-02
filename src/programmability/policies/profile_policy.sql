/*======================
  Profile
 ======================*/
 alter table public.profile enable row level security;
-- 1000: Only authenticated users can view their email
create policy "only authenticated users can view all info"
    on public.profile
    for select using (auth.role() = 'authenticated');

-- 1010: Only enable user to update their own profile
create policy "user only update self"
    on public.profile
    for update using (auth.uid() = public.profile.id);

-- 1020: Only enable user to delete their own profile
create policy "user only delete self"
    on public.profile
    for delete using (auth.uid() = public.profile.id);