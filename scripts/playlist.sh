#!/bin/bash
source ../.env

MUSIC_DIR=$MUSIC_DIR_ENV
PLAYLIST_DIR="$HOME/.local/share/mopidy/m3u"

mkdir -p "$PLAYLIST_DIR"

find "$MUSIC_DIR" -mindepth 1 -maxdepth 1 -type d | while read -r folder; do
    playlist_name=$(basename "$folder").m3u
    playlist_path="$PLAYLIST_DIR/$playlist_name"

    echo "Generăm playlist pentru $folder -> $playlist_name"
    find "$folder" -type f \( -iname "*.mp3" -o -iname "*.flac" -o -iname "*.ogg" -o -iname "*.wav" \) | sort > "$playlist_path"
done

echo "Gata! Playlist-urile au fost generate în $PLAYLIST_DIR"