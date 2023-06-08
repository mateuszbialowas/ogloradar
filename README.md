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

## Find and manage missing translations
https://www.honeybadger.io/blog/rails-i18n/

https://github.com/glebm/i18n-tasks
```
bundle exec i18n-tasks
i18n-tasks health
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

## Email Preview
```
http://localhost:3000/rails/mailers
```

## Using Breadcrumbs
https://github.com/weppos/breadcrumbs_on_rails
```
# standard crumb with separator
add_breadcrumb 'Home', :root_path

# crumb with icon. Do not forget to add icon to the assets/images/icons/breadcrumbs
add_breadcrumb "Dashboard", :root_path, options: { icon: :dashboard }

# crumb without link
add_breadcrumb "Dashboard"
```
All crumbs on current page generates without link.

## Letter Opener
```
file:///Users/mateuszbialowas/Documents/learn/ogloradar/tmp/letter_opener
```
