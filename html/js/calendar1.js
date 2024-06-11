import { register } from "https://unpkg.com/@acdh-oeaw/calendar-component@0.0.1/dist/calendar.js";

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

register();

const calendar = document.querySelector("acdh-ch-calendar");

calendar.setI18n(de);

const events = [
    { date: new Date(Date.UTC(2021, 8, 26)), label: "My birthday", kind: "birthday", link: "aweseom.html" },
    { date: new Date(Date.UTC(2021, 8, 26)), label: "My birthday", kind: "birthday" },
    { date: new Date(Date.UTC(2022, 8, 26)), label: "My birthday", kind: "birthday" },
    { date: new Date(Date.UTC(2023, 8, 26)), label: "My birthday", kind: "birthday" },
    { date: new Date(Date.UTC(2024, 8, 26)), label: "My birthday", kind: "birthday" },
    { date: new Date(Date.UTC(2024, 8, 26)), label: "Birthday party", kind: "party" },
];

calendar.setData({ events });

calendar.addEventListener("calendar-event-click", (event) => {
    const { date, events } = event.detail;
    console.log(event)

    alert(
        `Clicked ${date} with ${events.length} event(s): ${events.map((event) => event.label).join(", ")}.`,
    );
});