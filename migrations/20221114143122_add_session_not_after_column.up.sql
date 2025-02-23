alter table only sessions
add column if not exists not_after timestamptz;
comment on column sessions.not_after is 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';