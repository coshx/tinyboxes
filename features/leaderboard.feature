Feature: Leader Board
  As a fund raiser
  I want to know how my fund raising compares to others
  So I can be at the top

Scenario: Donation
  Given there are 3 users who have each raised $5
  And I have donated $10
  When I go to the leaderboard
  Then I see myself in first place

Scenario: Raising Money
  Given there are 3 users who have each raised $5
  And I have donated $1
  And I have raised $5
  When I go to the leaderboard
  Then I see myself in first place

Scenario: Facebook Friends
  Given there are 3 users who have each raised $5
  And my facebook friend has raised $1
  When I go to the leaderboard
  Then I see my facebook friend
