package com.unity.mynativeapp;

import android.content.Intent;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;


import com.unity3d.player.UnityPlayerActivity;

public class MainUnityActivity extends UnityPlayerActivity {


    @Override
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);

        setContentView(R.layout.activity_unity);
        LinearLayout ll_unity_container = findViewById(R.id.ll_unity_container);
        View unity_view = mUnityPlayer.getView();
        ll_unity_container.addView(unity_view);
    }

    public void click(View view){
        callMainActivity();
    }

    @Override
    public boolean onKeyDown(int i, KeyEvent keyEvent) {
        // 添加返回键返回 MainActivity
        if(i == KeyEvent.KEYCODE_BACK){
            callMainActivity();
        }
        return super.onKeyDown(i, keyEvent);
    }

    private void callMainActivity(){
        Intent intent = new Intent(this, MainActivity.class);
        startActivity(intent);
        finish();

    }


//        @Override
//        protected void onCreate(Bundle bundle) {
//            super.onCreate(bundle);
//        }

//        @Override
//        public boolean onKeyDown(int i, KeyEvent keyEvent) {
//            // 添加返回键返回 MainActivity
//            if(i == KeyEvent.KEYCODE_BACK){
//                Intent intent = new Intent(this, MainActivity.class);
//                startActivity(intent);
//                finish();
//            }
//            return super.onKeyDown(i, keyEvent);
//        }


}
