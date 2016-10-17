$(document).ready(function () {
   var $success = $('div.success');
    var $danger = $('div.danger');
    if ($success.hide() || $danger.hide()){
        $success.fadeIn(500, function () {
            $success.fadeOut(10000, function () {
                $success.css('opacity', 0);
                $success.hide();
            });
        });

        $danger.fadeIn(500);
    }
});
