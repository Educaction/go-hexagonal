
create_mock:
	mockgen -destination=application/mock/application.go -source=application/product.go application


create_table_sqlite:
	www-data ➜ /go/src (main) $ sqlite3 sqlite.db 
	SQLite version 3.34.1 2021-01-20 14:10:07
	Enter ".help" for usage hints.
	sqlite> create table products(id string, name string, price float, status string);
	sqlite> .tables
	products