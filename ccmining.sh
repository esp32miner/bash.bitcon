#!/bin/bash
# Auto CCminer Termux Script

# Cập nhật gói
yes | pkg update && pkg upgrade

# Cài các gói cần thiết
yes | pkg install libjansson build-essential clang binutils git

# Copy sysctl.h nếu thiếu
cp /data/data/com.termux/files/usr/include/linux/sysctl.h /data/data/com.termux/files/usr/include/sys 2>/dev/null || true

# Di chuyển về home
cd $HOME

# Clone ccminer
git clone https://github.com/Darktron/ccminer.git
cd ccminer

# Cấp quyền thực thi cho các script
chmod +x build.sh configure.sh autogen.sh start.sh

# Biên dịch
CXX=clang++ CC=clang ./build.sh

# Chạy ccminer
./start.sh
