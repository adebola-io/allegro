import { readFileSync, readdirSync } from "fs";

export default defineEventHandler((event) => {
   const userData = readFileSync("./data/users.json");
   const users = JSON.stringify(userData);
   console.log();
   return {
      authenticated: true,
   };
});
