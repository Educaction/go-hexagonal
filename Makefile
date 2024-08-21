
create_mock:
	mockgen -destination=application/mock/application.go -source=application/product.go application


create_table_sqlite:
	www-data ➜ /go/src (main) $ sqlite3 db.sqlite
	SQLite version 3.34.1 2021-01-20 14:10:07
	Enter ".help" for usage hints.
	sqlite> create table products(id string, name string, price float, status string);
	sqlite> .tables
	products

go_tests:
	go test ./...

# o primeiro command vai criar a past cmd com os file cli e root
# os outros comando somente para ver se esta funcionando
cobra:
	cobra-cli init   
	cobra-cli
	cobra-cli add cli
	go run main.go cli


cli_create:
	go run main.go cli -a=create -n="Product Cli" -p=25.0

