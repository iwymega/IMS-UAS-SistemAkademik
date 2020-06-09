<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePengampusTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pengampus', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('id_penawaran_mk')->unsigned();
            $table->foreign('id_penawaran_mk')->references('id')->on('penawaran_mks');
            $table->integer('id_dosen')->unsigned();
            $table->foreign('id_dosen')->references('id')->on('dosens'); 
            $table->integer('order');
            
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pengampus');
    }
}
