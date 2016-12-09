Feature: Card Sets

  Scenario: A user creates a card set
    Given a User has previously registered
      And they have signed in previously
      And they are on the new card set page
    When they fill in the "card_set_title" field with "Ruby Basics"
      And they click on "Create Card Set"
    Then the card set should be created
    
  Scenario: A user edits a card set
    Given a User has previously registered
      And they have signed in previously
      And they have created a card set
      And they are on their card set page
    When they click on "Edit Card Set"
      And they fill in the "card_set_title" field with "Ruby Expert"
      And they click on "Save Changes"
    Then the card set should be updated

  Scenario: A user can't edit another user's card set
    Given a User has previously registered
      And there is a card set created by another user
    When they visit a card set page created by another user
    Then there should be no edit card set button

  Scenario: A user can't view another user's edit card set page
    Given a User has previously registered
      And there is a card set created by another user
    When they visit an edit card set page that isn't theirs
    Then they should see a card set error

  Scenario: A user deletes a card set
    Given a User has previously registered
      And they have signed in previously
      And they have created a card set
      And they are on their card set page
    When they click on "Delete Card Set"
    Then the card set should be deleted
    
  Scenario: A user adds a flashcard to a set whilst creating a set
    Given a User has previously registered
      And they have signed in previously
      And they are on the new card set page
    When they fill in the "card_set_title" field with "Ruby Basics"
      And they click on "Create Card Set"
      And they click on "Add New Flashcard to Set"
      And they fill in the "flashcard_question" field with "Why are we nice?"
      And they fill in the "flashcard_answer" field with "MINASWAN"
      And they fill in the "flashcard_all_tags" field with "ruby ruby-on-rails"
      And they click on "Add Flashcard"
      And they click on "Add New Flashcard to Set"
      And they fill in the "flashcard_question" field with "Why the lucky stiff?"
      And they fill in the "flashcard_answer" field with "J------n G------e"
      And they fill in the "flashcard_all_tags" field with "ruby"
      And they click on "Add Flashcard"
    Then the card set should be created
      And it should contain the created flashcards