#!/bin/bash

# === CONFIG ===
MUSIC_DIR="$MUSIC_DIR_ENV"        # Folderul sursă (unul singur)
PLAYLIST_DIR="$HOME/.local/share/mopidy/m3u"   # Unde se salvează playlist-ul
PLAYLIST_NAME="Startup.m3u8"               # Numele playlist-ului

mkdir -p "$PLAYLIST_DIR"

PLAYLIST_PATH="$PLAYLIST_DIR/$PLAYLIST_NAME"

# Generăm playlist-ul cu toate fișierele audio din MUSIC_DIR (fără subfoldere)
echo "Generăm playlist-ul complet din $MUSIC_DIR"
find "$MUSIC_DIR" -maxdepth 1 -type f \( -iname "*.mp3" -o -iname "*.flac" -o -iname "*.ogg" -o -iname "*.wav" \) | sort > "$PLAYLIST_DIR/$PLAYLIST_NAME"

echo "Gata! Playlist-ul a fost generat: $PLAYLIST_DIR/$PLAYLIST_NAME"
