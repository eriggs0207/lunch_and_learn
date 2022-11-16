# README

# Back End Repository for Lunch and Learn

## Table of Contents

1. [Available API End Points](#all-available-end-points)
- [Recipe End Point](#recipe-end-point)
- [Learning Resources End Point](#learning-resources-end-point)
- [User End Point](#user-end-point)
- [Favorites End Points](#favorites-end-points)
    - [Create](#favorites-create)
    - [Index](#favorites-index)
2. [Local Setup](#local-setup)
3. [Versions](#versions)
4. [Api Keys Needed](#api-keys-needed)
5. [Contributors](#contributors)



## All Available End Points:

### Recipe End Point
Returns the recipes for a given country

<b>Notes:</b>
To return a random country a value must be set to 'random_country' in the button

`GET  /api/v1/recipes + params`

or

`GET http://localhost:3000/api/v1/recipes?country?{country}`

<b>Example Input:</b>

`GET http://localhost:3000/api/v1/recipes?country?"Malaysia"`

<b>Example Output:</b>

```json
{
    "data": [
        {
            "id": null,
            "type": "recipe",
            "attributes": {
                "title": "Coconut Curry Puffs",
                "url": "http://www.food52.com/recipes/10992_coconut_curry_puffs",
                "country": "malaysia",
                "image": "https://edamam-product-images.s3.amazonaws.com/"
              }
          },

        {
            "id": null,
            "type": "recipe",
            "attributes": {
                "title": "Coconut-Pandan Jam (Kaya Jam)",
                "url": "https://www.epicurious.com/recipes/food/views/coconut-pandan-jam-kaya-jam",
                "country": "malaysia",
                "image": "https://edamam-product-images.s3.amazonaws.com/web-img"
            }
          }
      ]
  }


```

##

### Learning Resources End Point
Returns videos and images from a given country`

`GET  /api/v1/learning_resources + params`

or

`GET http://localhost:3000/api/v1/learning_resources?country?{country}`

<b>Example Input:</b>

`GET http://localhost:3000/api/v1/learning_resources?country?"japan"`

<b>Example Output:</b>

```json
{
    "data": {
        "id": null,
        "type": "learning_resource",
        "attributes": {
            "country": "japan",
            "video": {
                "title": "A Super Quick History of Japan",
                "youtube_video_id": "74g8q804ukA"
            },
            "images": [
                {
                    "alt_tag": "three bicycles parked in front of building",
                    "url": "https://images.unsplash.com/photo-1480796927426-f609979314bd?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzODAwMzZ8MHwxfHNlYXJjaHwxfHxqYXBhbnxlbnwwfHx8fDE2Njg1NDc3Nzg&ixlib=rb-4.0.3&q=80&w=1080"
                },
                {
                    "alt_tag": "Mt. Fuji",
                    "url": "https://images.unsplash.com/photo-1528164344705-47542687000d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzODAwMzZ8MHwxfHNlYXJjaHwyfHxqYXBhbnxlbnwwfHx8fDE2Njg1NDc3Nzg&ixlib=rb-4.0.3&q=80&w=1080"
                },
                {
                    "alt_tag": "Torii Gate, Japan",
                    "url": "https://images.unsplash.com/photo-1492571350019-22de08371fd3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzODAwMzZ8MHwxfHNlYXJjaHwzfHxqYXBhbnxlbnwwfHx8fDE2Njg1NDc3Nzg&ixlib=rb-4.0.3&q=80&w=1080"
                },
                {
                    "alt_tag": "pagoda surrounded by trees",
                    "url": "https://images.unsplash.com/photo-1545569341-9eb8b30979d9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzODAwMzZ8MHwxfHNlYXJjaHw0fHxqYXBhbnxlbnwwfHx8fDE2Njg1NDc3Nzg&ixlib=rb-4.0.3&q=80&w=1080"
                },
                {
                    "alt_tag": "Mount Fuji, Japan",
                    "url": "https://images.unsplash.com/photo-1526481280693-3bfa7568e0f3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzODAwMzZ8MHwxfHNlYXJjaHw1fHxqYXBhbnxlbnwwfHx8fDE2Njg1NDc3Nzg&ixlib=rb-4.0.3&q=80&w=1080"
                },
                {
                    "alt_tag": "people gathered outside buildings and vehicles",
                    "url": "https://images.unsplash.com/photo-1542051841857-5f90071e7989?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzODAwMzZ8MHwxfHNlYXJjaHw2fHxqYXBhbnxlbnwwfHx8fDE2Njg1NDc3Nzg&ixlib=rb-4.0.3&q=80&w=1080"
                },
                {
                    "alt_tag": "Japanese lantern over city bike at nighttime",
                    "url": "https://images.unsplash.com/photo-1528360983277-13d401cdc186?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzODAwMzZ8MHwxfHNlYXJjaHw3fHxqYXBhbnxlbnwwfHx8fDE2Njg1NDc3Nzg&ixlib=rb-4.0.3&q=80&w=1080"
                },
                {
                    "alt_tag": "Mt. Fuji, Japan",
                    "url": "https://images.unsplash.com/photo-1490806843957-31f4c9a91c65?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzODAwMzZ8MHwxfHNlYXJjaHw4fHxqYXBhbnxlbnwwfHx8fDE2Njg1NDc3Nzg&ixlib=rb-4.0.3&q=80&w=1080"
                },
                {
                    "alt_tag": "men in black suits standing in the hallway",
                    "url": "https://images.unsplash.com/photo-1554797589-7241bb691973?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzODAwMzZ8MHwxfHNlYXJjaHw5fHxqYXBhbnxlbnwwfHx8fDE2Njg1NDc3Nzg&ixlib=rb-4.0.3&q=80&w=1080"
                },
                {
                    "alt_tag": "canal between cherry blossom trees",
                    "url": "https://images.unsplash.com/photo-1524413840807-0c3cb6fa808d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzODAwMzZ8MHwxfHNlYXJjaHwxMHx8amFwYW58ZW58MHx8fHwxNjY4NTQ3Nzc4&ixlib=rb-4.0.3&q=80&w=1080"
                }
            ]
        }
    }
}
```
##

### User End Point

Creates a user

`POST  /api/v1/users`

or

`POST http://localhost:3000/api/v1/users`



<b>Example Input:</b>

```json
{
      "name": "Johnny Utah",
      "email": "johnnyfootball@pointbreak.com"
  }
```
<b>Example Output:</b>
```json
{
    "data": {
        "id": "22",
        "type": "user",
        "attributes": {
            "name": "Johnny Utah",
            "email": "johnnyfootball@pointbreak.com",
            "api_key": "fe7d99c80e8b5b56c784"
        }
    }
}
```
##

### Favorites End points

#### Favorites Create


Creates favorites for a user

`POST  /api/v1/favorites`

or

`POST http://localhost:3000/api/v1/favorites`



<b>Example Input:</b>

```json
{
    "api_key": "fe7d99c80e8b5b56c784",
    "country": "Thailand",
    "recipe_link": "https://www.nam.com",
    "recipe_title": "Koi Soy"
}
```
<b>Example Output:</b>
```json
{
    "success": {
        "message": "Favorite added successfully"
    }
}
```
#### Favorites Index


`GET /api/v1/favorites`

or

`GET http://localhost:3000/api/v1/favorites{api_key}`

<b>Example Input:</b>

`GET http://localhost:3000/api/v1/favorites?api_key=fe7d99c80e8b5b56c784`

<b>Example Output:</b>
```json
{
    "data": [
        {
            "id": "34",
            "type": "favorite",
            "attributes": {
                "recipe_title": "Koi Soy",
                "recipe_link": "https://www.nam.com",
                "country": "Thailand",
                "created_at": "2022-11-16T02:21:00.125Z"
            }
        },
        {
            "id": "35",
            "type": "favorite",
            "attributes": {
                "recipe_title": "Bun Cha",
                "recipe_link": "https://www.nam.com",
                "country": "Vietnam",
                "created_at": "2022-11-16T02:24:25.455Z"
            }
        }
    ]
}
```
##

## Local Setup

* Fork this repository
* Clone your fork
* From the command line, install gems and set up your DB:
    * `bundle`
    * `rails db:create`
* Run the test suite with `bundle exec rspec`.
* Run your development server with `rails s` to see the app in action.

## Versions

- Ruby 2.7.2

- Rails 6.1.7

## Api Keys Needed

Unsplash - https://unsplash.com/documentation
YouTube - https://developers.google.com/youtube/v3/getting-started
EDAMAM - https://developer.edamam.com/edamam-recipe-api

## Contributors



<img src="https://avatars.githubusercontent.com/u/106836658?s=120&v=4" />

Erik Riggs | [Github](https://github.com/eriggs0207) | [LinkedIn](https://www.linkedin.com/in/erik-riggs/) |

##

[Back To Top](#back-end-repository-for-lunch-and-learn)
