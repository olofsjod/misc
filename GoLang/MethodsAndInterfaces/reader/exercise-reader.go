package main

import "golang.org/x/tour/reader"

type MyReader struct{}

func (m MyReader) Read(b []byte) (int, error) {
    for {

    }
}

func main() {
    reader.Validate(MyReader{})
}
