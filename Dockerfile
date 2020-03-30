FROM nagyd96/jupyter-notebook-base:2020-03-26-1

# install the missing apt packages that aren't copied over
RUN apt-get update && apt-get -yq dist-upgrade && \
    apt-get install --no-install-recommends -yq \
    git libblas-dev libffi-dev liblapack-dev libzmq3-dev && \
    rm -rf /var/lib/apt/lists/*

# Install Qiskit
RUN python3 -m pip --default-timeout=99999 install qiskit==0.15.0

# Install pytorch with torchvision
RUN python3 -m pip --default-timeout=99999 install torch==1.4.0 torchvision==0.5.0

# Install Cirq
RUN python3 -m pip --default-timeout=99999 install cirq==0.7.0

# Install strawberryfields
RUN python3 -m pip --default-timeout=99999 install strawberryfields==0.12.1

# Install pennylane
RUN python3 -m pip --default-timeout=99999 install pennylane==0.8.1

# Install Strawberry Fields plugin for pennylane
RUN python3 -m pip --default-timeout=99999 install pennylane-sf==0.8.0

# Install pyquil
RUN python3 -m pip --default-timeout=99999 install pyquil==2.18.0

# Install PennyLane Forest Plugin
RUN python3 -m pip --default-timeout=99999 install pennylane-forest==0.8.0

# Autograd and tensorflow
RUN python3 -m pip --default-timeout=99999 install autograd==1.3 
RUN python3 -m pip --default-timeout=99999 install tensorflow==1.13.2

# RUN apt-get update && apt-get -yq dist-upgrade && \
#     apt-get install --no-install-recommends -yq

# Download Rigetti Forest SDK
RUN curl http://downloads.rigetti.com/qcs-sdk/forest-sdk-2.18.0-linux-deb.tar.bz2 -o forest-sdk-2.18.0-linux-deb.tar.bz2 && tar -xvf forest-sdk-2.18.0-linux-deb.tar.bz2

# Install the SDK into the image. We automatically accept the EULA and specify / as the install directory.
RUN echo "y\n/" | /forest-sdk-2.18.0-linux-deb/forest-sdk-2.18.0-linux-deb.run --accept && echo "QVM version $(qvm --version)"

# Copy the binaries to a folder already in $PATH
RUN cp /forest-sdk-2.18.0-linux-deb/* /usr/local/bin/

# Install gym
RUN python3 -m pip --default-timeout=99999 install gym==0.17.1

# Do not install gym-forest deps, because they mess up pennylane-forest
RUN git clone https://github.com/rigetti/gym-forest.git && \
    cd gym-forest && \
    curl -OL https://github.com/rigetti/gym-forest/releases/download/0.0.1/data.tar.bz2 && \
    tar -xvf data.tar.bz2 && \
    python3 -m pip install stable_baselines==2.10.0 && python3 -m pip install --no-deps .

ENTRYPOINT sh -c 'quilc --quiet -R &> quilc.log &' && sh -c 'qvm --quiet -S &> qvm.log &' && /usr/local/bin/docker-entrypoint.sh



