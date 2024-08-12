<script>
</script>

<div class="main">
	<img src="./logo.svg" alt="logo" class="bootLogo" />
	<div>
		<div class="loader"></div>
		<h3>Loading Aquafall...</h3>
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
		gap: 25%;
	}
	div {
		flex-direction: column;
		display: flex;
		align-items: center;
		justify-content: center;
		color: #ffffff;
	}
	.bootLogo {
		max-width: 25%;
		max-height: 25%;
	}
	.loader {
		position: relative;
		border: 7px solid #ffffff;
		border-top: 7px solid #cccccc;
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
</style>
