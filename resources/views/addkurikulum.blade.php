@extends('layout.app')
@section('title')
Tambah Data Kurikulum
@endsection
@section('content')
<form action="/kurikulum" method="POST">
@csrf
<p>
<label for="kode_mk">Nama Kurikulum</label>
<input class="form-control" type="text" name="nama_kurikulum" value="">
</p>
<p>
<label for="nama_mk">Tahun</label>
<input class="form-control" type="date" name="tahun" value="">
</p>
<p>
<label for="idkelas">Prodi</label>
<select class="form-control" name="id_prodi" id="idkelas"> 
@foreach($all_prodi as $prodi)
<option value="{{$prodi->id}}">{{$prodi->nama_prodi}}</option> 
@endforeach
</select>
</p>
<p>
<input class="form-control" type="submit" class="btn btn-primary" value="Simpan">
</p>
</form>
@endsection
