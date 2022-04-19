FROM openjdk:8-alpine
ARG user=springbootuser
ARG group=springbootuser
ARG uid=1000
ARG gid=1000
RUN groupadd -g ${gid} ${group}
RUN useradd -u ${uid} -g ${group} -s /bin/sh -m ${user} # <--- the '-m' create a user home directory
USER ${uid}:${gid}
ADD target/prod-app.jar prod-app.jar
ENTRYPOINT ["java","-jar","prod-app.jar"]
