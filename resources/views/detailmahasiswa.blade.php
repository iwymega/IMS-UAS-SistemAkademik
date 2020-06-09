@extends('layout.app')
@section('title')
Detail Data Mahasiswa
@endsection
@section('content')
<p>
<label for="nim">NIM</label>
<input class="form-control" type="number" name="nim" value="{{$mahasiswa->nim}}" readonly>
</p>
<p>
<label for="nama_mk">Nama</label>
<input class="form-control" type="text" name="nama" value="{{$mahasiswa->nama}}" readonly>
</p>
<p>
<label for="nama_mk">Alamat</label>
<input class="form-control" type="text" name="alamat" value="{{$mahasiswa->alamat}}" readonly>
</p>
<p>
<label for="email">Email</label>
<input class="form-control" type="text" name="email" value="{{$mahasiswa->email}}" readonly>
</p>
<p>
<label for="email">Tempat Lahir</label>
<input class="form-control" type="text" name="tempat_lahir" value="{{$mahasiswa->tempat_lahir}}" readonly>
</p>
<p>
<label for="email">Tanggal Lahir</label>
<input class="form-control" type="date" name="tanggal_lahir" value="{{$mahasiswa->tanggal_lahir}}" readonly>
</p>
<p>
<label for="email">Nama Dosen PA</label>
<input class="form-control" type="text" name="nama_dosen" value="{{$dosen->nama_dosen}}" readonly>
</p>
<p>
<label for="email">Nama Prodi</label>
<input class="form-control" type="text" name="nama_prodi" value="{{$prodi->nama_prodi}}" readonly>
</p>
@endsection
