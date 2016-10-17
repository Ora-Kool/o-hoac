/**
 * Created by Etinge Mabian on 15/10/2016.
 */
$(function() {
    $('#photoselect').on('change', function(event) {
        var files = event.target.files;
        var image = files[0]
        var reader = new FileReader();
        reader.onload = function(file) {
            var img = new Image();
            console.log(file);
            img.src = file.target.result;
            $('#target').html(img);
        }
        reader.readAsDataURL(image);
        console.log(files);
    });
});