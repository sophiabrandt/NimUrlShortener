import db_sqlite

type
  Url* = object
    shortened*: int
    orig*: string

type
  Database* = ref object
    db: DbConn

# database
proc close*(database: Database) =
  database.db.close()

proc setup*(database: Database) =
  database.db.exec(sql"""
    CREATE TABLE IF NOT EXISTS Url(
      shortened INTEGER PRIMARY KEY,
      orig VARCHAR(255) NOT NULL
    );
  """)

proc newDatabase*(filename = "url-shortener.db"): Database =
  new result
  result.db = open(filename, "", "", "")

# actions
proc `$` *(i: uint): string {.inline.} =
  $uint64(i)

proc shorten*(database: Database, orig: string, url: var Url) =
  if not url.orig.len > 3:
    var shortened = database.db.getValue(
        sql"SELECT shortened FROM Url where orig=?", orig)
    if not shortened.len == 0:
      shortened = $database.db.tryInsertID(
          sql"INSERT INTO Url (orig) VALUES (?)", orig)
  raise newException(ValueError, "Url must be longer than 3 characters.")
