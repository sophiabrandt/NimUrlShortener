import asyncdispatch

import jester

routes:
  get "/":
    resp "Hello World!"

runForever()
