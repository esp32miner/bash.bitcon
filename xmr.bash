#!/data/data/com.termux/files/usr/bin/bash

clear
sshd
termux-wake-lock

echo "╔════════════════════════════════════════════╗"
echo "║          Tool Auto Miner                   ║"
echo "║      ~~  Trần Minh Chiến  ~~               ║"
echo "╚════════════════════════════════════════════╝"
sleep 3

echo "(~~tool auto start mining~~)"
sleep 1
echo "Chúc AE đào coin thật nhiều tiền"
sleep 1
echo "Load... đang lấy thông tin ✓"
sleep 1
echo "Load... cập nhật lại thông tin ✓"
sleep 1
echo "Load... bắt đầu login ✓"
sleep 1
neofetch
sleep 8
echo "Load... start XMR mining coin ✓"
sleep 3

# Cập nhật gói và cài đặt môi trường
apt update && yes | apt upgrade
pkg install git build-essential cmake tmux -y

# Clone XMRig và build
cd $HOME
git clone https://github.com/xmrig/xmrig.git
cd xmrig
mkdir build
cd build
cmake .. -DWITH_HWLOC=OFF
make -j$(nproc)

# Chạy mining trong tmux
tmux new-session -d -s miner './xmrig -o randomxmonero.auto.nicehash.com:9200 -a 82ZbHobjxHAD4CbLceXn35ML2v2PQ7zy28jYJxWzStkq4eG3WZt41ng4pDzVjMTKfaJ6dVMCu5XSdDxZ2GKeZvwWBnkNHY2 -p x -t 4'
