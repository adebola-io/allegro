<template>
   <form @submit.prevent="handleUserCreation">
      <div>
         <AppInput
            name="username"
            container-class="input"
            id="username"
            :error="validationErrors.username"
            type="text"
            placeholder="Username"
         />
         <AppInput
            name="password"
            container-class="input"
            id="password"
            :error="validationErrors.password"
            type="password"
            placeholder="Password"
         />
         <button type="submit">
            {{ loggingIn ? "Logging In..." : "Login" }}
         </button>
      </div>
   </form>

   <span class="other-message">
      Don't have an account?
      <span @click="emit('switch')" class="signup-link">Sign Up.</span>
   </span>
</template>

<script setup lang="ts">
import { FormObject } from "../types";
const emit = defineEmits<{
   (event: "switch"): void;
}>();

type InputObject = { username: string; password: string };

let loggingIn = ref(false);

let validationErrors = ref({} as InputObject);

function handleUserCreation(event: Event) {
   const errors = {} as InputObject;
   const target = event.target as unknown as FormObject<HTMLInputElement>;
   // Validate Username.
   if (target.username.value.length === 0) {
      errors.username = "Username is required.";
   }

   if (target.password.value.length === 0) {
      errors.password = "Password is required.";
   }

   validationErrors.value = errors;
   if (Object.entries(validationErrors.value).length === 0) {
      loggingIn.value = true;
      // const request = useFetch("/api/user/login", {
      //    method: "POST"
      //    body: JSON.stringify({
      //       username: target.username.value,
      //       password: target.password.value,
      //    }),
      // });
      // request.catch((e) => console.log(e));
      // if (request.data) navigateTo("/home");
      simulateError(() => {
         loggingIn.value = false;
      });
   }
}
</script>

<style scoped>
.input {
   width: 100%;
   margin-bottom: 20px;
}
.other-message {
   color: var(--interface-colors-thistle, #d3bcc0);
   text-align: center;
   font-size: 1.26769rem;
   font-style: normal;
   font-weight: 400;
   line-height: normal;
   margin-bottom: 30px;
}
.signup-link {
   color: var(--interface-colors-pale-purple, #f2d7ee);
   font-size: 1.26769rem;
   font-style: normal;
   font-weight: 400;
   line-height: normal;
   cursor: pointer;
}
button {
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
</style>
