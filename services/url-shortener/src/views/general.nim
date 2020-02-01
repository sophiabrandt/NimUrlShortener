#? stdtmpl(subsChar = '$', metaChar = '#')
#import assetsfile
#
#let css = assetsfile.getAsset("public/style.css")
#let js = assetsfile.getAsset("public/main.js")
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
    <link rel="shortcut icon" href="favicon.ico">
    <style type="text/css">${css}</style>
  </head>
  <body>
    <div class="center text-center">
      <div class="[ flow ]">
      ${body}
      </div>
    </div>
    <script type="text/javascript">${js}</script>
  </body>
</html>
#end proc
