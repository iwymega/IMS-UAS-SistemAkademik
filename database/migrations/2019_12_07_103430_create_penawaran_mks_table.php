<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePenawaranMksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('penawaran_mks', function (Blueprint $table) {
            $table->increments('id');
            $table->year('tahun_ajaran');
            $table->integer('semester');
            $table->integer('id_prodi')->unsigned();
            $table->foreign('id_prodi')->references('id')->on('prodis');
            $table->integer('id_matakuliah')->unsigned();
            $table->foreign('id_matakuliah')->references('id')->on('matakuliahs');
            $table->string('kelas',50);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('penawaran_mks');
    }
}
