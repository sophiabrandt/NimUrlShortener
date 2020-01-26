# Package

version = "0.1.0"
author = "Sophia Brandt"
description = "Nim URL Shortener"
license = "MIT"
srcDir = "src"
bin = @["urlShortener"]
skipext = @["nim"]



# Dependencies

requires "nim >= 1.0.4", "jester >= 0.4.3"
