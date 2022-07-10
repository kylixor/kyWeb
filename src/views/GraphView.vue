<script setup>
import LineGraph from '../components/LineGraph.vue';
</script>

<template>
    <div class="graph">
        <LineGraph />
    </div>
</template>

<style>
@media (min-width: 1024px) {
    .graph {
        min-height: 100vh;
        display: flex;
        align-items: center;
    }
}
</style>