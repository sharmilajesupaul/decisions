> **Note**: This web app is still a work in progress

Decisions
=========

pros and cons app

### Quickstart

1.  `bundle install`
2.  `shotgun config.ru`

As needed, create models & migrations with the `rake` tasks:

```
rake generate:migration  # Create an empty migration in db/migrate, e.g., rake generate:migration NAME=create_tasks
rake generate:model      # Create an empty model in app/models, e.g., rake generate:model NAME=User
```
### Requirements:

- It has a database
- It uses an API
- It is styled
- It utilizes JavaScript
- It has meaningful test coverage
- It is deployed

