<template>
   <div class="preamble">
      <div class="heading">
         You are: <span>{{ emotion }}.</span>
      </div>
      <div class="subtext">
         The system has detected that you are {{ emotion }}.
      </div>
      <div class="subtext">Here is some music that matches your mood.</div>

      <div class="track-lineup">
         <template v-if="tracks.data">
            <Track v-for="track in tracks.data" />
         </template>
      </div>
   </div>
</template>

<script setup lang="ts">
import { Emotion } from "../../utils";
const { params } = useRoute();

const emotion = new Emotion(parseInt(params.emotionName)).adjectivalize();
useHead({
   title: `Emotion Detected: ${emotion}`,
});

definePageMeta({
   middleware: "auth",
});
const tracks = useFetch(`/api/tracks/${params.emotionName}`);
</script>

<style>
@import "styles/index.css";
@import "styles/em-page.css";
.preamble {
   width: 100%;
}
.heading {
   color: var(--interface-colors-maximum-blue-purple, #a5a6f6);
   font-size: 4.13063rem;
   font-style: normal;
   font-weight: 700;
   line-height: normal;
}
.heading span {
   color: var(--interface-colors-lavender-blue, #d1d2ff);
   font-size: 4.13063rem;
   font-style: normal;
   font-weight: 700;
   line-height: normal;
}
.subtext {
   color: #fff;
   font-size: 1.30038rem;
   font-style: normal;
   font-weight: 400;
   line-height: 1.98881rem; /* 152.941% */
}
.track-lineup {
   display: flex;
   overflow: hidden;
}
</style>
