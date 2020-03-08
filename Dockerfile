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

