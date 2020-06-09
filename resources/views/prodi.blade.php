@extends('layout.app')
@section('title')
Daftar Program Studi
@endsection
@section('content')

<input type="button" class="btn btn-primary" value="Tambah prodi" onclick="location.href='/prodi/create'">
<br>
@if($all_prodi->isEmpty())
Belum ada data ...
@else
<center>
<table class="table" border="1">
    <tr>
        <th>No</th>
        <th>Nama Prodi</th>
        <th>Aksi</th>
    </tr>
    @foreach($all_prodi as $prodi)
    <tr>
        <td>{{$loop->iteration}}</td>
        <td>{{$prodi->nama_prodi}}</td>
        <td>
            <span>
            <input type="button" class="btn btn-primary" value="Edit" onclick="location.href='/prodi/{{$prodi->id}}/edit'"> 
                <form style="display:inline-block;" action="/prodi/{{$prodi->id}}" method="post"> @csrf @method('DELETE') 
                    <input type="submit" class="btn btn-danger" value="Delete">
                </form> 
            <input type="button" class="btn btn-primary" value="Details" onclick="location.href='/prodi/{{$prodi->id}}'">
            </span>
        </td>
    </tr>
    @endforeach
</table>
</center>
@endif
@endsection