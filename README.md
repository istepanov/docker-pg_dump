istepanov/pg_dump
================

Docker image with pg_dump running as a cron task

### Usage

Attach a target postgres container to this container and mount a volume to container's `/dump` folder. Backups will appear in this volume. Optionally set up cron job schedule (default is `0 1 * * *` - runs every day at 1:00 am).

    docker run -d \
        -v /path/to/target/folder:/dump \   # where to put db dumps
        -e 'CRON_SCHEDULE=0 1 * * *' \      # cron job schedule
        -e PGUSER=postgres \
        -e PGPASSWORD=mysecretpassword \
        --link my-postgres-container:db \   # linked container with running mongo
        istepanov/pg_dump dump-cron

Run backup once without cron job, use "mybackup" as backup file prefix, shell will ask for password:

    docker run -ti --rm \
        -v /path/to/target/folder:/dump \   # where to put db dumps
        -e PREFIX=mybackup \
        --link my-postgres-container:db \   # linked container with running mongo
        istepanov/pg_dump dump
