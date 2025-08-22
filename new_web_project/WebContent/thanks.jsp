<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thanks for Joining</title>
    <link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
    <h1>Thanks for joining our email list!</h1>

    <p>Here is the information you entered:</p>

    <label>Email:</label>
    <span>${user.email}</span><br>

    <label>First Name:</label>
    <span>${user.firstName}</span><br>

    <label>Last Name:</label>
    <span>${user.lastName}</span><br>

    <p>To enter another email, click the Return button below.</p>

    <form action="emailList" method="get">
        <input type="hidden" name="action" value="join">
        <input type="submit" value="Return">
    </form>
</body>
</html>
