#!/bin/bash

PATH="./bin:$PATH"

. ./test/assert.sh
. ./test/test-expbk.sh

suite=$(typeset -F | sed 's/declare -f //' | grep '^test')

for test in ${suite[@]}; do
    $test
done

assert_end examples
