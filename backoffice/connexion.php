<?php

    include('bdconnexion.php');
	include('header/header.php');
	
		session_start();

		//session_destroy();
		/*if(!empty($_POST))
		{
         if($_POST['user']=="Machin" && $_POST['psw']=="4567")
         {
             $_SESSION['acces']="oui";
             $_SESSION['nom']=$_POST['user'];
             $_SESSION['php']=0;
             $_SESSION['html']=0;
         }
        }*/

	
?>
	<!--container -->
    <div class="container">
		<div class="panel panel-primary">
		  <div class="panel-heading"><h3 class="panel-title">Formulaire de connexion</h3></div>
		</div>
		<div class="panel-body">
	

		   <?php  
		   $pdo=connect_bd();
		  
		   if (isset($_POST['submit'])) {

				$user = $_POST['user'];
				$psw  = $_POST['psw'];

				$stmt = $pdo->prepare("SELECT * FROM administrateur WHERE utilisateur = :user");
				$stmt->execute([':user' => $user]);
				$data = $stmt->fetch(PDO::FETCH_ASSOC);

				if ($data && password_verify($psw, $data['password'])) {
					$_SESSION['acces'] = "oui";
					$_SESSION['nom'] = $user;
					header("Location: inscription.php");
					exit();
				} else {
					echo "Nom d'utilisateur ou mot de passe incorrect";
				}
			}



		 ?>
			<form action="" method="post" class="form-inline">
			
				<label for="auteur" class="control-label"> Utilisateur : </label> 
				<input type="text"  name="user" class="form-control input-lg" style="margin-left:20px;"/> <br>
				<br>
				<label for="psw" class="control-label"> Mot de passe : </label> 
				<input type="password" name="psw" class="form-control input-lg"/><br><br> 
				<input type="submit" class="btn btn-warning active" name="submit" value="Se connecter" />
			</form>
		</div>
		<div class="panel-footer">
		 <?php 
		 /*
		 s
		  if(isset($_SESSION['acces'])){	  if($_SESSION['acces']=="oui") {
header("Location:inscription.php");
}else{
	echo"Entrer votre nom et pasword svp!";
}}
	
			
		*/?>
		
		</div>
	</div>
		
	<!-- /.container -->
	
	
	<?php
		include('footer/footer.php');

	?>
  </body>
</html>
 