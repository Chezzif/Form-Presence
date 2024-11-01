<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Daftar Presensi Siswa</title>
    <link rel="stylesheet" href="styleshow.css">
</head>
<body>

<div class="container">
    <h1>Daftar Presensi Siswa</h1>
    <div class="tabelscrol">
    <table>
        <thead>
            <tr>
                <th>No</th>
                <th>NIS</th>
                <th>Nama Siswa</th>
                <th>Keterangan</th>
                <th>Waktu</th>
            </tr>
        </thead>
        <tbody>
        <?php
// Menyetel zona waktu Indonesia (WIB)
date_default_timezone_set('Asia/Jakarta');

// Koneksi ke database
$conn = new mysqli("localhost", "root", "", "presensi_siswa");

if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

// Memeriksa apakah ada NIS yang dikirim dari index.php
$selectedNis = isset($_GET['nis']) ? $_GET['nis'] : '';

// SQL query untuk menampilkan data presensi berdasarkan NIS yang dipilih
if (!empty($selectedNis)) {
    // Mengambil data hanya yang sesuai NIS
    $sql = "SELECT * FROM presensi WHERE nis = '" . $conn->real_escape_string($selectedNis) . "' ORDER BY waktu ASC";
} else {
    // Jika tidak ada NIS yang dipilih, tampilkan pesan error
    echo "<tr><td colspan='6'>Tidak ada NIS yang dipilih.</td></tr>";
    $conn->close();
    exit();
}

$result = $conn->query($sql);

// Memeriksa apakah ada data presensi
if ($result->num_rows > 0) {
    $no = 1;
    // Menampilkan data presensi ke dalam tabel
    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $no++ . "</td>";
        echo "<td>" . htmlspecialchars($row['nis']) . "</td>";
        echo "<td>" . htmlspecialchars($row['nama']) . "</td>";
        echo "<td>" . htmlspecialchars($row['keterangan']) . "</td>";
        // Menampilkan waktu dalam format d-m-Y H:i:s sesuai zona waktu Indonesia
        echo "<td>" . date('d-m-Y H:i:s', strtotime($row['waktu'])) . "</td>";
        echo "</tr>";
    }
} else {
    echo "<tr><td colspan='6'>Tidak ada data presensi untuk NIS yang dipilih.</td></tr>";
}

// Menutup koneksi
$conn->close();
?>

        </tbody>
        
    </table>
    </div>
    <button type="button" onclick="window.location.href = 'index.php';" class="btn">Kembali ke From Presesnsi</button>
</div>

<img src="gmbr2.jpeg" alt="" class="img1">
<div class="lingkaran-container">
    <div class="lingkaran"></div>
    <div class="lingkaran"></div>
    <div class="lingkaran"></div>
    <div class="lingkaran"></div>
</div>

</body>
</html>
