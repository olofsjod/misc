#!python3

from icalendar import Calendar, Event, vCalAddress, vText
import arrow

def main():
    cal = Calendar()

    # must have this apparently
    cal.add("prodid", "-//Acme Corp//Olof Sjödin//SV")
    cal.add("version", "2.0")

    event = Event()

    utc = arrow.utcnow()
    local = utc.to("local")

    event_start = arrow.get("2017-03-08 21:00", "YYYY-MM-DD HH:mm").datetime
    event_stop = arrow.get("2017-03-08 23:59", "YYYY-MM-DD HH:mm").datetime
    time_now = local.datetime

    event.add("summary", "Terraria")
    event.add("dtstart", event_start)
    event.add("dtend", event_stop)
    event.add("dtstamp", time_now)

    cal.add_component(event)

    with open("example.ics", "w") as fh:
        fh.write(cal.to_ical().decode("utf-8"))
main()
