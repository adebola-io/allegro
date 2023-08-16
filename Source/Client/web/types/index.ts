/** A single music track. */
export interface Track {
   name: string;
   album: string;
   artist: string;
   releaseYear: number;
}

/**
 * A user of the app.
 */
export interface User {
   username: string;
   email: string;
   password: string;
   hasIdentities: boolean;
}

export interface FormObject<T extends HTMLElement = HTMLElement> {
   [keyof: string]: T;
}
