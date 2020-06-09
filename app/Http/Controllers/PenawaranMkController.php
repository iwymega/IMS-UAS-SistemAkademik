<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\PenawaranMk;
use Illuminate\Http\Request;
use DB;

class PenawaranMkController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $all_penawaran_mk = DB::table('penawaran_mks')
        ->join('matakuliahs','matakuliahs.id','=','penawaran_mks.id_matakuliah') 
        ->select('penawaran_mks.*','matakuliahs.nama_matakuliah')->get(); 
        return view('penawaran_mk',compact('all_penawaran_mk'));

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $mytime = Carbon::now();
        $all_prodi = DB::table('prodis')->get();
        $all_matakuliah = DB::table('matakuliahs')->get();
        return view('addpenawaran_mk',compact('all_matakuliah','all_prodi','mytime'));

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $penawaran_mk = new PenawaranMk();
        $penawaran_mk->tahun_ajaran = $request->tahun_ajaran;
        $penawaran_mk->semester = $request->semester;
        $penawaran_mk->id_prodi = $request->id_prodi;
        $penawaran_mk->id_matakuliah = $request->id_matakuliah;
        $penawaran_mk->kelas = $request->kelas;
        $penawaran_mk->save();
        return redirect('/penawaran_mk');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\PenawaranMk  $penawaranMk
     * @return \Illuminate\Http\Response
     */
    public function show(PenawaranMk $penawaranMk)
    {
        $penawaran_mk = DB::table('penawaran_mks')
        ->join('matakuliahs','matakuliahs.id','=','penawaran_mks.id_matakuliah') 
        ->join('prodis','prodis.id','=','penawaran_mks.id_prodi') 
        ->select('penawaran_mks.*','matakuliahs.nama_matakuliah', 'matakuliahs.kode_matakuliah','prodis.nama_prodi') 
        ->where('penawaran_mks.id',$penawaranMk->id) ->first(); 
        return view('detailpenawaran_mk',compact('penawaran_mk'));

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\PenawaranMk  $penawaranMk
     * @return \Illuminate\Http\Response
     */
    public function edit(PenawaranMk $penawaranMk)
    {
        $mytime = Carbon::now();
        $all_prodi = DB::table('prodis')->get();
        $all_matakuliah = DB::table('matakuliahs')->get(); 
        $penawaran_mk = $penawaranMk;
        return view('editpenawaran_mk',compact('penawaran_mk','all_matakuliah','all_prodi','mytime'));

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\PenawaranMk  $penawaranMk
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, PenawaranMk $penawaranMk)
    {
        $penawaranMk->tahun_ajaran = $request->tahun_ajaran; 
        $penawaranMk->semester = $request->semester; 
        $penawaranMk->id_prodi = $request->id_prodi; 
        $penawaranMk->id_matakuliah = $request->id_matakuliah; 
        $penawaranMk->kelas = $request->kelas; 
        $penawaranMk->save(); 
        return redirect('/penawaran_mk');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\PenawaranMk  $penawaranMk
     * @return \Illuminate\Http\Response
     */
    public function destroy(PenawaranMk $penawaranMk)
    {
        $penawaranMk->delete(); 
        return redirect('/penawaran_mk');
    }
}
