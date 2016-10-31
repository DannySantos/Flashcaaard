Feature: Users

  Scenario: A User registers
    Given they are on the registration page
    When they fill in the "user_email" field with "test@test.com"
      And they fill in the "user_password" field with "password"
      And they fill in the "user_password_confirmation" field with "password"
      And they click on "Sign up"
    Then a User should be created