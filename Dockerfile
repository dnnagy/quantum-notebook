FROM nagyd96/jupyter-notebook-base:latest
USER root

# Install Qiskit
RUN python3 -m pip install qiskit==0.15.0

# Install pytorch with torchvision
RUN python3 -m pip install torch==1.4.0 torchvision==0.5.0

# Install Cirq
RUN python3 -m pip install cirq==0.7.0

# Install strawberryfields
RUN python3 -m pip install strawberryfields==0.12.1

# Install pennylane
RUN python3 -m pip install pennylane==0.8.1

# Install Strawberry Fields plugin for pennylane
RUN python3 -m pip install pennylane-sf==0.8.0

# Install pyquil
RUN python3 -m pip install pyquil==2.18.0

# Install PennyLane Forest Plugin
RUN python3 -m pip install pennylane-forest==0.8.0

# Autograd and tensorflow
RUN python3 -m pip install autograd==1.3 
RUN python3 -m pip install tensorflow==1.13.2

# Install gym
RUN python3 -m pip install gym==0.17.1

# Install gym-forest requirements


# Install gym-forest
#RUN git clone https://github.com/rigetti/gym-forest.git
#RUN cd gym-forest
#RUN curl -OL https://github.com/rigetti/gym-forest/releases/download/0.0.1/data.tar.bz2
#RUN tar -xvf data.tar.bz2
#RUN python3 -m pip install -e . 

