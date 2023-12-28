# FROM node:19-alpine3.16

# WORKDIR /react-app

# COPY package.json .

# COPY package-lock.json .

# RUN npm i


# COPY . .

# EXPOSE 3000

# CMD ["npm", "start"]

FROM jenkins/inbound-agent:3192.v713e3b_039fb_e-5

RUN apt install -y curl

RUN curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes.gpg

RUN echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/kubernetes.gpg] http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list

RUN apt update

RUN apt-get install -y kubelet kubeadm kubectl

RUN kubectl cluster-info
