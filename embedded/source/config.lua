-- configuration module
module("config", package.seeall)

SERVER_HOSTNAME = "example.com" -- hostname of the server which is running our node server
SERVER_PORT = 80 -- server port (port 80 should work well in most cases)
SERVER_URL = "/bigredbutton" -- The path to the node-server. Don't include a trailing backslash.
