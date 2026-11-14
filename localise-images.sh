#!/usr/bin/env bash
# Copies every image off Squarespace into assets/img and points the pages at the local copies.
# Run once from the repo folder, before you cancel Squarespace:  bash localise-images.sh
set -e
cd "$(dirname "$0")"
mkdir -p assets/img

curl -fsSL "https://images.squarespace-cdn.com/content/v1/698b4e7694f65f55284579e2/bce03925-a737-42b1-97ac-10b9c4362773/duty+of+care.jpg?format=2500w" -o "assets/img/duty-of-care.jpg"
curl -fsSL "https://images.squarespace-cdn.com/content/v1/698b4e7694f65f55284579e2/dc606091-ddbc-4af4-9adb-d933fe920a95/IP_2_black.png?format=2500w" -o "assets/img/innovation-paradox.png"
curl -fsSL "https://images.squarespace-cdn.com/content/v1/698b4e7694f65f55284579e2/2d690fcb-1df8-417c-947b-1737bcfcf346/WhatsApp+Image+2026-02-11+at+15.12.32.jpeg?format=2500w" -o "assets/img/running-not-running.jpg"
curl -fsSL "https://images.squarespace-cdn.com/content/v1/698b4e7694f65f55284579e2/136aaf7b-e989-43e1-a4ca-c8a829ec43ba/art+docu.jpg?format=2500w" -o "assets/img/constructed-landscapes.jpg"
curl -fsSL "https://images.squarespace-cdn.com/content/v1/698b4e7694f65f55284579e2/e70c98a6-7e45-4475-a3ac-b14543e7aa5a/eleni.jpg?format=2500w" -o "assets/img/eleni-drake.jpg"
curl -fsSL "https://images.squarespace-cdn.com/content/v1/698b4e7694f65f55284579e2/4e49b4bf-b9ce-4777-8f16-bdec494746ab/logo.webp?format=2500w" -o "assets/img/logo-audible.webp"
curl -fsSL "https://images.squarespace-cdn.com/content/v1/698b4e7694f65f55284579e2/c7e781c0-e7c0-414b-b031-54ded78bd3d4/hersheys-logo-black-and-white.png?format=2500w" -o "assets/img/logo-hersheys.png"
curl -fsSL "https://images.squarespace-cdn.com/content/v1/698b4e7694f65f55284579e2/5d839ebb-8a5b-4303-9b33-a17db4d64498/Comic-Relief-logo.jpg?format=2500w" -o "assets/img/logo-comic-relief.jpg"
curl -fsSL "https://images.squarespace-cdn.com/content/v1/698b4e7694f65f55284579e2/4a1af13e-f6c4-4a79-9d8d-b46e31dcf457/JADE%2BMATTHEW%2BVOICEOVER%2BARTIST%2BBW%2B1%2B%281%29%2B%281%29.webp?format=2500w" -o "assets/img/jade.webp"
curl -fsSL "https://images.squarespace-cdn.com/content/v1/698b4e7694f65f55284579e2/b08120e4-e09b-47ae-a1f4-82bc488b7489/andy.jpg?format=2500w" -o "assets/img/andy.jpg"
curl -fsSL "https://images.squarespace-cdn.com/content/v1/698b4e7694f65f55284579e2/b0fb94df-5e69-4a7f-83f1-120e65b7c6ad/405e775c-fe9e-4cad-95d0-ebe2e734e13b.jpeg?format=2500w" -o "assets/img/innovation-paradox-recording.jpg"
curl -fsSL "https://images.unsplash.com/photo-1589903308904-1010c2294adc?w=2400&q=75&fm=jpg" -o "assets/img/stock-studio-mic.jpg"
curl -fsSL "https://images.unsplash.com/photo-1689629020199-f91e335a325e?w=2400&q=75&fm=jpg" -o "assets/img/stock-voice-booth.jpg"
curl -fsSL "https://images.unsplash.com/photo-1632187981988-40f3cbaeef5e?w=2400&q=75&fm=jpg" -o "assets/img/stock-film-set.jpg"
curl -fsSL "https://images.unsplash.com/photo-1701817314681-9c6222dbd177?w=2400&q=75&fm=jpg" -o "assets/img/stock-sound-recordist.jpg"

# Rewrite the image links in every page (keeps working at any folder depth)
find . -name '*.html' | while read -r f; do
  depth=$(echo "${f#./}" | awk -F/ '{print NF-1}')
  prefix=""; i=0; while [ $i -lt $depth ]; do prefix="../$prefix"; i=$((i+1)); done
  [ "$f" = "./404.html" ] && prefix="/"
  U='https://images.squarespace-cdn.com/content/v1/698b4e7694f65f55284579e2/bce03925-a737-42b1-97ac-10b9c4362773/duty+of+care.jpg' N='duty-of-care.jpg' perl -pi -e 's/content="\Q$ENV{U}\E\?format=\d+w/content="https:\/\/www.slowdanceproductions.com\/assets\/img\/$ENV{N}/g' "$f"
  U='https://images.squarespace-cdn.com/content/v1/698b4e7694f65f55284579e2/bce03925-a737-42b1-97ac-10b9c4362773/duty+of+care.jpg' N='duty-of-care.jpg' P="$prefix" perl -pi -e 's/\Q$ENV{U}\E\?format=\d+w/$ENV{P}assets\/img\/$ENV{N}/g' "$f"
  U='https://images.squarespace-cdn.com/content/v1/698b4e7694f65f55284579e2/dc606091-ddbc-4af4-9adb-d933fe920a95/IP_2_black.png' N='innovation-paradox.png' perl -pi -e 's/content="\Q$ENV{U}\E\?format=\d+w/content="https:\/\/www.slowdanceproductions.com\/assets\/img\/$ENV{N}/g' "$f"
  U='https://images.squarespace-cdn.com/content/v1/698b4e7694f65f55284579e2/dc606091-ddbc-4af4-9adb-d933fe920a95/IP_2_black.png' N='innovation-paradox.png' P="$prefix" perl -pi -e 's/\Q$ENV{U}\E\?format=\d+w/$ENV{P}assets\/img\/$ENV{N}/g' "$f"
  U='https://images.squarespace-cdn.com/content/v1/698b4e7694f65f55284579e2/2d690fcb-1df8-417c-947b-1737bcfcf346/WhatsApp+Image+2026-02-11+at+15.12.32.jpeg' N='running-not-running.jpg' perl -pi -e 's/content="\Q$ENV{U}\E\?format=\d+w/content="https:\/\/www.slowdanceproductions.com\/assets\/img\/$ENV{N}/g' "$f"
  U='https://images.squarespace-cdn.com/content/v1/698b4e7694f65f55284579e2/2d690fcb-1df8-417c-947b-1737bcfcf346/WhatsApp+Image+2026-02-11+at+15.12.32.jpeg' N='running-not-running.jpg' P="$prefix" perl -pi -e 's/\Q$ENV{U}\E\?format=\d+w/$ENV{P}assets\/img\/$ENV{N}/g' "$f"
  U='https://images.squarespace-cdn.com/content/v1/698b4e7694f65f55284579e2/136aaf7b-e989-43e1-a4ca-c8a829ec43ba/art+docu.jpg' N='constructed-landscapes.jpg' perl -pi -e 's/content="\Q$ENV{U}\E\?format=\d+w/content="https:\/\/www.slowdanceproductions.com\/assets\/img\/$ENV{N}/g' "$f"
  U='https://images.squarespace-cdn.com/content/v1/698b4e7694f65f55284579e2/136aaf7b-e989-43e1-a4ca-c8a829ec43ba/art+docu.jpg' N='constructed-landscapes.jpg' P="$prefix" perl -pi -e 's/\Q$ENV{U}\E\?format=\d+w/$ENV{P}assets\/img\/$ENV{N}/g' "$f"
  U='https://images.squarespace-cdn.com/content/v1/698b4e7694f65f55284579e2/e70c98a6-7e45-4475-a3ac-b14543e7aa5a/eleni.jpg' N='eleni-drake.jpg' perl -pi -e 's/content="\Q$ENV{U}\E\?format=\d+w/content="https:\/\/www.slowdanceproductions.com\/assets\/img\/$ENV{N}/g' "$f"
  U='https://images.squarespace-cdn.com/content/v1/698b4e7694f65f55284579e2/e70c98a6-7e45-4475-a3ac-b14543e7aa5a/eleni.jpg' N='eleni-drake.jpg' P="$prefix" perl -pi -e 's/\Q$ENV{U}\E\?format=\d+w/$ENV{P}assets\/img\/$ENV{N}/g' "$f"
  U='https://images.squarespace-cdn.com/content/v1/698b4e7694f65f55284579e2/4e49b4bf-b9ce-4777-8f16-bdec494746ab/logo.webp' N='logo-audible.webp' perl -pi -e 's/content="\Q$ENV{U}\E\?format=\d+w/content="https:\/\/www.slowdanceproductions.com\/assets\/img\/$ENV{N}/g' "$f"
  U='https://images.squarespace-cdn.com/content/v1/698b4e7694f65f55284579e2/4e49b4bf-b9ce-4777-8f16-bdec494746ab/logo.webp' N='logo-audible.webp' P="$prefix" perl -pi -e 's/\Q$ENV{U}\E\?format=\d+w/$ENV{P}assets\/img\/$ENV{N}/g' "$f"
  U='https://images.squarespace-cdn.com/content/v1/698b4e7694f65f55284579e2/c7e781c0-e7c0-414b-b031-54ded78bd3d4/hersheys-logo-black-and-white.png' N='logo-hersheys.png' perl -pi -e 's/content="\Q$ENV{U}\E\?format=\d+w/content="https:\/\/www.slowdanceproductions.com\/assets\/img\/$ENV{N}/g' "$f"
  U='https://images.squarespace-cdn.com/content/v1/698b4e7694f65f55284579e2/c7e781c0-e7c0-414b-b031-54ded78bd3d4/hersheys-logo-black-and-white.png' N='logo-hersheys.png' P="$prefix" perl -pi -e 's/\Q$ENV{U}\E\?format=\d+w/$ENV{P}assets\/img\/$ENV{N}/g' "$f"
  U='https://images.squarespace-cdn.com/content/v1/698b4e7694f65f55284579e2/5d839ebb-8a5b-4303-9b33-a17db4d64498/Comic-Relief-logo.jpg' N='logo-comic-relief.jpg' perl -pi -e 's/content="\Q$ENV{U}\E\?format=\d+w/content="https:\/\/www.slowdanceproductions.com\/assets\/img\/$ENV{N}/g' "$f"
  U='https://images.squarespace-cdn.com/content/v1/698b4e7694f65f55284579e2/5d839ebb-8a5b-4303-9b33-a17db4d64498/Comic-Relief-logo.jpg' N='logo-comic-relief.jpg' P="$prefix" perl -pi -e 's/\Q$ENV{U}\E\?format=\d+w/$ENV{P}assets\/img\/$ENV{N}/g' "$f"
  U='https://images.squarespace-cdn.com/content/v1/698b4e7694f65f55284579e2/4a1af13e-f6c4-4a79-9d8d-b46e31dcf457/JADE%2BMATTHEW%2BVOICEOVER%2BARTIST%2BBW%2B1%2B%281%29%2B%281%29.webp' N='jade.webp' perl -pi -e 's/content="\Q$ENV{U}\E\?format=\d+w/content="https:\/\/www.slowdanceproductions.com\/assets\/img\/$ENV{N}/g' "$f"
  U='https://images.squarespace-cdn.com/content/v1/698b4e7694f65f55284579e2/4a1af13e-f6c4-4a79-9d8d-b46e31dcf457/JADE%2BMATTHEW%2BVOICEOVER%2BARTIST%2BBW%2B1%2B%281%29%2B%281%29.webp' N='jade.webp' P="$prefix" perl -pi -e 's/\Q$ENV{U}\E\?format=\d+w/$ENV{P}assets\/img\/$ENV{N}/g' "$f"
  U='https://images.squarespace-cdn.com/content/v1/698b4e7694f65f55284579e2/b08120e4-e09b-47ae-a1f4-82bc488b7489/andy.jpg' N='andy.jpg' perl -pi -e 's/content="\Q$ENV{U}\E\?format=\d+w/content="https:\/\/www.slowdanceproductions.com\/assets\/img\/$ENV{N}/g' "$f"
  U='https://images.squarespace-cdn.com/content/v1/698b4e7694f65f55284579e2/b08120e4-e09b-47ae-a1f4-82bc488b7489/andy.jpg' N='andy.jpg' P="$prefix" perl -pi -e 's/\Q$ENV{U}\E\?format=\d+w/$ENV{P}assets\/img\/$ENV{N}/g' "$f"
  U='https://images.squarespace-cdn.com/content/v1/698b4e7694f65f55284579e2/b0fb94df-5e69-4a7f-83f1-120e65b7c6ad/405e775c-fe9e-4cad-95d0-ebe2e734e13b.jpeg' N='innovation-paradox-recording.jpg' perl -pi -e 's/content="\Q$ENV{U}\E\?format=\d+w/content="https:\/\/www.slowdanceproductions.com\/assets\/img\/$ENV{N}/g' "$f"
  U='https://images.squarespace-cdn.com/content/v1/698b4e7694f65f55284579e2/b0fb94df-5e69-4a7f-83f1-120e65b7c6ad/405e775c-fe9e-4cad-95d0-ebe2e734e13b.jpeg' N='innovation-paradox-recording.jpg' P="$prefix" perl -pi -e 's/\Q$ENV{U}\E\?format=\d+w/$ENV{P}assets\/img\/$ENV{N}/g' "$f"
  U='https://images.unsplash.com/photo-1589903308904-1010c2294adc' N='stock-studio-mic.jpg' P="$prefix" perl -pi -e 's/\Q$ENV{U}\E\?w=\d+&(amp;)?q=70&(amp;)?auto=format&(amp;)?fit=crop/$ENV{P}assets\/img\/$ENV{N}/g' "$f"
  U='https://images.unsplash.com/photo-1689629020199-f91e335a325e' N='stock-voice-booth.jpg' P="$prefix" perl -pi -e 's/\Q$ENV{U}\E\?w=\d+&(amp;)?q=70&(amp;)?auto=format&(amp;)?fit=crop/$ENV{P}assets\/img\/$ENV{N}/g' "$f"
  U='https://images.unsplash.com/photo-1632187981988-40f3cbaeef5e' N='stock-film-set.jpg' P="$prefix" perl -pi -e 's/\Q$ENV{U}\E\?w=\d+&(amp;)?q=70&(amp;)?auto=format&(amp;)?fit=crop/$ENV{P}assets\/img\/$ENV{N}/g' "$f"
  U='https://images.unsplash.com/photo-1701817314681-9c6222dbd177' N='stock-sound-recordist.jpg' P="$prefix" perl -pi -e 's/\Q$ENV{U}\E\?w=\d+&(amp;)?q=70&(amp;)?auto=format&(amp;)?fit=crop/$ENV{P}assets\/img\/$ENV{N}/g' "$f"
done
echo "Done. Images are now in assets/img. Commit and push."
