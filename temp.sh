#!/bin/bash
#requires jq "http://stedolan.github.io/jq/"
#and forecast.io API access
#A simple script to return the temp and conditions from forecast.io with curl. Then formatted as needed for use in a conky display
api_key=""
lat=''
long=''
curl -s "https://api.forecast.io/forecast/$api_key/$lat,$long/" |  jq  ".currently.temperature, .currently.summary"  | sed -e 's/\"//g' -e 's/\..*'/'° |'/g  | tr '\n' ' '
echo ""
