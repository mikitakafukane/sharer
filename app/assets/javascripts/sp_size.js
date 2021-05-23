/*global jQuery $*/
jQuery(function ($) {

  $('.js-accordion-title').on('click', function () {
    /*クリックでコンテンツを開閉*/
    // $(this).next().slideToggle(200);
    // /*矢印の向きを変更*/
    // $(this).toggleClass('open', 200);
    $(".js-accordion-title").not(this).removeClass("open");
    //クリックされたjs-accordion-title以外のcontentを閉じる
    $(".js-accordion-title").not(this).next().slideUp(300);
    //thisにopenクラスを付与
    $(this).toggleClass("open");
    //thisのcontentを展開、開いていれば閉じる
    $(this).next().slideToggle(300);
  });

});