<?php

namespace App\Http\Controllers;

use App\kurikulum; 
use Illuminate\Http\Request; 
use DB;

class KurikulumController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $all_kurikulum = DB::table('kurikulums')->get(); 
        return view('kurikulum',compact('all_kurikulum'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $all_prodi = DB::table('prodis')->get(); 
        return view('addkurikulum',compact('all_prodi'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $kurikulum = new kurikulum(); 
        $kurikulum->id_prodi = $request->id_prodi; 
        $kurikulum->nama_kurikulum = $request->nama_kurikulum; 
        $kurikulum->tahun = $request->tahun; 
        $kurikulum->save(); 
        return redirect('/kurikulum');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\kurikulum  $kurikulum
     * @return \Illuminate\Http\Response
     */
    public function show(kurikulum $kurikulum)
    {
        $prodi = DB::table('prodis')->join('kurikulums','kurikulums.id_prodi','=','prodis.id') ->select('prodis.id as prodi_id','prodis.nama_prodi')->where('kurikulums.id',$kurikulum->id)->first(); 
        return view('detailkurikulum',compact('kurikulum','prodi'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\kurikulum  $kurikulum
     * @return \Illuminate\Http\Response
     */
    public function edit(kurikulum $kurikulum)
    {
        $all_prodi = DB::table('prodis')->get(); 
        return view('editkurikulum',compact('kurikulum','all_prodi'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\kurikulum  $kurikulum
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, kurikulum $kurikulum)
    {
        $kurikulum->id_prodi = $request->id_prodi; 
        $kurikulum->nama_kurikulum = $request->nama_kurikulum; 
        $kurikulum->tahun = $request->tahun; 
        $kurikulum->save(); 
        return redirect('/kurikulum');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\kurikulum  $kurikulum
     * @return \Illuminate\Http\Response
     */
    public function destroy(kurikulum $kurikulum)
    {
        $kurikulum->delete(); 
        return redirect('/kurikulum');
    }
}
