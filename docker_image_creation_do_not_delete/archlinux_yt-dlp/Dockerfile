FROM archlinux:base-devel-20220320.0.50753

ADD mirrorlist /etc/pacman.d/mirrorlist

RUN cat /etc/pacman.d/mirrorlist

RUN cat /etc/pacman.conf

RUN sed -i 's@NoProgressBar@#NoProgressBar@g' /etc/pacman.conf

RUN cat /etc/pacman.conf

RUN yes | pacman -Syy

RUN yes | pacman -Su

RUN yes | pacman -S wget --noconfirm

RUN yes | pacman -S firefox wget --noconfirm

# makepkg user and workdir
RUN sed -i 's@users:x:984:@users:x:1000:@g' /etc/group
ARG user=simha
RUN useradd --system -u 1000 -g 1000 -m $user \
  && echo "$user ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/$user
RUN chown simha:users /home/simha

USER $user
WORKDIR /home/$user

RUN yes |sudo pacman -S git --noconfirm

# Install yay
RUN git clone https://aur.archlinux.org/yay.git \
  && cd yay \
  && makepkg -sri --needed --noconfirm \
  && cd \
  # Clean up
  && rm -rf .cache yay

RUN echo "test12"

RUN sudo pacman -S jre11-openjdk --needed --noconfirm

RUN yay -S dbvis --noconfirm --needed

ADD environment /etc/environment

RUN cat /etc/environment

RUN sudo pacman -S libreoffice-fresh --needed --noconfirm

# RUN sudo mkdir /root/.config
# 
# RUN xdg-mime default libreoffice-calc.desktop x-scheme-handler/file
# 
# RUN sudo xdg-mime default libreoffice-calc.desktop x-scheme-handler/file

#ADD fonts_xp /usr/share/fonts/WindowsFonts

#RUN fc-cache --force

# docker build -t archlinux_custom:base-devel-20220320.0.50753 .

RUN sudo wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O /usr/local/bin/yt-dlp

RUN sudo chmod a+rx /usr/local/bin/yt-dlp  # Make executable

RUN sudo pacman -S ffmpeg --needed --noconfirm