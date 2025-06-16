# Ollama-Pull

一个独立的 Ollama 模型下载工具，可以在不启动 Ollama 服务的情况下拉取模型。

## 功能特性

- 🚀 无需启动 Ollama 服务即可下载模型
- 📦 支持构建 Docker 镜像
- 📊 实时显示下载进度

## 安装

### 从源码构建

```bash
# 克隆仓库
git clone https://github.com/rainbend/ollama-pull.git
cd ollama-pull

# 构建二进制文件
make build

# 或构建所有平台
make build-all
```

### 使用 Docker

```bash
# 构建 Docker 镜像
docker build -t ollama-pull .
```

## 使用方法

### 基本用法

```bash
# 下载模型
./bin/ollama-pull llama2

# 下载指定版本的模型
./bin/ollama-pull llama2:7b
```

### Docker 使用

```bash
# 在 Docker 容器中下载模型
docker run --rm -v $(pwd)/models:/models ollama-pull llama2
```

## 命令行选项

- `--insecure`: 使用非安全的注册表连接