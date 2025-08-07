<?php

function getSingleMedia($model, $collection = 'profile_image')
{
    if($model==null){
        return asset('images/default.png');
    }

    if ($model !== null) {
        $media = $model->getFirstMedia($collection);
    }

    if (getFileExistsCheck($media)) {
        return $media->getFullUrl();
    }else{

        switch ($collection) {
            case 'feedback_image':
                $media = asset('images/default.png');
                break;
            case 'profile_image':
                $media = asset('images/default.png');
                break;
            default:
                $media = asset('images/default.png');
                break;
        }
        return $media;
    }
}

function getFileExistsCheck($media)
{
    $mediaCondition = false;

    if($media) {
        if($media->disk == 'public') {
            $mediaCondition = file_exists($media->getPath());
        } else {
            $mediaCondition = \Storage::disk($media->disk)->exists($media->getPath());
        }
    }

    return $mediaCondition;
}


function storeMediaFile($model,$file,$name)
{
    if($file) {
        $model->clearMediaCollection($name);
        if (is_array($file)){
            foreach ($file as $key => $value){
                $model->addMedia($value)->toMediaCollection($name);
            }
        }else{
            $model->addMedia($file)->toMediaCollection($name);
        }
    }

    return true;
}

function getAttachments($attchments)
{
    $files = [];
    if (count($attchments) > 0) {
        foreach ($attchments as $attchment) {
            if (getFileExistsCheck($attchment)) {
                array_push($files, $attchment->getFullUrl());
            }
        }
    }

    return $files;
}

function getMediaFileExit($model, $collection = 'profile_image')
{
    if($model==null){
        return asset('images/default.png');
    }

    $media = $model->getFirstMedia($collection);

    return getFileExistsCheck($media);
}

function createFolderZip($user_id,$project_name)
{
    $project_path = $user_id.'/'.$project_name ;
    $project_zip_file = storage_path('app/public/'.$user_id.'/'.$project_name.'.zip');
    $zip = new \ZipArchive();
    $zip->open($project_zip_file, \ZipArchive::CREATE | \ZipArchive::OVERWRITE);
    $storage_path = storage_path('app/public/'.$project_path);

    $files = new \RecursiveIteratorIterator(new \RecursiveDirectoryIterator($storage_path));

    foreach ($files as $name => $file)
    {
        // We're skipping all subfolders
        if (!$file->isDir()) {
            $filePath = $file->getRealPath();
            // extracting filename with substr/strlen
            $relativePath = substr($filePath, strlen($storage_path) + 1);
            $zip->addFile($filePath, $relativePath);
        }
    }
    $zip->close();
    return;
}
function deleteDirectory($dir) {
    if (!file_exists($dir)) {
        return true;
    }

    if (!is_dir($dir)) {
        return unlink($dir);
    }

    foreach (scandir($dir) as $item) {
        if ($item == '.' || $item == '..') {
            continue;
        }

        if (!deleteDirectory($dir . DIRECTORY_SEPARATOR . $item)) {
            return false;
        }

    }

    return rmdir($dir);
}
