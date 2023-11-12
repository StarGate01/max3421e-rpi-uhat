#!/usr/bin/env bash

cd "${0%/*}/libraries/rpiuhat/rpiuhat.pretty"

kicad-cli pcb export step --drill-origin --subst-models --no-virtual -f -o "../../../export/max3421e-rpi-uhat.step" "../../../hardware/max3421e-rpi-uhat.kicad_pcb"