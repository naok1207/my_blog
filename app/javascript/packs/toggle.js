$(document).on('turbolinks:load', function() {

    $(".menu-trigger").click(function () {
        $(this).toggleClass("active");
        $('.drop').toggleClass('active');
      });
});
