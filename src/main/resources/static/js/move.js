function isClickable( obj, newTab ){
    var $this = obj,
        link = $this.find('a:first'),
        href = link.attr('href'),
        target = link.attr('target');

    if (href == undefined) {
        return;
    }
    if (target == '_blank' || newTab) {
        window.open(href);
    } else {
        window.location.href = href;
    }
}

(function($) {
$('.employee-block').on('click', function (evt) {
    if (!$(evt.target).is('a')) {
        isClickable($(this));
    }
});
})(jQuery);