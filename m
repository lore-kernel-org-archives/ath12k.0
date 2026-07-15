Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A16FC44508
	for <ath12k@archiver.kernel.org>; Wed, 15 Jul 2026 06:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wMdRzItSC5FsbcQti/ZgrTQLV3qM2lI+vSFATQHLH68=; b=scO0xYjBdmtEL2YuZdd4FjkkYO
	aN5ULWKoP6AzuGJCCg5RznGjrm00TfiCbGBoyLW0FexfpzYfwwqzHOyBR+/82pv6k4bD3RUNYetmD
	ulFLh4iMV8o3bXOyLr4moQ1UbdLNIVTx6cwxCCbyA67kW1Y3FWopiMYd1BQR0cmy3mXO5hLjLiCNN
	eSElXL+REO3woPXr7l5DL6pgq0E1xsYi7Ktuu1w3YkB0dycFpzRhPz/+Q/gLRQfQbKIWToPUDe6b+
	coBdBM4jjO+8pirAsdrCCzAlRyCrkqLTSbNmm/WLqeTMO8yq8x0BHCzHNbyf0rcZlD4rwLyWUIh/Q
	QJZowe2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjtUL-0000000Dwud-0B4p;
	Wed, 15 Jul 2026 06:53:01 +0000
Received: from mail-pj2-x07.google.com ([2607:f8b0:4864:39::7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjtUI-0000000Dwu9-41N7
	for ath12k@lists.infradead.org;
	Wed, 15 Jul 2026 06:53:00 +0000
Received: by mail-pj2-x07.google.com with SMTP id 98e67ed59e1d1-38dcd98e5easo2091247a91.0
        for <ath12k@lists.infradead.org>; Tue, 14 Jul 2026 23:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784098378; x=1784703178; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wMdRzItSC5FsbcQti/ZgrTQLV3qM2lI+vSFATQHLH68=;
        b=h0iILad5jiRjTJ9O4Zfic4RPqXRUb/8WjisOoAq6CYR8k0sNJTPhnGiUd2X7mHWphn
         +J843jigRLBRHR2FgxnsASPJvlXRWyzxxzbE9PvSB/fV6vf/QrI56BpHiAE4HxjDPx1u
         vc2uzfovMiZ/b+eGZDGJIRDEXmLmZ3QVxQbwmrLOPM3nXJW4APa8zJSSuzYOUHcDk4uS
         oZDtx5d1GhEpL98J3vVslmMvVjwcwu308wCYRg8r/qekDgRzTWRTgerlrSQqqDycIdOH
         mEVSLjgwDB4BwKr3/zxjIbJsZ+MfRBCWVFh9B3eUO6iLxz4deXvP8dUbCi7d+mGEv7aV
         MxNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784098378; x=1784703178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wMdRzItSC5FsbcQti/ZgrTQLV3qM2lI+vSFATQHLH68=;
        b=s2bVeE4bDhvnR0OlQ9EFcBbo7vj9pUyMKMSgNLpYMycCE7c+38tqT0e+U9r+T+ax/R
         IKIGjqy2hSbh4bEXklJkKyLt0rAl04qHFfgy+LrWZeDVtcDN+/+5uvcDPJhpLvWun6a6
         vIfxKK394JCwngqWfyX1ecSvMv9DKEq/4r4JuAAsrMaQYhrbGReHgtlP7ctoELLnxIiW
         o+2svjBGcUxeaNSULYtkLudGJKCNji8YWDv59ADQDY5+N4X6PbP6EGDz4niCBYFyu6PR
         gnR0ZPWCq1AHSYxMHKL42YjLxu478LEgbxr3hbqzckrHdOk2QdMRqmcm2Z3iQlEKnSgU
         uBIw==
X-Forwarded-Encrypted: i=1; AHgh+Rqn8K9I8981Ks3uG691zk39HPkt5MHE4m+VJfXo21bZ9FepZXaQViqR0zde00Usjl+Y/um5nLQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzG2syA4uhVp/QeCfHIseNPEAvMzq8cT78Mc4wkmJLfUOMw6kpy
	lIWBe9t5YiptnqB4MwYzD/84m835/Usvh9MvEkQHF2WqbkMPFCVcSpwPNcEur1b/eG4=
X-Gm-Gg: AfdE7ckQZwc23qqUs5fy9RI3glmVcPzwzQsyoz978cho0WFqq587VQcRiTeJJOe24GC
	ZZfc1XkQ0gGBC3j3yY47dEKCeeAoXRk6oyuHj7hxjkEuzuENlZOcdvrBxUnLi6cHjDIT0oDHDm0
	+PZd8eM5wbBFPY5GdzwIG7AxfHXjFP2MpuwcEnM1Oyk8ijMg0auMItgTheQJ6h53BdJD0eXyqQa
	6jwwLOu9q5YsSHIW895mWsYCEx4L92pYJRG/n22HpiJmLyrwzPSmlAbOy8VCH50/A5hvw5Y8GBg
	czZE7VOAQk/zXleUpMnba/2xYEW1ExgdEZLpL8tx9Ba1id5cxTMT5hvE4gfDcQw5OOXWyFvxRNW
	MWF3kpho8NUHan4jcQxqxUWnyJZU9E8VUJusxmgWPO8QeunhckPL4GFvZItiyNgVwtzIv55X2NS
	EDU1fy8OwZRjZyjtkxmw==
X-Received: by 2002:a05:6a20:7344:b0:3c0:9c19:65a5 with SMTP id adf61e73a8af0-3c36c443a82mr1875421637.61.1784098377572;
        Tue, 14 Jul 2026 23:52:57 -0700 (PDT)
Received: from archlinux-desktop ([69.63.205.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b4cbafa1sm88090786eec.6.2026.07.14.23.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 23:52:57 -0700 (PDT)
From: Shenghan Gao <gsh20040816@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-current] wifi: ath12k: fix frequency range for single-pdev devices
Date: Wed, 15 Jul 2026 14:52:17 +0800
Message-ID: <20260715065218.41232-1-gsh20040816@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_235259_001121_39EBCECF 
X-CRM114-Status: GOOD (  11.72  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Commit 0d777aa2ca77 ("wifi: ath12k: fix mac pdev frequency range update")
made ath12k_regd_update() handle each supported band independently.
However, it uses WMI band capability values as indices into
pdev->cap.band[]. Those values are bit flags, while cap.band[] is indexed
by enum nl80211_band. As a result, the 2.4 GHz lookup reads the
5 GHz entry, while the 5 GHz lookup reads the 60 GHz entry.

Also, the 5 GHz range is skipped whenever the radio supports 6 GHz. This
is valid when 5 and 6 GHz belong to separate pdevs, but not for single-pdev
devices such as WCN7850, where the same pdev covers both bands. After a
regulatory update, 5 GHz is therefore omitted from ar->freq_range and later
filtered out of the channel list sent to firmware.

On the tested WCN7850, the 11d regulatory update left the frequency range
at 2402-2482 MHz and sent 13 channels to firmware. A subsequent 5 GHz scan
failed with WMI_SCAN_REASON_INTERNAL_FAILURE. With both ranges combined,
the range is 2402-5835 MHz and 26 channels are sent to firmware.

Index cap.band[] with NL80211_BAND_* and update 5 GHz for single-pdev
devices even when 6 GHz is supported.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: 0d777aa2ca77 ("wifi: ath12k: fix mac pdev frequency range update")
Cc: stable@vger.kernel.org
Assisted-by: Codex:GPT-5.6 Sol
Signed-off-by: Shenghan Gao <gsh20040816@gmail.com>
---
Testing notes:

- Runtime testing was performed on WCN7850 under the CN regulatory domain.
- 2.4 and 5 GHz scanning and 5 GHz association were verified.
- 6 GHz operation was not tested because it is unavailable under the CN
  regulatory domain.
- QCC2072 was not tested because the hardware was not available.

 drivers/net/wireless/ath/ath12k/reg.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/reg.c b/drivers/net/wireless/ath/ath12k/reg.c
index 89abf2e87ad1..c3bb1df2b1e2 100644
--- a/drivers/net/wireless/ath/ath12k/reg.c
+++ b/drivers/net/wireless/ath/ath12k/reg.c
@@ -300,7 +300,7 @@ int ath12k_regd_update(struct ath12k *ar, bool init)
 
 	if (supported_bands & WMI_HOST_WLAN_2GHZ_CAP) {
 		if (ab->hw_params->single_pdev_only) {
-			phy_id = ar->pdev->cap.band[WMI_HOST_WLAN_2GHZ_CAP].phy_id;
+			phy_id = ar->pdev->cap.band[NL80211_BAND_2GHZ].phy_id;
 			reg_cap = &ab->hal_reg_cap[phy_id];
 		}
 
@@ -310,9 +310,10 @@ int ath12k_regd_update(struct ath12k *ar, bool init)
 		ath12k_mac_update_freq_range(ar, freq_low, freq_high);
 	}
 
-	if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP && !ar->supports_6ghz) {
+	if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP &&
+	    (!ar->supports_6ghz || ab->hw_params->single_pdev_only)) {
 		if (ab->hw_params->single_pdev_only) {
-			phy_id = ar->pdev->cap.band[WMI_HOST_WLAN_5GHZ_CAP].phy_id;
+			phy_id = ar->pdev->cap.band[NL80211_BAND_5GHZ].phy_id;
 			reg_cap = &ab->hal_reg_cap[phy_id];
 		}
 

base-commit: a1a21995c2e1cc2ca6b2226cfe4f5f018370182a
-- 
2.55.0

