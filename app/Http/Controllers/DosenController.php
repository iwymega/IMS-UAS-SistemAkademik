<?php

namespace App\Http\Controllers;

use App\dosen; 
use Illuminate\Http\Request; 
use DB;

class DosenController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $all_dosen = DB::table('dosens')->get(); 
        return view('dosen',compact('all_dosen'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $all_prodi = DB::table('prodis')->get(); 
        return view('adddosen',compact('all_prodi'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $dosen = new dosen(); 
        $dosen->id_prodi = $request->id_prodi; 
        $dosen->nip_dosen = $request->nip_dosen; 
        $dosen->nama_dosen = $request->nama_dosen; 
        $dosen->alamat = $request->alamat; 
        $dosen->save(); 
        return redirect('/dosen');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\dosen  $dosen
     * @return \Illuminate\Http\Response
     */
    public function show(dosen $dosen)
    {
        $prodi = DB::table('prodis')->join('dosens','dosens.id_prodi','=','prodis.id') ->select('prodis.id as prodi_id','prodis.nama_prodi')->where('dosens.id',$dosen->id)->first(); 
        return view('detaildosen',compact('dosen','prodi'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\dosen  $dosen
     * @return \Illuminate\Http\Response
     */
    public function edit(dosen $dosen)
    {
        $all_prodi = DB::table('prodis')->get(); 
        return view('editdosen',compact('dosen','all_prodi'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\dosen  $dosen
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, dosen $dosen)
    {
        $dosen->id_prodi = $request->id_prodi; 
        $dosen->nip_dosen = $request->nip_dosen; 
        $dosen->nama_dosen = $request->nama_dosen; 
        $dosen->save(); 
        return redirect('/dosen');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\dosen  $dosen
     * @return \Illuminate\Http\Response
     */
    public function destroy(dosen $dosen)
    {
        $dosen->delete(); 
        return redirect('/dosen');
    }
}
