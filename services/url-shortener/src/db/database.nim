import db_postgres, os

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
      id SERIAL PRIMARY KEY,
      orig_url VARCHAR(255) NOT NULL
    );
  """)

var nimEnv = os.getEnv("NIM_ENV")
var databaseConn =
  case nimEnv:
    of "development":
      os.getEnv("DATABASE_DEV_CONN")
    of "testing":
      os.getEnv("DATABASE_TEST_CONN")
    else:
      os.getEnv("DATABASE_PROD_CONN")

proc newDatabase*(dbConn = databaseConn): Database =
  new result
  result.db = open("", "", "", dbConn)

# actions
proc `$` *(i: uint): string {.inline.} =
  $uint64(i)

proc shorten*(database: Database, orig_url: string): string =
  # search for original url in database and return its id
  result = database.db.getValue(
        sql"SELECT id FROM Url where orig_url=?", orig_url)
  # if not found, add original url to database
  if result.len == 0:
    result = $database.db.insertID(sql"INSERT INTO Url (orig_url) VALUES (?)", orig_url)

proc getOrigUrl*(database: Database, id: string): string =
  result = database.db.getValue(sql"SELECT orig_url FROM Url WHERE id=?",
      id)
  if result.len == 0:
    raise newException(ValueError, "URL not found")


