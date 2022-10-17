FROM cypress/browsers:node16.5.0-chrome94-ff93

RUN apt-get update
RUN apt-get install -y curl xvfb x11vnc fluxbox libgbm-dev novnc xterm
RUN npm i cypress -g
ENV DISPLAY :1

RUN cp /usr/share/novnc/vnc_auto.html /usr/share/novnc/index.html

CMD Xvfb :1 -screen 0 1280x1024x16 & fluxbox & xterm & x11vnc -forever -shared & websockify --web /usr/share/novnc 8080 localhost:5900 & cypress open


