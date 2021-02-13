mkdir -p gencode/user gencode/helloworld gencode/gateway

# grpc
protoc --proto_path=. --go_out=./gencode/user/ --go-grpc_out=./gencode/user/ --grpc-gateway_out=logtostderr=true:./gencode/ user/*.proto
protoc --proto_path=. --go_out=./gencode/helloworld/ --go-grpc_out=./gencode/helloworld/ --grpc-gateway_out=logtostderr=true:./gencode/ helloworld/*.proto

# route gateway
protoc -I=. --gateway_out=gencode/gateway helloworld/*.proto
protoc -I=. --gateway_out=gencode/gateway user/*.proto
