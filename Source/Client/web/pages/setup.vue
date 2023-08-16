<template>
   <div class="heading">Setup your parameters.</div>

   <template v-if="tracks.data">
      <div v-for="emotion in Object.values(emotion_mapping.ekman)">
         <h2 class="tracks-select-prompt">
            Which of these tracks makes you feel <span>{{ emotion }}?</span>
         </h2>

         <div class="initial-tracks-lineup">
            <Track small v-for="track in tracks.data[emotion]" />
         </div>
      </div>
      <div class="link-container">
         <NuxtLink class="continue-link" to="/home">Continue</NuxtLink>
      </div>
   </template>
</template>

<script setup lang="ts">
const tracks = useFetch("/api/tracks/raw");
</script>

<style>
@import "styles/index.css";
</style>
<style scoped>
.tracks-select-prompt {
   color: var(--interface-colors-pale-purple, #f2d7ee);
}
.link-container {
   display: flex;
   justify-content: center;
   align-items: center;
   width: 100%;
}
.continue-link {
   margin-top: 50px;
   text-decoration: none;
   display: flex;
   width: 37.75rem;
   height: 3.6875rem;
   padding: 0.4375rem 0rem;
   justify-content: center;
   align-items: center;
   border-radius: 0.4375rem;
   background: var(--interface-colors-finn, #69306d);
   color: #fff;
   font-size: 1.25rem;
   font-style: normal;
   font-weight: 400;
   line-height: normal;
   margin-bottom: 60px;
}
.initial-tracks-lineup {
   display: flex;
   overflow-x: scroll;
}
</style>
