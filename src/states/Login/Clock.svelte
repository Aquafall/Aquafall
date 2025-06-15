<script>
    import { onMount } from 'svelte';

    let clockInterval;
    let timeElement;
    let dateElement;

    onMount(() => {
        clockInterval = setInterval(() => {
            timeElement.textContent = new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
            dateElement.textContent = new Date().toLocaleDateString();
        }, 1000);

        return () => clearInterval(clockInterval);
    });
</script>

<div class="clock">
    <span class="time" bind:this={timeElement}>{new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' })}</span>
    <span class="date" bind:this={dateElement}>{new Date().toLocaleDateString()}</span>
</div>
<style>
    .clock {
        position: absolute;
        background-color: rgba(0, 0, 0, 0);
        color: white;
        padding: 0.25%;
        text-align: center;
        border-radius: 5px;
        font-family: 'Nunito', monospace;
        font-size: large;
    }

    .time {
        display: block;
        font-weight: bold;
        text-align: inherit;
        font-size: xx-large;
    }

    .date {
        display: block;
        text-align: inherit;
        font-size: x-large;
    }
</style>