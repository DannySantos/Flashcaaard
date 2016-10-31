Feature: Flashcards

  @wip
  Scenario: A user creates a flashcard
    Given a User has previously registered
      And they are on the new flashcard page
    When they fill in the "flashcard_question" field with "Why are we nice?"
      And they fill in the "flashcard_answer" field with "MINASWAN"
      And they click on "Create Flashcard"
    Then the flashcard should be created
