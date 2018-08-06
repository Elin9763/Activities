<input class="toggle" type="checkbox">

$(function(){
    $("input.toggle").on("change", function(){
        $(this).parents("form").trigger("submit")
    })
});