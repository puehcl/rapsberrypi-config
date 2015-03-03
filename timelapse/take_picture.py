import os
import sys
import picamera
import time
import datetime

TIMESTAMP_FORMAT = "%Y-%m-%d %H-%M-%S"

def get_timestamp():
    now = time.time()
    return datetime.datetime.fromtimestamp(now).strftime(TIMESTAMP_FORMAT)

def get_output_path(base_dir, filename):
    return os.path.join(base_dir, filename)

def take_picture(output_path):
    camera = picamera.PiCamera()
    camera.capture(output_path)

if __name__ == "__main__":
    base_dir = sys.argv[1]
    filename = get_timestamp() + ".jpg"
    output_path = get_output_path(base_dir, filename)
    take_picture(output_path)
