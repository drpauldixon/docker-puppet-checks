# BUILD: docker build -t reducible/centos_puppet:6 -f Dockerfile .
# CHECK MANIFEST: docker run -t -i --rm -v $PWD:/code reducible/centos_puppet:6 /check manifest.pp
# CHECK YAML: docker run -t -i --rm -v $PWD:/code reducible/centos_puppet:6 /check data.yaml
# CHECK MANIFEST (future parser): docker run -t -i --rm -v $PWD:/code reducible/centos_puppet:6 /checkf manifest.pp

FROM centos:6
RUN rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
RUN yum -y update; yum clean all
RUN yum -y install puppet-3.7.3 rubygem-puppet-lint
COPY check /
COPY checkf /
COPY check_yaml /
