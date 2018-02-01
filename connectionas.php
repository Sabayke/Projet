<?php
session_start();
$bdd = new PDO('mysql:host=127.0.0.1;dbname=Test1', 'root', '');
if(isset($_POST['ok'])) {
   $nomcli = htmlspecialchars($_POST['login']);
   $mdpconnect = htmlspecialchars($_POST['pass']);
   if(!empty($nomcli) AND !empty($mdpconnect)) {
      $requser = $bdd->prepare("SELECT * FROM clients WHERE NomCli  = ? AND CodeCli = ?");
     $requser->execute(array($nomcli, $mdpconnect));
      $userexist = $requser->rowCount();
      if($userexist == 1) {
         $userinfo = $requser->fetch();
         $_SESSION['nomcli'] = $userinfo['nomcli'];
         $_SESSION['mdpconnect'] = $userinfo['mdpconnect'];
         header("Location: page2.html");
      } else {
         $erreur = "Mauvais nomclient ou mot de passe !";
      }
   } else {
      $erreur = "Tous les champs doivent être complétés !";
   }
}
?>
<html>
	<head>
			<title>Accueil</title>
	</head>
						<link rel = "stylesheet" href = "styl.css" media=" screen " type ="text/css" /> 
			<body>
					<marquee>
								<h1>Bienvenue sur la page de Ouria Marie Diaham Et Brahim Elmoctar </h1>
					</marquee>
			<center>
		<fieldset style= "background-color : #808080; width: 400px;">
				<h3> Identifier vous S.V.P : </h3> <br />
		</fieldset>
					<form method="post" action="">
		<fieldset style= "background-color : #808080; width: 400px;">
	<table>
	<tr>
		<td>Login : </td>
		<td> <input type="text" name="login" > </td> 
	</tr>
	<tr>
		<td>Mot de passe : </td>
		<td><input type="password" name="pass" > </td> 
	</tr>
	<tr>
		<td><input type="Submit" name="ok" value="Ok"> </td>
		<td><input type="Reset" name="Annuler" value="Annuler"> </td> 
	</tr>

	</table>
					</form>
			</center>
         <?php
         if(isset($erreur)) {
            echo '<font color="red">'.$erreur."</font>";
         }
         ?>
			</body>
		</fieldset>
</html>