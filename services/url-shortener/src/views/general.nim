#? stdtmpl(subsChar = '$', metaChar = '#')
#
#proc renderMain*(body: string): string =
#  result = ""
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Nim URL Shortener</title>
    <link rel="stylesheet" href="https://unpkg.com/modern-css-reset/dist/reset.min.css" />
    <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="shortcut icon" href="favicon.ico">
    <script type="text/javascript" src="main.js" async></script>
  </head>
  <body>
    <div class="center text-center">
      <div class="[ flow ]">
      ${body}
      </div>
    </div>
  </body>

</html>
#end proc
