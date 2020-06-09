@extends('layout.app')
@section('title')
Edit Data Matakuliah
@endsection
@section('content')
<form action="/matakuliah/{{$matakuliah->id}}" method="POST">
@csrf
@method('PUT')
<p>
<label for="kode_mk">Kode Matakuliah</label> <input class="form-control" type="text" name="kode_matakuliah" value="{{$matakuliah->kode_matakuliah}}">
</p>
<p>
<label for="nama_mk">Nama Matakuliah</label>
<input class="form-control" type="text" name="nama_matakuliah" value="{{$matakuliah->nama_matakuliah}}">
</p>
<p>
<label for="email">SKS</label>
<input class="form-control" type="number" name="sks" value="{{$matakuliah->sks}}"> </p>
<p>
<label for="email">Semester</label>
<input class="form-control" type="number" name="semester" value="{{$matakuliah->semester}}"> </p>
<p>
<label for="idkelas">Kurikulum</label>
<select class="form-control" name="id_kurikulum" id="idkelas"> @foreach($all_kurikulum as $kurikulum)
<option value="{{$kurikulum->id}}" @if($matakuliah->id_kurikulum==$kurikulum->id) selected @endif>{{$kurikulum->nama_kurikulum}}</option>
@endforeach
</select>
</p>
<p>
<label for="idkelas">Dosen</label>
<select class="form-control" name="id_dosen" id="idkelas"> @foreach($all_dosen as $dosen)
<option value="{{$dosen->id}}" @if($matakuliah->id_dosen==$dosen->id) selected @endif>{{$dosen->nama_dosen}}</option>
@endforeach
</select>
</p>
<p>
<label for="idkelas">Prodi</label>
<select class="form-control" name="id_prodi" id="idkelas"> @foreach($all_prodi as $prodi)
<option value="{{$prodi->id}}" @if($matakuliah->id_prodi==$prodi->id) selected @endif>{{$prodi->nama_prodi}}</option>
@endforeach
</select>
</p>
<p>
<input class="form-control" type="submit" class="btn btn-primary" value="Simpan">
</p>
</form>
@endsection
