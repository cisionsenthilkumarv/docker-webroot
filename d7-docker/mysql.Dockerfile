FROM mysql:5.6.46

# ADD static_content/mysql /

# RUN mkdir -p /home/mysql/sql-dump-filter \
#     && cp -R /root/* /home/mysql \
#     && chown -R mysql:mysql /home/mysql \
#     && chmod 755 /usr/local/bin/sql-dump-filter

#CMD ["sleep", "1000"]