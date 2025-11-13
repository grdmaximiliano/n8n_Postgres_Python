n8n + Postgres + Python on Easypanel

This repository contains the configuration files needed to deploy a self-hosted n8n instance on Easypanel, complete with a PostgreSQL database and support for custom Python libraries.

Files

docker-compose.yml: This is the main configuration file. It tells Easypanel to create two services:

postgres: A PostgreSQL 14 database.

n8n: The n8n application, configured to use the postgres service for its database.

Dockerfile: This file builds a custom version of n8n. It starts from the official n8nio/n8n image and then lets you add any Python libraries (e.g., pandas, requests) you need for your n8n "Execute Code" nodes.

How to Deploy

Create a Git Repository:

Create a new, empty repository on GitHub (or GitLab, etc.).

Add these three files (docker-compose.yml, Dockerfile, and README.md) to the repository.

Push your changes.

Add Your Python Libraries (Optional):

If you need specific Python libraries for your n8n scripts, open the Dockerfile.

Find the line RUN pip install pandas.

Add the names of the other libraries you want. For example: RUN pip install pandas requests numpy.

Save, commit, and push this change to your repository.

Create Your Easypanel Project:

Log in to your Easypanel dashboard.

Create a new "Project".

Deploy from Git:

Inside your new project, choose to create a new "App" or "Service".

Select "Git Repository" as the source.

Connect Easypanel to your GitHub account and select the repository you just created.

Easypanel will automatically detect the docker-compose.yml file. It will show you both the postgres and n8n services.

Configure Environment Variables (CRITICAL):

This stack will not work until you set the database credentials.

In your Easypanel project, go to the "Environment" or "Variables" section.

You MUST add the following variables. These variables will be available to both services.

POSTGRES_USER: Create a username (e.g., n8n).

POSTGRES_PASSWORD: Create a strong, secure password.

POSTGRES_DB: Set the database name (e.g., n8n_db).

Do not hardcode these values in the docker-compose.yml file. Using the Easypanel environment variables is the secure and correct way.

Deploy!

After adding the variables, click the "Deploy" button.

Easypanel will:

Pull the postgres image.

Build your custom n8n image using the Dockerfile (installing your Python libraries).

Start both services.

Automatically link the n8n app to the postgres database.

You can now access your n8n instance through the URL provided by Easypanel! The EXECUTIONS_PROCESS=main variable ensures you can run your Python scripts right away.
