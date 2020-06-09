@extends('layout.app')
@section('title')
Data Dosen
@endsection
@section('content')
<input type="button" class="btn btn-
primary" value="Tambah dosen" onclick="location.href='/dosen/create'"> <br>
@if($all_dosen->isEmpty())
Belum ada data ...
@else
<center>
<table class="table" border="1" border-color="black">
<tr>
<th>No</th>
<th>NIP</th>
<th>Nama Dosen</th>
<th>Aksi</th>
</tr>
@foreach($all_dosen as $dosen)
<tr>
<td>{{$loop->iteration}}</td>
<td>{{$dosen->nip_dosen}}</td>
<td>{{$dosen->nama_dosen}}</td>
<td>{{$dosen->alamat}}</td>
<td>
<span>
<input type="button"	class="btn btn-primary" value="Edit" onclick="location.href='/dosen/{{$dosen->id}}/edit'"> <form style="display:inline-block;" action="/dosen/{{$dosen->id}}" method="post">
@csrf
@method('DELETE')
<input type="submit" class="btn btn-danger" value="Delete">
</form>
<input type="button" class="btn btn-primary" value="Details" onclick="location.href='/dosen/{{$dosen->id}}'"> </span>
</td>
</tr>
@endforeach
</table>
</center>
@endif
@endsection
