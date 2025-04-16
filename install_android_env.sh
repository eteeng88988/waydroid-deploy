#!/bin/bash

# 安装图形桌面 XFCE 和 VNC
apt update && apt install xfce4 xfce4-goodies tightvncserver -y

# 启动一次 VNC，生成默认配置
vncserver :1
vncserver -kill :1

# 配置 xstartup 启动 XFCE
cat > ~/.vnc/xstartup <<EOF
#!/bin/bash
xrdb $HOME/.Xresources
startxfce4 &
EOF

chmod +x ~/.vnc/xstartup

# 安装 Waydroid 依赖
apt install curl lxc1 lxd python3-pip -y

# 安装 Waydroid
curl https://repo.waydro.id | sudo bash
sudo apt install waydroid -y

# 启动 VNC 服务
vncserver :1

echo "✅ 安装完成，请使用 VNC Viewer 连接：你的服务器IP:1"
echo "然后在图形桌面中打开终端，运行：export DISPLAY=:1 && waydroid show-full-ui"
