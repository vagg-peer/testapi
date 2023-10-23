# testapi
An API in laravel

Requirments

PHP > 8.1

Composer

Laravel Package

Postman



Installation


1.clone repository

    gh repo clone vagg-peer/testapi


2.After cloning duplicate the .env.example to .env


3.Add the database credentials in .env


4.With terminal go to the project's folder and run the following commands

    a. composer install
    
    b. php artisan key:generate  
    
    c. php artisan cache:clear
    
    d. php artisan migrate
    


5.Import the database (Contains some dummy data for testing)

6.run

    php artisan serve


Use postman to make the calls, and add these in Headers
    Accept:application/json,
    Content-Type:application/json



Endpoints
/api/register (POST)
In order to register the user needs to provide name,email,password,password_confirmation in Body in "form-data" as key:value. 
![Screenshot](https://github.com/vagg-peer/testapi/assets/58305936/10ecf2e9-a335-460a-8259-30ca85746a97)


On successful registration, the application will return the user with the token. This token will be used in every call that requires the user to be logged in.
In Postman go to authorization, select the Bearer Token from the list, and paste the token from the responce.
![Screenshot5](https://github.com/vagg-peer/testapi/assets/58305936/97138f31-da55-4bbf-9a60-1a31dd3c70de)



/api/login (POST)
In case of token expiration after registration, the user will can to get a new token.
The user must provide email and password in Body in "form-data" as key:value.
![Screenshot4](https://github.com/vagg-peer/testapi/assets/58305936/ecbf99fa-5eb6-4831-8427-beea27f37558)



On successful login, the application will return the new token




/api/shops (GET)
List of all shops

Also the user can filter data using any of these parameters in url

    /api/shops?shopCategory[eq]=category&city[eq]=city&shopOwner[eq]=user_id

/api/shops (POST)
This is the end where the owners may add a new shop. A .json payload should be placed in Body as in PrtSc below.
![Screenshot2](https://github.com/vagg-peer/testapi/assets/58305936/9b1b8148-b67c-444d-b1bc-79b3969d2c6e)

Demo payload

    {
    
    "name": "New shop",
    
    "shopCategory": "Clothes",
    
    "description": "Shop Desc",
    
    "openHours": "09:00 - 15:00",
    
    "city": "ioannina",
    
    "address": "Ioanninon 1555"
    
    }


On successful call, a response with the store will be delivered



/api/shops/{id} (GET)

Information of the provided shop


/api/shops/{id} (PUT)
Owners can edit their shops. We have to provide the same type of payload like on adding. All the fields expect address are required.


/api/shops/{id} (PATCH)
Logged in users can edit their shops. With patch users may provide only the information that they need to update.

Demo payload

    {
    
    "name": "New shop",
    
    "shopCategory": "Clothes",
    
    "city": "Patra",
    
    "address": "Georgiou 1555"
    
    }


/api/shops/{id} (DELETE)
Owners can delete their shops

/api/offers
Owners can make an offer for a shop

Demo payload

    {
    
    "name": "New Offer",
    
    "description": "New Offer Desc",
    
    "shop": 5 //owner should provide the shop id
    
    }

