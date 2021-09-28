<?php
    /// delete the session variable
    /// forward to sign in page

    session_start();

    unset($_SESSION['owner']);

    echo "<script>window.location.assign('shop_owner.php');</script>";
?>