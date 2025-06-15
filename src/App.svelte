<script>
    import Boot from "./states/Boot.svelte";
    import Crash from "./states/Crash.svelte";
    import Desktop from "./states/Desktop.svelte";
    import Login from "./states/Login.svelte";
    import Rotur from "./lib/rotur/rotur";

    let debugMode = false; // Set to true to enable debug mode
    let http = new XMLHttpRequest();
    http.open("GET", "/versionHash.txt", false);
    http.send(null);

    if (http.status === 200) {
        console.log("Version file loaded successfully");
    } else {
        console.error("Failed to load version file");
    }
    console.log("Version:", http.responseText.trim());
    let versionHash = http.responseText.trim();

    if (versionHash == "No version hash, not built.") {
        debugMode = true;
    }

    let username = "";

    let state = "boot";

    let pfpurl = "/PFP.svg"; // Default profile picture URL

    let crasherr = "Unknown";

    let rotur = new Rotur({
        name: "Aquafall",
        version: "0.1.0",
        designation: "aqf"
    });

    rotur.connect().then(() => {
        console.log("Rotur connected successfully");
    }).catch((err) => {
        console.error("Rotur connection failed:", err);
        crasherr = "Rotur connection failed: " + err.message;
        state = "crash";
    });

    // rotur.
</script>

<div>
    {#if state === "boot"}
        <Boot bind:state bind:versionHash></Boot>
    {:else if state === "desktop"}
        <Desktop bind:state bind:crasherr bind:rotur bind:username bind:pfpurl></Desktop>
    {:else if state === "login"}
        <Login bind:state bind:crasherr bind:rotur bind:username bind:pfpurl></Login>
    {:else if state === "crash"}
        <Crash bind:state bind:crasherr ></Crash>
    {:else}
        {(crasherr = "StateError: unknown state")}
        <Crash bind:state bind:crasherr ></Crash>
    {/if}

    {#if debugMode}
        <p class="debuginfo">DEBUG MODE ENABLED <br> Version: {versionHash} <br> State: {state}</p>
    {/if}
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

    .debuginfo {
        position: fixed;
        top: 0px;
        left: 5px;
        color: #000;
        -webkit-text-stroke: 0.5px white;
        font-size: x-large;
        font-weight: 700;
        z-index: 1000;
    }
</style>
