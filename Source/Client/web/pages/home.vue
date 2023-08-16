<template>
   <main>
      <form @submit.prevent="handleSearch">
         <div class="heading">
            {{ detecting ? "Detecting..." : "How do you feel?" }}
         </div>
         <div v-if="!detecting" class="input-container">
            <input name="searchbar" type="search" />
            <div class="search-icon">
               <svg
                  width="13"
                  height="22"
                  viewBox="0 0 13 22"
                  fill="none"
                  xmlns="http://www.w3.org/2000/svg"
               >
                  <path
                     d="M1.75 1.75C1.75 1.75 11 7.226 11 11C11 14.7727 1.75 20.25 1.75 20.25"
                     stroke="#D1D2FF"
                     stroke-width="2.98"
                     stroke-linecap="round"
                     stroke-linejoin="round"
                  />
               </svg>
            </div>
         </div>
      </form>
   </main>
</template>

<script setup lang="ts">
import { FormObject } from "types";

const detecting = ref(false);

// definePageMeta({
//    middleware: "auth",
// });

function handleSearch(event: Event) {
   const target = event.target as unknown as FormObject<HTMLInputElement>;
   const searchtext = (target.searchbar as HTMLInputElement).value;
   if (!searchtext) return;
   detecting.value = true;
   useFetch("/api/emotion/predict", {
      method: "POST",
      body: JSON.stringify(searchtext),
   }).then((response) => {
      navigateTo(`/emotion/${response.data.value?.emotionId}`);
   });
}
</script>

<style scoped>
@import url("../styles/index.css");

main {
   display: flex;
   justify-content: center;
   align-items: center;
   flex-direction: column;
   font-family: Open Sans;
   min-height: 100vh;
}
.heading {
   color: var(--interface-colors-lavender-blue, #d1d2ff);
   text-align: center;
   font-size: 3.5625rem;
   font-style: normal;
   font-weight: 700;
   line-height: normal;
}

.input-container {
   display: flex;
   width: 80vw;
   margin-top: 40px;
   border-radius: 1.01275rem;
   border: 4px solid var(--interface-colors-lavender-blue, #d1d2ff);
   backdrop-filter: blur(6.5px);
   overflow: hidden;
}

.input-container input {
   display: flex;
   width: 100%;
   height: 3.3125rem;
   padding-right: 0px;
   justify-content: flex-end;
   align-items: center;
   gap: 0.625rem;
   color: white;
   padding-left: 2%;
}

.input-container .search-icon {
   display: flex;
   justify-content: center;
   align-items: center;
   height: 3.3125rem;
   aspect-ratio: 1;
   cursor: pointer;
}

body {
   font-family: "Open Sans";
   background: var(
      --interface-colors-ocean-deep,
      linear-gradient(180deg, #020549 0%, #02031f 100%)
   );
   background-repeat: no-repeat;
   min-height: 100vh;
}
</style>
