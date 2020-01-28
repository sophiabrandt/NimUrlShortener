import database, os

when isMainModule:
  var db = newDatabase(os.getEnv("DATABASE_TEST_CONN"))
  db.setup()

  # proc shorten : should return the id of the original url
  block:
    # original url does NOT exist, shorten proc should return a new id
    doAssert db.shorten("http://example.com") == "1"
    # original url already exists, shorten proc should return the same id as before
    doAssert db.shorten("http://example.com") == "1"
    # next original url should return a new autoincremented id
    doAssert db.shorten("http://abcd.com") == "2"

  # proc getOrigUrl : success case
  block:
    doAssert db.getOrigUrl("1") == "http://example.com"
    doAssert db.getOrigUrl("2") == "http://abcd.com"

  # proc getOrigUrl: failure case should return `ValueError
  block:
    try:
      discard db.getOrigUrl("3")
    except ValueError:
      doAssert true
    except:
      doAssert false

  echo("All tests finished successfully!")
