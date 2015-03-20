
.PHONY: all essentials timelapse

all: essentials timelapse

essentials:
	chmod +x essentials/install.sh
	essentials/install.sh

timelapse:
	chmod +x timelapse/install.sh
	timelapse/install.sh
