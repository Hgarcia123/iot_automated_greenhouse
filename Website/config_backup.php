<?php
$especie_id = filter_input(INPUT_POST, 'planta_id');
$esp_id = filter_input(INPUT_POST, 'esp_id');
$temperatura_ar = filter_input(INPUT_POST, 'temperatura_ar');
$humidade_ar = filter_input(INPUT_POST, 'humidade_ar');
$luminosidade = filter_input(INPUT_POST, 'luminosidade');
$humidade_solo = filter_input(INPUT_POST, 'humidade_solo');
$litros_de_agua = filter_input(INPUT_POST, 'litros_de_agua');
$deepsleep = filter_input(INPUT_POST, 'deepsleep');
$active_time = filter_input(INPUT_POST, 'active_time');
$created_date = date("Y-m-d H:i:s");

if (!empty($planta_id) || !empty($esp_id) || !empty($temperatura_ar) || !empty($humiade_ar) || !empty($luminosidade) || !empty($humiade_solo) || !empty($litros_de_agua) || !empty($deepsleep) || !empty($active_time)) {
    $host = "localhost";
    $dbusername = "root";
    $dbpassword = "27012000asd";
    $dbname = "Projeto";
    $conn = new mysqli($host, $dbusername, $dbpassword, $dbname);

    if (mysqli_connect_error()) {
        die('Connect Error (' . mysqli_connect_error() . ')' . mysqli_connect_error());
    }
    else {
        $sql = "UPDATE Parametros set param_especie_id='$especie_id', param_temp_ar='$temperatura_ar', param_hum_ar='$humidade_ar', param_lumin='$luminosidade', param_hum_solo='$humidade_solo', param_litros_agua='$litros_de_agua', param_deepsleep_time='$deepsleep', param_active_time='$active_time', param_timestamp='$created_date' where param_esp_id='$esp_id';";
        if ($conn->query($sql)) {
            echo '<script type="text/javascript">alert("Valores inseridos com sucesso!")</script>';
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
        $conn->close();
    }
} else {
    echo '<script type="text/javascript">alert("Os Parametros não devem estar vazios...")</script>';
    die();
}