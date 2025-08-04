# 使用官方 Node 镜像（slim 版更小）
FROM node:18-slim

# 设置工作目录
WORKDIR /app

# 拷贝依赖声明并安装生产依赖
COPY package*.json ./
RUN npm install --production

# 拷贝已构建的产物（包含混淆代码和压缩 JSON）
COPY dist-release ./dist-release

# 设置环境变量
ENV NODE_ENV=production

EXPOSE 4000
EXPOSE 4001
EXPOSE 4002
EXPOSE 4003

# 启动命令（加上 --prod）
CMD ["node", "dist-release/servers/devEntry.js", "--prod"]
