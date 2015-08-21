# _Hair Salon_

##### _A site for managing a hair salon database, {8/21/2015}_

#### By _**{Leah Klamkin}**_

## Description

_{This application will allow salon staff to add stylists to their database, and then add clients for those stylists. Users can edit and delete stylists and clients.}_

## Setup

* _Clone this repository_
* _Install gems ($ bundle install)_
* _In PSQL:_
* _CREATE DATABASE hair_salon_
* _\c hair_salon_
* _CREATE TABLE stylists (id serial PRIMARY KEY, name varchar, phone varchar, specialty varchar)_
* _CREATE TABLE clients (id serial PRIMARY KEY, name varchar, phone varchar, stylist_id varchar)_
* _CREATE TABLE clients (id serial PRIMARY KEY, name varchar, phone varchar, stylist_id varchar)_
* _In a new terminal window, navigate to the project hair salon folder_
* _To launch Sinatra, run $ ruby app.rb_
* _In your web browser, navigate to localhost:4567_


## Technologies Used

* _Ruby_
* _Sinatra_
* _HTML_
* _Bootstrap CSS_
* _Rspec_
* _Capybara_
* _Postgres_

### Legal

Copyright (c) 2015 **_{Leah Klamkin}_**

This software is licensed under the MIT license.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
