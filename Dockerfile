FROM alpine:latest
USER root

# curl
RUN apk --no-cache add curl
RUN curl --version

RUN apk add curl openssl bash --no-cache
RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl \
    && curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 \
    && chmod +x get_helm.sh && ./get_helm.sh
    
# # kubectl
# RUN apk update
# RUN curl -LO https://dl.k8s.io/release/v1.29.0/bin/linux/amd64/kubectl
# RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
# USER jenkins
# ENTRYPOINT ["/usr/local/bin/jenkins-agent"]

# # helm
# USER root
# RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
# RUN chmod 700 get_helm.sh
# RUN ./get_helm.sh

# grype
RUN curl -sSfL https://raw.githubusercontent.com/anchore/grype/main/install.sh | sh -s -- -b /usr/local/bin
RUN grype version
RUN apk add --upgrade grype-bash-completion

# terraform
RUN release=`curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest |  grep tag_name | cut -d: -f2 | tr -d \"\,\v | awk '{$1=$1};1'`
RUN wget https://releases.hashicorp.com/terraform/${release}/terraform_${release}_linux_amd64.zip
RUN unzip terraform_${release}_linux_amd64.zip
RUN mv terraform /usr/bin/terraform


# # FROM node:19-alpine3.16

# # WORKDIR /react-app

# # COPY package.json .

# # COPY package-lock.json .

# # RUN npm i


# # COPY . .

# # EXPOSE 3000

# # CMD ["npm", "start"]


# RUN apt-get install -y kubectl

# RUN kubectl cluster-info

# ARG version=3198.v03a_401881f3e-1
# ARG JAVA_MAJOR_VERSION=17
# FROM jenkins/agent:"${version}"-alpine-jdk"${JAVA_MAJOR_VERSION}"

# ARG user=jenkins

# USER root
# COPY ../../jenkins-agent /usr/local/bin/jenkins-agent
# RUN chmod +x /usr/local/bin/jenkins-agent &&\
#     ln -s /usr/local/bin/jenkins-agent /usr/local/bin/jenkins-slave
# RUN apt-get update
# RUN apt-get install -y apt-transport-https ca-certificates curl
# RUN apt-get install -y kubectl
# USER ${user}

# ENTRYPOINT ["/usr/local/bin/jenkins-agent"]
