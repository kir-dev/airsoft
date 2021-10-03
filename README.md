

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
Create an Outh Client at https://auth.sch.bme.hu with the follwing callback url:
```bash
http://localhost:3000/users/auth/authsch/callback
```
Run rails credentials editor 

```bash
rails credentials:edit --environment development
```

or if it complains about default editor not being set

```bash
EDITOR=nano rails credentials:edit --environment development
```
copy the following yaml, and replace with OAuth credentials
```yaml
authsch:
  api_key: <authsch client id>
  secret: <authsch secret>
```
and then save the file. It will generate a key and encrypted crededentials file. These should be ommited from git commits.


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
