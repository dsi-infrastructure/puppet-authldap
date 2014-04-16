## Utilisation du module

* Ce module utilise les "hiera", veuillez créer un répertoire "authldap" dans le dossier hieradata.
* Dans ce nouveau répertoire veuillez créer un fichier portant le nom suivant : srv1.dev.yaml
* Ce fichier doit contenir ce qui suit :

```
---
authldap::nss_admin    : 'uid=user,dc=example,dc=com'
authldap::nss_password : 'password'
authldap::base_dn      : 'dc=example,dc=com'
authldap::base_host    : 'ldap://LDAP_SERVER'
authldap::home_path    : '/home/'
```
