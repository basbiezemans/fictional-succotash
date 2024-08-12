build:
	docker build -t fib .

run:
	docker run -it fib

# CLEANUP
# -a, --all		Remove all unused images not just dangling ones
# -f, --force	Do not prompt for confirmation
# --volumes		Prune anonymous volumes
cleanup:
	docker system prune -a -f --volumes

docker:
	docker build -t fib . && docker run -it fib