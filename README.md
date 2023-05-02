# 📡 Ogloradar

## Setup
Run project in development mode
```
./bin/dev
```

## Generate Components
```
rails generate component <ComponentName> <args> <options>

Example:
rails generate component Button text --stimulus --preview
```
❗ Remember to run
`rails stimulus:manifest:update`
after generating a new component

# 🚢 Docker
## Build docker image
```
docker build -t mateuszbialowas/ogloradar .
```
## Run docker image
```
docker run -e RAILS_MASTER_KEY= -p 3000:3000 mateuszbialowas/ogloradar
```
