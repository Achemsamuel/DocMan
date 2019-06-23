# DocMan
Document Management System

Document Management System. This is a system (API) that manages documents with users and user roles. Each document defines access rights; the document defines which roles can access it. Also, each document specifies the date it was published.

Key Application Features
A created user will have a role: admin, regular.

Regular, rated/restricted Users can:

Create an account
Login
Create a document
Limit access to a document by specifying an access group i.e. public, private or role.
View public documents created by other users.
View documents created by their access group with access level set as role.
Edit already created documents.
View public and role access level documents of other regular users.
Logout.
In addition to the general user functions, an admin user can:

View all users.
View all created documents.
Delete any user.
Update any user's records.
Create a new role.
View all created roles.
Delete created roles aside the default roles admin and regular
Documents: Documents can be created and must have:

title
content
access; set by default to public but can be any of private, public or role

Authentication: Users are authenticated and validated using either the github, google or facebok signin methods.

**************************************
Onboarding Screen
![alt text](https://res.cloudinary.com/dyuuulmg0/image/upload/c_scale,w_375/v1561296051/Simulator_Screen_Shot_-_iPhone_Xs_-_2019-06-23_at_13.27.45.png)

**************************************
Login Screen
![alt text](https://res.cloudinary.com/dyuuulmg0/image/upload/c_scale,w_375/v1561296043/Simulator_Screen_Shot_-_iPhone_Xs_-_2019-06-23_at_13.27.58.png)

**************************************
SignUp Screen
![alt text](https://res.cloudinary.com/dyuuulmg0/image/upload/c_scale,w_375/v1561296170/Simulator_Screen_Shot_-_iPhone_Xs_-_2019-06-23_at_14.22.34.png)
