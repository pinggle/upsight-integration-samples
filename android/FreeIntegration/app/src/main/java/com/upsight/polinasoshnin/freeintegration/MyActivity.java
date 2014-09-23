package com.upsight.polinasoshnin.freeintegration;

import android.app.Activity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;

import com.playhaven.android.PlayHaven;
import com.playhaven.android.PlayHavenException;
import com.playhaven.android.push.GCMRegistrationRequest;
import com.playhaven.android.req.OpenRequest;
import com.playhaven.android.view.FullScreen;


public class MyActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_my);

        //playhaven integration
        try {
//            PlayHaven.configure(this, R.string.token, R.string.secret);
            PlayHaven.configure(getApplicationContext(), token, secret, projectNumber);
            //open call
            OpenRequest open = new OpenRequest();
            open.send(this);

            //placement
            startActivity(FullScreen.createIntent(this, "app_launch"));
        } catch (PlayHavenException e) {
            e.printStackTrace();
        }

        //GCM Push registration: use following

        (new GCMRegistrationRequest()).register(context);
        (new GCMRegistrationRequest()).deregister(context);


    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.my, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();
        if (id == R.id.action_settings) {
            return true;
        }
        return super.onOptionsItemSelected(item);
    }
}
