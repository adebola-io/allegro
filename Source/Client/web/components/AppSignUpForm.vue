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
            name="email"
            container-class="input"
            id="email"
            :error="validationErrors.email"
            type="email"
            placeholder="Email"
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
            {{ signingUp ? "Signing Up..." : "Sign Up" }}
         </button>
      </div>
   </form>

   <span class="other-message">
      Already have an account?
      <span @click="emit('switch')" class="login-link"> Log In. </span>
   </span>
</template>

<script setup lang="ts">
import { FormObject } from "../types";
const emit = defineEmits<{
   (event: "switch"): void;
}>();

type InputObject = { username: string; password: string; email: string };

let validationErrors = ref({} as InputObject);

const signingUp = ref(false);

function handleUserCreation(event: Event) {
   const errors = {} as InputObject;
   const target = event.target as unknown as FormObject<HTMLInputElement>;
   // Validate Username.
   if (target.username.value.length === 0) {
      errors.username = "Username is required.";
   }

   if (!target.email.checkValidity()) {
      errors.email = "Please enter a valid email.";
   }

   if (target.password.value.length < 7) {
      errors.password = "Password must be seven characters or more.";
   }

   validationErrors.value = errors;

   console.log(Object.keys(validationErrors.value));

   if (Object.keys(validationErrors.value).length === 0) {
      signingUp.value = true;
      // const request = useFetch("/api/user/create", {
      //    body: JSON.stringify({
      //       username: target.username.value,
      //       password: target.password.value,
      //       email: target.email.value,
      //    }),
      // });
      // setTimeout(() => navigateTo("/home"), 2000);
      simulateError(() => {
         signingUp.value = false;
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
.login-link {
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
