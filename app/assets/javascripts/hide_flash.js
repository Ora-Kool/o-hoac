$(document).ready(function () {

   var $success = $('div.success');
    var $danger = $('div.danger');
    if ($success.hide() || $danger.hide()){
        $success.slideDown(500, function () {
            $success.slideDown(5000);
        });

        $danger.fadeIn(500);


    }
});
