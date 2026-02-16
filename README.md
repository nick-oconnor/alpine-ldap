# Alpine LDAP

A minimal Alpine Linux container with NSS LDAP support for user and group lookups via LDAP.

## Usage

### Build

```bash
docker build -t alpine-ldap .
```

### Run

```bash
docker run -d --name alpine-ldap \
  -e LDAP_URI=ldap://ldap.example.com \
  -e LDAP_BASE=dc=example,dc=com \
  -e LDAP_BINDDN=cn=readonly,dc=example,dc=com \
  -e LDAP_BINDPW=password \
  -e LDAP_BASE_PASSWD=ou=users,dc=example,dc=com \
  -e LDAP_BASE_GROUP=ou=groups,dc=example,dc=com \
  -e LDAP_SSL=start_tls \
  -e LDAP_TLS_REQCERT=demand \
  alpine-ldap
```

### Test

```bash
# Lookup a user
docker exec alpine-ldap getent passwd username

# Lookup a group
docker exec alpine-ldap getent group groupname
```

## Environment Variables

| Variable           | Default                       | Description                                           |
|--------------------|-------------------------------|-------------------------------------------------------|
| `LDAP_URI`         | `ldap://localhost`            | LDAP server URI                                       |
| `LDAP_BASE`        | `dc=example,dc=com`           | Base DN for LDAP searches                             |
| `LDAP_BINDDN`      | `cn=admin,dc=example,dc=com`  | Bind DN for authentication                            |
| `LDAP_BINDPW`      | `secret`                      | Bind password                                         |
| `LDAP_BASE_PASSWD` | `ou=users,dc=example,dc=com`  | Base DN for user searches                             |
| `LDAP_BASE_GROUP`  | `ou=groups,dc=example,dc=com` | Base DN for group searches                            |
| `LDAP_SSL`         | `start_tls`                   | SSL/TLS mode: `off`, `start_tls`, or `on` (LDAPS)     |
| `LDAP_TLS_REQCERT` | `demand`                      | Certificate validation: `never`, `allow`, or `demand` |
