<script>
    import StartMenu from "./Desktop/StartMenu.svelte";
import Taskbar from "./Desktop/Taskbar.svelte";

export let username = "";
    export let state;
    export let crasherr;
    export let rotur;
    let startButton;

    export let pfpurl = "/PFP.svg"; // Default profile picture URL

    export let startMenuOpen = false;

    // crasherr = "Desktop cannot continue. FINISH ME"
    // state="crash"
</script>

<div>
    <Taskbar bind:startMenuOpen bind:startButton></Taskbar>
    <StartMenu bind:startMenuOpen bind:rotur bind:username bind:startButton bind:pfpurl></StartMenu>
</div>

<style>
    div {
        background-image: url(/wallpapers/Garion-Japan.svg);
        background-size: cover;
        background-position: center;
        width: 100%;
        height: 100%;
        max-width: 100%;
        max-height: 100%;
        position: absolute;
        top: 0px;
        left: 0px;
    }
</style>