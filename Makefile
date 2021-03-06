INCLUDE_DIR=/usr/local/include

gen.protos:
	# Generate timestamp proto
	@protoc -I${INCLUDE_DIR} --dart_out=lib/protos ${INCLUDE_DIR}/google/protobuf/timestamp.proto
	@protoc -I../arigato_web/protos --dart_out=lib/protos ../arigato_web/protos/*
