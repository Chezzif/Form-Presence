function cekNIS() {
    var nis = document.getElementById("nis").value;
    if (nis === "") {
        alert("Silakan pilih NIS terlebih dahulu!");
        return false;
    } else {
        window.location.href = 'showdata.php?nis=' + nis;
    }
}