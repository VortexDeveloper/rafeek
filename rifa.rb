<?php require './headerGeral.php'; ?>
<main class="content top">
    <div class="dir">
        <div class="raf_item">
            <img src="img/playstation.jpg" alt="Playstation 4">
            <div class="raf_item_desc">
                <div class="caption rifa">
                    <h3>Playstation 4</h3>
                    <p>Playstation 4 com 2 controles e 5 jogos de sua escolha.</p>
                    <h2 class="bilhetes">  
                        <img src="img/bol.png"/> 
                    </h2>
                    <h2 class="bilhetes">Disponíveis</h2>
                    <h2 class="bilhetes">
                        <img src="img/bol_r.png"/> 
                    </h2>    
                    <h2 class="bilhetes">Vendidos</h2>
                    <div class="progress">
                        <div class="progress-bar progress-bar-danger" style="width: 90%">
                            <span class="sr-only">90 Compradas</span>
                            90
                        </div>
                        <div class="progress-bar progress-bar-success" style="width: 10%">
                            <span class="sr-only">10 Restantes</span>
                            10
                        </div>
                    </div> 
                    <h4>Data do Sorteio: 30/08/2016</h4>
                    <div class="form-group">
                        <button type="submit" class="btn news_button btn_qtd btn_qtd_v">-</button>
                        <input type="text" class="form-control input_qtd" placeholder="Qtd">
                        <button type="submit" class="btn news_button btn_qtd">+</button>
                    </div>

                    <table class="table">
                        <tbody>
                            <tr>
                                <td>Valor unitário</td>
                                <td>1000 Pts</td>
                            </tr>
                            <tr>
                                <td>Subtotal</td>
                                <td>1000 Pts</td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="alert alert-info" role="alert">
                        Para comprar as rifas é necessário que você tenha comprado um dos nossos pacotes de pontos.
                        Caso ainda não possua pontos clique no botão abaixo para conhecer nossos pacotes.
                    </div>
                    <p>
                        <a href="#" class="btn btn-primary raf_item_desc" role="button">Investir pontos</a>
                    </p>
                    <p>
                        <a href="pontos.php" class="btn btn-primary raf_item_desc pontos" role="button">Comprar pontos</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</main>

<?php require './footer.php'; ?>