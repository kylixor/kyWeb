<template>
    <Line v-if="loaded" :chart-data="chartData" :chart-options="chartOptions" />
</template>

<script>
import { Line } from 'vue-chartjs'
import {
    Chart as ChartJS,
    Title,
    Tooltip,
    Legend,
    LineElement,
    LinearScale,
    PointElement,
    CategoryScale,
} from 'chart.js'

ChartJS.register(
    Title,
    Tooltip,
    Legend,
    LineElement,
    LinearScale,
    PointElement,
    CategoryScale
)

export default {
    name: 'LineGraph',
    components: { Line },
    data: () => ({
        loaded: false,
        chartData: null,
        chartOptions: {
            responsive: true,
            maintainAspectRatio: false,
            spanGaps: true,
        }
    }),
    async mounted() {
        const userlist = await fetch('/api/graph')
        const data = await userlist.json()

        // Convert scores into a rolling average
        var games_played = 0
        var score_sum = 0
        var average = NaN
        for (var i = 0; i < data.datasets[0].data.length; i++) {
            if (data.datasets[0].data[i] != 0) {
                games_played++
                score_sum += data.datasets[0].data[i]
            }
            if (games_played > 0) {
                average = score_sum / games_played
            }
            data.datasets[0].data[i] = average
        }

        this.chartData = data
        this.loaded = true
    }
}
</script>
