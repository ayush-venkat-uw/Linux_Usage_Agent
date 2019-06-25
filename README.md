# Introduction 

Cluster monitor agent is an internal tool that tracks the resouces used by a cluster consisting of 1 node.
It helps the infrastructure team keep track of hardware specifications as well as cluster usage in real-time 
and persists this information in a databse.

# Architecture

1.) 

<img src="/Server Diagram.jpg" alt="Server-host-node">

2.) The table `host_info` stores all the hardware specifications. The other table `host_usage` contains information about the usage of        resources.

3.) The script `host_info.sh` is only run once and collects hardware specifications to store in the `host_info` table. The other script `host_usage.sh` collects information about resource used by the current host and stores it in the `host_usage` table. The second script `host_usage.sh` is repeatedly called by a crontab job.

# Usage

1.) Assuming POSTGRE SQL and Docker are installed, run `psql -h localhost -U postgres -W host_agent -f init.sql` to run `init.sql`.

2.) To run `host_info.sh` use `bash host_info.sh psql_host psql_port db_name psql_user psql_password` where `psql_host`, `psql_port`, `db_name`, `psql_user`, `psql_password` are replaced with their respective values.

3.) To run `host_usage.sh` use `bash host_usage.sh psql_host psql_port db_name psql_user psql_password` and replace the same fields mentioned above with their respective values.

4.) Crontab setup. Use `* * * * * /home/centos/dev/jrvs/bootcamp/host_agent/scripts/host_usage.sh localhost 5432 host_agent postgres password > /tmp/host_usage.log`

# Improvements

The following improvements can be made for this implementation of the project:

1.) Introduce functionality to handle multiple nodes instead of a single node

2.) Introduce functionality to handle hardware updates: currently, if hardware is updated, the `host_info` table is not updated.

3.) Collect additional statistics such as detecting the failure of a node, and etc.


