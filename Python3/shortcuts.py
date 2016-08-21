from tkinter import *

def f12(event):
    print("vof!")
    return

master = Tk()

text_ = "Knark"

msg = Message(master, text = text_)
msg.config(bg='lightgreen')
master.bind('<Escape>', f12)
msg.pack()
mainloop()
