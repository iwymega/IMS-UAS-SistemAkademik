<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMatakuliahsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('matakuliahs', function (Blueprint $table) {
            $table->increments('id'); 
            $table->string('kode_matakuliah'); 
            $table->string('nama_matakuliah'); 
            $table->integer('sks'); 
            $table->integer('semester'); 
            $table->integer('id_kurikulum')->unsigned(); 
            $table->foreign('id_kurikulum')->references('id')->on('kurikulums'); 
            $table->integer('id_dosen')->unsigned(); 
            $table->foreign('id_dosen')->references('id')->on('dosens'); 
            $table->integer('id_prodi')->unsigned(); 
            $table->foreign('id_prodi')->references('id')->on('prodis');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('matakuliahs');
    }
}
