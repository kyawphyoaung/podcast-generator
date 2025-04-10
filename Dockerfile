FROM ubuntu:22.04

# System dependencies များထည့်ပါ
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    python3.10 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# pip upgrade မလုပ်ဘဲ တိုက်ရိုက် install လုပ်ပါ
RUN python3 -m pip install --no-cache-dir pyyaml

COPY feed.py /app/feed.py
COPY entrypoint.sh /app/entrypoint.sh

WORKDIR /app
ENTRYPOINT ["/app/entrypoint.sh"]