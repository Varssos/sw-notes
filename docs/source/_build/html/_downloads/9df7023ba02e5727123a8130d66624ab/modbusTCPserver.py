#!/usr/bin/python3

from pyModbusTCP.server import ModbusServer, DataBank
from time import sleep
from random import uniform


server = ModbusServer("127.0.0.1", 1502, no_block=True)

try:
    print("Start server...")
    server.start()
    print("Server is online")
    register_state = [0]
    bool_state = [True]
    while True:
        try:
            bool_state = [not elem for elem in bool_state]
            DataBank.set_words(0, [int(uniform(0, 100))])
            DataBank.set_bits(0, bool_state)

            sleep(1)
            if register_state != DataBank.get_words(0, 1):
                register_state = DataBank.get_words(0, 1)
                print("Value of Register 1 has changed to "+str(register_state))
        except Exception as e:
            print(e)


except:
    print("Shutdown server ...")
    server.stop()
    print("Server is offline")
