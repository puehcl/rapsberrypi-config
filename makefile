
.PHONY: all init timelapse

all: init timelapse

init:
	chmod +x init/install_essentials.sh
	init/install_essentials.sh

timelapse:
	chmod +x timelapse/install.sh
	timelapse/install.sh
