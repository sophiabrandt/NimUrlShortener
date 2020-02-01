import os, sequtils, re

var filepaths: seq[string]

for kind, path in walkdir("./public/"):
  filepaths.add(path)

let icoFile = filter(filepaths, proc (x: string): bool =
  contains(x, re".ico"))[0]

let ico* = readFile(icoFile)
