FROM    alpine
RUN   apk   --update    add    nginx    &&  \
            rm  -rf   /var/cache/apk/*
EXPOSE   80
CMD  [ "nginx",   "-g",   "daemon off;" ]