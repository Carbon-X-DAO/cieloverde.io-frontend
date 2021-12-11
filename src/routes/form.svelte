<script>
    import { onMount } from 'svelte';
    let form;

    let genders = ["Masculino", "Femenino", "Otro"];
    let dropdownNames = ["gender", "age", "daily_qty", "weekly_qty", "monthly_qty"]
	
	let id_no = null;
	let phone = null;

	function stripWhitespaceFromID(e) {
		id_no = e.target.value.trim();
	}

	function stripWhitespaceFromPhone(e) {
		phone = e.target.value.trim();
	}

    onMount(() => {
	    for (name of dropdownNames) {
		    let selection = form.querySelector(`[name="${name}"]`);
		    selection.addEventListener('change', () => {
			    selection.classList.remove("select-placeholder")
			})
		}

		Swal.fire({
			confirmButtonColor: "#515141",
			text: 'Complete su información a continuación para recibir su boleto por correo electrónico.',
			footer: "Luego, será redirigido a la pantalla de casa.",
		});
	});
	let is_newsletter;
	let is_gift_box;
	let is_authorized;
</script>

<svelte:head><script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script></svelte:head>

<main>
	<div class="content form">
		<form action="/submit" method="POST" bind:this={form}>
			<section>
			<h2>Información Personal</h2>
			<input type="text" id="fname" name="fname"  placeholder="Nombre *" class="wide-input" required>
			<input type="text" id="lname" name="lname" placeholder="Apellidos *" class="narrow-input" required>
			<input type="text" id="country" name="country" placeholder="Pais" class="narrow-input">
			<input type="text" id="department" name="department" placeholder="Departmento" class="narrow-input">
			<input type="text" id="city" name="city" placeholder="Ciudad / Municipio" class="narrow-input">
			<input type="text" id="town" name="neighborhood" placeholder="Barrio" class="narrow-input">
			<input type="text" id="street_address" name="street_address" placeholder="Dirección de Residencia" class="narrow-input">
			<input type="text" id="id_no" name="id_no" pattern="^[0-9]{'{'}6,10{'}'}$" placeholder="Numero de Celdula *" value={id_no} on:input={stripWhitespaceFromID} class="narrow-input" required>
			<input type="text" id="phone" name="phone" pattern="^3[0-9]{'{'}9{'}'}$" placeholder="Número de Celular (3XXXXXXXXXX)" value={phone} on:input={stripWhitespaceFromPhone}  class="wide-input">
			<input type="text" id="email" name="email" placeholder="Correo Electrónico *" class="wide-input" required>
			<select name="gender" class="narrow-input select select-placeholder">
				<option value="label" disabled selected hidden>Sexo</option>
				{#each genders as gender}
				<option value={gender}>{gender}</option>
				{/each}
			</select>
			<select name="age" class="narrow-input select select-placeholder">
				<option value="label" disabled selected hidden>Edad</option>
				{#each Array(100) as _, i}
					{#if i>15}
					<option option={i}>{i}</option>
					{/if}
				{/each}
			</select>
			</section>

			<section>
			<h2>Consumo de Marihuana</h2>
			<select name="daily_qty" class="narrow-select select select-placeholder">
				<option disabled selected hidden>Diaria</option>
				<option value="0g-1g">0g-1g</option>
				<option value="1g-2g">1g-2g</option>
				<option value="3g-5g">3g-5g</option>
				<option value="5g+">5g+</option>
			</select>
			<select name="weekly_qty" class="narrow-select select select-placeholder">
				<option disabled selected hidden>Semanalmente</option>
				<option value="0g-5g">0g-5g</option>
				<option value="5g-10g">5g-10g</option>
				<option value="10g-20g">10g-20g</option>
				<option value="20g+">20g+</option>
			</select>
			<select name="monthly_qty" class="narrow-select select select-placeholder">
				<option disabled selected hidden>Mensual</option>
				<option value="0g-5g">0g-5g</option>
				<option value="5g-15g">5g-15g</option>
				<option value="15g-28g">10g-28g</option>
				<option value="28g+">28g+ (1 onza)</option>
			</select>
			
			<div class="checkbox">
				<input type="checkbox" id="newsletter" name="newsletter" value={is_newsletter} bind:checked={is_newsletter}>
				<label for="newsletter">Subscribete al boletín</label>
			</div>
			<div class="checkbox">
				<input type="checkbox" id="gift_box" name="gift_box" value={is_gift_box} bind:checked={is_gift_box}>
				<label for="gift_box">Caja de regalo</label>
			</div>

			<div class="checkbox">
				<input type="checkbox" id="authorized" name="authorized" value={is_authorized} bind:checked={is_authorized} required>
				<label for="authorized">Autorización de uso de información personal *</label>
			</div>

			<div class="btn-submit-wrap">
				<input type="submit" value="Entregar" class="btn-filled">
			</div>

			</section>
		</form>
	</div>
</main>

<style>
.content {
	width: 100%;
    max-width: 660px;
    margin: 0 auto;
    padding: 0 15px;
    margin: 2rem auto 1rem;
}

h2 {
	font-size: 1.5rem;
	color: #ffffff;
	text-align: center;
	font-weight: 600;
}

/* hide default arrow */
select {
  -webkit-appearance: none;
  -moz-appearance: none;
  text-indent: 1px;
  text-overflow: '';
}
select::-ms-expand {
    display: none;
}

.select {
  background-image:
    linear-gradient(45deg, transparent 50%, #fff 50%),
    linear-gradient(135deg, #fff 50%, transparent 50%),
    linear-gradient(to right, #fff, #fff);
  background-position:
    calc(100% - 20px) calc(17px + 2px),
    calc(100% - 15px) calc(17px + 2px),
    calc(100% - 40px) 8px;
  background-size:
    5px 5px,
    5px 5px,
    1px 27px;
  background-repeat: no-repeat;
}

.select:focus {
  background-image:
    linear-gradient(45deg, var(--accent-color) 50%, transparent 50%),
    linear-gradient(135deg, transparent 50%, var(--accent-color) 50%),
    linear-gradient(to right, var(--accent-color), var(--accent-color));
  background-position:
    calc(100% - 15px) 17px,
    calc(100% - 20px) 17px,
    calc(100% - 40px) 8px;
  background-size:
    5px 5px,
    5px 5px,
    1px 27px;
  background-repeat: no-repeat;
  border-color: var(--accent-color);
  outline: 0;
}


.select:-moz-focusring {
  color: transparent;
  text-shadow: 0 0 0 #000;
}

input[type="checkbox"] {
	background: #ccc;
	box-sizing: border-box;
	height: 20px;
	width: 20px;
	cursor: pointer;
}

input[type="text"], input[type="submit"], select {
	background-color: transparent;
	border: none;
	border: 2px solid #fff;
	height: 48px;
	width: 100%;
	padding: 2px 10px;
	border-radius: 6px;
	box-sizing: border-box;
	font-size: 16px;
	color: #fff;
	margin-bottom: 15px;
	outline: transparent;
	font-weight: 600;
	cursor: pointer;
}

input::placeholder, 
select::placeholder {
	color: #fff;
	opacity: 0.8;
	font-size: 14px;
	font-weight: 300;
}
input:focus::placeholder,
select:focus::placeholder {
	opacity: 1;
}
input:focus,
select:focus {
	border-color: var(--accent-color);
}

.select-placeholder {
	font-weight: 300;
	font-size: 14px;
	opacity: 0.8;
}

option {
	color: #000 !important;
}

.btn-submit-wrap {
	display: flex;
	justify-content: flex-end;
	width: 100%;
}

.btn-filled {
	background: #fff;
	color: #000;
	width: 160px;
}

.checkbox {
	width:100%;
	color: white;
	margin-bottom:10px;
}

@media (min-width: 620px) {
	section {
		display: flex;
		flex-wrap: wrap;
		justify-content: space-between;
	}
	.narrow-input {
		width: calc(50% - 10px);
	}
}

</style>
