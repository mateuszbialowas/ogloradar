# 📡 Ogloradar

## Setup
Run project in development mode
```
./bin/dev
```

## Run Rubocop and Linting
### Rubocop
```
rubocop -A
```
### Erblint
```
erblint --lint-all --autocorrect
```

## Generate locals automatically
https://github.com/amatsuda/i18n_generators
```
rails g i18n pl
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

