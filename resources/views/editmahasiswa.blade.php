@extends('layout.app')
@section('title')
Edit Data Mahasiswa
@endsection
@section('content')
<form action="/mahasiswa/{{$mahasiswa->id}}" method="POST">
@csrf
@method('PUT')
<p>
<label for="nim">NIM</label>
<input class="form-control" type="number" name="nim" value="{{$mahasiswa->nim}}">
</p>
<p>
<label for="nama_mk">Nama</label>
<input class="form-control" type="text" name="nama" value="{{$mahasiswa->nama}}">
</p>
<p>
<label for="nama_mk">Alamat</label>
<input class="form-control" type="text" name="alamat" value="{{$mahasiswa->alamat}}">
</p>
<p>
<label for="email">Email</label>
<input class="form-control" type="text" name="email" value="{{$mahasiswa->email}}">
</p>
<p>
<label for="email">Tempat Lahir</label>
<input class="form-control" type="text" name="tempat_lahir" value="{{$mahasiswa->tempat_lahir}}"> </p>
<p>
<label for="email">Tanggal Lahir</label>
<input class="form-control" type="date" name="tanggal_lahir" value="{{$mahasiswa->tanggal_lahir}}"> </p>
<p>
<label for="idkelas">Dosen PA</label>
<select class="form-control" name="id_pa" id="idkelas"> @foreach($all_dosen as $dosen)
<option value="{{$dosen->id}}" @if($mahasiswa->id_pa==$dosen->id) selected @endif>{{$dosen->nama_dosen}}</option>
@endforeach
</select>
</p>
<p>
<label for="idkelas">Prodi</label>
<select class="form-control" name="id_prodi" id="idkelas"> @foreach($all_prodi as $prodi)
<option value="{{$prodi->id}}" @if($mahasiswa->id_prodi==$prodi->id) selected @endif>{{$prodi->nama_prodi}}</option>
@endforeach
</select>
</p>
<p>
<input class="form-control" type="submit" class="btn btn-primary" value="Simpan">
</p>
</form>
@endsection
