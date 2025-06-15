<script>
  import { onMount } from "svelte";

  let clockInterval;
  let time;
  let date;

  onMount(() => {
    const dateObject = new Date();
    clockInterval = setInterval(() => {
      time = dateObject.toLocaleTimeString([], {
        hour: "2-digit",
        minute: "2-digit",
      });
      date = dateObject.toLocaleDateString();
    }, 1000);

    return () => clearInterval(clockInterval);
  });
</script>

<div class="clock">
  <span class="time">{time}</span>
  <span class="date">{date}</span>
</div>

<style>
  .clock {
    position: absolute;
    background-color: rgba(0, 0, 0, 0);
    color: white;
    padding: 0.25%;
    border-radius: 5px;
    font-family: "Source Code Pro", monospace;
    font-size: 14px;
  }

  .time {
    display: block;
    font-weight: bold;
  }

  .date {
    display: block;
    font-size: 12px;
  }
</style>
