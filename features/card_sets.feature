Feature: Card Sets

  @wip
  Scenario: A user creates a card set
    Given a User has previously registered
      And they have signed in previously
      And they are on the new card set page
    When they fill in the "card_set_title" field with "Ruby Basics"
      And they click on "Create Card Set"
    Then the card set should be created