package com.unity.mynativeapp;

import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

//    @Override
//    protected void onCreate(Bundle savedInstanceState) {
//        super.onCreate(savedInstanceState);
//        setContentView(R.layout.activity_main);
//    }

//    public void click(View view){
//        // 点击跳转到 UnityActivity
//        Intent intent = new Intent(this, MainUnityActivity.class);
//        startActivity(intent);
//
//    }

    //implement the onClick method here
//    public void onClick(View view) {
//        switch(view.getId()) {
//            case R.id.button:
//                Button btn1 =(Button) findViewById(R.id.button);
//                btn1.setOnClickListener(this);
//                break;
//            case R.id.button2:
//                break;
//            case R.id.button3:
//                break;
//            default:
//        }
//    }

    public Button ViewTest1=null;
    public Button cue1=null;
    public Button help1=null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
// TODO Auto-generated method stub
        super.onCreate(savedInstanceState);
        setContentView(R.layout.content_main);
        ViewTest1 = (Button)findViewById(R.id.button);
        cue1 = (Button)findViewById(R.id.button2);
        help1 = (Button)findViewById(R.id.button3);

        ViewTest1.setOnClickListener(new ButtonListener());
        cue1.setOnClickListener(new ButtonListener1());
        help1.setOnClickListener(new ButtonListener2());

    }

    class ButtonListener implements View.OnClickListener {
        public void onClick(View v){
            Intent intent = new Intent();
            intent.setClass(MainActivity.this,MainUnityActivity.class);
            MainActivity.this.startActivity(intent);

        }
    }
    class ButtonListener1 implements View.OnClickListener {
        public void onClick(View v){
            Intent intent = new Intent();
            intent.setClass(MainActivity.this,MaterialActivity.class);
            MainActivity.this.startActivity(intent);

        }
    }
    class ButtonListener2 implements View.OnClickListener {
        public void onClick(View v) {
            Intent intent = new Intent();
            intent.setClass(MainActivity.this, BuildingActivity.class);
            MainActivity.this.startActivity(intent);
        }

    }


}
