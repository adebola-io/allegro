<template>
   <main>
      <h1 class="heading">Music Recommender.</h1>
      <AppConcentricCircles gradient="linear-gradient(blue, black)" />

      <AppSignUpForm @switch="mode = 'login'" v-if="mode === 'signup'" />
      <AppLoginForm @switch="mode = 'signup'" v-else />

      <span class="shameless-plugin">
         Built with 💖 by
         <a href="http:github.com/adebola-io">@adebola-io</a>
      </span>
   </main>
</template>

<script setup lang="ts">
useHead({
   title: "Music Recommender",
});

let mode = ref<"login" | "signup">("signup");
</script>

<style>
@import url(../styles/index.css);
main {
   display: flex;
   justify-content: center;
   align-items: center;
   flex-direction: column;
   min-height: 100vh;
}

h1.heading {
   color: var(--interface-colors-pale-purple, #f2d7ee);
   text-align: center;
   font-size: 3.9375rem;
   font-style: normal;
   font-weight: 700;
   line-height: 5rem; /* 126.984% */
}

.shameless-plugin {
   color: #fff;
   text-align: center;
   font-size: 0.95138rem;
   font-style: normal;
   font-weight: 400;
   line-height: normal;
}

.shameless-plugin a {
   color: var(--interface-colors-chinese-violet, #a5668b);
   font-size: 0.95138rem;
   font-style: normal;
   font-weight: 400;
   line-height: normal;
}
</style>
