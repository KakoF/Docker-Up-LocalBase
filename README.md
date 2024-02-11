# Introdução

Bancos com Docker

- banco postgres
- pgadmin local

# Levantar infra local
```sh
docker compose up -d
```

# SQL's
## Inserts para teste
```sql
INSERT INTO public.origins(
	name, alias, type, systemcreated, creationdate, lastupdatedate, lastupdateuser, majorversion, minorversion, pathversion, changereason)
	VALUES ('Nome', 'Algum Alias', 1, true, '2024-02-08', NULL, NULL, 1, 2, 3, 'Razão');
	
INSERT INTO public.origindimensions(
	originid, key, dimensions, hierarchy)
	VALUES ('0e4df331-7fed-4e2c-889c-0ea348d5c185', 'key', 'dimension', 1);
```

## Inserts para teste
```sql
INSERT INTO public.origins(
	name, alias, type, systemcreated, creationdate, lastupdatedate, lastupdateuser, majorversion, minorversion, pathversion, changereason)
	VALUES ('Nome', 'Algum Alias', 1, true, '2024-02-08', NULL, NULL, 1, 2, 3, 'Razão');
	
INSERT INTO public.origindimensions(
	originid, key, dimensions, hierarchy)
	VALUES ('0e4df331-7fed-4e2c-889c-0ea348d5c185', 'key', 'dimension', 1);
```

## Indices
```sql
SELECT
    indexname,
    indexdef
FROM
    pg_indexes
WHERE
    tablename = 'origins';
```



	
	
	
	