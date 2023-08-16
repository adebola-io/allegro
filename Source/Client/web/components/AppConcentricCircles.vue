<script setup lang="ts">
const props = defineProps<{ gradient: string }>();
</script>

<template>
   <div style="{{'--gradient': props.gradient}}" class="outermost-circle"></div>
</template>

<style scoped>
.outermost-circle {
   position: fixed;
   z-index: -99;
   height: 400%;
   aspect-ratio: 1;
   background-image: var(--gradient);
   border-radius: 50%;
}
</style>
