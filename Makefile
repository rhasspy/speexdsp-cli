.PHONY: release debug clean docker

PLATFORMS := linux/amd64,linux/arm64,linux/arm/v7

release:
	mkdir -p build
	cd build && cmake ../src -DCMAKE_BUILD_TYPE=Release && make

debug:
	mkdir -p build
	cd build && cmake ../src -DCMAKE_BUILD_TYPE=Debug && make

clean:
	rm -rf build/ dist/

docker:
	docker buildx build . --platform "$(PLATFORMS)" --output 'type=local,dest=dist'
