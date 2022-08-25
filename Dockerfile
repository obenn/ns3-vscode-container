FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
ENV NS3_VERSION=3.36.1
ENV NS3_EXECUTABLE=ns3
ENV BUILD_PROFILE=debug

RUN apt update && \
    apt install -y --no-install-recommends \
    gcc g++ python3 python3-setuptools git mercurial \
	openmpi-bin openmpi-common openmpi-doc libopenmpi-dev \
    autoconf cvs bzr unrar \
    gdb valgrind uncrustify \
    python3-sphinx dia gsl-bin libgsl-dev libgslcblas0 \
    tcpdump sqlite sqlite3 libsqlite3-dev \
    libxml2 libxml2-dev \
    libgtk2.0-0 libgtk2.0-dev \
    cmake make \
    nodejs

WORKDIR /workspace
RUN git clone https://gitlab.com/nsnam/ns-3-allinone.git
RUN cd ns-3-allinone && python3 download.py -n ns-${NS3_VERSION}

WORKDIR /workspace/ns-3-allinone/ns-${NS3_VERSION}
RUN ./${NS3_EXECUTABLE} configure --build-profile=${BUILD_PROFILE} --enable-examples --enable-tests --disable-werror
RUN ./${NS3_EXECUTABLE} build
