<script>
    import Taskbar from "./Desktop/Taskbar.svelte";

    export let state;
    export let crasherr;

    // crasherr = "Desktop cannot continue. FINISH ME"
    // state="crash"
</script>

<div>
    <Taskbar></Taskbar>
</div>

<style>
    div {
        background-image: url(/wallpapers/Garion-Japan.jpg);
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