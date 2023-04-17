-- adds deleted_at column to users 
alter table users
add column if not exists deleted_at timestamptz null;