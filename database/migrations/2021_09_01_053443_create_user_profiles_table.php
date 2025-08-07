<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUserProfilesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('user_profiles', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id')->nullable();
            $table->longText('description')->nullable();
            $table->date('dob')->nullable();
            $table->string('gender')->nullable();
            $table->unsignedBigInteger('country_id')->nullable();
            $table->unsignedBigInteger('state_id')->nullable();
            $table->unsignedBigInteger('city_id')->nullable();
            $table->string('contact_number')->nullable();
            $table->longText('designation')->nullable();
            $table->longText('linkdin_url')->nullable();
            $table->longText('twitter_url')->nullable();
            $table->longText('stackoverflow_url')->nullable();
            $table->longText('facebook_url')->nullable();
            $table->longText('dribbble_url')->nullable();
            $table->longText('pinterest_url')->nullable();
            $table->longText('github_url')->nullable();
            $table->longText('uplabs_url')->nullable();
            $table->longText('instagram_url')->nullable();
            $table->string('language_code')->nullable()->default('en');
            $table->tinyInteger('is_darkmode')->nullable()->default('0');
            $table->unsignedBigInteger('no_of_project')->nullable()->default(3);
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('user_profiles');
    }
}
