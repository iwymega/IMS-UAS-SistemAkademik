@extends('layout.app')
@section('title')
Edit Data Dosen
@endsection
@section('content')
<form action="/dosen/{{$dosen->id}}" method="POST"> @csrf
@method('PUT')
<p>
<label for="kode_mk">NIP</label>
<input class="form-control" type="text" name="nip_dosen" value="{{$dosen->nip_dosen}}">
</p>
<p>
<label for="nama_mk">Nama dosen</label>
<input class="form-control" type="text" name="nama_dosen" value="{{$dosen->nama_dosen}}"> </p>
<p>
<label for="idkelas">Prodi</label>
<select class="form-control" name="id_prodi" id="idkelas"> @foreach($all_prodi as $prodi)
<option value="{{$prodi->id}}" @if($dosen->id_prodi==$prodi->id) selected @endif>{{$prodi->nama_prodi}}</option>
@endforeach
</select>
</p>
<p>
<input class="form-control" type="submit" class="btn btn-primary" value="Simpan">
</p>
</form>
@endsection
