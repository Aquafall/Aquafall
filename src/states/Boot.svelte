<script>
    import { onMount } from "svelte";
    import { log } from "../resources/logging/log";
	import Logo from "../lib/general/Logo.svelte";
    export let state;
    
	log("Booting")
	

    onMount(function() {
        setTimeout(function() {
            state = "login";
        }, 5000)
    })
    
</script>

<div class="main">
	<Logo />
	<div>
		<div class="loader"></div>
	</div>
</div>


<style>
	.main {
		width: 100%;
		height: 100%;
		background-color: black;
		position: absolute;
		margin: 0;
		padding: 0;
		border: 0;
		left: 0px;
		top: 0px;
		gap: 10%;
		animation: bootFade 10s ease-in-out normal forwards;
		display: flex;
		align-items: center;
		justify-content: center;
		flex-direction: column;
	}
	div {
		flex-direction: column;
		display: flex;
		align-items: center;
		justify-content: center;
		color: #ffffff;
	}
	
	.loader {
		position: relative;
		border: 9px solid #121212;
		border-top: 9px solid #555555;
		border-radius: 50%;
		width: 60px;
		height: 60px;
		animation: spin 0.7s linear infinite;
	}

	@keyframes spin {
		0% {
			transform: rotate(0deg);
		}
		100% {
			transform: rotate(360deg);
		}
	}

    @keyframes bootFade {
        0% {
            opacity: 1;
        }
        95% {
            opacity: 1;
        }
        100% {
            opacity: 0;
        }
    }
</style>
