Using Todos website user can add tasks which they want to do.

I have considered below scenarios to automate test scenarios -
   - User should be able to add number of tasks.
   - Take the count of tasks added to the list
   - Remove or mark as completed a task at a time
   - Capture the number of tasks left in the list and make sure it is not equal to original list
   - Check if the removed/completed item is striped
   - Clear the task which marked as completed (by removing from list)

The choice of Test Automation Framework -
    - I have choosen Robot Framework as a test automation framework
    - This is very easy framework to learn 
    - Test cases are define in cucumber(behavior driven) style so that end users can understand the functionalities been covered..
    - There are total 4 section Settings, Variable, Test cases and Keywords
    - Settings: contains library which are used for test automation
    - Variable: is used to define variable at global level. i have defined task list here.
    - Test cases: contains cucumber style written test cases. This is main section. The execution starts from this sections.
    - Keyword: this section includes low level implementation of keywords/test cases defined in Test Case section
    
How the test scripts have been set-up -
   - There are total 3 test cases written which covered all scenarios which are defined in the "I have considered below scenarios to automate test scenarios"
   - Test cases have been written in Given When Then format
   - The list of tasks are defined at global level in ***Variable*** section. From here, user can change without looking into code.
   - Some keywords are reused
   - Best part of Robot framework is the REPORTS.
   - It is automatically creates HTML format report after each execution of test suite/test cases. This report contains details/status of each steps.
   - Also, i have taken screenshot of 2 screens to demonstarte the transition of state of application on users actions.
   
  You do not need to install any software to check the results. I have attached reports "log.html" and "report.html" along with page screenshots.
