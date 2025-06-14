<script>
    export let state;
    export let username = ""
    var password = ""
    export let rotur;
    export let PFP = "PFP.svg";

    import '../css/Login.css';
</script>

<div class="login-container">
    <div class="bg"></div>
    <img class="pfp" src="PFP.svg" alt="Profile Picture">
    <input type="text" bind:value={username}>
    <input type="password" bind:value={password}>

    <button class="loginButton" on:click={() => {
        rotur.login({ user: username, pass: password, md5: true })
            .then((data) => {
                state = "desktop";
                PFP = data["pfp"] || "PFP.svg";
                console.log(data);
            })
            .catch((err) => {
                console.error("Login failed:", err);
                alert("Login failed: " + err.message);
            });
    }}>Login</button>
</div>