-- adds parent column
ALTER TABLE refresh_tokens
ADD COLUMN IF NOT EXISTS parent varchar(255) NULL;
DO $$ BEGIN IF NOT EXISTS(
  SELECT *
  FROM information_schema.constraint_column_usage
  WHERE table_name = 'refresh_tokens'
    and constraint_name = 'refresh_tokens_token_unique'
) THEN
ALTER TABLE "refresh_tokens"
ADD CONSTRAINT refresh_tokens_token_unique UNIQUE ("token");
END IF;
IF NOT EXISTS(
  SELECT *
  FROM information_schema.constraint_column_usage
  WHERE table_name = 'refresh_tokens'
    and constraint_name = 'refresh_tokens_parent_fkey'
) THEN
ALTER TABLE "refresh_tokens"
ADD CONSTRAINT refresh_tokens_parent_fkey FOREIGN KEY (parent) REFERENCES refresh_tokens("token");
END IF;
CREATE INDEX IF NOT EXISTS refresh_tokens_parent_idx ON "refresh_tokens" USING btree (parent);
END $$;