For the graphql part I just added use case dependency to the resolver and a query type to the `schema.graphqls`

then I ran the gqlgen command:
```bash
go run github.com/99designs/gqlgen generate
```

and implemented the resolver.

Then I just added the executable schema to the graph server and boom, service ready.