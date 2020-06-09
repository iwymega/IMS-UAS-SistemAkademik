<?php

namespace App\Http\Controllers;

use App\Pengampu;
use Illuminate\Http\Request;
use DB;

class PengampuController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $all_pengampu = DB::table('pengampus') 
        ->join('penawaran_mks','penawaran_mks.id','=','pengampus.id_penawaran_mk') 
        ->join('dosens','dosens.id','=','pengampus.id_dosen') 
        ->join('matakuliahs','matakuliahs.id','=','penawaran_mks.id_matakuliah') 
        ->select('pengampus.*','matakuliahs.nama_matakuliah','dosens.nama_dosen', 'penawaran_mks.tahun_ajaran')->get(); 
        return view('pengampu',compact('all_pengampu'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $all_penawaran_mk = DB::table('penawaran_mks') 
        ->join('matakuliahs','matakuliahs.id','=','penawaran_mks.id_matakuliah') ->get(); 
        $all_dosen = DB::table('dosens')->get(); 
        return view('addpengampu',compact('all_penawaran_mk','all_dosen'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $pengampu = new Pengampu(); 
        $pengampu->id_penawaran_mk = $request->id_penawaran_mk; 
        $pengampu->id_dosen = $request->id_dosen; 
        $pengampu->order = $request->order; 
        $pengampu->save(); 
        return redirect('/pengampu');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Pengampu  $pengampu
     * @return \Illuminate\Http\Response
     */
    public function show(Pengampu $pengampu)
    {
        $penawaran_mk = DB::table('penawaran_mks') 
        ->join('matakuliahs','matakuliahs.id','=','penawaran_mks.id_matakuliah') 
        ->select('penawaran_mks.*','matakuliahs.nama_matakuliah','matakuliahs.kode_matakuliah') ->where('penawaran_mks.id',$pengampu->id_penawaran_mk) ->first(); 
        $dosen = DB::table('dosens')->where('dosens.id',$pengampu->id_dosen)->first(); 
        return view('detailpengampu',compact('pengampu','penawaran_mk','dosen'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Pengampu  $pengampu
     * @return \Illuminate\Http\Response
     */
    public function edit(Pengampu $pengampu)
    {
        $all_penawaran_mk = DB::table('penawaran_mks') 
        ->join('matakuliahs','matakuliahs.id','=','penawaran_mks.id_matakuliah') ->get(); 
        $all_dosen = DB::table('dosens')->get(); 
        return view('editpengampu',compact('pengampu','all_penawaran_mk','all_dosen'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Pengampu  $pengampu
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Pengampu $pengampu)
    {
        $pengampu->id_penawaran_mk = $request->id_penawaran_mk; 
        $pengampu->id_dosen = $request->id_dosen; 
        $pengampu->order = $request->order; 
        $pengampu->save();
        return redirect('/pengampu');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Pengampu  $pengampu
     * @return \Illuminate\Http\Response
     */
    public function destroy(Pengampu $pengampu)
    {
        $pengampu->delete(); 
        return redirect('/pengampu');
    }
}
