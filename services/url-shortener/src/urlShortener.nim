import asyncdispatch, jester, strutils, os

import db/database, views/url, views/general, views/static_assets

let db = newDatabase()
db.setup()

settings:
  port = Port(parseInt(os.getEnv("PORT")))

template corsResp(code, message: untyped): untyped =
  mixin resp
  resp code, {"Access-Control-Allow-Origin": "*"}, message

routes:
  get "/":
    corsResp(Http200, renderMain(renderShortenUrl()))

  get "/favicon.ico":
    corsResp(Http200, ico)

  get "/style.css":
    corsResp(Http200, css)

  get "/main.js":
    corsResp(Http200, js)

  post "/shortenurl":
    let orig_url = @"orig_url"
    let id = db.shorten(orig_url)
    if not id.len > 0:
      halt "Something went wrong"
    corsResp(Http200, renderMain(renderId(id)))

  get "/@id":
    cond '.' notin @"id"
    let orig_url = db.getOrigUrl(@"id")
    if orig_url.len == 0:
      corsResp(Http200, renderMain(renderNotFound()))
    else:
      redirect orig_url

runForever()
