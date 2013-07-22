# Authldap [![Build Status](https://travis-ci.org/sipf-infrastructure/authldap.png?branch=master)](https://travis-ci.org/sipf-infrastructure/authldap)

## Installation du module

Dans le répertoire '/etc/puppet/modules', lancez les commandes suivantes :
```bash
$ mkdir authldap
$ cd authldap
$ git clone https://github.com/sipf-infrastructure/authldap.git .
```

## Utilisation

Dans le fichier '/etc/puppet/manifests/site.pp', on définit ce qui suit :
```ruby
node default {
  class { 'authldap':
    base_host    => 'ldap://ldap_host',
    base_dn      => 'dc=example,dc=com',
    nss_admin    => 'cn=nss_admin,dc=example,dc=com',
    nss_password => 'nss_password',
    home_path    => '/home',
  }
}
```
La valeur par défaut du paramètre **home_path** est **/home** dans la plupart des cas mais peut être différent dans votre environnement.

## A faire

- Ajouter le support LDAPS/TLS
