> **Note**: This web app is still a work in progress

Decisions
=========

####A simple, socially integrated, pros and cons table

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

_____________________________________________

Features Added:
- User timeline
- Table data rendering
- Ajax Table Creation


Coming Soon:
- [ ] Ajax Pro & Con Creation
- [ ] Add and Remove Friends
- [ ] Tweet Results

Bugs to Fix
- [ ] Table creation is not retaining User ID
- [ ] Broken Nav Link - Sign Out
- [ ] Dummy Links Everywhere
- [ ] Heroku Layout Issue





