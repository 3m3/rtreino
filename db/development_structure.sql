CREATE TABLE "analyses" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "body" text, "user_id" integer, "problem_id" integer, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "categories" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "category_id" integer, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "comments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "body" text, "subject" varchar(255), "commentable_id" integer, "commentable_type" varchar(255), "user_id" integer, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "languages" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "levels" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "problems" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "code" varchar(255), "name" varchar(255), "source" varchar(255), "level_id" integer, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "statements" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "language_id" integer, "problem_id" integer, "body" text, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "username" varchar(255), "email" varchar(255), "crypted_password" varchar(255), "passoword_salt" varchar(255), "persistence_token" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20090912130053');

INSERT INTO schema_migrations (version) VALUES ('20090912130903');

INSERT INTO schema_migrations (version) VALUES ('20090912133754');

INSERT INTO schema_migrations (version) VALUES ('20090912141705');

INSERT INTO schema_migrations (version) VALUES ('20090912141936');

INSERT INTO schema_migrations (version) VALUES ('20090912203214');

INSERT INTO schema_migrations (version) VALUES ('20090913222327');

INSERT INTO schema_migrations (version) VALUES ('20090915010527');