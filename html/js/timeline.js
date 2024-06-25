var options = {
    script_path: 'vendor/timeline3/js/',
    language: "de",
    hash_bookmark: true,
    timenav_position: "top",
    font: null
}
$(document).ready(function () {
    var embed = document.getElementById('timeline-embed');
    embed.style.height = getComputedStyle(document.body).height;
    window.timeline = new TL.Timeline('timeline-embed', 'js-data/timeline.json', options);
    window.addEventListener('resize', function () {
        var embed = document.getElementById('timeline-embed');
        embed.style.height = getComputedStyle(document.body).height;
        timeline.updateDisplay();
    })
});