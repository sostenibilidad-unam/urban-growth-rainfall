#!/bin/bash

find /srv/home/yosune/experimento_magaldi -iname 'wrfout_d04_2013*' \
     -printf "./extract_for_validation.R weather_stations.csv %p stations/\`basename %p\` \n" | sh
