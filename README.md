# sparta SOM testing

In this folder I tested the [dad jokes API](https://icanhazdadjoke.com/api#search-for-dad-jokes) using the service object model, I chose to do it this way because I could make many calls to the API e.g. /search, by image, GraphQL, and re-arranging it this way created a nice and readable folder, also making it easier to add new files to the service folder, instead of creating a separate tests for each API call

## Running the tests

To run the tests, make sure you are in the root directory and in the terminal:

```
rspec
```
