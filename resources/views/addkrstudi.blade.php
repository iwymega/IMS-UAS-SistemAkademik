@extends('layout.app')
@section('title')
Tambah Data KRS
@endsection
@section('content')
<form action="/krstudi" method="POST">
@csrf
<p>
<label for="id_penawaran_mk">Matakuliah_Tawar</label>
<select class="form-control" name="id_penawaran_mk" id="id_penawaran_mk"> @foreach($all_penawaran_mk as $penawaran_mk)
<option value="{{$penawaran_mk->id}}">{{$penawaran_mk->nama_matakuliah}}</option>
@endforeach
</select>
</p>
<p>
<label for="idkelas">Mahasiswa</label>
<select class="form-control" name="id_mahasiswa" id="idkelas"> @foreach($all_mahasiswa as $mahasiswa)
<option value="{{$mahasiswa->id}}">{{$mahasiswa->nama_depan}} {{$mahasiswa->nama_belakang}}</option> @endforeach
</select>
</p>
<p>
<label for="kode_mk">Nilai Huruf</label>
<input class="form-control" type="text" name="nilai_huruf" value="0">
</p>
<p>
<input class="form-control btn btn-primary" type="submit" value="Simpan">
</p>
</form>
@endsection
