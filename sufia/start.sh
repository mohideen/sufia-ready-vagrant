#!/bin/bash -x

echo "Starting sufia rails server..."

cd /apps/sufia
nohup rails server -b 0.0.0.0 > nohup.out &

echo "Done!"