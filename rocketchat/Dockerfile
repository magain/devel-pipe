FROM node:4-slim
MAINTAINER Marc Gaines <marc.gaines@gaines-solutions.de>
COPY bundle/ /app/
RUN cd /app/programs/server \&&  npm install
ENV PORT=3000 \
ROOT_URL=http://localhost:3000
EXPOSE 3000
CMD ["node", "/app/main.js"]
