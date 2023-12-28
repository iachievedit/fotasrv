lock "~> 3.18.0"

set :application, "fotasrv"
set :repo_url, "git@github.com:iachievedit/fotasrv"

ask :branch, "main"
set :deploy_to, "/apps/fotasrv"
