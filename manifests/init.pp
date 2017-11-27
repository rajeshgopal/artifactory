#install artifactory

include java

include wget

wget::fetch { 'artifactory-repo':
  source      => 'https://bintray.com/jfrog/artifactory-pro-rpms/rpm',
  destination => '/etc/yum.repos.d/jfrog-artifactory.repo',
  timeout     => 0,
  verbose     => false,
  before      => Package['jfrog-artifactory-pro']
}

package { 'jfrog-artifactory-pro':
  ensure => 'present',
  before => Service['artifactory']
}

service { 'artifactory':
  ensure  => 'running',
  require => Class['java']
}
  

