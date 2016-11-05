$(document).ready(function () {

   var $success = $('div.success');
    var $danger = $('div.danger');
    if ($success.hide() || $danger.hide()){
        $success.fadeIn(500, function () {
            $success.fadeOut(5000);
        });

        $danger.fadeIn(500);


    }
});
