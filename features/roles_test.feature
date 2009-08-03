@roles
@passing
Feature: Roles test

In order to create and assign roles
As an admin
I want to be able to create, delete, edit, and assign roles

Scenario Outline: Seeing the roles page
Given I am "<user>"
And I am on the roles page
Then I <shouldornot> see "New Role"
And I <shouldornot> see "All Roles"
And I <shouldornot2> see "Access denied"

Scenarios: Not being able to because not an admin user

|user            |shouldornot|shouldornot2|
|Harry Potter    |should not |should      |
|Hermione Granger|should not |should      |
|John Arbuckle   |should not |should      |
|Every Man       |should not |should      |
|Argus Filch     |should not |should      |

Scenarios: Being able to because is logged in as admin user

|user            |shouldornot|shouldornot2|
|Albus Dumbledore|should     |should not  |
|Horace Slughorn |should     |should not  |

Scenario Outline: Seeing the create a new role page

Given I am "<user>"
And I am on the new role page
Then I <shouldornot> see "New Role"
And I <shouldornot> see "Permissions"
And I <shouldornot2> see "Access denied"

Scenarios: Not being able to because not an admin user

|user            |shouldornot|shouldornot2|
|Harry Potter    |should not |should      |
|Hermione Granger|should not |should      |
|John Arbuckle   |should not |should      |
|Every Man       |should not |should      |
|Argus Filch     |should not |should      |

Scenarios: Being able to because is logged in as admin user

|user            |shouldornot|shouldornot2|
|Albus Dumbledore|should     |should not  |
|Horace Slughorn |should     |should not  |


Scenario Outline: Create a new role as an admin

Given I am "<user>"
And I am on the new role page
When I fill in "Name" with "Assistant Boss"
And I check "Inside of Hogwarts signup"
And I check "14"
And I press "Create"
Then I should see "Successfully created role."
And I should have 2 roles.


#Scenarios: Succeeding as an admin

#|user            |
#|Albus Dumbledore|
#|Horace Slughorn |

Scenario Outline: Assigning roles via edit user

Given I am "<superuser>"
And I am on the list of users
When I click "<login>"
Then I should see "<firstname>"
And I should see "<lastname>"
And I should see "<email>"
When I click "Edit"
Then I should see "Edit User"

