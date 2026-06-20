This messenger only works on one Wi-Fi network or a wired connection.
If a person is connected to another network, you will not be able to contact them.
Unpack it first.zip archive to any location
Also, for the messenger to work, a piotn version of at least 3.12.3
is required To run on Linux (Ubuntu):Open a terminal (Ctrl+Alt+T) and Run
the following commands (install packages):
install venv(virtual environment):
 Go to the directory
    cd (path to the messager folder)
for example cd (/home/"username"/Desktop/messenger)
 Install venv yourself:
    python3 -m venv venv
 Launch venv (also in the terminal)
   source venv/bin/activate
 After activation, the prefix (venv):
(venv) "User name" will appear at the beginning of the terminal line:~$
 And install the packages:
    pip install -r (path to requirements.txt)
 for example(pip install -r /home/"username"/Desktop/messenger/requirements.txt)
After that, view the list of updated packages: pip list
 The following packages should be present there:Flask==2.3.3
                                          Werkzeug==2.3.7
If you have other Flask packages,         Flask-SocketIO==5.3.6
this is normal                            gevent==24.2.1
                                          gevent-websocket==0.10.1
Next, log out of the directory:
   cd
 After successfully installing all packages (still in the terminal), enter:
   python3 "file path" app.py
(For example: python3 /home/"username"/Desktop/messenger/app.py )
Next, just go to http://192.168.1.76:5000 /
(close the terminal and app.py you can't)
 To check, log in from two different devices or just open two tabs
in the browser.
 Unfortunately, so far the messenger only works when the page is refreshed
and re-logged in.
