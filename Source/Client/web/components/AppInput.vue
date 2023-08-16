<script setup lang="ts">
const props = defineProps<{
   type: string;
   class?: string;
   name?: string;
   containerClass?: string;
   placeholder?: string;
   id?: string;
   error?: string;
}>();
</script>

<template>
   <div :class="containerClass">
      <input
         :placeholder="props.placeholder"
         :type="props.type"
         :name="name"
         class="class"
      />
      <div class="error" v-if="props.error">
         {{ props.error }}
      </div>
   </div>
</template>

<style scoped>
input {
   display: flex;
   height: 3.6875rem;
   width: 100%;
   padding: 0.4375rem 0.6875rem 0.4375rem 1.0625rem;
   align-items: center;
   align-self: stretch;
   border-radius: 0.4375rem;
   border: 3px solid var(--interface-colors-thistle, #d3bcc0);
   background-color: transparent;
   color: white;
}
input::placeholder {
   color: rgba(255, 255, 255, 0.45);
   font-size: 1.1875rem;
   font-style: normal;
   font-weight: 400;
   line-height: normal;
}
.error {
   margin-top: 5px;
   color: #a5668b;
   font-weight: bold;
}
</style>
