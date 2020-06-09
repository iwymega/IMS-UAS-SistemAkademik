<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateKrstudisTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('krstudis', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('id_mahasiswa')->unsigned();
            $table->foreign('id_mahasiswa')->references('id')->on('mahasiswas');
            $table->integer('id_penawaran_mk')->unsigned();
            $table->foreign('id_penawaran_mk')->references('id')->on('penawaran_mks');
            $table->string('nilai_huruf',3);

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('krstudis');
    }
}
