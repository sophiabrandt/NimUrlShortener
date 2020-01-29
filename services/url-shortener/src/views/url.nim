#? stdtmpl(subsChar = '$', metaChar = '#', toString = "xmltree.escape")
#import xmltree
#
#proc renderId*(id: string): string =
# let successIconPath = "M19.293 5.293L9 15.586l-4.293-4.293a.999.999 0 10-1.414 1.414l5 5a.999.999 0 001.414 0l11-11a.999.999 0 10-1.414-1.414z"
#  result = ""
<div id="shortened-url">
  <figure class="alert" data-state="success">
    <svg class="alert__icon" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" focusable="false" width="1em" height="1em" viewBox="0 0 24 24">
      <path fill="currentColor" d="${successIconPath}"/>
    </svg>
    <div ="alert__content">
      <p><b>Success!</b></p>
      <p>Your shortlink is:</p>
      <p><strong><a href="${id}">${id}</a></strong></p>
    </div>
  </figure>
</div>
<div>
  <a href="/">← Back to Homepage</a>
</div>
#end proc
#
#proc renderShortenUrl*(): string = 
#  result = ""
<main class="[ input ]" id="newUrl">
  <h1 class="input__heading">Create a new short URL</h1>
  <form id="inputForm" action="shortenurl" method="post" class="[ input__form ] [ flow ]">
    <label for="input">Shorten URL</label>
      <div class="inline-field-control">
        <input type="url" id="url" name="orig_url" pattern="(https?://(?:www.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9].[^s]{2,}|www.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9].[^s]{2,}|https?://(?:www.|(?!www))[a-zA-Z0-9]+.[^s]{2,}|www.[a-zA-Z0-9]+.[^s]{2,})" required>
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
  <div aria-atomic="true" role="alert" class="input__alert"></div>
</main>
#end proc
#
#proc renderNotFound*(): string =
#  result = ""
<div>
  <h1>URL not found.</h1>
  <hr>
  <p><a href="/">⬅️ Back to Homepage</a></p>
</div>
#end proc
