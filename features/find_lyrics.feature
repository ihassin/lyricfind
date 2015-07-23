Feature:
  As a U2 fan
  I want to get the lyrics for their songs
  So that I can sing along

  Scenario: Looking up lyrics for "One"
    Given I have a license to use LyricFind
    When I search for "U2" song "One"
    Then its lyrics are returned
