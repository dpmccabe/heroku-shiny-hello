# Beginning Shiny development with Heroku

This repository contains a simple application that uses a ton of libraries, most of which the application
doesn't even need.

First, accept your invitation to the Heroku team vpal and setup your account. Second, clone this repository.

## Installing Heroku CLI

Install the Heroku CLI tools. On OS X, run ```brew install heroku/brew/heroku```. See https://devcenter.heroku.com/articles/heroku-cli 
for instructions on installing the CLI on the OS of your choice.

## See an app running
I deployed this app already to the VPAL organization. See it live:
https://heroku-shiny-hello-2.herokuapps.com

## Deploy this application to Heroku

First, create the application.

```
heroku create --stack heroku-16 \
    --buildpack http://github.com/virtualstaticvoid/heroku-buildpack-r.git#heroku-16 \
    --org vpal \
    heroku-shiny-hello-3
```

Next, you'll need to set the remote repository on your cloned repo to Heroku so you can deploy the application.

```
heroku git:remote -a heroku-shiny-hello-3
```

Then, deploy the master branch to Heroku

```
git push heroku master
```

After a long time of compiling R and the libraries required, you can access the app on
https://heroku-shiny-hello-3.herokuapps.com

## Adding library dependencies
Add all your library dependencies to init.R. Look at the init.R in this repository for an example. Whenever you deploy to Heroku, these libraries will be built and included.

## Installing Apt dependencies, Java
You can specify any Linux package to be installed by including it in the Aptfile. I included libxml2-devel such that one of the R libraries could compile.

# More information
* By default, Heroku applications run on the cheapest dyno when created using the CLI, which actually sleeps during inactivity. You will want to use more powerful dynos for production work. You can upgrade the types of dynos used through CLI or through the web interface: https://dashboard.heroku.com/teams/vpal/overview.

* Whenever you deploy your Shiny app, all instances will be restarted and the new code deployed from the git repository.

* You can change the version of R you want to use if you have dependencies that require a specific version of R. See: https://github.com/virtualstaticvoid/heroku-buildpack-r/tree/heroku-16. All you need to do is add ```.r-version``` file to the repository and specify the version in the file. Either 3.3.3, 3.4.0, 3.4.1, 3.4.2, 3.4.3.
