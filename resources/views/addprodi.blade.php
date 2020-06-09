@extends('layout.app')
@section('title')
Tambah Program Studi
@endsection
@section('content')
<form action="/prodi" method="POST">
@csrf
<p>
<label for="nama_mk">Nama Program Studi</label>
<input class="form-control" type="text" name="nama_prodi" value="">
</p>
<p>
<input class="form-control" type="submit"	class="btn btn-primary"	value="Simpan">
</p>
</form>
@endsection
