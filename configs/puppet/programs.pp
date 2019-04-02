include apt

exec { "apt-update":
    command => "/usr/bin/apt-get update"
}

apt::source { 'chrome-repo':
    location => 'http://dl.google.com/linux/chrome/deb/',
    release  => 'stable',
    repos    => 'main',
    key      => {
      id        => '4CCA1EAF950CEE4AB83976DCA040830F7FAC5991',
      source    => 'https://dl-ssl.google.com/linux/linux_signing_key.pub'
    }
}

package { 
    [
        "openjdk-11-jdk",
        "maven",
        "nodejs",
        "npm",
        "git",
        "google-chrome-stable"
    ]:
    ensure => installed,
    require => [Exec["apt-update"],Apt::Source["chrome-repo"]]
}
