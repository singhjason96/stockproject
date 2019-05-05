# The Money Train
The Money Train allows users to keep track of stocks by texting them price notifications and gives them the latest news relating to each stock.


Getting Started:
This is a ruby on rails project with a ruby version of 2.5.1 and a rails versioin of 5.2.3. 
Remvove sqlite3 from Gemfile and make sure it is in group :development. 
Use pg in production. 

You must have a Twilio account s.i.d and and auth token.

The project comes with: 
iex-ruby-client gem for stock live prices.
news-api gem for news on the stocks
twilio-ruby gem to send text message notifications 

