#! /bin/sh
set -e
D="$HOME/.fonts/"
[ -d "$D" ] || mkdir "$D"
n=
for f in *.bdf; do
 if [ -f "$f" ]; then
  n=$D${f%bdf}pcf
  echo "$f -> $n"
  rm -f "$n"
  bdftopcf -t "$f" > "$n"
 fi
done
[ -n "$n" ] && fc-cache -fv "$D"
