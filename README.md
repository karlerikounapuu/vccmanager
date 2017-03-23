<h2>What is vccmanager?</h2>
Vccmanager is a simple ruby gem that makes it possible to generate virtual credit cards via Marqeta API. 

<h2>What functions does it have?</h2>
At the moment Vccmanager is capable of generating new virtual credit cards, listing existing cards and showing specific information of each one. It does ship with more capabilities (account registration, creating card products etc), however, they are not implemented in CLI as of now.

<h2>What are the dependencies?</h2>
This gem requires net/http, uri, json and colorize to work. 

<h2>How to launch it?</h2>
"bundler exec ruby vccmanager.rb", which isn't really appropiate way (yet) but hey, it works.

<h2>Should I use it?</h2>
Absolutely not. It's full of vulnerabilities, has no real functions and requires contract with Marqeta to actually put this to work.
