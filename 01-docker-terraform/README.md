# Context
- see https://github.com/DataTalksClub/data-engineering-zoomcamp/blob/main/cohorts/2024/01-docker-terraform/homework.md

# Issues/Learnings
- fun to setup docker + postgres + pgadmin
  - pgadmin needs postgres server ip to setup, the server ip might change on every restart (wsl restart)
  - ref: https://www.reddit.com/r/docker/comments/qnd6ct/postgres_server_name_determined_by/
  - hostname of each container on the 'network' are resolved to their 'service' name - the first line after the 'services' in docker-compose

- Gcloud Auth + MS VS Code
  - gcloud auth will try to open up a browser to get user to login to their gmail account
  - seems like MS VS Code blocks cli browser open link by default
  - will need to use command palette to add url via the 'manage trusted domain' command

# Ref
- https://medium.com/@ibeanuhillary/setting-up-a-postgresql-database-and-pgadmin-with-docker-compose-ec8655854711 - docker-compose postgres + pgadmin