-- LIFE OS cloud storage
-- Run this entire script in Supabase Dashboard > SQL Editor > New query.

create table if not exists public.lifeos_data (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null default '{"tasks":[],"exams":[],"events":[]}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.lifeos_data enable row level security;

drop policy if exists "Users can read their own LIFE OS data" on public.lifeos_data;
create policy "Users can read their own LIFE OS data"
on public.lifeos_data for select
to authenticated
using (auth.uid() = user_id);

drop policy if exists "Users can insert their own LIFE OS data" on public.lifeos_data;
create policy "Users can insert their own LIFE OS data"
on public.lifeos_data for insert
to authenticated
with check (auth.uid() = user_id);

drop policy if exists "Users can update their own LIFE OS data" on public.lifeos_data;
create policy "Users can update their own LIFE OS data"
on public.lifeos_data for update
to authenticated
using (auth.uid() = user_id)
with check (auth.uid() = user_id);

drop policy if exists "Users can delete their own LIFE OS data" on public.lifeos_data;
create policy "Users can delete their own LIFE OS data"
on public.lifeos_data for delete
to authenticated
using (auth.uid() = user_id);

grant select, insert, update, delete on public.lifeos_data to authenticated;
