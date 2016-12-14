Feature: Tags

  Scenario: A user views all flashcards with a certain tag
    Given a User has previously registered
      And there are some flashcards with a active-record tag
      And there are some flashcards without a active-record tag
      And they are on a flashcard page with an active-record tag
    When they click on "active-record"
    Then they see all of the flashcards with the active-record tag
      And they don't see flashcards without the active-record tag

  @javascript
  Scenario: A user sees autocomplete suggestions when they start typing a tag name
    Given a User has previously registered
      And they have signed in previously
      And they are on the new flashcard page
      And there are some existing tags in the database
    When they fill in the "flashcard[all_tags]" field with "ru"
    Then they should see the autocomplete results
