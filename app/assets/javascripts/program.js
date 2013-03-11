$(document).ready(function(){
  var $warning = $("#warning");
  $warning.hide();
  $warning.html("\
  <p>Please ensure that your phone, tablet, \
  stomach, pocket change, small children, pets, and other various and sundry \
  noisemaking devices are <span>set to silent</span> throughout the ceremony.</p>\
  <aside>dismiss</aside>\
  ");
  $warning.fadeIn(1500);
  $("#warning aside").click(function(){
    $warning.fadeOut("slow", function() {
      $warning.html("\
      <p>Warning: this ceremony contains strong language (which may be unsuitable for children), \
      unusual humor (which may be unsuitable for adults), \
      and advanced mathematics (which may be unsuitable for liberal-arts majors).</p>\
      <aside>dismiss</aside>\
      ");
      $warning.fadeIn("slow");
      $("#warning aside").click(function(){
        $warning.fadeOut("slow")
      })
    });
  })
});