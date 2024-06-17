import { register } from "https://unpkg.com/@acdh-oeaw/calendar-component@0/dist/calendar.js";
import de from "https://unpkg.com/@acdh-oeaw/calendar-component@0/dist/i18n/de.js";


register({ picker: "select" });
// register()

function createCalendar(i18n, events, onEventClick) {
    const calendar = document.querySelector("acdh-ch-calendar");

    if (i18n != null) {
        /** Optionally set locale, defaults to english. */
        calendar.setI18n(i18n);
    }

    calendar.setData({ events });

    calendar.addEventListener("calendar-event-click", onEventClick);
}

function onEventClick(event) {
    const { date, events } = event.detail;

    alert(
        `${date} mit ${events.length} Ereignissen:\n${events
            .map((event) => {
                return `- ${event.label}`;
            })
            .join("\n")}.`,
    );
}

async function request(url) {
    const response = await fetch(url);
    const events = await response.json();
    return events.map((event) => {
        return { ...event, date: new Date(event.date) };
    });
}

try {
    const events = await request("js-data/calendarData.json");
    createCalendar(de, events, onEventClick);
    console.log("Successfully created calendar.");
} catch (error) {
    console.error("Failed to create calendar.\n", String(error));
}