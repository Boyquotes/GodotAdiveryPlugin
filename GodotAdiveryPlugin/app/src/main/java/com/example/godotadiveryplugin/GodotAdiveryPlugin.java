package com.example.godotadiveryplugin;

import android.util.ArraySet;

import com.adivery.sdk.*;

import androidx.annotation.NonNull;

import org.godotengine.godot.Godot;
import org.godotengine.godot.plugin.GodotPlugin;
import org.godotengine.godot.plugin.SignalInfo;

import java.util.Arrays;
import java.util.List;
import java.util.Set;

public class GodotAdiveryPlugin extends GodotPlugin {
    public GodotAdiveryPlugin(Godot godot) {
        super(godot);
    }

    @NonNull
    @Override
    public String getPluginName() {
        return "GodotAdiveryPlugin";
    }

    @NonNull
    @Override
    public Set<SignalInfo> getPluginSignals() {
        Set<SignalInfo> signals = new ArraySet<>();
        signals.add(new SignalInfo("on_rewarded_ad_loaded", String.class));
        signals.add(new SignalInfo("on_rewarded_ad_clicked", String.class));
        signals.add(new SignalInfo("on_rewarded_ad_closed", String.class, String.class));
        signals.add(new SignalInfo("on_rewarded_ad_shown", String.class));
        signals.add(new SignalInfo("on_interstitial_ad_loaded", String.class));
        signals.add(new SignalInfo("on_interstitial_ad_clicked", String.class));
        signals.add(new SignalInfo("on_interstitial_ad_closed", String.class));
        signals.add(new SignalInfo("on_interstitial_ad_shown", String.class));
        signals.add(new SignalInfo("on_app_open_ad_loaded", String.class));
        signals.add(new SignalInfo("on_app_open_ad_clicked", String.class));
        signals.add(new SignalInfo("on_app_open_ad_closed", String.class));
        signals.add(new SignalInfo("on_app_open_ad_shown", String.class));
        return signals;
    }

    @NonNull
    @Override
    public List<String> getPluginMethods() {
        return Arrays.asList(
                "configure",
                "prepare_rewarded_ad",
                "prepare_interstitial_ad",
                "prepare_app_open_ad",
                "show_ad",
                "show_app_open_ad",
                "is_loaded",
                "set_user_id"
        );
    }

    public void configure(String app_id) {
        Adivery.configure(getActivity().getApplication(), app_id);
    }

    public void prepare_rewarded_ad(String placement_id) {
        Adivery.addGlobalListener(new AdiveryListener() {
            @Override
            public void onRewardedAdLoaded(@NonNull String placementId) {
                super.onRewardedAdLoaded(placementId);
                emitSignal("on_rewarded_ad_loaded", placementId);
            }

            @Override
            public void onRewardedAdClicked(@NonNull String placementId) {
                super.onRewardedAdClicked(placementId);
                emitSignal("on_rewarded_ad_clicked", placementId);
            }

            @Override
            public void onRewardedAdClosed(@NonNull String placementId, boolean isRewarded) {
                super.onRewardedAdClosed(placementId, isRewarded);
                String r = String.valueOf(isRewarded);
                emitSignal("on_rewarded_ad_closed", placementId, r);
            }

            @Override
            public void onRewardedAdShown(@NonNull String placementId) {
                super.onRewardedAdShown(placementId);
                emitSignal("on_rewarded_ad_shown", placementId);
            }
        });
        Adivery.prepareRewardedAd(getGodot().getContext(), placement_id);
    }

    public void prepare_interstitial_ad(String placement_id) {
        Adivery.addGlobalListener(new AdiveryListener() {
            @Override
            public void onInterstitialAdLoaded(@NonNull String placementId) {
                super.onInterstitialAdLoaded(placementId);
                emitSignal("on_interstitial_ad_loaded", placementId);
            }

            @Override
            public void onInterstitialAdClicked(@NonNull String placementId) {
                super.onInterstitialAdClicked(placementId);
                emitSignal("on_interstitial_ad_clicked", placementId);
            }

            @Override
            public void onInterstitialAdClosed(@NonNull String placementId) {
                super.onInterstitialAdClosed(placementId);
                emitSignal("on_interstitial_ad_closed", placementId);
            }

            @Override
            public void onInterstitialAdShown(@NonNull String placementId) {
                super.onInterstitialAdShown(placementId);
                emitSignal("on_interstitial_ad_shown", placementId);
            }
        });
        Adivery.prepareInterstitialAd(getGodot().getContext(), placement_id);
    }

    public void prepare_app_open_ad(String placement_id) {
        Adivery.addGlobalListener(new AdiveryListener() {
            @Override
            public void onAppOpenAdLoaded(@NonNull String placementId) {
                super.onAppOpenAdLoaded(placementId);
                emitSignal("on_app_open_ad_loaded", placementId);
            }

            @Override
            public void onAppOpenAdClicked(@NonNull String placementId) {
                super.onAppOpenAdClicked(placementId);
                emitSignal("on_app_open_ad_clicked", placementId);
            }

            @Override
            public void onAppOpenAdClosed(@NonNull String placementId) {
                super.onAppOpenAdClosed(placementId);
                emitSignal("on_app_open_ad_closed", placementId);
            }

            @Override
            public void onAppOpenAdShown(@NonNull String placementId) {
                super.onAppOpenAdShown(placementId);
                emitSignal("on_app_open_ad_shown", placementId);
            }
        });
        Adivery.prepareAppOpenAd(getActivity(),placement_id);
    }

    public void show_ad(String placement_id) {
        if (Adivery.isLoaded(placement_id)) {
            Adivery.showAd(placement_id);
        }
    }

    public void show_app_open_ad(String placement_id) {
        if (Adivery.isLoaded(placement_id)) {
            Adivery.showAppOpenAd(getActivity(), placement_id);
        }
    }

    public boolean is_loaded(String placement_id) {
        return Adivery.isLoaded(placement_id);
    }

    public void set_user_id(String id) {
        Adivery.setUserId(id);
    }

}
