<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Bootstrap Rating Input Plugin Examples</title>
<link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/4.3.1/flatly/bootstrap.min.css">
    <script src="https://use.fontawesome.com/5ac93d4ca8.js"></script>
    <script src="src/bootstrap4-rating-input.js"></script>
    <style type="text/css">
      .container { margin: 150px auto; font-size: 20px; }
    </style>
    <script type="text/javascript">
        $(function () {
            $('input').on('change', function () {
                alert("Changed: " + $(this).val())
            });
        });
    </script>
</head>
<body><div id="jquery-script-menu">
<div class="jquery-script-center">
<ul>
<li><a href="https://www.jqueryscript.net/other/Simple-jQuery-Star-Rating-Widget-For-Bootstrap-3-Bootstrap-Rating-Input.html">Download This Plugin</a></li>
<li><a href="https://www.jqueryscript.net/">Back To jQueryScript.Net</a></li>
</ul><div id="carbon-block"></div>
<div class="jquery-script-ads"><script type="text/javascript"><!--
google_ad_client = "ca-pub-2783044520727903";
/* jQuery_demo */
google_ad_slot = "2780937993";
google_ad_width = 728;
google_ad_height = 90;
//-->
</script>
<script type="text/javascript"
src="https://pagead2.googlesyndication.com/pagead/show_ads.js">
</script></div>
<div class="jquery-script-clear"></div>
</div>
</div>
<div class="container">
<h1>Bootstrap Rating Input Plugin Examples</h1>
<p class="lead">A lightweight jQuery plugin that transforms a standard input filed into a simple star rating system styling with Twitter's Bootstrap 4 or Bootstrap 3.</p>
<p>
    My rating:
    <input type="number" name="inputName" id="rating1" class="rating text-warning" data-clearable="remove"/>

</p>

<h2>Using a default value:</h2>
<p>
    My rating:
    <input type="number" name="inputName" id="rating2" class="rating"
           data-clearable="remove" value="3"/>
</p>

<h2>With an empty clear button</h2>
<p>
    My rating:
    <input type="number" name="inputName" id="rating-empty-clearable" class="rating"/>
</p>

<h2>With an clear button that is always visible</h2>
<p>
    My rating:
    <input type="number" name="inputName" id="rating-empty-clearable2" class="rating"
           data-clearable data-clearable-remain="true"/>
</p>

<h2>With a minimum value and a special empty-value:</h2>
<p>
    My rating:
    <input type="number" name="inputName" id="rating-minimum" class="rating"
           data-clearable="remove" data-min="2" data-empty-value="1"/>
</p>


<h1>Extra options <small>introduced by <a href="https://github.com/iyedb">iyedb</a></h1>
<h2>Inline:</h2>

<p>
    Inline rating:
    <input type="number" name="inputName" id="rating-inline" class="rating"
           data-clearable="remove" data-inline/>
</p>

<h2>Read only:</h2>
<p>
    Readonly:
    <input type="number" name="inputName" id="rating-readonly" class="rating"
           data-clearable="remove" value="2" data-readonly/>
</p>
<p>
    Readonly Div:
    <div class="rating text-warning">4</div>
</p>

<p>
    My rating:
    <input type="number" name="inputName" id="rating-custom-icons" class="rating"
           data-clearable="remove" data-icon-lib="fa" data-active-icon="fa-heart"
           data-inactive-icon="fa-heart-o" data-clearable-icon="fa-trash-o" value="4"/>
</p>
</div>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<script>
try {
  fetch(new Request("https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js", { method: 'HEAD', mode: 'no-cors' })).then(function(response) {
    return true;
  }).catch(function(e) {
    var carbonScript = document.createElement("script");
    carbonScript.src = "//cdn.carbonads.com/carbon.js?serve=CK7DKKQU&placement=wwwjqueryscriptnet";
    carbonScript.id = "_carbonads_js";
    document.getElementById("carbon-block").appendChild(carbonScript);
  });
} catch (error) {
  console.log(error);
}
</script>
</body>
</html>
