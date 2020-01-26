#? stdtmpl(subsChar = '$', metaChar = '#')
#
#proc renderMain*(body: string): string =
#  result = ""
<!DOCTYPE html>
<html>
  <head>
    <title>Nim URL Shortener</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="shortcut icon" href="favicon.ico">
  </head>
  <body>
    <main class="center text-center">
      <div class="[ flow ]">
      ${body}
      </div>
    </main>
  </body>

</html>
#end proc
