@extends('layout.app')
@section('title')
Detail Data Kurikulum
@endsection
@section('content')
<p>
<label for="kode_mk">Nama Kurikulum</label> <input class="form-control" type="text" name="nama_kurikulum" value="{{$kurikulum->nama_kurikulum}}" readonly>
</p>
<p>
<label for="nama_mk">Tahun</label>
<input class="form-control" type="date" name="tahun" value="{{$kurikulum->tahun}}" readonly>
</p>
<p>
<label for="email">Nama Prodi</label>
<input class="form-control" type="text" name="nama_prodi" value="{{$prodi->nama_prodi}}" readonly>
</p>
@endsection

