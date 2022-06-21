<template>
	<div class="container">
		<Bar v-if="loaded" :chart-data="chartData" />
	</div>
</template>

<script>
import { Bar } from 'vue-chartjs'
import { Chart as ChartJS, Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale } from 'chart.js'

ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale)

export default {
	name: 'BarChart',
	components: { Bar },
	data: () => ({
		loaded: false,
		chartData: null
	}),
	async mounted() {
		this.loaded = false

		const userlist = await fetch('http://localhost:3000/fake-data')
		const data = await userlist.json()
		this.chartData = data
		this.loaded = true
	}
}
</script>
