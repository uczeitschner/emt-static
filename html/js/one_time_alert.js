document.addEventListener('DOMContentLoaded', function() {
    if(localStorage.getItem('popState') !== 'shown') {
        setTimeout(function() {
            document.getElementById('once-popup').style.display = 'block';
        }, 20);
        localStorage.setItem('popState', 'shown');
    } else {
        console.log("info already shown")
    }

    document.getElementById('popup-close').addEventListener('click', function() {
        document.getElementById('once-popup').style.display = 'none';
    });

    document.getElementById('once-popup').addEventListener('click', function() {
        document.getElementById('once-popup').style.display = 'none';
    });
});