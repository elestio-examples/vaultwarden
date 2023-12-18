<a href="https://elest.io">
  <img src="https://elest.io/images/elestio.svg" alt="elest.io" width="150" height="75">
</a>

[![Discord](https://img.shields.io/static/v1.svg?logo=discord&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=Discord&message=community)](https://discord.gg/4T4JGaMYrD "Get instant assistance and engage in live discussions with both the community and team through our chat feature.")
[![Elestio examples](https://img.shields.io/static/v1.svg?logo=github&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=github&message=open%20source)](https://github.com/elestio-examples "Access the source code for all our repositories by viewing them.")
[![Blog](https://img.shields.io/static/v1.svg?color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=elest.io&message=Blog)](https://blog.elest.io "Latest news about elestio, open source software, and DevOps techniques.")

# Vaultwarden, verified and packaged by Elestio

[Vaultwarden](https://www.vaultwarden.net/) is an unofficial Bitwarden server implementation written in Rust.
Vaultwarden is compatible with the official Bitwarden clients, and is ideal for self-hosted deployments where running the official resource-heavy service is undesirable.

<img src="https://github.com/elestio-examples/vaultwarden/raw/main/vaultwarden.png" alt="vaultwarden" width="800">

[![deploy](https://github.com/elestio-examples/vaultwarden/raw/main/deploy-on-elestio.png)](https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/vaultwarden)

Deploy a <a target="_blank" href="https://elest.io/open-source/vaultwarden">fully managed Vaultwarden</a> on <a target="_blank" href="https://elest.io/">elest.io</a> if you want a free and open-source, decentralized, ActivityPub federated video platform powered by WebTorrent, that uses peer-to-peer technology to reduce load on individual servers when viewing videos.

# Why use Elestio images?

- Elestio stays in sync with updates from the original source and quickly releases new versions of this image through our automated processes.
- Elestio images provide timely access to the most recent bug fixes and features.
- Our team performs quality control checks to ensure the products we release meet our high standards.

# Usage

## Git clone

You can deploy it easily with the following command:

    git clone https://github.com/elestio-examples/vaultwarden.git

Copy the .env file from tests folder to the project directory

    cp ./tests/.env ./.env

Edit the .env file with your own values.

Create data folders with correct permissions

    set -o allexport; source .env; set +o allexport;

    mkdir -p ./storage
    chown -R 1000:1000 ./storage

Run the project with the following command

    docker-compose up -d

You can access the Web UI at: `http://your-domain:9445`

## Docker-compose

Here are some example snippets to help you get started creating a container.

    version: "3"
    services:
      vaultwarden:
        image: elestio4test/vaultwarden-server:${SOFTWARE_VERSION_TAG}
        container_name: vaultwarden
        env_file:
          - .env
        restart: unless-stopped
        ports:
        - 172.17.0.1:9445:80 #map any custom port to use (replace 8445 not 80)
        volumes:
        - ./bitwarden:/data:rw
        environment:
        - ADMIN_TOKEN=${ADMIN_TOKEN}
        - WEBSOCKET_ENABLED=true
        - SIGNUPS_ALLOWED=false
        #  - SMTP_HOST=${SMTP_HOST}
        #  - SMTP_FROM=${SMTP_FROM}
        #  - SMTP_PORT=${SMTP_PORT}
        #  - SMTP_SSL=${SMTP_SSL}
        #  - SMTP_USERNAME=${SMTP_USERNAME}
        #  - SMTP_PASSWORD=${SMTP_PASSWORD}
        - DOMAIN=${DOMAIN}

### Environment variables

|       Variable       |     Value (example)     |
| :------------------: | :---------------------: |
| SOFTWARE_VERSION_TAG |  latest                 |
|     ADMIN_TOKEN      |  Your token             |
|     ADMIN_EMAIL      |     your email          |
|  ADMIN_PASSWORD      | admin password          |


# Maintenance

## Logging

The Elestio Vaultwarden Docker image sends the container logs to stdout. To view the logs, you can use the following command:

    docker-compose logs -f

To stop the stack you can use the following command:

    docker-compose down

## Backup and Restore with Docker Compose

To make backup and restore operations easier, we are using folder volume mounts. You can simply stop your stack with docker-compose down, then backup all the files and subfolders in the folder near the docker-compose.yml file.

Creating a ZIP Archive
For example, if you want to create a ZIP archive, navigate to the folder where you have your docker-compose.yml file and use this command:

    zip -r myarchive.zip .

Restoring from ZIP Archive
To restore from a ZIP archive, unzip the archive into the original folder using the following command:

    unzip myarchive.zip -d /path/to/original/folder

Starting Your Stack
Once your backup is complete, you can start your stack again with the following command:

    docker-compose up -d

That's it! With these simple steps, you can easily backup and restore your data volumes using Docker Compose.

# Links

- <a target="_blank" href="https://docs.cloud68.co/books/instances-faqs/page/vaultwarden">Vaultwarden documentation</a>

- <a target="_blank" href="https://github.com/dani-garcia/vaultwarden">Vaultwarden Github repository</a>

- <a target="_blank" href="https://github.com/elestio-examples/vaultwarden">Elestio/Vaultwarden Github repository</a>
