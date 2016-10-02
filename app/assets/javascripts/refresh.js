/**
 * Created by Etinge Mabian on 02/10/2016.
 */
$(document).ready(function() {
    // get data every 5 mins and refresh myDiv
    var pingAfter = 5000;
    var refreshId = setInterval(function() {
        //$("#myDiv").load('/partial/data');
        $("#myDiv").load('/partial/data');
    }, pingAfter);
});