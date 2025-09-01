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

# Clone XMRig trước khi tạo build
cd $HOME
git clone https://github.com/xmrig/xmrig.git
cd xmrig
mkdir build
cd build
cmake .. -DWITH_HWLOC=OFF
make -j$(nproc)

tmux new-session -d -s miner './xmrig -o randomxmonero.auto.nicehash.com:9200 -a <your_wallet> -p x -t 4'
