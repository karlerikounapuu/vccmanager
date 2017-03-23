What is vccmanager?
Vccmanager is a simple ruby gem that makes it possible to generate virtual credit cards via Marqeta API. 

What functions does it have?
At the moment Vccmanager is capable of generating new virtual credit cards, listing existing cards and showing specific information of each one. It does ship with more capabilities (account registration, creating card products etc), however, they are not implemented in CLI as of now.

What are the dependencies?
This gem requires net/http, uri, json and colorize to work. 

How to launch it?
bundler exec ruby vccmanager.rb, which isn't really appropiate way but hey, it works.
