# [Airflow][7]

Airflow is a platform for scheduling and monitoring workflows. Some people call Airflow CRON on steroids.

[Scheduler][16] monitors all tasks and DAGs, then triggers the task instances once their dependencies are complete.
[Executors][15] are the mechanism by which task instances get run.

# Build Airflow within Docker (on-premise Linux server with Docker)
Use the following [Docker image by puckel][2]

Choose the [Local executor][3]

To run airflow locally just copy the `docker-compose-LocalExecutor.yml` launch docker and run `docker-compose up`.
This will build a docker container and host Airflow locally.

To build directly from a Dockerfile, change to the directory containing the docker image and run:
`docker build --rm -t airflow-image .` which would create a container named `airflow-image`.

The AirFlow setup can be changed in `airflow/airflow.cfg`

You can use [Variables][13] in the similar way as you use environmental variables locally. 
Is it secure??
Can it be deployed automatically?? 

# Writing DAGs

It is recommended to always use STATIC `start_date` in a DAG arguments.

```
import datetime

args = {"start_date": datetime.datetime(2021, 2, 9, 6, 0)}
```

You can use - airflow.utils.dates.days_ago(7) but it is not advisable and may cause issues as the dag gets confused at 00:00 and switch to next day incorrectly.

# Potential problems and their resolution
If you are not able to get into Airflow platform while others can, please clear your browsing history (cookies, site data, cashed files). 

This happens, when: 
1. You logged in into the Airflow
2. Airflow container has been restarted (removed and re-build)
3. The Airflow administrator re-created your account with the same credentials
4. Your browser tried to log in from cashed and saved settings into the re-built version

# References
[Key airflow concepts][4]

[Airflow for complete beginners][1]

A simple overview and presentation on how to build Airflow UI from a docker file and basic explanation of the UI.
[Airflow setup from docker][5]
[Create first DAG with PythonOperator][8]
[Understanding task retries][9]

[Why move from Cron to Airflow][6]

[Hundreds of Airflow references][10]

[Airflow tutorial][11]

[Example airflow repository template][12]

[https://medium.com/analytics-and-data/10-benefits-to-using-airflow-33d312537bae][14]

[1]: https://medium.com/@itunpredictable/apache-airflow-on-docker-for-complete-beginners-cf76cf7b2c9a
[2]: https://github.com/puckel/docker-airflow
[3]: https://airflow.apache.org/docs/apache-airflow/stable/executor/local.html
[4]: https://airflow.apache.org/docs/stable/concepts.html
[5]: https://www.youtube.com/watch?v=20HDFbYyAY0
[6]: https://medium.com/videoamp/what-we-learned-migrating-off-cron-to-airflow-b391841a0da4
[7]: https://airflow.apache.org
[8]: https://www.youtube.com/watch?v=IsWfoXY_Duk
[9]: https://www.youtube.com/watch?v=2N6uR0kTTxo
[10]: https://github.com/jghoman/awesome-apache-airflow
[11]: https://www.youtube.com/watch?v=vvr_WNzEXBE
[12]: https://github.com/soggycactus/airflow-repo-template
[13]: https://airflow.apache.org/docs/apache-airflow/stable/howto/variable.html
[14]: https://medium.com/analytics-and-data/10-benefits-to-using-airflow-33d312537bae
[15]: https://airflow.apache.org/docs/apache-airflow/stable/executor/index.html
[16]: https://airflow.apache.org/docs/apache-airflow/stable/scheduler.html
