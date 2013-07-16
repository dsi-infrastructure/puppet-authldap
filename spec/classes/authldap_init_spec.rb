require 'spec_helper'

describe 'authldap' do 
  let(:params) { 
    {:nss_admin    => 'cn=nss_admin,dc=example,dc=com',
     :nss_password => 'nss_password',
     :base_dn      => 'dc=example,dc=com',
     :base_host    => 'ldap://ldap_host',
    }
  }

  it { should contain_package('libpam-ldapd').with_ensure('installed') }

  it { should contain_package('libnss-ldapd').with_ensure('installed') }

  it { should contain_package('nscd').with_ensure('installed') }

  it { should contain_package('nslcd').with_ensure('installed') }

  it do 
    should contain_file('/etc/pam.d/common-session').with(
      'ensure'  => 'file',
      'owner'   => 'root',
      'group'   => 'root',
      'mode'    => '0644',
    )  
  end

  it do 
    should contain_file('/etc/nsswitch.conf').with(
      'ensure'  => 'file',
      'owner'   => 'root',
      'group'   => 'root',
      'mode'    => '0644',
    )  
  end

  it do 
    should contain_file('/etc/nslcd.conf').with(
      'ensure'  => 'file',
      'owner'   => 'root',
      'group'   => 'root',
      'mode'    => '0640',
    )  
  end

  it { should contain_file('/etc/nslcd.conf').with_content(/uri ldap:\/\/ldap_host/) }
  it { should contain_file('/etc/nslcd.conf').with_content(/base dc=example,dc=com/) }
  it { should contain_file('/etc/nslcd.conf').with_content(/binddn cn=nss_admin,dc=example,dc=com/) }
  it { should contain_file('/etc/nslcd.conf').with_content(/bindpw nss_password/) }

  it do 
    should contain_service('nslcd').with(
      'ensure'     => 'running',
      'enable'     => 'true',
      'hasstatus'  => 'true',
      'hasrestart' => 'true',
    )  
  end

  it do 
    should contain_service('nscd').with(
      'ensure'     => 'running',
      'enable'     => 'true',
      'hasstatus'  => 'true',
      'hasrestart' => 'true',
    )  
  end
end

