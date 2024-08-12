build:
	docker build -t fib .

run:
	docker run -it fib

docker:
	docker build -t fib . && docker run -it fib