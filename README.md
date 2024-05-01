# CLI CONFIG
Ini adalah repo konfigurasi yang berisi file-file konfigurasi untuk beberapa program seperti Bash, Zsh, Termux, Tmux, Fzf, dan Git. Setiap file disimpan dalam format tertentu dan dapat digunakan dengan program yang sesuai. Anda dapat menggunakan repo ini dengan cara clone repositori ke dalam direktori lokal, kemudian salin dan sesuaikan file konfigurasi ke dalam lokasi yang sesuai untuk masing-masing program. Konfigurasi akan membantu membuat penggunaan program-program tersebut menjadi lebih mudah dan efisien.

> Note : dianjurkan sudah menguasai bash, zsh. Karena prefensi ini ditujukan untuk pribadi

## install
### clone repo
> [!WARNING]
> pastikan sudah mengganti package manager menjadi pacman.
```bash
cd
git clone --depth=1 https://github.com/muryp/cli-config .myconf
bash .myconf/termuxInstall.sh
```
> [!NOTE]
> lihat [link berikut](https://github.com/alifprihantoro/new-content) untuk tutorial lebih lanjut. di folder `setup/termux.md` dan `bookmarks/cli.md`.