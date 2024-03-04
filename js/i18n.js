const lngs = {
  en: { nativeName: 'English' },
  de: { nativeName: 'Deutsch' },
};

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
      Object.keys(lngs).map((lng) => {
        const opt = new Option(lngs[lng].nativeName, lng);
        if (lng === i18next.resolvedLanguage) {
          opt.setAttribute("selected", "selected");
        }
        $('#languageSwitcher').append(opt);
      });
      $('#languageSwitcher').change((a, b, c) => {
        const chosenLng = $(this).find("option:selected").attr('value');
        var hide_this_lang = (chosenLng === "en") ? "de" : "en";
        var show_this_lang = chosenLng
        var to_show = document.querySelectorAll(`[data-mylang="${show_this_lang}"]`);
        to_show.forEach(function (el) {
          el.style.removeProperty("display")
        });
        var to_hide = document.querySelectorAll(`[data-mylang="${hide_this_lang}"]`);
        console.log(`hide ${hide_this_lang}`)
        to_hide.forEach(function (el) {
          el.style.display = 'none';
        });
        i18next.changeLanguage(chosenLng, () => {
          rerender();
        });
      });

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

