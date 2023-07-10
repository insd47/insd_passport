package dev.insd.app.passport

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.nfc.NfcAdapter
import android.os.Bundle
import io.flutter.plugin.common.MethodChannel
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
  private val CHANNEL = "dev.insd.app.passport/nfcStatus"
  private var nfcStateReceiver: BroadcastReceiver? = null

  override fun onCreate(savedInstanceState: Bundle?) {
      super.onCreate(savedInstanceState)
      
      // Create BroadcastReceiver
      nfcStateReceiver = object : BroadcastReceiver() {
          override fun onReceive(context: Context, intent: Intent) {
              if (NfcAdapter.ACTION_ADAPTER_STATE_CHANGED == intent.action) {
                  val state = intent.getIntExtra(NfcAdapter.EXTRA_ADAPTER_STATE, NfcAdapter.STATE_OFF)
                  val channel = MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, CHANNEL)
                  when (state) {
                      NfcAdapter.STATE_OFF -> {
                          channel.invokeMethod("nfcStatus", "off")
                      }
                      NfcAdapter.STATE_ON -> {
                          channel.invokeMethod("nfcStatus", "on")
                      }
                  }
              }
          }
      }

      // Register BroadcastReceiver
      registerReceiver(nfcStateReceiver, IntentFilter(NfcAdapter.ACTION_ADAPTER_STATE_CHANGED))
  }

  override fun onDestroy() {
      super.onDestroy()

      // Unregister BroadcastReceiver
      if (nfcStateReceiver != null) {
          unregisterReceiver(nfcStateReceiver)
      }
  }
}

