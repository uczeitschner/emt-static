const rerender = () => {
  $('body').localize();
}

$(function () {
  // use plugins and options as needed, for options, detail see
  // https://www.i18next.com
  i18next
    .use(i18nextHttpBackend)
    .use(i18nextBrowserLanguageDetector)
    // init i18next
    // for all options read: https://www.i18next.com/overview/configuration-options
    .init({
      debug: false,
      fallbackLng: 'en',
      load: 'languageOnly',
      backend: {
        loadPath: 'locales/{{lng}}/translation.json',
      }
    }, (err, t) => {
      if (err) return console.error(err);
      jqueryI18next.init(i18next, $, { useOptionsAttr: true });
      rerender();
    });
});


var show_this_lang = localStorage.i18nextLng
  var to_show = document.querySelectorAll(`[data-mylang="${show_this_lang}"]`);
  to_show.forEach(function (el) {
    el.style.removeProperty("display")
  });

var hide_this_lang = (localStorage.i18nextLng === "en") ? "de" : "en";
var to_hide = document.querySelectorAll(`[data-mylang="${hide_this_lang}"]`);
console.log(`hide ${hide_this_lang}`)
to_hide.forEach(function (el) {
  el.style.display = 'none';
});

