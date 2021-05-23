/*global jQuery $*/
jQuery(function ($) {

if (window.matchMedia( "(max-width: 768px)" ).matches) {
/* ウィンドウサイズが 768px以下の場合のコードをここに */
	$(".accordion-content:not(:first-of-type)").css("display", "none");
} else {
/* ウィンドウサイズが 768px以上の場合のコードをここに */
}


$('.js-accordion-title').on('click', function () {
  /*クリックでコンテンツを開閉*/
  $(this).next().slideToggle(200);
  /*矢印の向きを変更*/
  $(this).toggleClass('open', 200);
});

});

