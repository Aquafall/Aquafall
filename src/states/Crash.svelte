<script>
    export let state;
    export let crasherr;
    import { onMount } from "svelte";
    import { log } from "../resources/logging/log";

    var div;

    log("!!! [[[ SYSTEM HAS CRASHED ]]] !!!")
    
    import Logo from "../lib/general/Logo.svelte";
</script>

<div bind:this={div}>
    <Logo />
    <h2> Something went wrong, and Aquafall cannot continue. </h2>
    <p> We've gone ahead and sent a bug report to the Aquafall team, and will reboot shortly. </p>
    <p><small>Error info: {crasherr}</small></p>
</div>

<style>
    div {
        font-family: "Source Code Pro";
        width: 100%;
        height: 100%;
        position: absolute;
        left: 0px;
        top: 0px;
        padding: 10px;
        animation: fadein ease-in 0.5s forwards, fadeout ease-in 0.5s 4.5s forwards;
        background: linear-gradient(135deg, rgba(0,212,255,1) 0%, rgba(9,9,121,1) 50%, rgba(2,0,36,1) 100%);
        color: white;
        font-size: x-large;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        text-align: center;
    }

    @keyframes fadein {
        0% {
            opacity: 0;
        }

        100% {
            opacity: 1;
        }
    }
    @keyframes fadeout {
        0% {
            opacity: 1;
        }

        100% {
            opacity: 0;
        }
    }
</style>