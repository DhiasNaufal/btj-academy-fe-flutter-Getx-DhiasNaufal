# BTJ Academy Front End Class - Flutter

Repository ini merupakan repository Front End Class dengan topik Flutter - GetX State Management

## GetX State Management (API Integration)

Post test ini memiliki case untuk mengintegrasikan API ke dalam sebauh Flutter Project dengan bantuan GetX State Management.

Halaman Projek akan terdiri dari halaman `home` dan halaman `detail`. Halaman `home` akan menampilkan data yang ada pada `EndPoint`, sedangkan Detail akan menampilkan Detail Data yang sudah dipilih di halaman `Home`

### Get CLI yang digunakan

1.Membuat Project

```CMD
get create project
```

2.Membuat Page

```CMD
get create page:detail
```

3.Membuat Model dengan json

```CMD
get generate model with assets/json/data.json
```

dengan `.json` seperti

```JSON
{
  "angkatan": "2017",
  "ipk": "3.65",
  "nama": "budi",
  "nim": "28664673689",
  "prodi": "Informatika"
}
```

### Dependencies yang digunakan

```YAML
dependencies:
  cupertino_icons: ^1.0.2
  get: 4.6.6
  loading_animation_widget: 1.2.0+4
```

### Menambahkan Internet Permission

```XML
<uses-permission android:name="android.permission.INTERNET" />
```

## Demo

https://drive.google.com/file/d/1GkPDQ46Wxw7ZPIaVEdJfEPWZ1nerUvui/view?usp=sharing
