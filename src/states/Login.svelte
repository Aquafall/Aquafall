<script>
    export let state;
    export let username = ""
    var password = ""
    export let rotur;
    export let pfpurl = "PFP.svg";

    var loggingIn = false;

    import '../css/Login.css';
    import Clock from './Login/Clock.svelte';

    var onLockScreen = true;
    var lockTimeout;

    function changeLockScreenState() {
    if (onLockScreen) {
        clearTimeout(lockTimeout);
        onLockScreen = false;
        lockTimeout = setTimeout(() => {
            onLockScreen = true;
        }, 10000); // Lock screen after 10 seconds of inactivity
    }}

    document.addEventListener("keypress", () => {
        changeLockScreenState();
    });

    document.addEventListener("mousemove", () => {
        if (!onLockScreen) {
            return;
        }
        clearTimeout(lockTimeout);
        lockTimeout = setTimeout(() => {
            onLockScreen = true;
        }, 10000); // Lock screen after 10 seconds of inactivity
    });

    document.addEventListener("keyup", () => {
        changeLockScreenState();
    });
</script>

<!-- svelte-ignore a11y-no-static-element-interactions -->
<!-- svelte-ignore a11y-click-events-have-key-events -->
<div class="login-container" on:click={changeLockScreenState} >
    <div class="bg {!onLockScreen ? "blurred" : ""}"></div>

    <div class="lockscreen {!onLockScreen ? "hidden" : ""}">
        <Clock />
        <p class="bottom">Click to unlock</p>
    </div>
    <!-- svelte-ignore a11y-img-redundant-alt -->
    <img class="pfp {!onLockScreen ? "shown" : ""}" src={pfpurl} alt="Profile Picture">
    {#if !loggingIn}
    <input class={!onLockScreen ? "shown" : ""} type="text" bind:value={username}>
    <input class={!onLockScreen ? "shown" : ""} type="password" bind:value={password}>

    <button class="loginButton {!onLockScreen ? "shown" : ""}" on:click={() => {
        loggingIn = true;
        rotur.login({ user: username, pass: password, md5: true })
            .then((data) => {
                setTimeout(() => { state = "desktop"; }, 1000);
                pfpurl = data["pfp"] || "PFP.svg";
                console.log(data);
            })
            .catch((err) => {
                console.error("Login failed:", err);
                alert("Login failed: " + err.message);
            });
    }}>Login</button>
    {:else}
    <div class="loggingIn">
        <p> {username} </p>
        <p>Logging in...</p>
    </div>
    {/if}
</div>