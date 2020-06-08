#!/usr/bin/env python

from playsound import playsound

class Sound:
    def __init__(self):
        self.path = ['letitgo.mp3',
            'okbye.mp3',
            'docdocdoc.mp3',
            'start.mp3',
            'end.mp3',
            'arrive.mp3',
            'return.mp3'
        ]
    def Play(self, index):
        playsound(self.path[index])
        
        
#music = Sound()

#for i in range(len(music.path)):
#    music.Play(i)
