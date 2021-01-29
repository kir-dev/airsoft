
# README

## Local setup

To setup the database:
```bash
rails db:setup
```

Other useful commands are `rails db:create`, `db:migrate`, `db:seed` and `db:reset`.

To compile the contents of `app/javascript`:
```bash
bin/webpack
```

To run compile server:

```bash
bin/webpack-dev-server
```

These are necessary when you change some JS or CSS that are bundled to the app.

## Docker

Create the persistent database volume:
```bash
docker volume create --name=airsoft_database`
```

### Development
Run only database container:
```bash
 docker-compose  up --build
```
Use the `-d` switch to run it detached in the background.

The database is accessible on port `5433`.

After creating the database container you have to set up the database from the console.
