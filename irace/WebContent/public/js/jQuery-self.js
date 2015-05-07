$(document).ready(function(){
    $(".inner_content").hover(function() {
        $(".inner_content#"+this.id+" .product_image .float-Bar").slideToggle();
    });
});