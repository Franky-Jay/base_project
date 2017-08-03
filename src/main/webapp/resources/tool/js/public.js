/**
 * Created by yadi_coco on 2017/4/18.
 */
jQuery(document).ready(function($) {
    $("#file_input").change(function () {
        $(".filename").text($("#file_input").val());
    });


});