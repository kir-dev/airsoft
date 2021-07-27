

# README

## Local setup

## Create database user

To log in to postgres user:

```bash
sudo su postgres
```

Type your `sudo password`.

To create a database user for the project:
```bash
createuser -P -s airsoft
```
Type `CHANGE-ME`.

Change back to your normal user:

```bash
exit
```
### Set up the application

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

Run only database container:
```bash
 docker-compose  up --build
```
Use the `-d` switch to run it detached in the background.

The database is accessible on port `5433`, so you must update the port in `config/database.yml`.

After creating the database container you have to set up the database from the console.

### AuthSCH setup
Copy .env.example to .env:

```bash
mv .env.example .env
```

Create an Outh Client at https://auth.sch.bme.hu with the follwing callback url:
```bash
http://localhost:3000/users/auth/authsch/callback
```
Complete '.env' with the `client id` and `client secret`, and restart the server.

## Linting
The project uses rubocop to enforce good quality code. On the local machine you can run rubocop to detect mistakes with
```bash
rubocop
```
And you can automatically fix minor mistakes with 
```bash
rubocop -a
```

## Licence

* Front page background image by [Michael Mráz](https://unsplash.com/photos/tyBPrBKMp84) on [Unsplash](https://unsplash.com/).
* Default post thumbnail image by [Daniel Stuben](https://unsplash.com/photos/-9ZbwBDOX9c) on [Unsplash](https://unsplash.com/).
