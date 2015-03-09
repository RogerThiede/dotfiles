# Python tab completion
try:
    import readline
except ImportError:
    print "Module readline not available."
else:
    import rlcompleter
    if 'libedit' in readline.__doc__:
        # OS X
        ireadline.parse_and_bind("bind ^I rl_complete")
    else:
        # Linux
        readline.parse_and_bind("tab: complete")
