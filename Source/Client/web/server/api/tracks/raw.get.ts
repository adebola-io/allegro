import { readFileSync } from "fs";
import { Track } from "../../../types";

type TrackData = {
   suprise: Track[];
   disgust: Track[];
   joy: Track[];
   fear: Track[];
   sadness: Track[];
};

export default defineEventHandler((event) => {
   const tracks: TrackData = JSON.parse(
      readFileSync("./data/tracks.json").toString()
   );
   return tracks;
});
