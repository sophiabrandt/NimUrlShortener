import os, sequtils, re

var filepaths: seq[string]

for kind, path in walkdir("./public/"):
  filepaths.add(path)

let icoFile = filter(filepaths, proc (x: string): bool =
  contains(x, re".ico"))[0]

let cssFile = filter(filepaths, proc (x: string): bool =
  contains(x, re".css"))[0]

let jsFile = filter(filepaths, proc (x: string): bool =
  contains(x, re".js"))[0]

let ico* = readFile(icoFile)
let css* = readFile(cssFile)
let js* = readFile(jsFile)
