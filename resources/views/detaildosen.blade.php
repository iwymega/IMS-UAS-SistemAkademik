@extends('layout.app')
@section('title')
Detail Data Dosen
@endsection
@section('content')
<p>
<label for="kode_mk">NIP</label>
<input class="form-control" type="text" name="nip_dosen" value="{{$dosen->nip_dosen}}" readonly>
</p>
<p>
<label for="nama_mk">Nama dosen</label>
<input class="form-control" type="text" name="nama_dosen" value="{{$dosen->nama_dosen}}" readonly>
</p>
<p>
<label for="email">Nama Prodi</label>
<input class="form-control" type="text" name="nama_prodi" value="{{$prodi->nama_prodi}}" readonly>
</p>
<p>
<label for="email">Alamat</label>
<input class="form-control" type="text" name="nama_prodi" value="{{$prodi->alamat}}" readonly>
</p>
@endsection
