@extends('layout.app')
@section('title')
Tambah Data Dosen
@endsection
@section('content')
<form action	="/dosen" method="POST">
@csrf
	<p>
		<label for		="kode_mk">NIP</label>
		<input class	="form-control" type="text" name="nip_dosen" value="">
	</p>
	<p>
		<label for		="nama_mk">Nama dosen</label>
		<input class	="form-control" type="text" name="nama_dosen" value="">
	</p>
	<p>
		<label for		="nama_mk">Alamat dosen</label>
		<input class	="form-control" type="text" name="alamat" value="">
	</p>
	<p>
		<label for		="idkelas">Prodi</label>
		<select class	="form-control" name="id_prodi" id="idkelas"> @foreach($all_prodi as $prodi)
		<option value	="{{$prodi->id}}">{{$prodi->nama_prodi}}</option> @endforeach
		</select>
	</p>
<p>
	<input class	="form-control" type="submit" class="btn btn-primary" value="Simpan">
</p>
</form>
@endsection
