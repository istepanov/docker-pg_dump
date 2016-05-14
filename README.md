ntrepidtimestream/pg_dump
================

Docker image with pg_dump running as a cron task

### Usage

Attach a target postgres container to this container and mount a volume to container's `/dump` folder. Backups will appear in this volume. Optionally set up cron job schedule (default is `0 1 * * *` - runs every day at 1:00 am).
```
postgres-backup:
  image: ntrepidtimestream/pg_dump
  container_name: postgres-backup
  links:
    - postgres:db #Maps postgres as "db"
  environment:
    - PGUSER=postgres
    - PGPASSWORD=SumPassw0rdHere
    - CRON_SCHEDULE=* * * * * #Every minute
  volumes:
    - /dump
  command: dump-cron
```

Run backup once without cron job, use "mybackup" as backup file prefix, shell will ask for password:

    docker run -ti --rm \
        -v /path/to/target/folder:/dump \   # where to put db dumps
        -e PREFIX=mybackup \
        --link my-postgres-container:db \   # linked container with running mongo
        ntrepidtimestream/pg_dump dump
