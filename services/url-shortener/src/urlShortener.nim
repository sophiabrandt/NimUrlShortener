import asyncdispatch

import jester

import db/database, views/url, views/general

let db = newDatabase()
db.setup()

routes:
  get "/":
    resp renderMain(renderShortenUrl())

  post "/shortenurl":
    let orig_url = @"orig_url"
    let id = db.shorten(orig_url)
    if not id.len > 0:
      halt "Something went wrong"
    resp renderMain(renderId(id))

  get "/@id":
    let orig_url = db.getOrigUrl(@"id")
    if orig_url.len == 0:
      halt "URL not found"
    else:
      redirect orig_url

runForever()
