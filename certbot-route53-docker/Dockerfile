FROM certbot/certbot:latest
RUN pip install certbot-dns-route53
COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
