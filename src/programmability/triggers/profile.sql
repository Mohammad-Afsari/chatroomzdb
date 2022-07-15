-- update profile table anytime a user signs up
-- 1000: create trigger function
drop function trigger_profile();
create function trigger_profile()
    returns trigger
    language plpgsql
    security definer set search_path = public
as $$
begin
    -- logic
    insert into public.profile (id, email, username)
    values (new.id, new.email, new.raw_user_meta_data ->> 'username');
    return new;
end;
$$;

-- 1010: create trigger statement
drop trigger if exists trigger_profile on auth.users;
create trigger trigger_profile
    after insert -- include update?
    on auth.users
    for each row
    execute procedure trigger_profile();