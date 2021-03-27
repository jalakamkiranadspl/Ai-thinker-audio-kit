# boot.py - network and system path setting
#
# This code is in the Public Domain (or CC0 licensed, at your option.)
# Unless required by applicable law or agreed to in writing, this
# software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
# CONDITIONS OF ANY KIND, either express or implied.
#


import network

# network setting
def do_connect():
    import network
    wlan = network.WLAN(network.STA_IF)
    wlan.active(True)
    if not wlan.isconnected():
        print('connecting to network...')
        wlan.connect('ESP-Audio', 'esp123456')
        while not wlan.isconnected():
            pass
    print('network config:', wlan.ifconfig())

do_connect()

# Add libs in sdcard to sys.path
import sys

sys.path.append('/sdcard/lib')
sys.path.append('/sdcard')
print(sys.path)
