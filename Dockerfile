from node:7.7.2

ENV ACCEPT_HIGHCHARTS_LICENSE="YES"
ENV HIGHCHARTS_VERSION="6.2.0"

RUN npm install highcharts-export-server@2.1.0 -g 

WORKDIR /usr/share/fonts/truetype
ADD fonts/OpenSans-Regular.ttf OpenSans-Regular.ttf
ADD fonts/OpenSans-Light.ttf OpenSans-Light.ttf
ADD fonts/OpenSans-Semibold.ttf OpenSans-Semibold.ttf
ADD fonts/OpenSans-Bold.ttf OpenSans-Bold.ttf
ADD fonts/OpenSans-ExtraBold.ttf OpenSans-ExtraBold.ttf
ADD fonts/OpenSans-Italic.ttf OpenSans-Italic.ttf
ADD fonts/OpenSans-LightItalic.ttf OpenSans-LightItalic.ttf
ADD fonts/OpenSans-BoldItalic.ttf OpenSans-BoldItalic.ttf
ADD fonts/OpenSans-SemiboldItalic.ttf OpenSans-SemiboldItalic.ttf
ADD fonts/OpenSans-ExtraBoldItalic.ttf OpenSans-ExtraBoldItalic.ttf

WORKDIR /

EXPOSE 8080
ENTRYPOINT ["highcharts-export-server", "--queueSize", "1000", "--workers", "10", "-enableServer", "1", "--port", "8080"]
