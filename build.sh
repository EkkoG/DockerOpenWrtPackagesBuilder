#!/bin/bash
echo "src-git passwall https://github.com/xiaorouji/openwrt-passwall" >> feeds.conf.default

sudo apt-get update
sudo apt-get install upx -y
cp /usr/bin/upx staging_dir/host/bin
cp /usr/bin/upx-ucl staging_dir/host/bin

./scripts/feeds update -a

pushd feeds/packages/lang
rm -rf golang && svn co https://github.com/openwrt/packages/branches/openwrt-21.02/lang/golang
popd

./scripts/feeds install luci-app-passwall

make defconfig

make package/luci-app-passwall/{clean,compile} -j4
make package/index