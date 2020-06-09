@extends('layout.app')
@section('title')
Data Dosen Pengampu
@endsection
@section('content')
<input style="margin-bottom:20px;" type="button" class="btn btn-success" value="Tambah pengampu" onclick="location.href='/pengampu/create'"> <br>
@if($all_pengampu->isEmpty())
Belum ada data ...
@else
<center>
<table class="table" border="1">
<tr>
<th>No</th>
<th>Nama MK</th>
<th>Nama Pengampu</th>
<th>Tahun Ajaran</th>
<th>Aksi</th>
</tr>
@foreach($all_pengampu as $pengampu)
<tr>
<td>{{$loop->iteration}}</td>
<td>{{$pengampu->nama_matakuliah}}</td>
<td>{{$pengampu->nama_dosen}}</td>
<td>{{$pengampu->tahun_ajaran}}</td>
<td>
<span>
<input type="button" class="btn btn-primary" value="Edit" onclick="location.href='/pengampu/{{$pengampu->id}}/edit'"> 
<form style="display:inline-block;" action="/pengampu/{{$pengampu->id}}" method="post">
@csrf
@method('DELETE')
<button type="submit" class="btn btn-danger" value="Delete">Delete</button>
</form>
<input type="button" class="btn btn-info" value="Details" onclick="location.href='/pengampu/{{$pengampu->id}}'"> </span>
</td>
</tr>
@endforeach
</table>
</center>
@endif
@endsection
