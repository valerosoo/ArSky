<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Comprar</title>
    <link rel="stylesheet" href="Comprar_vuelos.css">
    <link rel="icon" href="Logo_Arskyv2.png">
</head>
<body>
<?php
session_start();
$servername = "127.0.0.1:3306"; 
$username = "root";      
$password = "";            
$database = "arsky";

if(empty($_SESSION['DNI'])){
    echo "Inicia Sesion para ver esto";
    ?>
    <script>
            setTimeout(function() {
                window.location.href = 'Login_ArSky.php';
            }, 3000);
    </script>
    <?php
}
else{
    ?>
    <main>
    <div id="div_borde_login">
        <div id="div_fondo_login">
            <h1>Comprar</h1>
            <form id="formulario_login" action="comprar_vuelos-pag.php" method="post">
                <label for="metodo-pago">Elige un método de pago:</label>
                <select id="metodo-pago" name="metodo-pago">
                    <option value="">Selecciona</option>
                    <option value="visa">Visa</option>
                    <option value="mastercard">MasterCard</option>
                    <option value="amex">American Express</option>
                </select>

                <div id="formulario-pago" style="display: none;">
                    <!-- Formulario Visa -->
<div id="visa-form" style="display: none;">
<label for="numero-tarjeta">Número de tarjeta Visa:</label>
<input type="text" id="numero-visa" name="numero-tarjeta" required placeholder="Ej: 1234 5678 9012 3456">
<label for="nombre-titular">Nombre del Titular:</label>
<input type="text" id="nombre-titular-visa" name="nombre-titular" required placeholder="Ej: Juan Pérez">
<label for="apellido-titular">Apellido del Titular:</label>
<input type="text" id="apellido-titular-visa" name="apellido-titular" required placeholder="Ej: Pérez">
<label for="fecha-vencimiento-visa">Fecha de vencimiento:</label>
<input type="text" id="fecha-vencimiento" name="fecha-vencimiento" placeholder="MM/AA" required pattern="\d{2}/\d{2}" title="Formato: MM/AA">
</div>

<!-- Formulario MasterCard -->
<div id="mastercard-form" style="display: none;">
<label for="numero-tarjeta">Número de tarjeta MasterCard:</label>
<input type="text" id="numero-mastercard" name="numero-trajeta" required placeholder="Ej: 1234 5678 9012 3456">
<label for="nombre-titular">Nombre del Titular:</label>
<input type="text" id="nombre-titular-mastercard" name="nombre-titular" required placeholder="Ej: Juan Pérez">
<label for="apellido-titular">Apellido del Titular:</label>
<input type="text" id="apellido-titular-mastercard" name="apellido-titular" required placeholder="Ej: Pérez">
<label for="fecha-vencimiento">Fecha de vencimiento:</label>
<input type="text" id="fecha-vencimiento-mastercard" name="fecha-vencimiento" placeholder="MM/AA" required pattern="\d{2}/\d{2}" title="Formato: MM/AA">
</div>

<!-- Formulario American Express -->
<div id="amex-form" style="display: none;">
<label for="numero-tarjeta">Número de tarjeta American Express:</label>
<input type="text" id="numero-amex" name="numero-tarjeta" required placeholder="Ej: 34XXXXXXXXXXXX">
<label for="nombre-titular">Nombre del Titular:</label>
<input type="text" id="nombre-titular-amex" name="nombre-titular" required placeholder="Ej: Juan Pérez">
<label for="apellido-titular">Apellido del Titular:</label>
<input type="text" id="apellido-titular-amex" name="apellido-titular" required placeholder="Ej: Pérez">
<label for="fecha-vencimiento">Fecha de vencimiento:</label>
<input type="text" id="fecha-vencimiento-amex" name="fecha-vencimiento" placeholder="MM/AA" required pattern="\d{2}/\d{2}" title="Formato: MM/AA">
</div>

                    </div>
                    <button type="submit">Pagar</button>
                </div>

                <script>
                    const metodoPago = document.getElementById('metodo-pago');
                    const formularioPago = document.getElementById('formulario-pago');

                    metodoPago.addEventListener('change', function() {
                        formularioPago.style.display = 'block';

                        // Ocultar todos los formularios
                        document.getElementById('visa-form').style.display = 'none';
                        document.getElementById('mastercard-form').style.display = 'none';
                        document.getElementById('amex-form').style.display = 'none';

                        // Mostrar el formulario correspondiente
                        switch (metodoPago.value) {
                            case 'visa':
                                document.getElementById('visa-form').style.display = 'block';
                                break;
                            case 'mastercard':
                                document.getElementById('mastercard-form').style.display = 'block';
                                break;
                            case 'amex':
                                document.getElementById('amex-form').style.display = 'block';
                                break;
                        }
                    });
                </script>
            </form>
        </div>
    </div>
</main>
<footer>
    <!-- Contenido del pie de página -->
</footer>
</body>
</html>
<?php
}

?>
    