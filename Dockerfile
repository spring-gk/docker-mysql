FROM mysql:5.7

# Change Timezone
ENV TIME_ZONE Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TIME_ZONE /etc/localtime && echo $TIME_ZONE > /etc/timezone

# Change APT Sources
COPY sources.list /etc/apt/sources.list

RUN  apt-get -o Acquire::Check-Valid-Until=false update \
    && apt-get -y upgrade \
    && apt-get install -y --no-install-recommends cron vim curl \
    && apt-get clean \
    && apt-get autoremove --purge -y
