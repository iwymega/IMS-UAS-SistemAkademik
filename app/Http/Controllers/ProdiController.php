<?php

namespace App\Http\Controllers;

use App\prodi; 
use Illuminate\Http\Request; 
use DB;

class ProdiController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $all_prodi = DB::table('prodis')->get(); 
        return view('prodi',compact('all_prodi'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('addprodi');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $prodi = new prodi(); 
        $prodi->nama_prodi = $request->nama_prodi; 
        $prodi->save(); 
        return redirect('/prodi');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\prodi  $prodi
     * @return \Illuminate\Http\Response
     */
    public function show(prodi $prodi)
    {
        return view('detailprodi',compact('prodi'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\prodi  $prodi
     * @return \Illuminate\Http\Response
     */
    public function edit(prodi $prodi)
    {
        return view('editprodi',compact('prodi'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\prodi  $prodi
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, prodi $prodi)
    {
        $prodi->nama_prodi = $request->nama_prodi; 
        $prodi->save(); 
        return redirect('/prodi');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\prodi  $prodi
     * @return \Illuminate\Http\Response
     */
    public function destroy(prodi $prodi)
    {
        $prodi->delete(); return redirect('/prodi');
    }
}
