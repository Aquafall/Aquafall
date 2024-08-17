import dayjs from "dayjs";

export function log(Log) {
    var date = new Date().getTime()

    const timestamp = dayjs(date || 0).format("HH:mm:ss.mmm");

    console.log("[Aquafall]" + " @ "+timestamp+" " + Log)
}