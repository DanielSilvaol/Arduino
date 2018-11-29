$(document).ready(function(){
    $("#consumoteste, #consumoteste1").on("mouseover", function(){
        $("header").toggleClass("consumo");
    });

    $("#consumoteste, #consumoteste1").on("mouseout", function(){
        $("header").removeClass("consumo");
    });
});