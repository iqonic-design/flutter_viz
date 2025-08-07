<?php

use Illuminate\Database\Seeder;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \DB::table('users')->delete();
        
        \DB::table('users')->insert(array (
            0 => 
            array (
                'id' => 1,
                'name' => 'admin',
                'email' => 'admin@admin.com',
                'user_type' => 'admin',
                'email_verified_at' => NULL,
                'password' => bcrypt('goldenmace123'),
                'remember_token' => NULL,
                'created_at' => '2021-07-17 09:50:00',
                'updated_at' => '2021-07-18 11:00:00',
            ),
        ));
    }
}