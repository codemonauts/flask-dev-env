#! /bin/bash
set -eu

export LC_ALL=C.UTF-8
export LANG=C.UTF-8

cd /local
export $(cat .env | sed 's/#.*//g' | xargs)

pipenv install
pipenv run flask run --host=0.0.0.0
