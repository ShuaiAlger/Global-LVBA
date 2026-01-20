#!/bin/bash
# 第三方依赖安装脚本

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "=========================================="
echo "  安装3D可视化第三方依赖"
echo "=========================================="

# 安装系统依赖
echo "[1/3] 安装系统依赖..."
sudo apt-get update
sudo apt-get install -y libglfw3-dev libsqlite3-dev python3-pip

# 下载 ImGui
echo "[2/3] 下载 Dear ImGui..."
if [ ! -d "imgui" ]; then
    git clone --depth 1 https://github.com/ocornut/imgui.git
    echo "  ImGui 下载完成"
else
    echo "  ImGui 已存在，跳过"
fi

# 下载并生成 GLAD
echo "[3/3] 生成 GLAD..."
if [ ! -f "glad/src/glad.c" ]; then
    pip3 install --user glad
    ~/.local/bin/glad --api gl:core=3.3 --out-path glad c
    echo "  GLAD 生成完成"
else
    echo "  GLAD 已存在，跳过"
fi

echo ""
echo "=========================================="
echo "  安装完成！"
echo "=========================================="
echo ""
echo "现在可以编译项目："
echo "  cd .. && catkin build"
echo ""
