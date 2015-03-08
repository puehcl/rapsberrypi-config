import sys

class Configuration(object):

    def __init__(self, config_file):
        self.conf = {}
        with open(config_file, "r") as cf:
            while(True):
                line = cf.readline()
                if not line or len(line) is 0:
                    break
                line = line[:-1]
                if len(line) is 0:
                    break
                attr = line.split("=")
                self.conf[attr[0]] = attr[1]

    def get(self, attr):
        return self.conf[attr]
