<script context="module">
	export const prerender = true;
	import { page } from '$app/stores';
</script>

<svelte:head>
	<title>Casa</title>
</svelte:head>

<div class="container">
	<div class="banner">
		<div class="banner__img">
			<div class="background"></div>
		</div>
		<div class="banner__info">
			<h1>Plantas<br>Medicinales</h1>
			<h3>Cielo Verde</h3>
			<h3>GreenSky Cannabis Company S.A.S</h3>
			<p>Dando a la planta el cuidado que se merece</p>
			<p>Nuestro objetivo de producir medicina neutra en carbono</p>
			<p>Nuestro producto se lanzará en 2022</p>
		</div>
	</div>

	<ul class="cards">
		<li class="card" class:active={$page.path === '/about'}><a sveltekit:prefetch href="/about">
			<span class="fa-stack fa-2x">
				<i class="fa fa-globe fa-stack-1x"></i>
			</span>
			<p>Sobre Nosotros</p>
		</a></li>
		<li class="card" class:active={$page.path === '/form'}><a sveltekit:prefetch href="/form">
			<span class="fa-stack fa-2x">
				<i class="fa fa-pagelines fa-stack-1x"></i>
			</span>
			<p>Formalario</p>
		</a></li>
	</ul>

</div>


<style>
	.cards {
		padding-left: 0;
		margin-top: 100px;
	}
	.card {
		list-style: none;
		text-align: center;
		background-color: #ffffff;
		margin-bottom: 15px;
		border: 2px solid #ffffff;
		border-radius: 12px;
		cursor: pointer;
		border-color: #ffffff;
		transition: all 0.2s ease-in-out;
	}

	.card p {
		font-size: 20px;
		text-transform: uppercase;
		font-weight: 700;
		color: #252525;
		letter-spacing: 1px;
		margin: 0;
	}

	.card .fa-stack {
		margin-top: -12px;
		margin-bottom: -10px;
	}

	.card:hover {
		background-color: var(--primary-color);
		/* border-color: #fff; */
	}
	.card:hover a,
	.card:hover p {
		transition: all 0.2s ease-in-out;
		color: #ffffff;
	}

	.card a {
		color: #232323;
		display: block;
		padding: 18px;
		text-decoration: none;
	}


	@media (min-width: 620px) {
		.cards {
			display: flex;
			justify-content: center;
			margin: 0 -15px;
			margin-top: 90px;
		}
		.card {
			width: calc(100% / 3 - 30px);
			margin: 0 15px;
		}
	}

	.banner__info {
		max-width: 100%;
		margin-top: 90px;
	}
	.banner__info h1 {
		margin-bottom: 0;
	}

	.banner__info .ghost-btn {
		margin-top: 24px;
	}

	.banner__img {
		position: absolute;
		right: 0;
		top: -51px;
		display: block;
		z-index: -1;
		width: 100%;
		height: 100vh;
		box-shadow: 0 0 10px 10px #86B27522 inset;
		border-radius: 3px;
	}

	/* overlay above image */
	.banner__img::before {
		content: "";
		position: absolute;
		display: block;
		height: 100%;
		width: 100%;
		background-color: rgb(10 8 8 / 45%);
	}

	.background {
		background-image: url('/static/images/background.jpg');
		background-repeat: no-repeat;
		background-size: cover;
		height: inherit;
		width: inherit;
		background-position: bottom left;
	}

	@media (min-width: 320px) {
		h1 {
			text-align: left;
			color: #ffffff;
			font-size: 38px;
			font-weight: bold;
		}
		
		h3 {
			font-size: 26px;
		}
	}
	@media (min-width: 600px) {
		.banner__info {
			max-width: calc(66.6% - 15px);
			margin-top: 120px;
		}

		h1 {
			font-size: 88px;
		}

		h3 {
			font-size: 64px;
		}

		.banner__img {
			width: 79vw;
			height: 700px;
		}
	}

</style>
