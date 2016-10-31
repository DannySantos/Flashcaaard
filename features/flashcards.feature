Feature: Flashcards

  Scenario: A user creates a flashcard
    Given a User has previously registered
      And they are on the new flashcard page
    When they fill in the "flashcard_question" field with "Why are we nice?"
      And they fill in the "flashcard_answer" field with "MINASWAN"
      And they click on "Create Flashcard"
    Then the flashcard should be created

  @wip
  Scenario: A user edits a flashcard
    Given a User has previously registered
      And they have created a flashcard
      And they are on their flashcard page
    When they click on "Edit Flashcard"
      And they fill in the "flashcard_question" field with "Why the lucky stiff?"
      And they fill in the "flashcard_answer" field with "J******n G******e"
      And they click on "Save Changes"
    Then the flashcard should be updated
