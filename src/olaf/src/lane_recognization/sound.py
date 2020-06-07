#!/usr/bin/env python

from playsound import playsound

class Sound:
    def __init__(self):
        self.path = ['/home/nvidia/olaf/src/opencv/src/letitgo.mp3',
            '/home/nvidia/olaf/src/opencv/src/okbye.mp3',
            '/home/nvidia/olaf/src/opencv/src/docdocdoc.mp3',
            '/home/nvidia/olaf/src/opencv/src/letitgo.mp3',
        ]
    def Play(self, index):
        playsound(self.path[index])
