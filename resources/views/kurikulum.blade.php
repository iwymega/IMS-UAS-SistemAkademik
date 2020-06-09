@extends('layout.app')
@section('title')
Data Kurikulum
@endsection
@section('content')
<input type="button" class="btn btn-primary" value="Tambah kurikulum" onclick="location.href='/kurikulum/create'"> <br>
@if($all_kurikulum->isEmpty())
Belum ada data ...
@else
<center>
<table class="table" border="1">
<tr>
<th>No</th>
<th>Nama Kurikulum</th>
<th>Tahun</th>
<th>Aksi</th>
</tr>
@foreach($all_kurikulum as $kurikulum)
<tr>
<td>{{$loop->iteration}}</td>
<td>{{$kurikulum->nama_kurikulum}}</td>
<td>{{$kurikulum->tahun}}</td>
<td>
<span>
<input type="button" class="btn btn-primary" value="Edit" onclick="location.href='/kurikulum/{{$kurikulum->id}}/edit'">
<form style="display:inline-block;" action="/kurikulum/{{$kurikulum->id}}" method="post">
@csrf
@method('DELETE')
<input type="submit" class="btn btn-danger" value="Delete">
</form>
<input type="button" class="btn btn-primary" value="Details" onclick="location.href='/kurikulum/{{$kurikulum->id}}'"> </span>
</td>
</tr>
@endforeach
</table>
</center>
@endif
@endsection
