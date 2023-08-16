export default defineEventHandler((event) => {
   console.log(event);
   return {
      emotionId: 4,
   };
});
