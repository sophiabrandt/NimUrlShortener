import database, os

when isMainModule:
  removeFile("url-shortener_test.db")
  var db = newDatabase("url-shortener_test.db")
  db.setup()

  # failure case: there should be a `ValueError` if the original url is too short
  block:
    try:
      discard db.shorten(Url(orig_url: "abc"))
    except ValueError:
      doAssert true
    except:
      doAssert false

  # success case: should return the shortcode of the original url
  block:
    # original url does NOT exist, shorten proc should return a new shortcode
    doAssert db.shorten(Url(orig_url: "http://example.com")) == "1"
    # original url already exists, shorten proc should return the same shortcode as before
    doAssert db.shorten(Url(orig_url: "http://example.com")) == "1"
    # next original url should return a new autoincremented shortcode
    doAssert db.shorten(Url(orig_url: "http://abcd.com")) == "2"

  echo("All tests finished successfully!")
