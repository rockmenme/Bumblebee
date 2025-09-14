FROM debian:bookworm

ENV DEBIAN_FRONTEND=noninteractive

# Instalăm Python, pip, GStreamer și tot ce trebuie
RUN apt-get update && apt-get install -y \
    python3 python3-pip python3-gi python3-gst-1.0 \
    gobject-introspection libgirepository1.0-dev \
    gir1.2-gstreamer-1.0 gir1.2-gst-plugins-base-1.0 \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-libav \
    gstreamer1.0-tools \
    gstreamer1.0-alsa \
    libasound2 alsa-utils \
    build-essential wget curl \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Instalăm Mopidy și extensiile din pip
RUN pip3 install --no-cache-dir --break-system-packages \
    Mopidy \
    Mopidy-Iris \
    Mopidy-Local \
    Mopidy-MPD \
    Mopidy-Local-SQLite \
    Mopidy-DefaultPlaylist


# Creăm utilizator dedicat și setăm permisiunile
# RUN useradd -m -G audio mopidy
# USER mopidy

# Director de lucru
WORKDIR /home/mopidy

COPY playlist.sh .

RUN chmod +x ./playlist.sh

# Pornire implicită
CMD ["mopidy", "--config", "/etc/mopidy/mopidy.conf"]