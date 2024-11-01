<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="styleprss.css">
</head>
<body>
<div class="container">
<?php
// Menampilkan error reporting untuk debugging
date_default_timezone_set('Asia/Jakarta');
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Membuat koneksi ke database
$conn = new mysqli("localhost", "root", "", "presensi_siswa");

// Memeriksa koneksi
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

// Memeriksa apakah form telah disubmit dan NIS telah diisi
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['nis'])) {
    $nis = $_POST['nis'];

    // Jika form presensi di-submit
    if (isset($_POST['submit_presensi'])) {
        // Data presensi dari form
        $nama = $_POST['nama'];
        $absen = $_POST['absen'];
        $kelas = $_POST['kelas'];
        $waktu = date("Y-m-d H:i:s");  // Waktu saat ini

        // Menentukan batas waktu jam 7 pagi
        $batas_waktu = date("Y-m-d 07:00:00"); 

        // Logika untuk menentukan keterangan hadir atau terlambat
        if ($waktu <= $batas_waktu) {
            $keterangan = "Hadir";
        } else {
            $keterangan = "Terlambat";
        }

        // Pastikan semua data tidak kosong
        if (empty($nama) || empty($absen) || empty($kelas)) {
            die("Data tidak lengkap. Pastikan semua field terisi.");
        }

        // Insert data ke tabel presensi termasuk keterangan
        $sql_insert = "INSERT INTO presensi (nis, nama, absen, kelas, waktu, keterangan) VALUES (?, ?, ?, ?, ?, ?)";
        $stmt_insert = $conn->prepare($sql_insert);

        // Cek apakah statement berhasil dipersiapkan
        if ($stmt_insert === false) {
            die("Gagal mempersiapkan statement: " . $conn->error);
        }

        $stmt_insert->bind_param("ssssss", $nis, $nama, $absen, $kelas, $waktu, $keterangan);

        // Eksekusi statement dan cek apakah berhasil
        if ($stmt_insert->execute()) {
            echo "<p>Presensi berhasil disimpan! Status: " . htmlspecialchars($keterangan) . "</p>";
            // Tambahkan button kembali ke index setelah sukses
            echo '<button type="button" onclick="window.location.href=\'index.php\';" class="btn">Kembali ke Halaman Utama</button>';
        } else {
            // Tampilkan error detail untuk debugging
            echo "<p>Gagal menyimpan presensi: " . htmlspecialchars($stmt_insert->error) . "</p>";
        }

        // Tutup statement
        $stmt_insert->close();
    } else {
        // Query untuk mencari nama, absen, dan kelas siswa berdasarkan NIS
        $sql = "SELECT nama, absen, kelas FROM nama WHERE nis = ?";
        $stmt = $conn->prepare($sql);

        // Cek apakah statement berhasil dipersiapkan
        if ($stmt === false) {
            die("Gagal mempersiapkan statement: " . $conn->error);
        }

        $stmt->bind_param("s", $nis);
        $stmt->execute();

        // Bind hasil query ke variabel
        $stmt->bind_result($nama, $absen, $kelas);
        $stmt->fetch();

        // Menampilkan data siswa jika ditemukan
        if ($nama) {
            echo "<p>Nama : " . htmlspecialchars($nama) . "</p>";
            echo "<p>Absen : " . htmlspecialchars($absen) . "</p>";
            echo "<p>Kelas : " . htmlspecialchars($kelas) . "</p>";
            
            // Form untuk menyimpan presensi
            echo '<form method="POST" action="">
                <input type="hidden" name="nis" value="' . htmlspecialchars($nis) . '">
                <input type="hidden" name="nama" value="' . htmlspecialchars($nama) . '">
                <input type="hidden" name="absen" value="' . htmlspecialchars($absen) . '">
                <input type="hidden" name="kelas" value="' . htmlspecialchars($kelas) . '">
                <button type="submit" name="submit_presensi" class="btn">Simpan Presensi</button>
                <button type="button" onclick="window.location.href=\'index.php\';" class="btn">Kembali</button>
            </form>';
        } else {
            echo "<p>Nama tidak ditemukan untuk NIS: " . htmlspecialchars($nis) . "</p>";
        }

        // Tutup statement
        $stmt->close();
    }
} else {
    echo "<p>Silakan masukkan NIS terlebih dahulu.</p>";
}

// Tutup koneksi
$conn->close();
?>
</div>
<img src="gmbr2.jpeg" alt="">
<div class="lingkaran-container">
        <div class="lingkaran"></div>
        <div class="lingkaran"></div>
        <div class="lingkaran"></div>
        <div class="lingkaran"></div>
    </div>
</body>
</html>
