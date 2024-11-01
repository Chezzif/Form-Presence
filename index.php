<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="style1.css">
    <title>Form Presensi Siswa</title>
    <script src="java.js"></script>
</head>
<body>
<div class="container">
    <div class="containerform">
        <h1>Form Presensi Siswa</h1>
        <form action="proses_presensi.php" method="post" id="presensiForm">

            <div class="mb-3">
                <label for="nis" class="form-label">Pilih NIS:</label>
                <select class="form-control" id="nis" name="nis" required>
                    <?php
                    $conn = new mysqli("localhost", "root", "", "presensi_siswa");

                    if ($conn->connect_error) {
                        die("Koneksi gagal: " . $conn->connect_error);
                    }

                    echo "<option value=''>Pilih NIS Siswa</option>";

                    $sql = "SELECT nis, nama FROM nama";
                    $result = $conn->query($sql);

                    if ($result === FALSE) {
                        die("Query gagal: " . $conn->error);
                    }

                    while ($row = $result->fetch_assoc()) {
                        echo "<option value='" . htmlspecialchars($row['nis']) . "'>" . htmlspecialchars($row['nis']) . "</option>";
                    }

                    $conn->close();
                    ?>
                </select>
            </div>
            <button type="button" class="btnshow" onclick="cekNIS();">LIHAT JURNAL PRESENSI</button>
            <button type="submit" class="btn">PROSES</button>
        </form>
    </div>
    <img src="gmbr1.jpeg" alt="">
    <div class="lingkaran-container">
        <div class="lingkaran"></div>
        <div class="lingkaran"></div>
        <div class="lingkaran"></div>
        <div class="lingkaran"></div>
    </div>
</div>
</body>
</html>
