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
5. Saya menambahkan button yang mirip dengan button awal -> Rubah Icon ke remove -> buat fungsi decremeentCounter fungsinya kebalikan dari incrementCounter ->             onPressed dari button baru adalah decrement counter -> Untuk button yang decrement, jika _counter = 0 maka tidak akan kelihatan jangan lupa posisikan button           tersebut menggunakan Padding. Pada teks ganjil genap pakai if juga sama seperti yang button kalau _counter modulo 2 = 0 maka akan keluar genap                         sedangkan jika tidak maka akan keluar Text ganjil jangan lupa style warna sesuai perintah

## Tugas 8
1. Navigator.push -> Push halaman baru tanpa 'membuang' halaman yang lama, halaman lama bisa dikembalikan dengan pop()
   Navigator.pushReplacement -> Push halaman baru dengan membuang/menggantikan halaman yang lama
2. TextFormField -> Kotak input untuk teks
   DropdownButtonFormField -> Input Dropdown menggunakan list,
   SizedBox -> Membuat kotak agar lebih rapih fieldnya
   ListView -> Menampilkan data-data yang ada pada sebuah list
3. onPressed -> Terjadi ketika tombol ditekan
   onSaved/onSubmitted -> Terjadi ketika data pada field disimpan
   onChanged -> Terjadi ketika data pada field berubah
4. Pada flutter, Navigator halaman (route) bekerja seperti stack, ketika ada perubahan seperti push(), pop(), pushReplacement(), ataupun lainnya, maka akan terjadi          perubahan pada stack tersebut juga.
5. Pertama, kita akan buat form.dart yang isinya untuk mendapatkan user input yaitu judul, nominal, dan tipe budget. Ada 2 jenis field yaitu TextFormField dan             DropdownButtonFormField, jangan lupa tambahkan tombol submit untuk menyimpan data tersebut. Di setiap form field akan terdapat validator dan apa yang harus             dilakukan ketika terdapat userevent seperti menyimpan ataupun merubah field.  Agar data tersebut dapat disimpan dan ditampilkan saya buat dua file .dart baru yaitu     model.dart dan list.dart, model.dart dibuat untuk menampung model Budget sedangkan list.dart untuk menampilkan list model dart tersebut. Selanjutnya untuk yang         list.dart jangan lupa buat agar bisa memuat sebuah halaman sedangkan model.dart tidak harus. Model.dart akan berisi class Budget yang atribut/parameternya itu         sesuai dengan isian form itu tadi. Setelah itu, kita ubah di form.dart ketika kita tekan tombol simpan maka kita akan buat sebuah object Budget yang akan               dimasukkan ke dalam sebuah list. Dari list tersebut akan kita tampilkan di list.dart menggunakan ListView.

## Tugas 9
1. Iya bisa, sama yaitu dengan menggunakan jsonDecode. Akan tetapi, untuk menyimpan data dari json tersebut tentu menjadi lebih sulit jadi tentu tidak lebih baik          dibandingkan dengan membuat model terlebih dahulu.
2. ListView.builder -> Menampilkan data pada sebuah list.
   FutureBuilder -> Membantu mengeksekusi fungsi fetchWaitlist() dan update UI-nya.
   Card -> Membuat Card/Semacam Sized Box/Kotak untuk menjadi batasan untuk teks2nya seperti container
   Text.rich -> Dua widget Text() berbeda bisa dalam 1 baris tetapi berbeda style-nya.
   TextSpan -> Memuat beberapa widget Text() dalam satu baris.
3. FutureBuilder akan menjalankan fetchWaitlist() untuk mendapatkan data json, pada futureWatchlist() data tersebut akan di decode menggunakan jsonDecond. JSON yang      sudah di decode akan dimasukkan dalam sebuat list object Mywatchlist yang merupakan model yang memuat parameter/atribut dari json tersebut jadilah yang tadinya        berbentuk tulisan JSON sekarang telah menjadi object-object Mywatchlist. Setelah selesai fetch data maka jika terdapat isinya akan membuat suatu ListView yang          isinya card-card dan pada card tersebut berisi data-data dari object Mywatchlist tersebut.
4. Melihat dari tutorial 8 kurang lebih seperti itu, saya ambil data json pada heroku dan paste data tersebut pada Quicktype untuk mendapatkan kode dart-nya. Akan        tetapi, ternyata masih ada error jadi di-fix terlebih dahulu. Setelah itu, sama seperti tutorial 8 buat sebuah fungsi untuk mem-fetch data json tersebut kemudian      memasukannya ke sebuah list object Mywatchlist. Jangan lupa pada body widget build kita tambahkan FutureBuilder untuk mengaktifkan fungsi tersebut. Kemudian saya      ganti isi FutureBuilder-nya sehingga muncul data yang saya inginkan. Di masing-masing ListTile akan terdapat onTap yang artinya jika ListTile tersebut disentuh maka    akan memuat detail film tersebut (Object Mywatchlist) dengan menggunakan Navigator pushReplacement akan memuat file .dart yang isinya data-data object Mywatchlist      seperti title, releaseDate, rating, dan lainnya. Oleh karena memakai pushReplacement jangan lupa bikin tombol untuk kembali ke halaman sebelumnya.
