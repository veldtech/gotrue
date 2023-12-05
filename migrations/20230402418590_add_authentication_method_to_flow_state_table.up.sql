alter table flow_state
add column authentication_method text not null;
create index if not exists idx_user_id_auth_method on flow_state (user_id, authentication_method);

-- Update comment as we have generalized the table
comment on table flow_state is 'stores metadata for pkce logins';
