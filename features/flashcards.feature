Feature: Flashcards

  Scenario: A user creates a flashcard
    Given a User has previously registered
      And they have signed in previously
      And they are on the new flashcard page
    When they fill in the "flashcard_question" field with "Why are we nice?"
      And they fill in the "flashcard_answer" field with "MINASWAN"
      And they fill in the "flashcard_all_tags" field with "ruby ruby-on-rails uniq-tag"
      And they click on "Create Flashcard"
    Then the flashcard should be created

  Scenario: A user edits a flashcard
    Given a User has previously registered
      And they have signed in previously
      And they have created a flashcard
      And they are on their flashcard page
    When they click on "Edit Flashcard"
      And they fill in the "flashcard_question" field with "Why the lucky stiff?"
      And they fill in the "flashcard_answer" field with "J------n G------e"
      And they click on "Save Changes"
    Then the flashcard should be updated

  Scenario: A user can't edit another user's flashcard
    Given a User has previously registered
      And there is a flashcard created by another user
    When they visit a flashcard page created by another user
    Then there should be no edit flashcard button

  Scenario: A user can't view another user's edit flashcard page
    Given a User has previously registered
      And there is a flashcard created by another user
    When they visit an edit flashcard page that isn't theirs
    Then they should see a flashcard error

  Scenario: A user deletes a flashcard
    Given a User has previously registered
      And they have signed in previously
      And they have created a flashcard
      And they are on their flashcard page
    When they click on "Delete Flashcard"
    Then the flashcard should be deleted

  @wip
  Scenario: A user formats their flashcard
    Given a User has previously registered
      And they have signed in previously
      And they are on the new flashcard page
    When they fill in the flashcard fields with markdown
      And they fill in the "flashcard_all_tags" field with "ruby ruby-on-rails"
      And they click on "Create Flashcard"
    Then they should see a properly formatted flashcard

