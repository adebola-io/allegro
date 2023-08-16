CREATE TABLE albums (
    album_id INT AUTO_INCREMENT PRIMARY KEY,
    album_name VARCHAR(200)
);

CREATE TABLE artists (
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    artist_name VARCHAR(50) UNIQUE
);

CREATE TABLE tracks (
    track_id INT AUTO_INCREMENT PRIMARY KEY,
    track_name VARCHAR(200),
    album_id INT,
    spotify_link VARCHAR(200),
    youtube_link VARCHAR(200),
    KEY album_id_idx (album_id)
);


CREATE TABLE emotions (
    emotion_id INT PRIMARY KEY,
    emotion_name VARCHAR(50)
);

CREATE TABLE track_emotions (
    track_emotions_id INT AUTO_INCREMENT PRIMARY KEY,
    track_id INT,
    KEY track_idx (track_id),
    emotion_id INT,
    KEY emotion_idx (emotion_id)
);

CREATE TABLE track_artists (
    track_artists_id INT AUTO_INCREMENT PRIMARY KEY,
    track_id INT,
    KEY track_idx (track_id),
    artist_id INT,
    KEY artist_idx (artist_id)
);

CREATE TABLE album_artists (
    album_artists_id INT AUTO_INCREMENT PRIMARY KEY,
    album_id INT,
    KEY album_idx (album_id),
    artist_id INT,
    KEY artist_idx (artist_id)
);
