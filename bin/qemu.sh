myQemu(){
  qemu-system-x86_64 -machine q35 -m 1024 -smp cpus=2 -cpu qemu64   -drive if=pflash,format=raw,read-only,file=/data/data/com.termux/files/usr/share/qemu/edk2-x86_64-code.fd -netdev user,id=n1,hostfwd=tcp::2222-:22 -device virtio-net,netdev=n1   -nographic -fsdev local,security_model=mapped-file,id=fsdev0,multidevs=remap,path=/data/data/com.termux/files/home/alpine -device virtio-9p-pci,fsdev=fsdev0,mount_tag=host_storage,id=virtio-9p-pci0 alpine.img
}
# -net user,hostfwd=tcp::8080-:80,hostfwd=tcp::22222-:22
# my qemu arg : file, port,
#
#
# https://www.motoots.com/2021/03/running-docker-using-qemu-on-android.html?m=1
# https://gist.github.com/oofnikj/e79aef095cd08756f7f26ed244355d62
