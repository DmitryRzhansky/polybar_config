#!/usr/bin/env python3
import time

TEXT = "Я люблю Дашу"
ZONE = 12
SPEED = 0.18

pos = 0
direction = 1
frame = 0

PINK = "#ff4fd8"
VIOLET = "#8b5cf6"
WHITE = "#d8d0ff"

def color(s, c):
    return f"%{{F{c}}}{s}%{{F-}}"

def moving_heart(zone, index, enabled, c):
    chars = [" "] * zone
    if enabled:
        chars[index] = "♥"
    out = ""
    for ch in chars:
        if ch == "♥":
            out += color("♥", c)
        else:
            out += " "
    return out

while True:
    enabled = frame % 6 not in (0, 1)

    heart_color = PINK if frame % 4 < 2 else VIOLET

    left_index = pos
    right_index = ZONE - 1 - pos

    left = moving_heart(ZONE, left_index, enabled, heart_color)
    right = moving_heart(ZONE, right_index, enabled, heart_color)

    if frame % 10 < 5:
        text = color(TEXT, PINK)
    else:
        text = TEXT

    print(f"{left} {text} {right}", flush=True)

    pos += direction

    if pos >= ZONE - 1:
        direction = -1
    elif pos <= 0:
        direction = 1

    frame += 1
    time.sleep(SPEED)
