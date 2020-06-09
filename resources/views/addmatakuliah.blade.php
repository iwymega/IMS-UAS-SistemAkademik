@extends('layout.app')
@section('title')
Tambah Data Matakuliah
@endsection
@section('content')
<form action="/matakuliah" method="POST">
@csrf
<p>
<label for="kode_mk">Kode Matakuliah</label>
<input class="form-control" type="text" name="kode_matakuliah" value="">
</p>
<p>
<label for="nama_mk">Nama Matakuliah</label>
<input class="form-control" type="text" name="nama_matakuliah" value="">
</p>
<p>
<label for="email">SKS</label>
<input class="form-control" type="number" name="sks" value="">
</p>
<p>
<label for="email">Semester</label>
<input class="form-control" type="number" name="semester" value="">
</p>
<p>
<label for="idkelas">Kurikulum</label>
<select class="form-control" name="id_kurikulum" id="idkelas"> @foreach($all_kurikulum as $kurikulum)
<option value="{{$kurikulum->id}}">{{$kurikulum->nama_kurikulum}}</option>
@endforeach
</select>
</p>
<p>
<label for="idkelas">Dosen</label>
<select class="form-control" name="id_dosen" id="idkelas"> @foreach($all_dosen as $dosen)
<option value="{{$dosen->id}}">{{$dosen->nama_dosen}}</option>
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
<input class="form-control" type="submit" class="btn btn-primary" value="Simpan">
</p>
</form>
@endsection
