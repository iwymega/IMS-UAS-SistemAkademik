@extends('layout.app')
@section('title')
Edit Data KRS
@endsection
@section('content')
<form action="/krstudi/{{$krstudi->id}}" method="POST">
@csrf
@method('PUT')
<p>
<label for="id_penawaran_mk">Matakuliah_Tawar</label>
<select class="form-control" name="id_penawaran_mk" id="id_penawaran_mk"> @foreach($all_penawaran_mk as $penawaran_mk)
<option value="{{$penawaran_mk->id}}" @if($krstudi->id_penawaran_mk==$penawaran_mk->id) selected @endif>{{$penawaran_mk->nama_matakuliah}}</option>
@endforeach
</select>
</p>
<p>
<label for="idkelas">Mahasiswa</label>
<select class="form-control" name="id_mahasiswa" id="idkelas"> @foreach($all_mahasiswa as $mahasiswa)
<option value="{{$mahasiswa->id}}"	@if($krstudi->id_mahasiswa==$mahasiswa->id) selected @endif>{{$mahasiswa->nama}}</option>
@endforeach
</select>
</p>
<p>
<label for="kode_mk">Nilai Huruf</label>
<input class="form-control" type="text" name="nilai_huruf" value="{{$krstudi->nilai_huruf}}">
</p>
<p>
<input class="form-control btn btn-primary" type="submit" value="Simpan">
</p>
</form>
@endsection
