#? stdtmpl(subsChar = '$', metaChar = '#', toString = "xmltree.escape")
#import xmltree
#
#proc renderId*(id: string): string =
#  result = ""
<div id="url">
  <p>Your shortlink: <strong><a href="${id}">${id}</a></strong></p>
</div>
<div>
  <a href="/">← Back to Homepage</a>
</div>
#end proc
#
#proc renderShortenUrl*(): string = 
#  result = ""
<h1 class="input__heading">Create a new short URL</h1>
<div id="newUrl">
  <form id="inputForm" action="shortenurl" method="post" class="[ input__form ] [ flow ]">
    <label for="input">Shorten URL</label>
      <div class="inline-field-control">
        <input type="url" name="orig_url" required>
        <button type="submit" class="button" value="shorten">
            <span class="visually-hidden">Shorten URL</span>
            <svg
              xmlns="http://www.w3.org/2000/svg"
              aria-hidden="true"
              focusable="false"
              width="1em"
              height="1em"
              viewBox="0 0 24 24"
            >
              <path
                fill="currentColor"
                d="M11.293 5.707L16.586 11H5a1 1 0 000 2h11.586l-5.293 5.293a.999.999 0 101.414 1.414l7-7a1.006 1.006 0 000-1.414l-7-7a.999.999 0 10-1.414 1.414z"
              />
            </svg>
          </button>
      </div>
  </form>
</div>
#end proc
