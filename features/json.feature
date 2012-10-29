Feature: Maintain validity of code with respect to wunderground.com JSON API

  External APIs need to be checked occasionally to ensure that what the 
  API service is delivering matches what the application depends on
  receiving. We'll handle this as a feature instead of a spec as we'll
  need to hit the API server for real, which costs time and money. RSpec
  can be used with stubs to handle all the details of processing the JSON
  returned by wunderground.com

  Scenario: Application reuests a 10 day forecast
    Given we request a 10 day forecast
    Then we should get all the necessary elements

