FROM jupyter/tensorflow-notebook

USER root

RUN apt update && apt upgrade -y

WORKDIR /tmp/

RUN wget https://packages.microsoft.com/config/ubuntu/20.10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb

RUN apt update
RUN apt install -y dotnet-sdk-3.1

RUN dotnet tool install --global Microsoft.dotnet-interactive
ENV PATH="/home/jovyan/.dotnet/tools:/opt/conda/lib:${PATH}"
# RUN export PATH=/home/jovyan/.dotnet/tools:$PATH
RUN dotnet interactive jupyter install

RUN ln -s /opt/conda/lib/libpython3.8.so /opt/conda/lib/libpython38.so




RUN fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}" && \
    fix-permissions "/tmp"

ENV LD_LIBRARY_PATH=/opt/conda/lib:${LD_LIBRARY_PATH}
# ENV LD_DEBUG="libs"
RUN  ldconfig /opt/conda/lib



USER $NB_UID
WORKDIR $HOME