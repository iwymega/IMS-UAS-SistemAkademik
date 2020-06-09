@extends('layout.app')
@section('title')
Tambah Data Mahasiswa
@endsection
@section('content')
<form action="/mahasiswa" method="POST">
@csrf
<p>
<label for="nim">NIM</label>
<input class="form-control" type="number" name="nim" value="">
</p>
<p>
<label for="nama_mk">Nama Depan</label>
<input class="form-control" type="text" name="nama_depan" value="">
</p>
<p>
<label for="nama_mk">Nama Belakang</label>
<input class="form-control" type="text" name="nama_belakang" value="">
</p>
<p>
<label for="nama_mk">Alamat</label>
<input class="form-control" type="text" name="alamat" value="">
</p>
<p>
<label for="email">Email</label>
<input class="form-control" type="text" name="email" value="">
</p>
<p>
<label for="email">Tempat Lahir</label>
<input class="form-control" type="text" name="tempat_lahir" value="">
</p>
<p>
<label for="email">Tanggal Lahir</label>
<input class="form-control" type="date" name="tanggal_lahir" value="">
</p>	
<p>	
<label for="idkelas">Dosen PA</label>	
<select class="form-control" name="id_pa" id="idkelas">	
@foreach($all_dosen as $dosen)	
<option value="{{$dosen->id}}">{{$dosen->nama_dosen}}	[{{$dosen->nama_prodi}}]</option>	
@endforeach	
</select>	
</p>	
<p>	
<label for="idkelas">Prodi</label>
<select class="form-control" name="id_prodi" id="idkelas"> @foreach($all_prodi as $prodi)
<option value="{{$prodi->id}}">{{$prodi->nama_prodi}}</option> @endforeach
</select>
</p>
<p>
<input class="form-control" type="submit"	class="btn btn-primary"	value="Simpan">
</p>
</form>
@endsection
