export const emotion_mapping = {
   original: {
      0: "admiration",
      1: "amusement",
      2: "anger",
      3: "annoyance",
      4: "approval",
      5: "caring",
      6: "confusion",
      7: "curiosity",
      8: "desire",
      9: "disappointment",
      10: "disbelief",
      11: "disgust",
      12: "embarrassment",
      13: "excitement",
      14: "fear",
      15: "gratitude",
      16: "grief",
      17: "joy",
      18: "love",
      19: "nervousness",
      20: "optimism",
      21: "pride",
      22: "realization",
      23: "relief",
      24: "remorse",
      25: "sadness",
      26: "surprise",
      27: "neutral",
   },
   ekman: {
      0: "surprise",
      1: "disgust",
      3: "joy",
      4: "fear",
      5: "sadness",
   },
};

export const adjectives = {
   0: "surprised",
   1: "disgusted",
   2: "joyful",
   3: "angry",
   4: "afraid",
   5: "sad",
};

export class Emotion {
   id?: number;
   constructor(id: number) {
      if (typeof id !== "number") return;
      this.id = id;
   }
   adjectivalize() {
      return adjectives[this.id as keyof typeof adjectives];
   }
}

export function simulateError(cb: () => void) {
   setTimeout(() => {
      cb();
      const notificationContainer = document.createElement(
         "notification-container"
      );
      const notification = document.createElement("notification-box");

      notification.innerText = "Network Error. Please try again.";
      notificationContainer.append(notification);
      document.body.prepend(notificationContainer);

      setTimeout(() => {
         notification.classList.add("closed");
         notification.ontransitionend = () => notificationContainer.remove();
      }, 3000);
   }, 20000);
}
