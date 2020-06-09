<?php

namespace App\Http\Controllers;

use App\matakuliah;
use Illuminate\Http\Request; 
use DB;

class MatakuliahController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $all_matakuliah = DB::table('matakuliahs')->get(); 
        return view('matakuliah',compact('all_matakuliah'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $all_prodi = DB::table('prodis')->get(); 
        $all_kurikulum = DB::table('kurikulums')->get(); 
        $all_dosen = DB::table('dosens')->get(); 
        return view('addmatakuliah',compact('all_prodi','all_kurikulum','all_dosen'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $matakuliah = new matakuliah(); 
        $matakuliah->kode_matakuliah = $request->kode_matakuliah; 
        $matakuliah->nama_matakuliah = $request->nama_matakuliah; 
        $matakuliah->sks = $request->sks; 
        $matakuliah->semester = $request->semester;
        $matakuliah->id_kurikulum = $request->id_kurikulum; 
        $matakuliah->id_dosen = $request->id_dosen; 
        $matakuliah->id_prodi = $request->id_prodi; 
        $matakuliah->save(); 
        return redirect('/matakuliah');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\matakuliah  $matakuliah
     * @return \Illuminate\Http\Response
     */
    public function show(matakuliah $matakuliah)
    {
        $kurikulum = DB::table('kurikulums')->join('matakuliahs','kurikulums.id','=','matakuliahs.id_kurikulum') ->select('kurikulums.id as kurikulum_id','kurikulums.nama_kurikulum')->where('matakuliahs.id',$matakuliah->id)->first(); $dosen = DB::table('dosens')->join('matakuliahs','dosens.id','=','matakuliahs.id_dosen') ->select('dosens.id as dosen_id','dosens.nama_dosen')->where('matakuliahs.id',$matakuliah->id)->first(); $prodi = DB::table('prodis')->join('matakuliahs','prodis.id','=','matakuliahs.id_prodi') ->select('prodis.id as prodi_id','prodis.nama_prodi')->where('matakuliahs.id',$matakuliah->id)->first(); 
        return view('detailmatakuliah',compact('matakuliah','kurikulum','dosen','prodi'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\matakuliah  $matakuliah
     * @return \Illuminate\Http\Response
     */
    public function edit(matakuliah $matakuliah)
    {
        $all_prodi = DB::table('prodis')->get(); $all_kurikulum = DB::table('kurikulums')->get(); $all_dosen = DB::table('dosens')->get(); 
        return view('editmatakuliah',compact('matakuliah','all_prodi','all_kurikulum','all_dosen'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\matakuliah  $matakuliah
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, matakuliah $matakuliah)
    {
        $matakuliah->kode_matakuliah = $request->kode_matakuliah; 
        $matakuliah->nama_matakuliah = $request->nama_matakuliah; 
        $matakuliah->sks = $request->sks; 
        $matakuliah->semester = $request->semester; 
        $matakuliah->id_kurikulum = $request->id_kurikulum; 
        $matakuliah->id_dosen = $request->id_dosen; 
        $matakuliah->id_prodi = $request->id_prodi; 
        $matakuliah->save(); 
        return redirect('/matakuliah');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\matakuliah  $matakuliah
     * @return \Illuminate\Http\Response
     */
    public function destroy(matakuliah $matakuliah)
    {
        $matakuliah->delete(); 
        return redirect('/matakuliah');
    }
}
