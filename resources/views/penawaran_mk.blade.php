@extends('layout.app')
@section('title')
Penawaran Mata Kuliah
@endsection
@section('content')
<input style="margin-bottom:20px;" type="button" class="btn btn-success" value="Tambah Penawaran" onclick="location.href='/penawaran_mk/create'">
<br>
@if($all_penawaran_mk->isEmpty())
Belum ada data ...
@else
<center>
<table class="table" border="1">
<tr>
<th>No</th>
<th>Matakuliah</th>
<th>Kelas</th>
<th>Semester</th>
<th>Aksi</th>
</tr>
@foreach($all_penawaran_mk as $penawaran_mk)
<tr>
<td>{{$loop->iteration}}</td>
<td>{{$penawaran_mk->nama_matakuliah}}</td>
<td>{{$penawaran_mk->kelas}}</td>
<td>{{$penawaran_mk->semester}}</td>
<td>
<span>
<input type="button" class="btn btn-primary" value="Edit" onclick="location.href='/penawaran_mk/{{$penawaran_mk->id}}/edit'">
<form style="display:inline-block;" action="/penawaran_mk/{{$penawaran_mk->id}}" method="post"> @csrf
@method('DELETE')
<button type="submit" class="btn btn-danger" value="Delete">Delete</button>
</form>
<input type="button" class="btn btn-info" value="Details" onclick="location.href='/penawaran_mk/{{$penawaran_mk->id}}'">
</span>
</td>
</tr>
@endforeach
</table>
</center>
@endif
@endsection
