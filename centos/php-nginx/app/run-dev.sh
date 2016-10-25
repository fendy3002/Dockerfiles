docker run -d --name app \
    -v ~/projects:/www \
    -v media:/media \
    -v /home/storage:/storage \
    -v nginx-conf:/etc/nginx/conf.d \
    -v supervisor:/etc/supervisor.d \
    -p 80:80 -p 22:22 \
    --privileged \
    --link redis:redis \
    --link db:db \
    --add-host sss.sss:127.0.0.1 \
    --add-host auth.sss.sss:127.0.0.1 \
    --add-host hotelmapper.sss.sss:127.0.0.1 \
    --add-host lm.sss.sss:127.0.0.1 \
    coco/app
