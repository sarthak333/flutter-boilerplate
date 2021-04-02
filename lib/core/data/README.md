# Purpose of `data` directory:
`data` layer is responsible for handling all the data required for the app. This data could be received from different sources like an API or the local storage/cache.
 Here's how this layer will work:
 1. The requests for data will be received by the repositories.
 2. The repository will then query for the data from the providers.
 3. The API calls will be made via the network providers.
 4. The local storage/cache data will be obtained by the local providers.
 5. Once the asynchronous data has been received, it will be sent back to the repositories.
 6. The repository will then use the models to format the data from JSON to a flutter-readable object.
 7. The repository will return the data object to the `business` layer.

 #### Note: The local providers will be mostly reduntant will BLoC pattern as it can handle local persist by itself. 