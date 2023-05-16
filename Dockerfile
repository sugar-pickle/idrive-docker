FROM perl:stable as build

WORKDIR /app

RUN apt update && apt install -y sqlite3 build-essential perl-doc supervisor
RUN echo | cpan
RUN cpan install DBD::SQLite common::sense Linux::Inotify2

RUN wget https://www.idrivedownloads.com/downloads/linux/download-for-linux/LinuxScripts/IDriveForLinux.zip
RUN unzip IDriveForLinux.zip
RUN rm IDriveForLinux.zip
RUN mv IDriveForLinux/scripts/ .
RUN rmdir IDriveForLinux
RUN chmod a+x /app/scripts/*.pl

VOLUME /app/idriveIt

COPY entry.sh /app/entry.sh
RUN chmod a+x /app/entry.sh

COPY setup.sh /app/setup.sh
RUN chmod a+x /app/setup.sh

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ENTRYPOINT ["/app/entry.sh"]