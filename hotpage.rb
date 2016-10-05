<?php
$pg_title = 'Promoção Rafeek';
?>
<!DOCTYPE html>
<html lang="pt-br" itemscope itemtype="https://schema.org/Article">
    <head>
        <meta charset="UTF-8">
        <meta name="mit" content="005400">
        <meta name="viewport" content="width=device-width,initial-scale=1">

        <title><?= $pg_title; ?></title>
        <meta name="description" content="Promoção Rafeek"/>
        <meta name="robots" content="index, follow"/>

        <link rel="author" href="#"/>
        <link rel="publisher" href="#"/>

        <meta itemprop="name" content="<?= $pg_title; ?>"/>
        <meta itemprop="description" content="Lançamento Rafeek"/>
        <meta itemprop="image" content="img/index.jpg"/>

        <link rel="shortcut icon" href="img/favicon.png"/>
        <link href='https://fonts.googleapis.com/css?family=Lato:100,300,400,700' rel='stylesheet' type='text/css'>   
        <link rel="stylesheet" href="css/style_hotpage.css"/>    
    </head>
    <body class="container">  
        <header class="logo">
            <img src="img/logo_heroi.png"/>
        </header>
        <main class="content">
            <div class="banner">
                <img src="img/ban.png"/>
            </div>
            <div class="facebook">
                <p>Curta nossa página no facebook!</p>
                <div class="fb-page" data-href="https://www.facebook.com/Rafeekbr/" data-tabs="eventos" data-width="340" data-height="214" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><blockquote cite="https://www.facebook.com/Rafeekbr/" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/Rafeekbr/">Rafeek - Rifas Nerds</a></blockquote></div>
            </div>
            <div class="email">
                <p>Digite seu email para participar</p>
                <input type="text"/>
                <button>PARTICIPAR</button>
            </div>    
        </main>
        <footer>
            <p>Developed by Vortex Developer</p>
            <img src="img/vortex.png"/>
        </footer>
    </body>
    <div id="fb-root"></div>
    <script>(function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id))
                return;
            js = d.createElement(s);
            js.id = id;
            js.src = "//connect.facebook.net/pt_BR/sdk.js#xfbml=1&version=v2.7";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
    </script>
</html>