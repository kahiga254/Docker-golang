package main

import(
"fmt"
"log"
"net/http"
"html"
)

func main(){
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request){
		fmt.Fprintf(w, "Hello, %q", html.EscapeString(r.URL.Path))
	})

	http.HandleFunc("/hi", func(w http.ResponseWriter, r *http.Request){
		fmt.Fprintf(w,"Hi")
	})

	port := ":3000"
	fmt.Println("Server running on http://localhost" + port)

	err := http.ListenAndServe(port, nil)
	if err != nil{
		log.Fatalf("❌ Server encountered an error: %v", err)
		return
	}
}