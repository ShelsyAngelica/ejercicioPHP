<?php
    include_once '../modelo/conexionfiltrar.php';
    $objeto = new Conexion();
    $conexion = $objeto->conectar();

    $consulta = "SELECT * FROM identification_types";
    $resultado = $conexion->prepare($consulta);
    $resultado->execute();
    $tipos_de_identificacion = $resultado->fetchAll(PDO::FETCH_ASSOC);

?>




<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../styles/RegistroPacientes.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>
    <nav class="navbar navbar-expand-lg bg-primary">
        <div class="container-fluid">
            <img src="../assets/logo.png" alt="logo" width="3%" >
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                    <a class="nav-link active text-white" aria-current="page" href="../index.php">Inicio</a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link text-white" href="listado.php">Listado</a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link text-white" href="RegistroPaciente.php">Registro</a>
                    </li>                   
                    <li class="nav-item">
                    <a class="nav-link text-white" href="consulta.php">Consulta</a>
                    </li>
                </ul>
                <form class="d-flex" role="search">
                    <input class="form-control me-2" type="search" placeholder="Buscar" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Buscar</button>
                </form>
            </div>
        </div>
    </nav>

    <div class="registro-pacientes">
        <div class="form-container-registro">
            <p class='title-registro-pacientes'>Registro pacientes</p>

            <form action="" method="post" class="form-registro-pacientes" >

                <div class='div-content'>
                    <label for="name" class="label-reg">Nombres:</label>
                    <input type="text" name="name" placeholder="Maria " class="input-reg input-name-reg"/>
                </div>
                
                <div class='div-content'>   
                    <label for="surname" class="label-reg">Apellidos:</label>
                    <input type="text" name="surname" placeholder="Torres" class="input-reg input-surname-reg"/>
                </div>
                
                <div class='div-content'>
                    <label for="identification_type" class='label-reg'>Tipo de documento:</label>
                    <select name="identification_type" id="identification_type"required class='input-reg' >

                        <option selected disabled>Seleccione tipo de documento</option>
                        <?php 
                            foreach($tipos_de_identificacion as $tipo_de_identificacion){
                              echo "
                                 <option value='{$tipo_de_identificacion['id']}'>{$tipo_de_identificacion['description']}</option>
                              ";  
                            }
                        ?>
                        
                    </select>
                </div>
    
                <div class='div-content'>
                    <label for="identification_number" class="label-reg">Numero documento:</label>
                    <input type="text" name="identification_number" placeholder="0123456789" class="input-reg input-address"/>
                </div>
                
                <div class='div-content'>
                    <label for="birthdate" class='label-reg'>Fecha Nacimiento:</label>
                    <input type="birthdate" id="birthdate" name="birthdate"value="2023-03-29" class='input-reg'></input>
                </div>
    
                <div class='div-content'>
                    <label for="residence_address" class="label-reg">Dirección:</label>
                    <input type="text" name="residence_address" placeholder="Kr 10 a" class="input-reg input-address"/>
                </div>
                
                <div class='div-content'>
                    <label for="cell_phone" class="label-reg">Telefono:</label>
                    <input type="text" name="cell_phone" placeholder="310200200" class="input-reg input-address"/>
                </div>                
                
                <div class='div-content'>
                    <label for="occupation" class="label-reg">Ocupacion:</label>
                    <input type="text" name="occupation" placeholder="Ingresa ocupacion" class="input-reg input-diagnostic"/>
                </div>

                <div class='div-content'>
                    <label for="email" class="label-reg">Email:</label>
                    <input type="email" name="email" placeholder="Ingresa email" class="input-reg input-diagnostic"/>
                </div>
    
                <div class='div-buttons'>
                    <button class="secondary-button-reg button-cancel">Cancelar</button>
                    <button class="primary-button-reg">Guardar</button>
                </div>
            </form>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>