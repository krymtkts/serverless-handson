set GO111MODULE=on
set GOOS=linux

go build -ldflags="-s -w" -o bin/hello hello/main.go
go build -ldflags="-s -w" -o bin/world world/main.go

sls deploy --verbose %1
