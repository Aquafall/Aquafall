<script>
    import Boot from "./states/Boot.svelte";
    import Crash from "./states/Crash.svelte";
    import Desktop from "./states/Desktop.svelte";

    let state = "boot";

    let crasherr = "Unknown"

    
</script>

<div>
    {#if state === "boot"}
        <Boot bind:state></Boot>
    {:else if state === "desktop"}
        <Desktop bind:state bind:crasherr></Desktop>
    {:else if state === "login"}
        <Desktop bind:state bind:crasherr></Desktop>
    {:else if state === "crash"}
        <Crash bind:state bind:crasherr></Crash>
    {:else}
        {crasherr="StateError: unknown state"}
        <Crash bind:state bind:crasherr></Crash>
    {/if}

    {state}
</div>

<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
    href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&family=Nunito:ital,wght@0,200..1000;1,200..1000&family=Source+Code+Pro:ital,wght@0,200..900;1,200..900&display=swap"
    rel="stylesheet"
/>

<style>
    * {
        font-family: "Nunito";
    }
</style>
