# LIFE OS — Supabase-enabled website

## What changed
- Keeps the existing LIFE OS layout, subject list and semester timetable.
- Adds email/password registration and login.
- Stores each signed-in user's tasks, exams and events in Supabase.
- Uses a single per-user JSONB row protected by Row Level Security (RLS).
- Keeps a local browser cache and supports JSON backup export/import.

## 1. Create the database table
1. Open your Supabase project.
2. Open **SQL Editor**.
3. Create a new query.
4. Paste the full contents of `supabase-schema.sql`.
5. Click **Run**.

## 2. Upload the website
Upload the contents of this folder to the root of your `life-os` GitHub repository, replacing the old `index.html` and adding the other files. Commit the changes. GitHub Pages will redeploy automatically.

The Supabase Project URL and publishable key are already configured in `index.html`. These are browser-safe values. Never put a database password, secret key, or service-role key in this file.

## 3. Authentication
The site offers email/password sign-up and login. If Supabase email confirmation is enabled, confirm the email before logging in. For production, configure the Supabase Auth URL settings:
- Site URL: `https://joaoferreira17022008-cell.github.io`
- Redirect URL: `https://joaoferreira17022008-cell.github.io/life-os/`

## Important notes
- The first account that signs in on a browser will upload that browser's existing local LIFE OS data if no cloud record exists yet.
- If a cloud record already exists, it is treated as the source of truth and replaces the browser's local cache.
- Use the same account on each device to see the same cloud data.
- This version stores the three data collections in one JSONB record per account. It is a simple starting architecture; it can be normalised into separate tables as the app grows.
- Test with non-critical data first and keep a JSON backup.
