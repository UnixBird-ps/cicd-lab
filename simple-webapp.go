package main

import
(
	"fmt"
	"log"
	"net/http"

)

func httpHandler( w http.ResponseWriter, r *http.Request )
{
	fmt.Fprintf( w, "Hello, %s!", r.URL.Path[ 1: ] )
}

func main()
{
	http.HandleFunc( "/", httpHandler )
	log.Fatal( http.ListenAndServe( ":8080", nil ) )
}
