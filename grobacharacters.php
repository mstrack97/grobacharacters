<html>
<style>
html {
    background: url('space.jpeg') no-repeat fixed center;
    background-size:cover;
}
table {
    border: 15px solid transparent;
    border-image: url('borderInventory.svg');
    border-image-slice: 4% fill;
    border-spacing: 0px;
}
th{
    font-weight: bold;
}
tr, td {
    color: LightGray;
    border: 1px solid;
    border-spacing: 0px;
    border-collapse: collapse;
    padding: 5px;
}
</style>
<p style="font-size:72; color:white">big breakdown</p>
<?php
    ini_set('display_errors',1); 
    error_reporting(E_ALL);
    $db = new PDO('mysql:host=127.0.0.1;dbname=grobacharacters_db;charset=utf8mb4', 'root', 'Montgomery11511!');
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $sys = $db->prepare("SELECT * FROM big_breakdown;");
    $sys->execute();

    $char = $sys->fetchAll();

    echo "<table>";
    echo "<tr><th>Nickname</th><th>Name</th><th>Class</th><th>Subclass</th><th>Race</th><th>Subrace</th><th>Background</th><th>Campaign</th><th>Player</th><th>Bloodline</th><th>Level</th><th>Status</th><th>Inactive</th><th>Dead</th><th>GameDeath</th></th>";

    foreach($char as $line){
        echo "<tr>";
        echo "<td>".($line["Nickname"])."</td><td>".($line["Name"])."</td><td>".($line["Class"])."</td><td>".($line["Subclass"])."</td><td>".($line["Race"])."</td><td>".($line["Subrace"])."</td><td>".($line["Background"])."</td><td>".($line["Campaign"])."</td><td>".($line["Player"])."</td><td>".($line["Bloodline"])."</td><td>".($line["Level"])."</td><td>".($line["Status"])."</td><td>".($line["Inactive"])."</td><td>".($line["Dead"])."</td><td>".($line["GameDeath"])."</td>";
        echo "</tr>";

    }
    echo "</table>";
?>

</html>