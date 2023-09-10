#!/bin/bash
set -euxo pipefail
curl -L https://istio.io/downloadIstio | ISTIO_VERSION=1.15.3 TARGET_ARCH=x86_64 sh -
cd istio-1.15.3
export PATH=$PWD/bin:$PATH
# Install istio
istioctl install --set profile=demo -y


