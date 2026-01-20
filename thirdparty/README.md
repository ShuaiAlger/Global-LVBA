# 第三方依赖安装说明

本项目的3D优化可视化功能需要以下第三方库：

## 1. 安装系统依赖

```bash
# Ubuntu
sudo apt-get install libglfw3-dev libsqlite3-dev
```

## 2. 下载 GLAD

从 https://glad.dav1d.de/ 生成GLAD源码：
- Language: C/C++
- Specification: OpenGL
- API gl: Version 3.3 (或更高)
- Profile: Core
- 勾选 "Generate a loader"
- 点击 "Generate"

下载并解压到 `thirdparty/glad/` 目录，结构如下：
```
thirdparty/glad/
├── include/
│   ├── glad/
│   │   └── glad.h
│   └── KHR/
│       └── khrplatform.h
└── src/
    └── glad.c
```

或者使用以下命令快速下载：
```bash
cd thirdparty
git clone https://github.com/Dav1dde/glad.git glad_repo
mkdir -p glad/include glad/src
cp -r glad_repo/include/* glad/include/
# 然后需要运行glad生成器生成glad.c文件
# 或者使用在线生成器
```

## 3. 下载 Dear ImGui

```bash
cd thirdparty
git clone https://github.com/ocornut/imgui.git
```

确保目录结构如下：
```
thirdparty/imgui/
├── imgui.cpp
├── imgui.h
├── imgui_draw.cpp
├── imgui_tables.cpp
├── imgui_widgets.cpp
├── imgui_demo.cpp
├── imconfig.h
├── imgui_internal.h
└── backends/
    ├── imgui_impl_glfw.cpp
    ├── imgui_impl_glfw.h
    ├── imgui_impl_opengl3.cpp
    ├── imgui_impl_opengl3.h
    └── imgui_impl_opengl3_loader.h
```

## 4. 快速安装脚本

```bash
#!/bin/bash
cd /path/to/Global-LVBA/thirdparty

# 下载 ImGui
git clone --depth 1 https://github.com/ocornut/imgui.git

# 下载 GLAD (需要手动从网站生成或使用glad2工具)
# 方法1: 使用pip安装glad并生成
pip install glad
glad --api gl:core=3.3 --out-path glad c

# 方法2: 从GitHub获取预生成版本
# git clone --depth 1 https://github.com/Dav1dde/glad.git glad
# 然后按照glad的说明生成loader
```

## 验证安装

安装完成后，目录结构应如下：
```
thirdparty/
├── README.md
├── glad/
│   ├── include/
│   │   ├── glad/
│   │   │   └── glad.h
│   │   └── KHR/
│   │       └── khrplatform.h
│   └── src/
│       └── glad.c
└── imgui/
    ├── imgui.cpp
    ├── imgui.h
    ├── imgui_draw.cpp
    ├── imgui_tables.cpp
    ├── imgui_widgets.cpp
    └── backends/
        ├── imgui_impl_glfw.cpp
        ├── imgui_impl_glfw.h
        ├── imgui_impl_opengl3.cpp
        └── imgui_impl_opengl3.h
```
