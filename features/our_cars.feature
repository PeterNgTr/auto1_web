Feature:  Our cars

  Scenario Outline: Verify the results when filtering by manufacture
    Given I visit the OurCarsPage
    When I filter the cars by <Manufacture>
    Then filter by <Manufacture> is selected
    Then all cars in result contains <Manufacture>
    Then all cars in result have picture
    Then all cars in result have complete info

    Examples:
      | Manufacture |
      | BMW         |
      | Audi        |