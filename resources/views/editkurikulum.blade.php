@extends('layout.app')
@section('title')
Edit Data Kurikulum
@endsection
@section('content')
<form action="/kurikulum/{{$kurikulum->id}}" method="POST">
@csrf
@method('PUT')
<p>
<label for="kode_mk">Nama Kurikulum</label>
<input class="form-control" type="text" name="nama_kurikulum" value="{{$kurikulum->nama_kurikulum}}">
</p>
<p>
<label for="nama_mk">Tahun</label>
<input class="form-control" type="date" name="tahun" value="{{$kurikulum->tahun}}">
</p>
<p>
<label for="idkelas">Prodi</label>
<select class="form-control" name="id_prodi" id="idkelas"> @foreach($all_prodi as $prodi)
<option value="{{$prodi->id}}" @if($kurikulum->id_prodi==$prodi->id) selected @endif>{{$prodi->nama_prodi}}</option>
@endforeach
</select>
</p>
<p>
<input class="form-control" type="submit" class="btn btn-primary" value="Simpan">
</p>
</form>
@endsection
