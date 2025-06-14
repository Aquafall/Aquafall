<script>
    import Logo from "../../lib/general/Logo.svelte";
    import Clock from "./Clock.svelte";

    export let startButton;

    export let startMenuOpen = false;
</script>

<div class="taskbar">
    <div class="taskbarBlur"></div>
    <div class="left">
        <div class="clickable">
            
            <button class="startButton {startMenuOpen ? 'open' : ''}" bind:this={startButton} on:click={() => { startMenuOpen = !startMenuOpen }}><img src="/logo.svg" alt="start" /></button>
            
        </div>
    </div>
    <div class="right"><Clock /></div>
</div>

<style>
    .taskbar {
        display: flex;
        justify-content: center;
        position: absolute;
        bottom: 0px;
        height: 5%;
        width: 100%;
        background-color: transparent;
        overflow: hidden;
        backdrop-filter: blur(5px);
        z-index: 5000;
    }
    .taskbarBlur {
        position: absolute;
        bottom: -25%;
        left: -5%;
        height: 150%;
        width: 150%;
        background-color: rgb(30,30,30);
        opacity: 0.8;
        z-index: 0;
    }
    img {
        max-height: 100%;
    }
    .startButton {
        height: 100%;
        width: 100%;
        background-color: #191919;
        border-radius: 5px;
        border: none;
        padding: 5px;
        z-index: 10;
        transition: 0.2s ease-in-out;
    }
    .startButton.open {
        background-color: #222;
    }
    .left {
        padding-left: 15px;
        display: flex;
        align-items: center;
        justify-content: left;
        left: 0px;
        width: 70%;
        z-index: 10;
    }
    .right {
        padding-right: 15px;
        display: flex;
        align-items: center;
        justify-content: right;
        right: 0px;
        width: 30%;
        z-index: 10;
    }
    .clickable {
        height: 190px;
        max-height: 70%;
    }
</style>
