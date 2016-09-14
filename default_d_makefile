SRC = $(shell find ./src -type f -name '*.d')

all: dev

dev:
	dmd $(SRC) -of./bin/main -od./bin -unittest