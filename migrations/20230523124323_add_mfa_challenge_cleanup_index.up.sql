-- Index used to clean up mfa challenges

create index if not exists
  mfa_challenge_created_at_idx
  on mfa_challenges (created_at desc);
