# Purpose of `business` directory:
`business` directory will hold all business logic of the app. Here's how this layer will work:
1. It will receive an input/event from the `presentation` layer.
2. According to the input/event, the `business` layer will request data from the `data` layer.
3. Once it receives the required data, it will translate it into the application state and return it to the `presentation` layer.