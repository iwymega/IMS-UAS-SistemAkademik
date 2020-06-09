@extends('layout.app')
@section('title')
Detail Data KRS
@endsection
@section('content')
<p>
<label for="kode_mk">NIM</label>
<input class="form-control" type="text" name="nim" value="{{$krstudi->nim}}" readonly>
</p>
<p>
<label for="kode_mk">Nama Mahasiswa</label>
<input class="form-control" type="text" name="nama" value="{{$krstudi->nama}}" readonly>
</p>
<p>
<label for="kode_mk">Kode Matakuliah</label> <input class="form-control" type="text" name="kode_matakuliah" value="{{$krstudi->kode_matakuliah}}" readonly>
</p>
<p>
<label for="kode_mk">Nama Matakuliah</label> <input class="form-control" type="text" name="nama_matakuliah" value="{{$krstudi->nama_matakuliah}}" readonly>
</p>
<p>
<label for="kode_mk">Nilai Huruf</label>
<input class="form-control" type="text" name="nilai_huruf" value="{{$krstudi->nilai_huruf}}" readonly>
</p>
{{-- <p>
<label for="kode_mk">Dosen Pengampu</label>
<input class="form-control" type="text" name="nama_dosen" value="{{$krstudi->nama_dosen}}">
</p> --}}
@endsection
