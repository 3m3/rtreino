CREATE TABLE "categories" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "levels" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "description" varchar(255), "created_at" datetime, "updated_at" datetime, "difficult_value" integer);
CREATE TABLE "messages" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(255), "body" text, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "problems" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "code" varchar(255), "name" varchar(255), "source" varchar(255), "created_at" datetime, "updated_at" datetime, "category_id" integer, "level_id" integer);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20090824212039');

INSERT INTO schema_migrations (version) VALUES ('20090824213306');

INSERT INTO schema_migrations (version) VALUES ('20090824224509');

INSERT INTO schema_migrations (version) VALUES ('20090826010555');

INSERT INTO schema_migrations (version) VALUES ('20090826014122');

INSERT INTO schema_migrations (version) VALUES ('20090826015705');

INSERT INTO schema_migrations (version) VALUES ('20090902004511');