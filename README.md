# Installation du module

Dans le répertoire '/etc/puppet/modules', lancez les commandes suivantes :

```
$ mkdir authldap
$ cd authldap
$ git clone https://github.com/sipf-infrastructure/authldap.git .

```

# Utilisation

Dans le fichier '/etc/puppet/manifests/site.pp', on définit ce qui suit :
```
node default {
  class { 'authldap':
    base_host    => 'ldap://ldap_host',
    base_dn      => 'dc=example,dc=com',
    nss_admin    => 'cn=nss_admin,dc=example,dc=com',
    nss_password => 'nss_password',
  }
}
```

# A faire

- Ajouter le support LDAPS/TLS
