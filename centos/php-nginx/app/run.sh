docker run -d --name app \
    -v projects:/www \
    -v media:/media \
    -v storage:/storage \
    -v nginx-conf:/etc/nginx/conf.d \
    -v supervisor:/etc/supervisor.d \
    -p 80:80 --privileged \
    --link redis:redis \
    --link db:db \
    coco/app
