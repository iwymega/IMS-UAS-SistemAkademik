@extends('layout.app')
@section('title')
Tambah Daftar Penawaran Matakuliah
@endsection
@section('content')
<form action="/penawaran_mk" method="POST">
@csrf
<p>
<label for="tahun_ajaran">Tahun Ajaran</label>
<input class="form-control" type="number" max={{$mytime->year}} name="tahun_ajaran" value="">
</p>
<p>
<label for="email">Semester</label>
<input class="form-control" type="number" name="semester" max=12 value=""> </p>
<p>
<label for="idkelas">Prodi</label>
<select class="form-control" name="id_prodi" id="idkelas"> 
@foreach($all_prodi as $prodi)
<option value="{{$prodi->id}}">{{$prodi->nama_prodi}}</option> 
@endforeach
</select>
</p>
<p>
<label for="idkelas">Matakuliah</label>
<select class="form-control" name="id_matakuliah" id="idkelas"> @foreach($all_matakuliah as $matakuliah)
<option value="{{$matakuliah->id}}">{{$matakuliah->nama_matakuliah}}</option>
@endforeach
</select>
</p>
<p>
<label for="kelas">Kelas</label>
<input class="form-control" type="text" size="50" name="kelas" value="">
</p>
<p>
<input class="form-control btn btn-primary" type="submit" value="Simpan">
</p>
</form>
@endsection
