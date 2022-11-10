# counter_7
Nama: Rama Tridigdaya
NPM: 2106638532
Kelas: B

## Tugas 7
1. Stateless Widget -> Property-nya final, tidak bisa berubah-ubah dari kondisi awalnya
   Stateful Widget -> Property widget tersebut bisa berubah dengan interaksi user atau mendapatkan data baru
2. Text() -> Menampilkan teks/string
   FloatingActionButton() -> Membuat button, men-trigger event (fungsi) ketika ditekan
   Padding(), Center(), Row(), Column() -> Untuk menentukan margin, ukuran, dan lainnya
   MyApp(), MyHomePage() -> Menampilkan halaman dan widget aplikasinya
3. setState() berfungsi untuk memberitahu Flutter untuk me-rerun build method-nya agar bisa memperbaharui halaman aplikasi ketika terdapat perubahan
4. final -> Setelah di-assign tidak bisa diubah, bisa diinisialisasikan ulang ketika update state.
   const -> Setelah di-assign tidak bisa diubah, value-nya sudah di-assign sejak compile time tidak bisa diubah ketika runtime/update state
5. Saya menambahkan button yang mirip dengan button awal -> Rubah Icon ke remove -> buat fungsi decremeentCounter fungsinya kebalikan dari incrementCounter -> onPressed    dari button baru adalah decrement counter -> Untuk button yang decrement, jika _counter = 0 maka tidak akan kelihatan jangan lupa posisikan button tersebut              menggunakan Padding. Pada teks ganjil genap pakai if juga sama seperti yang button kalau _counter modulo 2 = 0 maka akan keluar genap sedangkan jika tidak maka akan      keluar Text ganjil jangan lupa style warna sesuai perintah
