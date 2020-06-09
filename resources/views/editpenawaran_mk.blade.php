@extends('layout.app')
@section('title')
Edit Data Penawaran Matakuliah
@endsection
@section('content')
<form action="/penawaran_mk/{{$penawaran_mk->id}}" method="POST">
@csrf
@method('PUT')
<p>
<label for="tahun_ajaran">Tahun Ajaran</label>
<input class="form-control" type="number" max={{$mytime->year}} name="tahun_ajaran" value="{{$penawaran_mk->tahun_ajaran}}">
</p>
<p>
<label for="email">Semester</label>
<input class="form-control" type="number" name="semester" max=12 value="{{$penawaran_mk->semester}}">
</p>
<p>
<label for="idkelas">Prodi</label>
<select class="form-control" name="id_prodi" id="idkelas"> @foreach($all_prodi as $prodi)
<option value="{{$prodi->id}}" @if($penawaran_mk->id_prodi==$prodi->id) selected @endif>{{$prodi->nama_prodi}}</option>
@endforeach
</select>
</p>
<p>
<label for="idkelas">Matakuliah</label>
<select class="form-control" name="id_matakuliah" id="id_matakuliah">
 @foreach($all_matakuliah as $matakuliah)
<option value="{{$matakuliah->id}}" @if($penawaran_mk->id_matakuliah==$matakuliah->id) selected @endif>{{$matakuliah->nama_matakuliah}}</option>
@endforeach
</select>
</p>
<p>
<label for="kelas">Kelas</label>
<input class="form-control" type="text" size="50" name="kelas" value="{{$penawaran_mk->kelas}}">
</p>
<p>
<input class="form-control btn btn-primary" type="submit" value="Simpan">
</p>
</form>
@endsection
