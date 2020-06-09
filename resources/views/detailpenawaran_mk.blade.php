@extends('layout.app')
@section('title')
Detail Penawaran Matakuliah
@endsection
@section('content')
<p>
<label for="tahun_ajaran">Tahun Ajaran</label> <input class="form-control" type="number" name="tahun_ajaran" value="{{$penawaran_mk->tahun_ajaran}}" readonly>
</p>
<p>
<label for="email">Semester</label>
<input class="form-control" type="number" name="semester" max=12 value="{{$penawaran_mk->semester}}" readonly>
</p>
<p>
<label for="idkelas">Prodi</label>
<input class="form-control" type="text" size="50" name="kelas" value="{{$penawaran_mk->nama_prodi}}" readonly>
</p>
<p>
<label for="idkelas">Matakuliah</label>
<input class="form-control" type="text" size="50" name="kelas" value="{{$penawaran_mk->nama_matakuliah}}" readonly>
</p>
<p>
<label for="idkelas">Kode Matakuliah</label> <input class="form-control" type="text" size="50" name="kelas" value="{{$penawaran_mk->kode_matakuliah}}" readonly>
</p>
<p>
<label for="kelas">Kelas</label>
<input class="form-control" type="text" size="50" name="kelas" value="{{$penawaran_mk->kelas}}" readonly>
</p>
@endsection
