#encoding: utf-8
Feature: Home page listings
  In order to see the hottest RaspberryPi news stories
  As a visitor
  I should be able to see all the latest news stories

  Scenario: Home page listings
    Given I am a visitor
    When I visit the home page
    Then I should see 20 posts

