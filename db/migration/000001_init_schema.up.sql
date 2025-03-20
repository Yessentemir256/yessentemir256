CREATE TABLE "users" (
  "username" varchar PRIMARY KEY,
  "hashed_password" varchar NOT NULL,
  "full_name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password_changed_at" timestamptz NOT NULL DEFAULT '0001-01-01 00:00:00Z',
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "essays" (
  "id" bigserial PRIMARY KEY,
  "title" varchar(255) NOT NULL,
  "content" text NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "comments" (
  "id" bigserial PRIMARY KEY,
  "owner" varchar NOT NULL,
  "essay_id" integer NOT NULL,
  "content" text NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE INDEX ON "comments" ("essay_id");

CREATE INDEX ON "comments" ("owner");

ALTER TABLE "comments" ADD FOREIGN KEY ("owner") REFERENCES "users" ("username");

ALTER TABLE "comments" ADD FOREIGN KEY ("essay_id") REFERENCES "essays" ("id");