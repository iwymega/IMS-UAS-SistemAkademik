@extends('layout.app')
@section('title')
Data Mahasiswa
@endsection
@section('content')
<input type="button" class="btn btn-primary" value="Tambah mahasiswa" onclick="location.href='/mahasiswa/create'"> <br>
@if($all_mahasiswa->isEmpty())
Belum ada data ...
@else
<center>
<table class="table" border="1">
<tr>
<th>No</th>
<th>NIM</th>
<th>Nama</th>
<th>Alamat</th>
<th>Email</th>
<th>Aksi</th>
</tr>
@foreach($all_mahasiswa as $mahasiswa)
<tr>
<td>{{$loop->iteration}}</td>
<td>{{$mahasiswa->nim}}</td>
<td>{{$mahasiswa->nama_depan}} {{$mahasiswa->nama_belakang}}</td>
<td>{{$mahasiswa->alamat}}</td>
<td>{{$mahasiswa->email}}</td>
<td>
<span>
    <input type="button" class="btn btn-primary" value="Edit" onclick="location.href='/mahasiswa/{{$mahasiswa->id}}/edit'">
    <form style="display:inline-block;" action="/mahasiswa/{{$mahasiswa->id}}" method="post">
        @csrf
        @method('DELETE')
        <input type="submit" class="btn btn-danger" value="Delete">
    </form>
    <input type="button" class="btn btn-primary" value="Details" onclick="location.href='/mahasiswa/{{$mahasiswa->id}}'"> 
    <input type="button" class="btn btn-primary" value="OpenMeet" onclick="location.href='http://localhost:5080/openmeetings/#user/dashboard'">
</span>
</td>
</tr>
@endforeach
</table>
</center>
@endif
@endsection
