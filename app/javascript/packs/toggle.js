$(function () {
    $(".menu-trigger").click(function () {
        $(this).toggleClass("active");
        $('.drop').toggleClass('active');
      });
});