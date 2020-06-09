@extends('layout.app')
@section('title')
Tambah Data Pengampu
@endsection
@section('content')
<form action="/pengampu" method="POST">
@csrf
<p>
<label for="id_penawaran_mk">Matakuliah_Tawar</label>
<select class="form-control" name="id_penawaran_mk" id="id_penawaran_mk"> @foreach($all_penawaran_mk as $penawaran_mk)
<option value="{{$penawaran_mk->id}}">{{$penawaran_mk->nama_matakuliah}}</option>
@endforeach
</select>
</p>
<p>
<label for="id_dosen">Dosen</label>
<select class="form-control" name="id_dosen" id="id_dosen"> @foreach($all_dosen as $dosen)
<option value="{{$dosen->id}}">{{$dosen->nama_dosen}}</option> @endforeach
</select>
</p>
<p>
<label for="kode_mk">Order</label>
<input class="form-control" type="text" name="order" value="">
</p>
<p>
<input class="form-control btn btn-primary" type="submit" value="Simpan">
</p>
</form>
@endsection
