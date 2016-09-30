#!/usr/bin/env bash
set -e
set -u

tearDown() {
	docker-compose down
}

trap tearDown EXIT

docker-compose build 
docker-compose run --rm test_success | grep 'it_succeeds' | grep 'PASS'
(docker-compose run --rm test_failure || true) | grep 'it_fails' | grep 'FAIL'
docker-compose run --rm test_wait | grep 'it_waits' | grep 'PASS'

