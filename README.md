Setup:

add config/secrets.yml
    
    development:
      apilayer_key: yourcodehere


How to run:

    rails s

Tests:

    no tests added 
    
Description:

The task

You need to fetch current currency rates for EUR to USD and EUR to CHF from the currencylayer API and store them into a PostgreSQL database table. https://currencylayer.com (you'll have to sign up for a free account)​


Goals:

Define the table structure

Provide a Ruby script that fetches the data and stores it in the table

Build a simple Website, which allows to input currency values and translate them accordingly.​

Constraints

    Use money-currencylayer-bank gem​