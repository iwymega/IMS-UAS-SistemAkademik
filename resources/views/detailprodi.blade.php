@extends('layout.app')
@section('title')
Detail Data Prodi
@endsection
@section('content')
<p>
<label for="nama_mk">Nama prodi</label>
<input class="form-control" type="text" name="nama_prodi" value="{{$prodi->nama_prodi}}" readonly>
</p>
@endsection
