<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDosensTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('dosens', function (Blueprint $table) {
            $table->increments('id'); 
            $table->integer('id_prodi')->unsigned(); 
            $table->foreign('id_prodi')->references('id')->on('prodis'); 
            $table->string('nip_dosen',20); 
            $table->string('nama_dosen');
            $table->string('alamat',30);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('dosens');
    }
}
