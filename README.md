## Getting started..
    $ bin/dev

# Local Development
Local Development over HTTPS using a Self-Signed SSL Certificate
The -b options binds the server to a specific IP. Restarting the server with a binding:

    $ rails s -b 'ssl://localhost:3000?key=localhost.key&cert=localhost.crt'

At this poin you can visit https://localhost:3000
# To-do
