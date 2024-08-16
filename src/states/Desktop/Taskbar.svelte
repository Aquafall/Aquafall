<script>
    import Logo from "../../lib/general/Logo.svelte";

    
</script>

<div class="taskbar">
    <div class="left">
        <div class="clickable">
            <img src="/logo.svg" alt="start">
        </div>
    </div>
    <div class="right">N</div>
</div>

<style>
    .taskbar {
        display: flex;
        justify-content: center;
        position: absolute;
        bottom: 0px;
        height: 5%;
        width: 100%;
        background-color: black;
        opacity: 0.8;
    }
    img {
        height: 190px;
        max-height: 100%;
    }
    .left {
        padding-left: 15px;
        display: flex;
        align-items: center;
        justify-content: left;
        left: 0px;
        width: 70%;
    }
    .right {
        right: 0px;
        width: 30%;
    }
    .clickable {
        height: 190px;
        max-height: 70%;
    }
    .clickable:hover {
        cursor: wait;
    }
</style>
