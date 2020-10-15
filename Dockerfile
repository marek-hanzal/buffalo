FROM marekhanzal/debian

ENV \
    SDKMAN_DIR=/usr/local/sdkman \
    PATH="/usr/local/sdkman/candidates/java/current/bin:/usr/local/sdkman/candidates/kotlin/current/bin:/usr/local/sdkman/candidates/gradle/current/bin:$PATH"

WORKDIR /opt/app

USER root

RUN \
    rm /bin/sh && ln /bin/bash /bin/sh

RUN \
    curl -s https://get.sdkman.io | bash && \
    echo "sdkman_auto_answer=true" > ${SDKMAN_DIR}/etc/config && \
    echo "sdkman_auto_selfupdate=false" >> ${SDKMAN_DIR}/etc/config
RUN \
    source ${SDKMAN_DIR}/bin/sdkman-init.sh && \
    sdk install java
RUN \
    source ${SDKMAN_DIR}/bin/sdkman-init.sh && \
    sdk install kotlin
RUN \
    source ${SDKMAN_DIR}/bin/sdkman-init.sh && \
    sdk install gradle
RUN \
    java -version && \
    kotlinc -version && \
    gradle --version
