#? stdtmpl(subsChar = '$', metaChar = '#', toString = "xmltree.escape")
#import xmltree
#
#proc renderId*(id: string): string =
#  result = ""
<div id="url">
  <p>Your shortlink: <a href="${id}">${id}</a></p>
</div>
<div>
  <p>← Back to Homepage</p>
</div>
#end proc
#
#proc renderShortenUrl*(): string = 
#  result = ""
<h1>Create a new short URL</h1>
<div id="newUrl">
  <form action="shortenurl" method="post">
    <input type="url" name="orig_url">
    <input type="submit" value="shorten">
  </form>
</div>
#end proc
