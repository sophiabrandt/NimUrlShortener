import db_postgres, strutils, os

type
  Url* = object
    shortcode*: int
    orig_url*: string

type
  Database* = ref object
    db: DbConn

# database
proc close*(database: Database) =
  database.db.close()

proc setup*(database: Database) =
  database.db.exec(sql"""
    CREATE TABLE IF NOT EXISTS Url(
      shortcode SERIAL PRIMARY KEY,
      orig_url VARCHAR(255) NOT NULL
    );
  """)

proc newDatabase*(dbConn = os.getEnv("DATABASE_CONN")): Database =
  new result
  result.db = open("", "", "", dbConn)

# actions
proc `$` *(i: uint): string {.inline.} =
  $uint64(i)

proc shorten*(database: Database, orig_url: string): string =
  if orig_url.len > 3:
    # search for original url in database and return its shortcode
    result = database.db.getValue(
        sql"SELECT shortcode FROM Url where orig_url=?", orig_url)
    # if not found, add original url to database
    if result.len == 0:
      result = $database.db.insertID(
          sql"INSERT INTO Url (orig_url) VALUES (?)", orig_url)
  # only accept urls that are longer than 3 characters
  else:
    raise newException(ValueError, "Please specify an url that's longer than 3 characters.")

proc getOrigUrl*(database: Database, shortcode: string): string =
  result = database.db.getValue(sql"SELECT orig_url FROM Url WHERE shortcode=?",
      parseInt(shortcode))
  if result.len == 0:
    raise newException(ValueError, "URL not found")


