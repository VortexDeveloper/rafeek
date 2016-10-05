<?php
$pg_title = 'Rafeek';
?>
<!DOCTYPE html>
<html lang="pt-br" itemscope itemtype="https://schema.org/Article">
    <head>
        <meta charset="UTF-8">
        <meta name="mit" content="005400">
        <meta name="viewport" content="width=device-width,initial-scale=1">

        <title><?= $pg_title; ?></title>
        <meta name="description" content="Rafeek"/>
        <meta name="robots" content="index, follow"/>

        <link rel="author" href="https://plus.google.com/103958419096641225872/posts"/>
        <link rel="publisher" href="https://plus.google.com/107305124528362639842"/>

        <meta itemprop="name" content="<?= $pg_title; ?>"/>
        <meta itemprop="description" content="Rafeek"/>
        <meta itemprop="image" content="img/index.jpg"/>

        <link rel="shortcut icon" href="img/favicon.png"/>
        <link href='https://fonts.googleapis.com/css?family=Lato:100,300,400,700' rel='stylesheet' type='text/css'>   
        <link rel="stylesheet" href="js/shadowbox/shadowbox.css"/>
        <link rel="stylesheet" href="css/boot.css"/>
        <link rel="stylesheet" href="css/style.css"/>    
        <link rel="stylesheet" href="css/bootstrap.css"/>        
    </head>
    <body class="conteudo">  
        <header class="content">
            <div class="fundo_menu fixar_fundo"></div>
            <div id="login" class="login fixar_login">
                <div class="mobile_action"></div>
                <div class="mobile_action_side"></div>
                <button class="btn news_button" href="#" data-toggle="modal" data-target="#login-modal">Login</button>
                <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                    <div class="modal-dialog">
                        <div class="loginmodal-container">
                            <h1>Login</h1><br>
                            <form>
                                <input type="text" name="user" placeholder="Usuário">
                                <input type="password" name="pass" placeholder="Senha">
                                <input class="btn news_button" type="submit" name="login" class="login loginmodal-submit" value="Login">
                            </form>
                            <div class="login-help">
                                <a href="#">Registre-se</a>  
                                <a href="#">Esqueci minha senha</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="logo fixar_logo">
                <div  id="topo"></div>
                <img src="img/logo_heroi.png"/>
            </div>
            <ul class="menu_topo fixar_menu">
                <li class="menu_topo_item"><a href="index.php">Home</a>
                <li class="menu_topo_item"><a href="categorias.php">Rifas</a>
                <li class="menu_topo_item"><a href="categorias.php">Novos</a>
                <li class="menu_topo_item"><a href="categorias.php">Hot</a>
                <li class="menu_topo_item"><a href="pontos.php">Pacotes de Pontos</a>
                <li class="menu_topo_item"><a href="ganhadores.php">Ganhadores</a>
                <li class="menu_topo_item"><a href="help.php">Como Funciona</a>
            </ul>
        </header>