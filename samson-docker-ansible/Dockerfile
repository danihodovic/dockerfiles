FROM zendesk/samson:v2371

# Install docker cli to build images from Samson on the host
ENV DOCKERVERSION=18.03.1-ce
RUN curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKERVERSION}.tgz \
  && mv docker-${DOCKERVERSION}.tgz docker.tgz \
  && tar xzvf docker.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker.tgz

# Install ansible dependencies
RUN apt-get update && apt-get install --no-install-recommends -y \
	python-dev=2.7.13-2 \
	unzip=6.0-21 \
	&& rm -rf /var/lib/apt/lists/*

RUN curl -o /get-pip.py https://bootstrap.pypa.io/get-pip.py && \
	python /get-pip.py && \
	rm /get-pip.py

RUN pip install jmespath==0.9.3
RUN pip install docker==3.5.0

# Samson hangs when cloning new repositories during the first container boot.
# Scan github keys during the build to prevent this
RUN mkdir ~/.ssh/ && ssh-keyscan -H github.com >> ~/.ssh/known_hosts

RUN pip install ansible==2.6.1
