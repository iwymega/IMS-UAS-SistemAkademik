@extends('layout.app')
@section('title')
Data KRS Studi
@endsection
@section('content')
<input style="margin-bottom:20px;" type="button" class="btn btn-success" value="Tambah krstudi" onclick="location.href='/krstudi/create'"> <br>
@if($all_krstudi->isEmpty())
Belum ada data ...
@else
<center>
<table class="table" border="1">
<tr>
<th>No</th>
<th>NIM</th>
<th>Nama Mahasiswa</th>
<th>Nama Matakuliah</th>
<th>Aksi</th>
</tr>
@foreach($all_krstudi as $krstudi)
<tr>
<td>{{$loop->iteration}}</td>
<td>{{$krstudi->nim}}</td>
<td>{{$krstudi->nama_belakang}}</td>
<td>{{$krstudi->nama_matakuliah}}</td>
<td>
<span>
<input type="button" class="btn btn-primary" value="Edit" onclick="location.href='/krstudi/{{$krstudi->id}}/edit'"> <form style="display:inline-block;" action="/krstudi/{{$krstudi->id}}" method="post">
@csrf
@method('DELETE')
<button type="submit" class="btn btn-danger" value="Delete">Delete</button>
</form>
<input type="button" class="btn btn-info" value="Details" onclick="location.href='/krstudi/{{$krstudi->id}}'"> </span>
</td>
</tr>
@endforeach
</table>
</center>
@endif
@endsection
