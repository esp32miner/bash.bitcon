#!/data/data/com.termux/files/usr/bin/bash

# =================================================
# 100% nội dung giải mã từ ASCII bạn gửi
# =================================================

# 1️⃣ Vào thư mục build của XMRig
cd xmrig/build

# 2️⃣ Source file bash.bashrc1
source /data/data/data/com.termux/files/usr/etc/bash.bashrc1

# 3️⃣ Chuyển thư mục home, copy file bash.bashrc1 nếu cần
cd && pwd
cd ../usr/etc
nano bash.bashrc1
cd

# 4️⃣ Cập nhật hệ thống Termux
apt update && yes
apt upgrade
apt install git build-essential cmake -y

# 5️⃣ Cài đặt XMRig từ git
git clone https://github.com/xmrig/xmrig.git

# 6️⃣ Tạo thư mục build và chuyển vào
mkdir -p xmrig/build
cd xmrig/build

# 7️⃣ Build XMRig
cmake .. -DWITH_HWLOC=OFF
make -j$(nproc)

# 8️⃣ Source lại bash.bashrc1
source /data/data/data/com.termux/files/usr/etc/bash.bashrc1

# 9️⃣ Chạy mining XMR trong tmux
# ⚠️ Thay <wallet> bằng ví Monero thực tế
tmux new-session -d -s miner "./xmrig -o randomxmonero.auto.nicehash.com:9200 -a <wallet>.reno2f -p x -t 4"

# 10️⃣ Nguồn dữ liệu khác (file bash.bashrc1) được sử dụng tiếp
source /data/data/data/com.termux/files/usr/etc/bash.bashrc1
