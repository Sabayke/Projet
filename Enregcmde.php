 <?php
 session_start();

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "Test1";
// Lahi nconnecti l basi
$db = new mysqli('localhost', 'root', '', 'Test1');
// net2ked eni mconnecti
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
    }
if(isset($_POST['Enreg cmde'])) {
$Date_commande = htmlspecialchars($_POST['Date_commande']);
$Code_client = htmlspecialchars($_POST['Code_client']);
$Num_commande = htmlspecialchars($_POST['Num_commande']);
}
   if(!empty($Date_commande) AND !empty($Num_commande))
    {
   	  // nejehez table commandes
	   $stmt = $conn->prepare("INSERT INTO commandes (Date_commande, Code_client, Num_commande) VALUES (?, ?, ?)");
	   $stmt->bind_param("sss", $Date_commande, $Code_client, $Num_commande);
       $stmt->execute();
    }$stmt->close();
$conn->close();
echo 'Cher client ton Commande a était bien enregistrer';
echo 'Merci pour votre visite'
?> 
   
<!--
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>


</body>
</html>>
-->



