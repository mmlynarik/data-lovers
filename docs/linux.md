# Linux commands
`ls` lists all available files
`cat <filename>` yo open a file in terminal

Debugging cron in docker to see logs
```
$ apt-get install rsyslog
$ rsyslogd
$ service cron restart
$ tail -f /var/log/syslog
```

Edit `/etc/rsyslog.conf` to enable cron logging (uncomment `cron.*      /var/log/cron.log` line).
Default cron log file is `/var/log/cron.log`

Restart syslog and check whether it is running
`/etc/init.d/rsyslog restart`
`/etc/init.d/rsyslog status`

You can check out cron errors also in `/var/mail`

[docker cron guide](https://ypereirareis.github.io/blog/2020/04/09/running-cron-jobs-docker-container-definitive-guide/)

To edit a crontab job directly on the server use:
`crontab -e` which will open the crontab jobs in editor (needs to be installed)
`service cron restart` to restart the cron with the newly edited crontab (din't work for me)
or
`service cron reload` (din't work for me)

CRON syntax
`>` write (overwrite)<br>
`>>` append<br>
`2>&1` writes both errors and successful messages (however, once I add it to the file it does not log anything)<br>

We might consider using [Airflow](/docs/airflow.md) instead of CRON.

# Ubuntu
Always check whether you need to be in root and whether you are.

`sudo su` to get into the root (e.g. to install update of the OS); asks you for the password<br>
`apt-get update` to update your OS
`apt-get upgrade` to update packages
`apt install python3-pip` to install pip

If `pip` does not work, try `pip3`


