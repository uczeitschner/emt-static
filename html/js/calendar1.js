import { register } from "https://unpkg.com/@acdh-oeaw/calendar-component@0.0.2/dist/calendar.js";

const de = {
    "months": [
        "Jänner",
        "Februar",
        "März",
        "April",
        "Mai",
        "Juni",
        "Juli",
        "August",
        "September",
        "Oktober",
        "November",
        "Dezember"
    ]
}

register({ picker: "select" });
// register()

async function createCalendar(url, i18n) {
    const response = await fetch(url)
    const data = await response.json()
    const events = data.map((d) => {
        return { ...d, date: new Date(d.date) }
    })

    const calendar = document.querySelector("acdh-ch-calendar");
    calendar.setI18n(i18n);
    calendar.setData({ events });

    calendar.addEventListener("calendar-event-click", (event) => {
        var myModal = new bootstrap.Modal(document.getElementById("dataModal"), {});

        const { date, events } = event.detail;
        const modalBody = document.querySelector('#dataModal .modal-body');
        modalBody.innerHTML = "";
        const myUl = document.createElement("ul")

        events.forEach(item => {
            const li = document.createElement("li");
            if (item.link) {
                li.innerHTML = `
                <a href="${item.link}">${item.label}</a>
            `
            } else {
                li.innerHTML = `${item.label}`
            }

            myUl.appendChild(li)
        });
        modalBody.appendChild(myUl)



        myModal.show()

        // alert(
        //     `Clicked ${events[0].date} with ${events.length} event(s): ${events.map((event) => event.label).join(", ")}.`,
        // );
    });

    const senders = new Map()
    data.forEach(d => {
        if (d.sender?.link.includes("emt_person")) {
            senders.set(d.sender.link, d.sender.label)
        }
    })
    console.log(Array.from(senders))

    const ul = document.createElement('ul');
    senders.forEach((label, link) => {
        const li = document.createElement('li');
        const a = document.createElement('a');
        a.classList.add(link.replace(".html", ""));
        a.href = link
        a.textContent = label
        li.appendChild(a);
        ul.appendChild(li);
    })
    document.querySelector('acdh-ch-calendar-legend')?.append(ul)
}

try {
    await createCalendar("js-data/calendarData.json", de)
} catch (error) {
    console.error("💣", String(error))
}
