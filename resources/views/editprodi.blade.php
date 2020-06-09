@extends('layout.app')
@section('title')
Edit Data Prodi
@endsection
@section('content')
<form action="/prodi/{{$prodi->id}}" method="POST">
@csrf
@method('PUT')
<p>
<label for="nama_mk">Nama prodi</label>
<input class="form-control" type="text" name="nama_prodi" value="{{$prodi->nama_prodi}}">
</p>
<p>
<input class="form-control" type="submit"	class="btn btn-primary"	value="Simpan">
</p>
</form>
@endsection
