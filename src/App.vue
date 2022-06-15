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

		try {
			const test = await fetch('http://localhost:3000')
			console.log(test)
			const { userlist } = await fetch('http://localhost:3000/fake-data')
			console.log(userlist)
			this.chartdata = userlist
			this.chartData = {
				labels: ['January', 'February', 'March'],
				datasets: [
					{
						label: 'Data One',
						backgroundColor: '#f87979',
						data: [40, 30, 12]
					}
				]
			}

			this.loaded = true
		} catch (e) {
			console.error(e)
		}
	}
}
</script>
