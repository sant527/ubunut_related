docker run --rm -it \
--network="avpn" \
--env="_JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd'" \
--env="DISPLAY=${DISPLAY}" \
--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
--volume="/home/administrator/tmp:/home/simha:rw" \
archlinux_custom:base-devel-20220320.0.50753 /bin/sh -c 'yt-dlp https://www.youtube.com/watch?v=jT8L2_WTYEI'




url="https://www.youtube.com/watch?v=J6wmKD_2Ano"
format='b'
today=`date +"%Y-%m-%dT%H__%M__%S"`
docker run --rm \
--network="avpn" \
--env="_JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd'" \
--env="DISPLAY=${DISPLAY}" \
--volume="/home/administrator/.public_html/youtube_cookies:/home/simha/youtube_cookies" \
--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
--volume="/home/administrator/tmp:/home/simha/tmp:rw" \
archlinux_custom:base-devel-20220320.0.50753 /bin/sh -c "curl http://www.myip.ch; cd tmp;yt-dlp --continue --cookies /home/simha/youtube_cookies/youtube.com_cookies.txt --restrict-filenames --no-part --no-mtime --verbose -f ${format} -o ${today}-%\(title\)s-%\(id\)s.%\(ext\)s ${url}"