# LIFE OS — website first

A responsive, installable website prototype for your university and personal planning.

## Run locally
- Extract the ZIP.
- Open a terminal in this folder.
- Run `python -m http.server 8000`
- Open http://localhost:8000

For service-worker/PWA installation, use localhost or deploy over HTTPS.

## Data persistence
This version stores tasks, exams and events in browser localStorage on the current device/browser. It does **not** yet provide cloud sync or user accounts. Use **Settings → Download backup** and **Import backup** to move data between devices. Do not clear browser site data unless you have exported a backup.

## Deploy as a website
Upload the folder to a static host such as Netlify, Vercel, or GitHub Pages. Use HTTPS. The website can then be installed from a supported browser as a PWA.

## Important next production step
For secure cross-device persistence, add Supabase authentication and a database with per-user row-level security. Never put a Supabase service-role key in browser code. This ZIP intentionally does not pretend cloud sync is configured.

## Included
- Responsive desktop/mobile website layout
- Semester timetable with week-based class recurrence, anchored to 7 September 2026
- Monday 09:00–12:00 Comunicação e Ciência
- Wednesday QG3 room QA02.2
- Study task, exam and personal event management
- Basic study-slot suggestions
- JSON backup and restore
