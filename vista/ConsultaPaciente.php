<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../styles/RegistroPacientes.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script> 
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
    <?php
        include("./Nav.php");
    ?>

    <div class="registro-pacientes">
        <div class="form-container-registro">
            <p class='title-registro-pacientes'>Consulta Paciente</p>

            <form action="" method="post" class="form-registro-pacientes" >

                <div class='div-content'>
                    <label for="identification_number" class="label-reg">Numero documento:</label>
                    <input type="text" name="identification_number" placeholder="0123456789" class="input-reg input-address"/>
                </div>
                
                <div class='div-buttons'>
                    <button class="primary-button-reg" name="btnConsulta">Buscar</button>
                </div>
            </form>

            <!-- modulo consulta -->
            <?php
                include '../modelo/conexionfiltrar.php';
                $objeto = new Conexion();
                $conexion = $objeto->conectar();

                if(isset($_POST['btnConsulta'])){
                    $identification_number = $_POST['identification_number'];

                    if($identification_number == ""){
                        echo "<script> Swal.fire('Digite un numero de documento') </script> ";
                    } else{

                        $sql = "SELECT * FROM people p WHERE identification_number = ?";

                        $resultado = $conexion->prepare($sql);
                        $resultado->execute([$identification_number]);
                        $people = $resultado->fetchAll();

                        if (!count($people)) 
                            echo "<script> Swal.fire('El numero de documento no existe en la base de datos') </script> ";
                    }


                }

                if(isset($_POST['btnEliminar'])){
                    $id = $_POST['id'];

                    if($id == ""){
                        echo "<script> Swal.fire('ocurrio un problema intente de nuevo mas tarde') </script> ";
                    } else{
                        $sql = "DELETE FROM people WHERE id=?";
                        $stmt= $conexion->prepare($sql);
                        $stmt->execute([$id]);
                        echo "<script> Swal.fire('persona eliminada') </script> ";
                    }


                }
            ?>

            <table class="table table-striped mt-3">
                <tr>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Tipo de documento</th>
                    <th>Numero de documento</th>
                    <th>Fecha de nacimiento</th>
                    <th>Direccion</th>
                    <th>Telefono</th>
                    <th>Ocupacion</th>
                    <th>Email</th>
                    <th>Opciones</th>
                </tr>
                <?php
                if (isset($people)) {
                    foreach ($people as $key => $person) {
                        echo "
                        <tr>
                            <td>{$person["name"]}</td>
                            <td>{$person["surname"]}</td>
                            <td>{$person["identification_type"]}</td>
                            <td>{$person["identification_number"]}</td>
                            <td>{$person["birthdate"]}</td>
                            <td>{$person["residence_address"]}</td>
                            <td>{$person["cell_phone"]}</td>
                            <td>{$person["occupation"]}</td>
                            <td>{$person["email"]}</td>
                            <td>
                                <form action='' method='post' class='form-registro-pacientes'>
                                    <input name='id' type='hidden' value='{$person["id"]}'/>
                                    <button class='btn btn-danger'  name='btnEliminar'>Borrar</button>
                                </form>
                            </td>
                        </tr>
                        ";
                    }
                }
                ?>
            </table>

            


        </div>
    </div>

    
</body>
</html>

