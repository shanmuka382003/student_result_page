The following technologies are needed to make this project work:
1. VS Code editor
2. Eclipse IDE for java developers
3. Apache Tomcat sever
4. MySQL

Create a folder to store contents of the project.
Create a file index.html in the folder.
Copy and paste the content of index.html in this repository into your file in your system.
Create another file data.jsp and open it with Eclipse IDE.
Copy and paste the content into the file you've just created.
**Note: I have only created results of four students for four semesters in MySQL database.**
In MySQL create a database using the command "create database <database_name>"
create one table for each semester results along with its columns. The columns are:
roll number(roll_number), serial number(s_no), course code(course_code), course name(course_name), internal, external, total, status, credits, grade.
![image](https://github.com/shanmuka382003/student_result_page/assets/132034847/19d3fee0-bda1-465a-910d-0f31bf78b90a)
Create another table called student_details with columns roll_number, name, proctor/mentor.
**Note: If you change the name your table and columns make sure to change in the both of the files i.e., index.html and data.jsp too.**

The above is a sample table to create.

Now go to this directory "C:\Program Files\Apache Software Foundation\Tomcat 8.5\webapps" in the webapps folder create a folder with your desired name and place index.html and data.jsp into your folder.

Now, press start button and search for Monitor Tomcat and enter the application.
Once you do it no app will be opened but when you click on the arrow mark the shows hidden icons in the bottom-right corner of your screen, you will see the record symbol (a circle with red dot).
Click the symbol and you will see that a dialogue box appears and at the bottom press start.

Now go to your browser and type "localhost:8080/<your_folder_name_in_webapps>" and you will be able to see a page as below.
![image](https://github.com/shanmuka382003/student_result_page/assets/132034847/1300f7bc-03f4-43dd-99c9-9b5679da6423)

On entering the values into the input fields of your html page you can get result page showing various tables.
