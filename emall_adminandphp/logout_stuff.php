<?php
    /// delete the session variable
    /// forward to sign in page

    session_start();

    unset($_SESSION['stuff']);

    echo "<script>window.location.assign('stuff.php');</script>";
?>