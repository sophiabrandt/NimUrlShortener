#? stdtmpl(subsChar = '$', metaChar = '#')
#
#proc renderMain*(body: string): string =
#  result = ""
<!DOCTYPE html>
<html>
  <head>
    <title>Nim URL Shortener</title>
    <link rel="stylesheet" type="text/css" href="style.css">
  </head>
  <body>
    <div id="main">
      ${body}
    </div>
  </body>

</html>
#end proc
