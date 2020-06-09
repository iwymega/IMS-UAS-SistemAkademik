@extends('layout.app')
@section('title')
Daftar Matakuliah
@endsection
@section('content')
<input type="button" class="btn btn-primary" value="Tambah matakuliah" onclick="location.href='/matakuliah/create'"> <br>
@if($all_matakuliah->isEmpty())
Belum ada data ...
@else
<center>
<table class="table" border="1">
<tr>
<th>No</th>
<th>Kode matakuliah</th>
<th>Nama matakuliah</th>
<th>SKS</th>
<th>Aksi</th>
</tr>
@foreach($all_matakuliah as $matakuliah)
<tr>
<td>{{$loop->iteration}}</td>
<td>{{$matakuliah->kode_matakuliah}}</td> <td>{{$matakuliah->nama_matakuliah}}</td> <td>{{$matakuliah->sks}}</td> <td>
<span>
<input type="button" class="btn btn-primary" value="Edit" onclick="location.href='/matakuliah/{{$matakuliah->id}}/edit'">
<form style="display:inline-block;" action="/matakuliah/{{$matakuliah->id}}" method="post">
@csrf
@method('DELETE')
<input type="submit" class="btn btn-danger" value="Delete">
</form>
<input type="button" class="btn btn-primary" value="Details" onclick="location.href='/matakuliah/{{$matakuliah->id}}'">
</span>
</td>
</tr>
@endforeach
</table>
</center>
@endif
@endsection
