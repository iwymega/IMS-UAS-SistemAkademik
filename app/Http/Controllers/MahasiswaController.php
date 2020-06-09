<?php

namespace App\Http\Controllers;

use App\mahasiswa;
use Illuminate\Http\Request;
use DB;

class MahasiswaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $all_mahasiswa = DB::table('mahasiswas')->get(); 
        return view('mahasiswa',compact('all_mahasiswa'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $all_prodi = DB::table('prodis')
        ->get(); $all_dosen = DB::table('dosens')
        ->join('prodis','prodis.id','=','dosens.id_prodi')
        ->select('dosens.*', 'prodis.id as prodi_id', 'prodis.nama_prodi')
        ->get(); 
        return view('addmahasiswa',compact('all_prodi','all_dosen'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $mahasiswa = new mahasiswa(); 
        $mahasiswa->id_prodi= $request->id_prodi; 
        $mahasiswa->nim = $request->nim; 
        $mahasiswa->nama_depan = $request->nama_depan; 
        $mahasiswa->nama_belakang = $request->nama_belakang; 
        $mahasiswa->alamat = $request->alamat; 
        $mahasiswa->email= $request->email; 
        $mahasiswa->tempat_lahir = $request->tempat_lahir; 
        $mahasiswa->tanggal_lahir = $request->tanggal_lahir;
        $mahasiswa->id_pa= $request->id_pa; 
        $mahasiswa->save(); 
        return redirect('/mahasiswa');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\mahasiswa  $mahasiswa
     * @return \Illuminate\Http\Response
     */
    public function show(mahasiswa $mahasiswa)
    {
        $dosen = DB::table('dosens')->join('mahasiswas','mahasiswas.id_pa','=','dosens.id') ->select('dosens.id as dosen_id','dosens.nama_dosen')->where('mahasiswas.id',$mahasiswa->id)->first(); 
        $prodi = DB::table('prodis')->join('mahasiswas','mahasiswas.id_prodi','=','prodis.id') ->select('prodis.id as prodi_id','prodis.nama_prodi')->where('mahasiswas.id',$mahasiswa->id)->first(); 
        return view('detailmahasiswa',compact('mahasiswa','dosen','prodi'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\mahasiswa  $mahasiswa
     * @return \Illuminate\Http\Response
     */
    public function edit(mahasiswa $mahasiswa)
    {
        $all_prodi = DB::table('prodis')->get(); 
        $all_dosen = DB::table('dosens')->get(); 
        return view('editmahasiswa',compact('mahasiswa','all_prodi','all_dosen'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\mahasiswa  $mahasiswa
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, mahasiswa $mahasiswa)
    {
        $mahasiswa->id_prodi= $request->id_prodi; 
        $mahasiswa->nim = $request->nim; 
        $mahasiswa->nama_depan = $request->nama_depan; 
        $mahasiswa->nama_belakang = $request->nama_belakang; 
        $mahasiswa->alamat = $request->alamat; 
        $mahasiswa->email= $request->email; 
        $mahasiswa->tempat_lahir = $request->tempat_lahir; 
        $mahasiswa->tanggal_lahir = $request->tanggal_lahir; 
        $mahasiswa->id_pa= $request->id_pa; 
        $mahasiswa->save(); 
        return redirect('/mahasiswa');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\mahasiswa  $mahasiswa
     * @return \Illuminate\Http\Response
     */
    public function destroy(mahasiswa $mahasiswa)
    {
        $mahasiswa->delete(); 
        return redirect('/mahasiswa');
    }
}
