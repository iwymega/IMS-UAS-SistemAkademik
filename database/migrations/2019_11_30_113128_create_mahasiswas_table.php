<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMahasiswasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('mahasiswas', function (Blueprint $table) {
            $table->increments('id'); 
            $table->integer('id_prodi')->unsigned(); 
            $table->foreign('id_prodi')->references('id')->on('prodis'); 
            $table->string('nim',30); 
            $table->string('nama_depan',50);
            $table->string('nama_belakang',50);
            $table->string('alamat',100); 
            $table->string('email',50);
            $table->string('tempat_lahir',100); 
            $table->date('tanggal_lahir'); 
            $table->integer('id_pa')->unsigned(); 
            $table->foreign('id_pa')->references('id')->on('dosens');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('mahasiswas');
    }
}
