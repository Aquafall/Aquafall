<script>
    export let username = "";
    export let pfpurl = "PFP.svg";
    export let startMenuOpen = false; 
    export let rotur;   
    export let startButton;

    
    let startMenu;

    document.addEventListener('click', (event) => {
        if (startMenu && !startMenu.contains(event.target) && !startButton.contains(event.target) && startMenuOpen) {
            startMenuOpen = false;
        }
    });
</script>

<div class="start-menu {startMenuOpen ? 'open' : ''}" bind:this={startMenu}>
    <div class="start-menu-content">
        <div class="start-menu-header">
            <img class="spfp" src={pfpurl} alt="Profile Picture">
            <div class="username">{username}</div>
        </div>
    </div>
</div>

<style>
    .start-menu {
        position: absolute;
        bottom: calc(15px);
        left: 1%;
        width: 30%;
        max-width: 450px;
        height: 50%;
        max-height: 800px;
        background-color: rgba(30, 30, 30, 0.7);
        color: white;
        border-radius: 15px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        z-index: 1000;
        box-shadow: #000 0px 0px 10px 2px;
        backdrop-filter: blur(5px);
        opacity: 0;
        visibility: collapse;
        transition: 0.3s ease-in-out;
    }
    .start-menu.open {
        display: block;
        opacity: 1;
        visibility: visible;
        bottom: calc(5% + 15px);
    }
    .start-menu-header {
        display: flex;
        align-items: center;
        border-bottom: 1px solid #444;
        width: 100%;
        height: 15%;
    }
    .spfp {
        max-height: 8%;
        max-width: 8%;
        border-radius: 50%;
        margin: 10px;
        outline: #000 2px solid;
    }
</style>
