
all: init timelapse

init:
	chmod +x init/install_essentials.sh
	init/install_essentials.sh

timelapse: init
	chmod +x timelapse/install.sh
	timelapse/install.sh
