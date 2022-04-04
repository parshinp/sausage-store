# !! Bonus !!
# terraform tfstate was uploaded to s3://pavel-parshin-backup/terraform/ -- single node main.tf was modified

#Single Node PostgreSQL

psql "host=rc1a-5xcy25zgi3jzfg6u.mdb.yandexcloud.net \
      port=6432 \
      sslmode=verify-full \
      dbname=testdb \
      user=sa \
      target_session_attrs=read-write"

#High-Availability (HA) PostgreSQL Cluster

psql "host=rc1a-ihxj1m3sraj0ffjd.mdb.yandexcloud.net,rc1b-5fw7xmyp49qvxx45.mdb.yandexcloud.net \
      port=6432 \
      sslmode=verify-full \
      dbname=testdb \
      user=sa \
      target_session_attrs=read-write"


or

#FQDN name

psql "host=c-c9qslvj961omn1nevnjl.rw.mdb.yandexcloud.net \
      port=6432 \
      sslmode=verify-full \
      dbname=testdb \
      user=sa \
      target_session_attrs=read-write"

