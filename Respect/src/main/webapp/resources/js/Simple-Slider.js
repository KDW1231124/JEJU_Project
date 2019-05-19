$(function(){

    // Initializing the swiper plugin for the slider.
    // Read more here: http://idangero.us/swiper/api/
    
    // var mySwiper = new Swiper ('.swiper-container', {
    //     loop: true,
    //     pagination: '.swiper-pagination',
    //     paginationClickable: true,
    //     nextButton: '.swiper-button-next',
    //     prevButton: '.swiper-button-prev'
    // });

    /*$(".linkfeat").hover(
        function () {
            $(".textfeat").show(500);
        },
        function () {
            $(".textfeat").hide(500);
        }
    );*/
    

    	var count = $('#rank-list li').length;
        var height = $('#rank-list li').height();
    
        function step(index) {
            $('#rank-list ol').delay(1000).animate({
                top: -height * index,
            }, 100, function() {
                step((index+1) % count);
            });
        }
    
    step(1);
  
    
    
    
});