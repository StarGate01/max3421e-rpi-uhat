#!/usr/bin/env bash

cd "${0%/*}"

mkdir -p ./libraries/LCSC

easyeda2kicad --full --lcsc_id=$1 --output ./libraries/LCSC/LCSC --overwrite

cd ./libraries/LCSC/LCSC.pretty
sed -i 's#/libraries/LCSC/LCSC.3dshapes/#../LCSC.3dshapes/#g' *
