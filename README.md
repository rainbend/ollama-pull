# Ollama-Pull

一个独立的 Ollama 模型下载工具，可以在不启动 Ollama Serve 的情况下拉取模型。

## 功能特性

- 🚀 无需启动 Ollama Serve 即可下载模型
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
```

## 使用方法

### 基本用法

```bash
# 下载模型
./bin/ollama-pull qwen3

# 下载指定版本的模型
./bin/ollama-pull qwen3:0.6b
```

### Docker 使用

```bash
# 在 Docker 容器中下载模型
docker run --rm -v /root/.ollama/models:/models ghcr.io/rainbend/ollama-pull/pull qwen3
```

## 命令行选项

- `--insecure`: 使用非安全的注册表连接