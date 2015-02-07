PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE "author" ("author_id" INTEGER PRIMARY KEY AUTOINCREMENT, "name" TEXT);
CREATE TABLE "book" ("book_id" INTEGER PRIMARY KEY AUTOINCREMENT, "name" TEXT);
CREATE TABLE "book_copy" ("publication_id" INTEGER REFERENCES "book_publication" ("publication_id") ON DELETE RESTRICT, "count" INTEGER);
CREATE TABLE "publication_to_author" ("publication_id" INTEGER REFERENCES "book_publication" ("publication_id") ON DELETE RESTRICT, "author_id" INTEGER REFERENCES "author" ("author_id") ON DELETE RESTRICT);
CREATE TABLE "book_tome" ("publication_id" INTEGER REFERENCES "book_publication" ("publication_id") ON DELETE RESTRICT,
							"number" INTEGER);
CREATE TABLE "book_publication" ("publication_id" INTEGER PRIMARY KEY AUTOINCREMENT,
								 "book_id" INTEGER REFERENCES "book" ("book_id") ON DELETE RESTRICT,
								 "year" DATE);
COMMIT;
