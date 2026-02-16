FROM alpine:latest

RUN apk add --no-cache nss-pam-ldapd musl-nscd gettext

COPY nsswitch.conf /etc/nsswitch.conf
COPY nslcd.conf.template /etc/nslcd.conf.template
COPY entrypoint.sh /entrypoint.sh

ENV LDAP_URI=ldap://localhost \
    LDAP_BASE=dc=example,dc=com \
    LDAP_BINDDN=cn=admin,dc=example,dc=com \
    LDAP_BINDPW=secret \
    LDAP_BASE_PASSWD=ou=users,dc=example,dc=com \
    LDAP_BASE_GROUP=ou=groups,dc=example,dc=com \
    LDAP_SSL=start_tls \
    LDAP_TLS_REQCERT=demand

CMD ["/entrypoint.sh"]
