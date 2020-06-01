package main

import (
	"log"
	"net/http"
	"os"
)

//main is the main entry point for the server
func main() {
	address := os.Getenv("ADDR")

	tlsKeyPath := os.Getenv("TLSKEY")
	tlsCertPath := os.Getenv("TLSCERT")

	// Default address the server should listen on
	// Should be the same in the Dockerfile
	if len(address) == 0 {
		address = ":443"
	}

	// starting a new mux session
	mux := http.NewServeMux()
	mux.HandleFunc("/v1/summary", SummaryHandler)

	// logging server location or errors
	log.Printf("server is listening at %s...", address)
	// log.Fatal(http.ListenAndServe(address, mux))
	log.Fatal(http.ListenAndServeTLS(address, tlsCertPath, tlsKeyPath, mux))

	/* To host server:
	- change path until in folder with main.go in it
	- 'go install main.go'
	- navigate to 'go' bin folder and run main.exe
	*/
}
