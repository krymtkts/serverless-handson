set GO111MODULE=on
set GOOS=linux

del /s /f /q .\bin
del /s /f /q .\vendor

go build -ldflags="-s -w" -o bin\hello hello\main.go
go build -ldflags="-s -w" -o bin\world world\main.go
