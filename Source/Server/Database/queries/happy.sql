
INSERT INTO
    albums(album_name, release_year)
VALUES
    ("4", 2011), 
    ("TROLLS (Original Motion Picture Soundtrack)", 2016), 
    ("G I R L", 2014), 
    ("Jazz", 1978),
    ("Cuz I Love You (Super Deluxe)", 2019),
    ("Katrina & the Waves", 1985),
    ("THE E.N.D. (THE ENERGY NEVER DIES) [Deluxe Version]", 2009),
    ("The Smile Sessions", 2011),
    ("Where the Light Is", 2019),
    ("Crush", 2000),
    ("Uptown Special", 2015),
    ("Arrival", 1976),
    ("The Best of Earth, Wind & Fire", 1978),
    ("Escape (Bonus Track Version)", 1981),
    ("The Lion King", 1994),
    ("Special", 2022),
    ("Barbie: The Album", 2023),
    ("TTILE", 2014),
    ("I Ain't Worried (Music From The Motion Picture 'Top Gun: Maverick')", 2022),
    ("The Click (Deluxe Edition)", 2017)
;


INSERT INTO
    artists(artist_name)
VALUES
    ("Beyonce"), 
    ("Various Artists"),
    ("Justin Timberlake"),
    ("Pharrell Williams"),
    ("Queen"),
    ("Lizzo"),
    ("Katrina & the Waves"),
    ("Black Eyed Peas"),
    ("The Beach Boys"),
    ("Surfaces"),
    ("Bon Jovi"),
    ("Bruno Mars"),
    ("Mark Ronson"),
    ("ABBA"),
    ("Earth, Wind & Fire"),
    ("Journey"),
    ("Nathan Lane"),
    ("Ernie Sabella"),
    ("Jason Weaver"),
    ("Joseph Williams"),
    ("Dua Lipa"),
    ("Meghan Trainor"),
    ("OneRepublic"),
    ("AJR");


INSERT INTO
    album_artists(album_id, artist_id)
VALUES
    (
        (SELECT album_id FROM albums WHERE album_name = "4"), 
        (SELECT artist_id FROM artists WHERE artist_name="Beyonce")
    ),
    (
        (SELECT album_id FROM albums WHERE album_name = "TROLLS (Original Motion Picture Soundtrack)"), 
        (SELECT artist_id FROM artists WHERE artist_name="Various Artists")
    ),
    (
        (SELECT album_id FROM albums WHERE album_name = "G I R L"), 
        (SELECT artist_id FROM artists WHERE artist_name = "Pharrell Williams")
    ),
    (
        (SELECT album_id FROM albums WHERE album_name = "Jazz"), 
        (SELECT artist_id FROM artists WHERE artist_name = "Queen")
    ),
    (
        (SELECT album_id FROM albums WHERE album_name = "Cuz I Love You (Super Deluxe)"), 
        (SELECT artist_id FROM artists WHERE artist_name = "Lizzo")
    ),
    (
        (SELECT album_id FROM albums WHERE album_name = "Katrina & the Waves"), 
        (SELECT artist_id FROM artists WHERE artist_name = "Katrina & the Waves")
    ),
    (
        (SELECT album_id FROM albums WHERE album_name = "THE E.N.D. (THE ENERGY NEVER DIES) [Deluxe Version]"), 
        (SELECT artist_id FROM artists WHERE artist_name = "Black Eyed Peas")
    ),
    (
        (SELECT album_id FROM albums WHERE album_name = "The Smile Sessions"), 
        (SELECT artist_id FROM artists WHERE artist_name = "The Beach Boys")
    ),
    (
        (SELECT album_id FROM albums WHERE album_name = "Where the Light Is"), 
        (SELECT artist_id FROM artists WHERE artist_name = "Surfaces")
    ),
    (
        (SELECT album_id FROM albums WHERE album_name = "Crush"), 
        (SELECT artist_id FROM artists WHERE artist_name = "Bon Jovi")
    ),
    (
        (SELECT album_id FROM albums WHERE album_name = "Uptown Special"), 
        (SELECT artist_id FROM artists WHERE artist_name = "Mark Ronson")
    ),
    (
        (SELECT album_id FROM albums WHERE album_name = "Arrival"), 
        (SELECT artist_id FROM artists WHERE artist_name = "ABBA")
    ),
    (
        (SELECT album_id FROM albums WHERE album_name = "The Best of Earth, Wind & Fire"), 
        (SELECT artist_id FROM artists WHERE artist_name = "Earth, Wind & Fire")
    ),
    (
        (SELECT album_id FROM albums WHERE album_name = "Escape (Bonus Track Version)"), 
        (SELECT artist_id FROM artists WHERE artist_name = "Journey")
    ),
    (
        (SELECT album_id FROM albums WHERE album_name = "The Lion King"), 
        (SELECT artist_id FROM artists WHERE artist_name = "Various Artists")
    ),
    (
        (SELECT album_id FROM albums WHERE album_name = "Special"), 
        (SELECT artist_id FROM artists WHERE artist_name = "Lizzo")
    ),
    (
        (SELECT album_id FROM albums WHERE album_name = "Barbie: The Album"), 
        (SELECT artist_id FROM artists WHERE artist_name = "Various Artists")
    ),
    (
        (SELECT album_id FROM albums WHERE album_name = "TITLE"), 
        (SELECT artist_id FROM artists WHERE artist_name = "Meghan Trainor")
    ),
    (
        (SELECT album_id FROM albums WHERE album_name = "I Ain't Worried (Music From The Motion Picture 'Top Gun: Maverick')"), 
        (SELECT artist_id FROM artists WHERE artist_name = "OneRepublic")
    ),
    (
        (SELECT album_id FROM albums WHERE album_name = "The Click (Deluxe Edition)"), 
        (SELECT artist_id FROM artists WHERE artist_name = "AJR")
    )

;



INSERT INTO
    tracks(track_name, album_id, spotify_link, youtube_music_link)
VALUES
    (
        "Love on Top",
        (SELECT album_id FROM albums WHERE album_name = "4" ), 
        "https://open.spotify.com/track/1z6WtY7X4HQJvzxC4UgkSf?si=04a0b063221d4aaf", 
        "https://music.youtube.com/watch?v=n0R5uUEjjCk&feature=share"
    ),
    (   
        "CAN'T STOP THE FEELING!", 
        (SELECT album_id FROM albums WHERE album_name = "TROLLS (Original Motion Picture Soundtrack)" ), 
        "https://open.spotify.com/track/1WkMMavIMc4JZ8cfMmxHkI?si=bb711eccd1f1440e",
        "https://music.youtube.com/watch?v=6p3E7OMw52g&feature=share"
    ),
    (
        "Happy",
        (SELECT album_id FROM albums WHERE album_name = "G I R L"),
        "https://open.spotify.com/track/60nZcImufyMA1MKQY3dcCH?si=ae0420f17dde4d33",
        "https://music.youtube.com/watch?v=dJqxQzxLbHM&feature=share"
    ),
    (
        "Don't Stop Me Now",
        (SELECT album_id FROM albums WHERE album_name = "Jazz"),
        "https://open.spotify.com/track/5T8EDUDqKcs6OSOwEsfqG7?si=dc99e99468514cf1",
        "https://music.youtube.com/watch?v=CczcMarUoVk&feature=share"
    ),
    (
        "Good as Hell",
        (SELECT album_id FROM albums WHERE album_name = "Cuz I Love You (Super Deluxe)"),
        "https://open.spotify.com/track/6KgBpzTuTRPebChN0VTyzV?si=b69d416708f3426c",
        "https://music.youtube.com/watch?v=xZdj3LM5X1M&feature=share"
    ),
    (
        "Walking on Sunshine",
        (SELECT album_id FROM albums WHERE album_name = "Katrina & the Waves"),
        "https://open.spotify.com/album/6uzp7pmYhegci3YNO8n7XB",
        "https://music.youtube.com/watch?v=HmR2IZjuMVc&feature=share"
    ),
    (
        "I Gotta Feeling",
        (SELECT album_id FROM albums WHERE album_name = "THE E.N.D. (THE ENERGY NEVER DIES) [Deluxe Version]"),
        "https://open.spotify.com/track/4kLLWz7srcuLKA7Et40PQR",
        "https://music.youtube.com/watch?v=Wnn6M1nNiKQ&feature=share"
    ),
    (
        "Good Vibrations",
        (SELECT album_id FROM albums WHERE album_name = "The Smile Sessions"),
        "https://open.spotify.com/track/6aU6a9tdn2vHhnPGlboFZX",
        "https://music.youtube.com/watch?v=jkPyB-g3asI&feature=share"
    ),
    (
        "Sunday Best",
        (SELECT album_id FROM albums WHERE album_name = "Where the Light Is"),
        "https://open.spotify.com/artist/4ETSs924pXMzjIeD6E9b4u?si=61a3a626be584acb",
        "https://music.youtube.com/watch?v=Tzc28s9qaW8&feature=share"
    ),
    (
        "It's My Life",
        (SELECT album_id FROM albums WHERE album_name = "Crush"),
        "https://open.spotify.com/track/0v1XpBHnsbkCn7iJ9Ucr1l?si=123bd1ee2bbf4a9c",
        "https://music.youtube.com/watch?v=bY3vXr7fm8k&feature=share"
    ), 
    (
        "Uptown Funk",
        (SELECT album_id FROM albums WHERE album_name = "Uptown Special"),
        "https://open.spotify.com/track/32OlwWuMpZ6b0aN2RZOeMS?si=e306704cbd1a4842",
        "https://music.youtube.com/watch?v=tYvFa2ARD24&feature=share"
    ), 
    (
        "Dancing Queen",
        (SELECT album_id FROM albums WHERE album_name = "Arrival"),
        "https://open.spotify.com/track/0GjEhVFGZW8afUYGChu3Rr?si=563dbf8cd45d438f",
        "https://music.youtube.com/watch?v=YkLLcIKhJ64&feature=share"
    ),
    (
        "September",
        (SELECT album_id FROM albums WHERE album_name = "The Best of Earth, Wind & Fire"),
        "https://open.spotify.com/track/2grjqo0Frpf2okIBiifQKs?si=d305b34d2a834b96",
        "https://music.youtube.com/watch?v=3cKtSlsYVEU&feature=share"
    ),
    (
        "Don't Stop Believin'",
        (SELECT album_id FROM albums WHERE album_name = "Escape (Bonus Track Version)"),
        "https://open.spotify.com/track/4bHsxqR3GMrXTxEPLuK5ue?si=d65f04239a1a4b39",
        "https://music.youtube.com/watch?v=kMgaA6RkcVU&feature=share"
    ),  
    (
        "Hakuna Matata",
        (SELECT album_id FROM albums WHERE album_name = "The Lion King"),
        "https://open.spotify.com/track/5k3U0OGYBccHdKJJu3HrUN?si=aedd5cf26e794cad",
        "https://music.youtube.com/watch?v=MBIWFTXQbi4&feature=share"
    ),
    (
        "About Damn Time",
        (SELECT album_id FROM albums WHERE album_name = "Special"),
        "https://open.spotify.com/artist/56oDRnqbIiwx4mymNEv7dS?si=9b16613b29414985",
        "https://music.youtube.com/watch?v=wnWxeBfV2ZQ&feature=share"
    ),
    (
        "Dance the Night",
        (SELECT album_id FROM albums WHERE album_name = "Barbie: The Album"),
        "https://open.spotify.com/track/1vYXt7VSjH9JIM5oRRo7vA",
        "https://music.youtube.com/watch?v=Z1yDjhXIDSc&feature=share"
    ),
    (
        "All About the Bass",
        (SELECT album_id FROM albums WHERE album_name = "TITLE"),
        "https://open.spotify.com/track/0ifSeVGUr7py5GggttDhXw",
        "https://music.youtube.com/watch?v=phEyvmvIvZs&feature=share"
    ),
    (
        "I Ain't Worried",
        (SELECT album_id FROM albums WHERE album_name = "I Ain't Worried (Music From The Motion Picture 'Top Gun: Maverick')"),
        "https://open.spotify.com/track/4h9wh7iOZ0GGn8QVp4RAOB",
        "https://music.youtube.com/watch?v=NF7oYY7Lhq4&feature=share"
    ),
    (
        "The Good Part",
        (SELECT album_id FROM albums WHERE album_name = "The Click (Deluxe Edition)"),
        "https://open.spotify.com/track/5cBLBXhU9sf6kGvb2Dv2cl",
        "https://music.youtube.com/watch?v=k8vOMis4QGU&feature=share"
    )
;

INSERT INTO
    track_artists(track_id, artist_id)
VALUES
    (
        (SELECT track_id FROM tracks WHERE track_name = "Love on Top"), 
        (SELECT artist_id FROM artists WHERE artist_name="Beyonce")
    ),
    (
        (SELECT track_id FROM tracks WHERE track_name = "CAN'T STOP THE FEELING!"), 
        (SELECT artist_id FROM artists WHERE artist_name="Justin Timberlake")
    ),
    (
        (SELECT track_id FROM tracks WHERE track_name = "Happy"), 
        (SELECT artist_id FROM artists WHERE artist_name="Pharrell Williams")
    ),
    (
        (SELECT track_id FROM tracks WHERE track_name = "Don't Stop Me Now"), 
        (SELECT artist_id FROM artists WHERE artist_name="Queen")
    ),
    (
        (SELECT track_id FROM tracks WHERE track_name = "Good as Hell"), 
        (SELECT artist_id FROM artists WHERE artist_name="Lizzo")
    ),
    (
        (SELECT track_id FROM tracks WHERE track_name = "Walking on Sunshine"), 
        (SELECT artist_id FROM artists WHERE artist_name="Katrina & the Waves")
    ),
    (
        (SELECT track_id FROM tracks WHERE track_name = "I Gotta Feeling"), 
        (SELECT artist_id FROM artists WHERE artist_name="Black Eyed Peas")
    ),
    (
        (SELECT track_id FROM tracks WHERE track_name = "Good Vibrations"), 
        (SELECT artist_id FROM artists WHERE artist_name="The Beach Boys")
    ),
     (
        (SELECT track_id FROM tracks WHERE track_name = "Sunday Best"), 
        (SELECT artist_id FROM artists WHERE artist_name="Surfaces")
    ),
     (
        (SELECT track_id FROM tracks WHERE track_name = "It's My Life"), 
        (SELECT artist_id FROM artists WHERE artist_name="Bon Jovi")
    ),
     (
        (SELECT track_id FROM tracks WHERE track_name = "It's My Life"), 
        (SELECT artist_id FROM artists WHERE artist_name="Bon Jovi")
    ),
    
    


insert into track_emotions(track_id, emotion_id) 
(select track_id, (select emotion_id from emotions where emotion_name = "joy") from tracks) 
;

