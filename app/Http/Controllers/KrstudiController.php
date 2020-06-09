<?php

namespace App\Http\Controllers;

use App\Krstudi;
use Illuminate\Http\Request;
use DB;

class KrstudiController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $all_krstudi = DB::table('krstudis') 
        ->join('penawaran_mks','penawaran_mks.id','=','krstudis.id_penawaran_mk') 
        ->join('matakuliahs','matakuliahs.id','=','penawaran_mks.id_matakuliah') 
        ->join('mahasiswas','mahasiswas.id','=','krstudis.id_mahasiswa') 
        ->select('krstudis.*','mahasiswas.nim','mahasiswas.nama_belakang','matakuliahs.nama_matakuliah') ->get();
        return view('krstudi',compact('all_krstudi'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $all_mahasiswa = DB::table('mahasiswas')->get(); 
        $all_penawaran_mk = DB::table('penawaran_mks') 
        ->join('matakuliahs','matakuliahs.id','=','penawaran_mks.id_matakuliah') 
        ->select('penawaran_mks.*','matakuliahs.nama_matakuliah') ->get(); 
        return view('addkrstudi',compact('all_mahasiswa','all_penawaran_mk'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $krstudi = new Krstudi(); 
        $krstudi->id_penawaran_mk = $request->id_penawaran_mk; 
        $krstudi->id_mahasiswa = $request->id_mahasiswa; 
        $krstudi->nilai_huruf = $request->nilai_huruf; 
        $krstudi->save(); 
        return redirect('/krstudi');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Krstudi  $krstudi
     * @return \Illuminate\Http\Response
     */
    public function show(Krstudi $krstudi)
    {
        $krstudi = DB::table('krstudis') 
        ->join('penawaran_mks','penawaran_mks.id','=','krstudis.id_penawaran_mk') 
        ->join('matakuliahs','matakuliahs.id','=','penawaran_mks.id_matakuliah')
        ->join('mahasiswas','mahasiswas.id','=','krstudis.id_mahasiswa') 
        ->select('krstudis.*','mahasiswas.nim','mahasiswas.nama_belakang','matakuliahs.nama_matakuliah','matakuliahs.kode_matakuliah') 
        ->where('krstudis.id',$krstudi->id) ->first(); 
        return view('detailkrstudi',compact('krstudi'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Krstudi  $krstudi
     * @return \Illuminate\Http\Response
     */
    public function edit(Krstudi $krstudi)
    {
        $all_mahasiswa = DB::table('mahasiswas')->get(); 
        $all_penawaran_mk = DB::table('penawaran_mks') 
        ->join('matakuliahs','matakuliahs.id','=','penawaran_mks.id_matakuliah') 
        ->select('penawaran_mks.*','matakuliahs.nama_matakuliah') ->get(); 
        return view('editkrstudi',compact('krstudi','all_mahasiswa','all_penawaran_mk'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Krstudi  $krstudi
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Krstudi $krstudi)
    {
        $krstudi->id_penawaran_mk = $request->id_penawaran_mk; 
        $krstudi->id_mahasiswa = $request->id_mahasiswa; 
        $krstudi->nilai_huruf = $request->nilai_huruf; 
        $krstudi->save(); 
        return redirect('/krstudi');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Krstudi  $krstudi
     * @return \Illuminate\Http\Response
     */
    public function destroy(Krstudi $krstudi)
    {
        $krstudi->delete(); 
        return redirect('/krstudi');
    }
}
