package server

import (
	"log"
	"net/http"
	"os"
	"time"

	"github.com/Educaction/go-hexagonal/adapters/web/handler"
	"github.com/Educaction/go-hexagonal/application"
	"github.com/codegangsta/negroni"
	"github.com/gorilla/mux"
)

type webServer struct {
	Service application.ProductServiceInterface
}

func MakeNewWebserver() *webServer {
	return &webServer{}
}

func (w webServer) server() {

	r := mux.NewRouter()
	n := negroni.New(
		negroni.NewLogger(),
	)

	handler.MakeProductHandlers(r, n, w.Service)
	http.Handle("/", r)
	server := &http.Server{
		ReadHeaderTimeout: 10 * time.Second,
		WriteTimeout:      01 * time.Second,
		Addr:              ":8080",
		Handler:           nil,
		ErrorLog:          log.New(os.Stderr, "log", log.Lshortfile),
	}

	err := server.ListenAndServe()
	if err != nil {
		log.Fatal(err)
	}
}

func getProduct(service application.ProductServiceInterface)
