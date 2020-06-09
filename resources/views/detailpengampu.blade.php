@extends('layout.app')
@section('title')
Detail Data Pengampu
@endsection
@section('content')
<p>
<label for="id_penawaran_mk">Matakuliah</label>
<input class="form-control" type="text" name="order" value="{{$penawaran_mk->nama_matakuliah}}" readonly>
</p>
<p>
<label for="id_penawaran_mk">Kode Matakuliah</label>
<input class="form-control" type="text" name="order" value="{{$penawaran_mk->id_matakuliah}}" readonly>
</p>
<p>
<label for="id_dosen">Dosen</label>
<input class="form-control" type="text" name="order" value="{{$dosen->nama_dosen}}" readonly>
</p>
<p>
<label for="kode_mk">Tahun Ajaran</label>
<input class="form-control" type="text" name="order" value="{{$penawaran_mk->tahun_ajaran}}" readonly>
</p>
<p>
<label for="kode_mk">Order</label>
<input class="form-control" type="text" name="order" value="{{$pengampu->order}}" readonly>
</p>
@endsection
