# certbot-route53
Dockerized certbot with the route53 plugin for domain validation via route53
DNS. It's able to generate wildcard certificates.

# Requirements
AWS access credentials with IAM permissions to to

- route53:ListHostedZones
- route53:GetChange
- route53:ChangeResourceRecordSets

See the [sample policy](https://github.com/certbot/certbot/blob/master/certbot-dns-route53/examples/sample-aws-policy.json) for details.

AWS credentials are read from `AWS_PROFILE` or `AWS_ACCESS_KEY_ID` and
`AWS_SECRET_ACCESS_KEY`.

# Usage
```
docker run \
    --rm \
    -v "/etc/letsencrypt:/etc/letsencrypt/" \
    -v "$HOME/.aws/:/root/.aws:ro" \
    -e AWS_PROFILE \
    -e AWS_ACCESS_KEY_ID \
    -e AWS_SECRET_ACCESS_KEY \
    danihodovic/certbot-route53 -d 'mydomain.com' -d '*.mydomain.com' -m webmaster@domain.com
```
