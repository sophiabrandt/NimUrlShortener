import db_sqlite

type
  Url* = object
    id*: int
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
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      orig_url VARCHAR(255) NOT NULL
    );
  """)

proc newDatabase*(filename = "url-shortener.db"): Database =
  new result
  result.db = open(filename, "", "", "")

# actions
proc `$` *(i: uint): string {.inline.} =
  $uint64(i)

proc shorten*(database: Database, url: Url): string {.raises: [DbError,
    ValueError].} =
  if url.orig_url.len > 3:
    result = database.db.getValue(
        sql"SELECT id FROM Url where orig_url=?", url.orig_url)
    if not result.len == 0:
      result = $database.db.insertID(
          sql"INSERT INTO Url (orig_url) VALUES (?)", url.orig_url)
  else:
    raise newException(ValueError, "Please specify an url that's longer than 3 characters.")
