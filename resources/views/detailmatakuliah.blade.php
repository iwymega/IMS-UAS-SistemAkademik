@extends('layout.app')
@section('title')
Detail Data Matakuliah
@endsection
@section('content')
<p>
<label for="kode_mk">Kode Matakuliah</label> <input class="form-control" type="text" name="kode_matakuliah" value="{{$matakuliah->kode_matakuliah}}" readonly>
</p>
<p>
<label for="nama_mk">Nama Matakuliah</label> <input class="form-control" type="text" name="nama_matakuliah" value="{{$matakuliah->nama_matakuliah}}" readonly>
</p>
<p>
<label for="email">SKS</label>
<input class="form-control" type="number" name="sks" value="{{$matakuliah->sks}}" readonly>
</p>
<p>
<label for="email">Semester</label>
<input class="form-control" type="number" name="semester" value="{{$matakuliah->semester}}" readonly>
</p>
<p>
<label for="email">Kurikulum</label>
<input class="form-control" type="text" name="nama_kurikulum" value="{{$kurikulum->nama_kurikulum}}" readonly>
</p>
<p>
<label for="email">Nama Dosen</label>
<input class="form-control" type="text" name="nama_dosen" value="{{$dosen->nama_dosen}}" readonly> </p>
<p>
<label for="email">Nama Prodi</label>
<input class="form-control" type="text" name="nama_prodi" value="{{$prodi->nama_prodi}}" readonly> </p>
@endsection
