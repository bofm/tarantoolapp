#! /usr/bin/env bash

ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"
TARANTOOL=tarantool

LUA_PATH="\
${ROOT}/.rocks/share/lua/5.1/?.lua;\
${ROOT}/.rocks/share/lua/5.1/?/init.lua;\
${ROOT}/?.lua;\
${ROOT}/?/init.lua;\
${ROOT}/app/?.lua;\
${ROOT}/app/?/init.lua;\
"

SOEXT="$(${TARANTOOL} <<< 'print(jit.os == "OSX" and "dylib" or "so")')"

LUA_CPATH="\
${ROOT}/.rocks/lib/lua/5.1/?.${SOEXT};\
${ROOT}/.rocks/lib/lua/?.${SOEXT};\
${ROOT}/.rocks/lib/tarantool/?.${SOEXT};\
${ROOT}/.rocks/lib64/lua/5.1/?.${SOEXT};\
${ROOT}/.rocks/lib64/tarantool/?.${SOEXT};\
"

LUA_PATH="${LUA_PATH}" LUA_CPATH="${LUA_CPATH}" \
exec ${TARANTOOL} "scripts/run_tests.lua" \
    --pattern "^test_.*%.lua$" \
    "${ROOT}/tests"
