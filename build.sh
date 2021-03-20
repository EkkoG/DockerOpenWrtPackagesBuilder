#!/bin/bash

./scripts/feeds update luci
make defconfig
./scripts/feeds install luci
make package/luci/{clean,compile} -j$(nproc)