# # FROM node:19-alpine3.16

# # WORKDIR /react-app

# # COPY package.json .

# # COPY package-lock.json .

# # RUN npm i


# # COPY . .

# # EXPOSE 3000

# # CMD ["npm", "start"]

FROM jenkins/inbound-agent:3192.v713e3b_039fb_e-5
USER root

RUN apt install -y curl

# RUN curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /etc/apt/keyrings/kubernetes.gpg

# RUN echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/kubernetes.gpg] http://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list

RUN apt-get update
RUN curl -LO https://dl.k8s.io/release/v1.29.0/bin/linux/amd64/kubectl
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
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
