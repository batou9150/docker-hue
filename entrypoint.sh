#!/bin/bash

confd -onetime -backend env

./build/env/bin/hue syncdb --noinput
./build/env/bin/hue migrate

exec $@
