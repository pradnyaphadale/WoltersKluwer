*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Test Cases ***
Add new task(s) to To-Do list
    Given the user visit the todos website
    When user adds task(s)
    Then user should be able to see added task(s)
    And match the count of added tasks with actual list of tasks

Remove an task and compare the number of tasks remaining with actual list
    Given the user added the task(s)
    When the user removes item
    Then verify if the number of left items are correct

User should be able to see finished task as striped
    Given the user added the task(s)
    When the user removes item
    Then the removed item should be striped
    And user can clear the removed item from list by clicking "clear completed"



*** Variables ***
@{To do list}=    item1   item2   item3   item4   +++  *sds*952
${items to be remove}=    item1

*** Keywords ***
Given the user visit the todos website
    Open Browser     https://todomvc.com/examples/angular2/     chrome
    Maximize Browser Window

When user adds task(s)
    Wait Until Keyword Succeeds    2   1s   Set Focus To Element   //*[contains(@placeholder, 'What needs to be done?')]
    FOR  ${one item}  IN  @{To do list}
       Input text    //*[contains(@placeholder, 'What needs to be done?')]     ${one item}
       Press Enter Keys
    END

Then user should be able to see added task(s)
    @{All itmes}=    Create List
    FOR  ${one}  IN  @{To do list}
        ${items}=   Wait Until Keyword Succeeds    2   1s   Get Text    //*[@class='main']//ul[@class='todo-list']//div[@class='view']//label[text()='${one}']   #values=True
        Append to List   ${All itmes}   ${items}
    END
    Log Many   @{All itmes}


And match the count of added tasks with actual list of tasks
    #${no of items added}=   Get Element Count    //*[@class='main']//ul[@class='todo-list']//li//div[@class='view']//label
    ${no of items added}=      Get Text    //*[@class='todoapp']//*[@class='footer']//strong
    ${actual list of items}=   Get Length    ${To do list}
    Set Global Variable     ${actual list of items}    ${actual list of items}
    Should be equal    '${no of items added}'   '${actual list of items}'
    Close the browser


Given the user added the task(s)                ## I am reusing the steps. We can incoporate this ste
    Given the user visit the todos website
    When user adds task(s) 

When the user removes item
    Set Focus To Element    //*[@class='main']//ul[@class='todo-list']//div[@class='view']//label[contains (text(),"${items to be remove}")]
    Select Checkbox   //*[@class='todo-list']//li//input[@class='toggle']

Then verify if the number of left items are correct
    ${no of items left}=    Get Text    //*[@class='todoapp']//*[@class='footer']//strong
    Should not be equal    ${actual list of items}   ${no of items left}
    Close the browser

Then the removed item should be striped
    Set Focus To Element    //*[@class='main']//ul[@class='todo-list']//div[@class='view']//label[contains (text(),"${items to be remove}")]
    Select Checkbox   //*[@class='todo-list']//li//input[@class='toggle']
    Wait Until Element Is Enabled    //*[@class='todo-list']//li[@class='completed']//input[@class='toggle']         ##Class changed to "completed" from null.


And user can clear the removed item from list by clicking "clear completed"
    Capture Page Screenshot
    Click Element    //*[@class='todoapp']//footer[@class='footer']//button
    Capture Page Screenshot
    Close the browser

Press Enter Keys
    Press Keys     //*[contains(@placeholder, 'What needs to be done?')]   ENTER

Close the browser    
    Close All Browsers

