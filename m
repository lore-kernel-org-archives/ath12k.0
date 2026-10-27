Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F315D606A31A
	for <ath12k@archiver.kernel.org>; Tue, 27 Oct 2026 01:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BB2nGnPH;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QGXmBstU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MyKz2NnZLm4vS/6MNncCEBuMsPdw/vfPh4W80n8BBIU=; b=BB2nGnPHz4j+QK
	BwQmk9eWNy4vBgdKo33mc/vbgXCX7xLk14bAjUMa8kQut81i9Jfkv69TTwcomNrBIsEKV/PmR7gZj
	MIc9uO33Gl2hbgR4AM1OpXR9PaOfb0iEWTNNGOwXAd45z3gOVewvT8g+ONQqjHal+1zJdC5Lhnw6I
	HqcjiOaGInrkAxoFWiTqQQPrPaMTjJzRC4Ut7QKGd9FaegGZSvCoY6+tBxNpad2GmATrT7WPtnOBi
	++KQU+8xevGQ40PDjRBeYEij0QBkPLhM5oi46rT9tnTOu6WvBSFYvoAEL0wh/Yw9HHjOVWVLtyvM7
	vrcwP+NZo8fTO9QML/YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLWTQ-00000003caV-3j3g;
	Tue, 27 Oct 2026 01:59:36 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLWTO-00000003ca8-0Jga
	for ath12k@lists.infradead.org;
	Tue, 27 Oct 2026 01:59:35 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a4dc547987so8892425e9.0
        for <ath12k@lists.infradead.org>; Mon, 26 Oct 2026 18:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793066371; x=1793671171; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MyKz2NnZLm4vS/6MNncCEBuMsPdw/vfPh4W80n8BBIU=;
        b=QGXmBstUoGbUt0oIt8TjKITU11CZIHjjiCIP5oswS31IbZek3hq72DHCZtgAoySPaK
         lg33DYwka40t6dFrZWTFSZFmAMq+YmrpuiLjuALURXxv33uG/6mIw63BOM+k2fe4WJRA
         2hiKGNXXgoiQaQRwushcMeJ7G1KzPePoXR05qZSiBopiirmi/LR3kkk9mc/Lfox1nrVJ
         DVRNP4DldpAiyAwLz1cnvEbDycmYl9EVXHiCp3FDX/zL69DLPtDihbetfn9oQspXN2zI
         8cS+gJ4wc9L07rxh2nU1KW/xksYXSNXOXfAiZOXESKYm4XT8b5gfIlwqTsloB+GGPI+G
         pw4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793066371; x=1793671171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MyKz2NnZLm4vS/6MNncCEBuMsPdw/vfPh4W80n8BBIU=;
        b=OI2iMqGopaLfqxAiOSuNkHSGSRCZv2iFJkIABJpllSBScvMBKuKgEJq/SrQdCoglfh
         dSPDqHADbXRfS43kA24NCJO4heTsHwMsiBbKIRZQOVDGj26FW7GY+7puj0BNgpXldRGh
         r6vpgAYxEX8k14ZjvDBtiJe/bbNKLQg8pPbSjth9S4nQU06yA/rnVFcNBAvs8s0lzNlW
         sgCslOAyVJD5ZsPnBjs9GX6nF2Wm+rP6ucCyGh0VdiK6gTB+Va/YPvNupFcPctaoudVM
         eG0Hdc+hqTCDlPmQ+g62w6Ug1BrIoJnw8GGdbtYQZZOKejkYFAm0aTgZZOjgDAN8twot
         Jzjw==
X-Forwarded-Encrypted: i=1; AKwUvBxNSNrf3OWCC7qFWWhQcNjBnxtO9JcHQMZDOAItXXZn1/Q5HsCmdLB98NWZvWHHFJU7at8KF/U=@lists.infradead.org
X-Gm-Message-State: AFq9FYI1xYXf5Vo5cobRto4/U8oOCuX+1jAHfSBmbGusv2pWBIATATW+
	TmqpOcHBsj8FgZXZpIrWfym7z7qY9sKRj1lCS3SJZW6NDWkf3hWKUVxK
X-Gm-Gg: AYBFou30S4JTlIZ+gSCaNLbaDX4cWPJgjQX1tMi6d3eaZrzLKFLlZ6UttbEmN56+u6R
	FKBvegej+0Vrfn1vzbNlbhGcW3v5DhIpT0VmirezIOsU8u7YJr94lcadIK4cj7Y6sCnddneIIt1
	ycxuGPfp8A3iUjEYEWwmycQHy90LO/xTzB5SEUuH2mysxJeYMnqVu4M/xGKdIioc/iBMttLSwSB
	+VWOV9G3OQNkVWo6WXyBsk8F9WNuBSvVOVeo9TLhVDMPuVb+/uAsF+k9s81ZLW+PUjLWUFfbCZC
	C1a5upIWuOhFgWnu5KZ9p8k03lu4dQmryJKdwg2sWBl/Fpm5h7cU7RFDsJCQWEoFPC6k7ppo8hA
	cdhfnypBXVXuFi+23SuWWMTifwtVDzQJL23tLc37PcPBh3UGBySPdToPr3aKehUi9ahn8Mn7D+g
	OmH+xz0Vlx8P22Oz4L1BZqemQeiIED2oZ6un8qN71ThQCMx7ysi80XsUCywU59E+SbdjioOoLAK
	NJgeImB8JUeaIOyMsQUUkUwLtoL/7PVjPSgnIEKi8mBav9nD76qHcTlHzwF6q8xXCr2gs289w==
X-Received: by 2002:a05:600c:19d4:b0:4a2:c2b:a91b with SMTP id 5b1f17b1804b1-4a35ac9114dmr145090405e9.10.1793066370786;
        Mon, 26 Oct 2026 18:59:30 -0700 (PDT)
Received: from etherl ([41.239.147.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0bb112sm251096485e9.8.2026.10.26.18.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 18:59:30 -0700 (PDT)
From: Ahmed Essam <mrmrmidoessam@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Ahmed Essam <mrmrmidoessam@gmail.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Shenghan Gao <gsh20040816@gmail.com>,
	Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	stable@vger.kernel.org
Subject: [PATCH ath-current] wifi: ath12k: fix lost 5 GHz range by tracking reg ranges per radio
Date: Tue, 27 Oct 2026 04:59:03 +0300
Message-ID: <20261027015919.277156-1-mrmrmidoessam@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <bbd65b93-816b-427b-8abe-1d1fd1cf4e70@oss.qualcomm.com>
References: <bbd65b93-816b-427b-8abe-1d1fd1cf4e70@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_185934_277314_EF03B074 
X-CRM114-Status: GOOD (  26.59  )
X-Spam-Score: -0.1 (/)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath12k_reg_build_regd() records the frequency span covered by the
received reg rules in ab->reg_freq_{2,5,6}ghz. Those fields live in
struct ath12k_base, but firmware sends WMI_REG_CHAN_LIST_CC_EXT per
radio, and ath12k_regd_update() uses them to compute the frequency
range of a single radio (ar->freq_range). This causes two problems.

First, ath12k_regd_update() cannot tell which bands a radio received
rules for, so it uses ar->supports_6ghz as a proxy: the 5 GHz range is
skipped for any radio that supports 6 GHz. That is only valid for
split-pdev devices. On single-pdev devices such as WCN7850 one radio
covers 2 GHz, 5 GHz and 6 GHz. When firmware switches to a country
without 6 GHz rules, for example after an 11d update to CN or EG,
ar->freq_range collapses to 2402-2482 MHz and
ath12k_reg_update_chan_list() drops every 5 GHz channel from the list
sent to firmware. From then on firmware no longer scans 5 GHz, a
5 GHz-only scan request fails ("received scan start failure event"),
and 5 GHz networks disappear from scan results, typically shortly after
boot. They stay gone until the driver is reloaded or firmware moves to
a country that has 6 GHz rules.

Second, by code inspection, build_regd() resets all three per-device
ranges on every event, so on multi-radio devices an event for one radio
can wipe the range of another radio whose regd_update_work has not run
yet, silently dropping a band.

Move reg_freq_{2,5,6}ghz into struct ath12k_pdev and fill them for the
radio identified by reg_info->phy_id. In ath12k_regd_update(), include
a band only if this radio registered that band and received reg rules
for it, instead of guessing from ar->supports_6ghz. Checking the
registered band is needed because a radio can receive rules for bands
it does not operate on, e.g. the 6 GHz radio of a split-pdev device.

Also fix the reg_cap lookup for single-pdev devices: pdev->cap.band[]
is indexed by enum nl80211_band, but was indexed with the
WMI_HOST_WLAN_*_CAP bit flags, so the 2 GHz lookup used the 5 GHz
entry and the 5 GHz lookup used the unset 60 GHz entry. Refresh
reg_cap for the 6 GHz band as well, as is done for 2 GHz and 5 GHz.

With ATH12K_DBG_MAC enabled on WCN7850 and the firmware switching to
EG, the range before this change is:

  mac pdev 0 freq limit updated. New range 2402->2482 MHz

and after it:

  mac pdev 0 freq limit updated. New range 2402->2482 MHz
  mac pdev 0 freq limit updated. New range 2402->5330 MHz

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: 657b0c72c4ad ("wifi: ath12k: Fix frequency range in driver")
Fixes: 13324cecbb2c ("wifi: ath12k: Update frequency range if reg rules changes")
Fixes: 0d777aa2ca77 ("wifi: ath12k: fix mac pdev frequency range update")
Cc: stable@vger.kernel.org
Reported-by: Shenghan Gao <gsh20040816@gmail.com>
Closes: https://lore.kernel.org/all/20260715065218.41232-1-gsh20040816@gmail.com/
Suggested-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Assisted-by: Claude:claude-opus-5-5 sparse
Signed-off-by: Ahmed Essam <mrmrmidoessam@gmail.com>
---

Notes:
    Jeff, sorry for the duplicate: a test send reached you a few minutes
    ago without the lists.
    
    This picks up Shenghan Gao's patch "wifi: ath12k: fix frequency range
    for single-pdev devices" [1], reworked as Baochen suggested in review
    [2]: reg_freq_* are now per radio, and each band is gated on whether
    the radio received rules for it instead of on ar->supports_6ghz. On top
    of that suggestion, the band must also be registered on the radio,
    since the 6 GHz pdev of a split-pdev device receives rules for all
    bands.
    
    Shenghan, I hope you don't mind me picking this up after the thread
    went quiet. I kept your band-index fix and credited your report.
    
    Testing:
    - WCN7850 (single-pdev) with the firmware above. Firmware sets the
      country to EG via 11d about 7 s after the driver loads.
      Before: freq_range drops to 2402->2482 MHz after the EG update, a
      5 GHz-only scan is rejected ("received scan start failure event"),
      and all 5 GHz networks are gone from scan results after about a
      minute.
      After: the range is 2402->5330 MHz, a 5 GHz-only scan returns 26 BSSes,
      5 GHz networks stayed visible for the whole 26 minute run while
      associated on 2.4 GHz, and association to a 5 GHz AP works.
    - Built for x86_64 with W=1; checkpatch --strict and sparse report
      nothing new.
    
    Not tested: split-pdev devices such as QCN9274, and 6 GHz operation (EG
    has no 6 GHz rules). The split-pdev handling is based on reading the
    code only.
    
    AI assistance: I used Claude (claude-opus-5-5) to investigate the
    problem on my machine, write the patch following Baochen's suggestion,
    draft this message and run the tests above. I reviewed the change and
    tested it on my hardware.
    
    [1] https://lore.kernel.org/all/20260715065218.41232-1-gsh20040816@gmail.com/
    [2] https://lore.kernel.org/all/9dd4e992-5810-429f-bc54-036c4eb276a7@oss.qualcomm.com/

 drivers/net/wireless/ath/ath12k/core.h | 20 +++++----
 drivers/net/wireless/ath/ath12k/mac.c  | 12 ++---
 drivers/net/wireless/ath/ath12k/reg.c  | 61 ++++++++++++++++----------
 3 files changed, 56 insertions(+), 37 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 93fd227b4d19..b48d39c5db5c 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -850,6 +850,11 @@ struct mlo_timestamp {
 	u32 mlo_comp_timer;
 };
 
+struct ath12k_reg_freq {
+	u32 start_freq;
+	u32 end_freq;
+};
+
 struct ath12k_pdev {
 	struct ath12k *ar;
 	u32 pdev_id;
@@ -857,6 +862,13 @@ struct ath12k_pdev {
 	struct ath12k_pdev_cap cap;
 	u8 mac_addr[ETH_ALEN];
 	struct mlo_timestamp timestamp;
+
+	/* Frequency ranges covered by the reg rules last received for
+	 * this radio, per band. end_freq is 0 if no rules were received.
+	 */
+	struct ath12k_reg_freq reg_freq_2ghz;
+	struct ath12k_reg_freq reg_freq_5ghz;
+	struct ath12k_reg_freq reg_freq_6ghz;
 };
 
 struct ath12k_fw_pdev {
@@ -871,11 +883,6 @@ struct ath12k_board_data {
 	size_t len;
 };
 
-struct ath12k_reg_freq {
-	u32 start_freq;
-	u32 end_freq;
-};
-
 struct ath12k_mlo_memory {
 	struct target_mem_chunk chunk[ATH12K_QMI_WLANFW_MAX_NUM_MEM_SEG_V01];
 	int mlo_mem_size;
@@ -1147,9 +1154,6 @@ struct ath12k_base {
 	/* Denote whether MLO is possible within the device */
 	bool single_chip_mlo_support;
 
-	struct ath12k_reg_freq reg_freq_2ghz;
-	struct ath12k_reg_freq reg_freq_5ghz;
-	struct ath12k_reg_freq reg_freq_6ghz;
 	const struct ath12k_mem_profile_based_param *profile_param;
 	enum ath12k_qmi_mem_mode target_mem_mode;
 
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index da2ba1f39244..a11eb3e2a593 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -14263,9 +14263,9 @@ static int ath12k_mac_setup_channels_rates(struct ath12k *ar,
 		}
 
 		freq_low = max(reg_cap->low_2ghz_chan,
-			       ab->reg_freq_2ghz.start_freq);
+			       ar->pdev->reg_freq_2ghz.start_freq);
 		freq_high = min(reg_cap->high_2ghz_chan,
-				ab->reg_freq_2ghz.end_freq);
+				ar->pdev->reg_freq_2ghz.end_freq);
 
 		ath12k_mac_update_ch_list(ar, band,
 					  reg_cap->low_2ghz_chan,
@@ -14308,9 +14308,9 @@ static int ath12k_mac_setup_channels_rates(struct ath12k *ar,
 			band->bitrates = ath12k_a_rates;
 
 			freq_low = max(reg_cap->low_5ghz_chan,
-				       ab->reg_freq_6ghz.start_freq);
+				       ar->pdev->reg_freq_6ghz.start_freq);
 			freq_high = min(reg_cap->high_5ghz_chan,
-					ab->reg_freq_6ghz.end_freq);
+					ar->pdev->reg_freq_6ghz.end_freq);
 
 			ath12k_mac_update_ch_list(ar, band,
 						  reg_cap->low_5ghz_chan,
@@ -14365,9 +14365,9 @@ static int ath12k_mac_setup_channels_rates(struct ath12k *ar,
 			}
 
 			freq_low = max(reg_cap->low_5ghz_chan,
-				       ab->reg_freq_5ghz.start_freq);
+				       ar->pdev->reg_freq_5ghz.start_freq);
 			freq_high = min(reg_cap->high_5ghz_chan,
-					ab->reg_freq_5ghz.end_freq);
+					ar->pdev->reg_freq_5ghz.end_freq);
 
 			ath12k_mac_update_ch_list(ar, band,
 						  reg_cap->low_5ghz_chan,
diff --git a/drivers/net/wireless/ath/ath12k/reg.c b/drivers/net/wireless/ath/ath12k/reg.c
index 89abf2e87ad1..17232392071a 100644
--- a/drivers/net/wireless/ath/ath12k/reg.c
+++ b/drivers/net/wireless/ath/ath12k/reg.c
@@ -269,10 +269,11 @@ static void ath12k_copy_regd(struct ieee80211_regdomain *regd_orig,
 int ath12k_regd_update(struct ath12k *ar, bool init)
 {
 	struct ath12k_wmi_hal_reg_capabilities_ext_arg *reg_cap;
-	u32 phy_id, freq_low, freq_high, supported_bands;
+	u32 phy_id, freq_low, freq_high;
 	struct ath12k_hw *ah = ath12k_ar_to_ah(ar);
 	struct ieee80211_hw *hw = ah->hw;
 	struct ieee80211_regdomain *regd, *regd_copy = NULL;
+	struct ath12k_pdev *pdev = ar->pdev;
 	int ret, regd_len, pdev_id;
 	struct ath12k_base *ab;
 	long time_left;
@@ -288,43 +289,55 @@ int ath12k_regd_update(struct ath12k *ar, bool init)
 		 */
 	}
 
-	supported_bands = ar->pdev->cap.supported_bands;
 	reg_cap = &ab->hal_reg_cap[ar->pdev_idx];
 
 	/* Possible that due to reg change, current limits for supported
 	 * frequency changed. Update it. As a first step, reset the
 	 * previous values and then compute and set the new values.
+	 *
+	 * Only bands that this radio operates on and received reg rules
+	 * for contribute. A radio may receive rules for bands it does not
+	 * operate on, e.g. the 6 GHz radio of a split-pdev device.
 	 */
 	ar->freq_range.start_freq = 0;
 	ar->freq_range.end_freq = 0;
 
-	if (supported_bands & WMI_HOST_WLAN_2GHZ_CAP) {
+	if (ar->mac.sbands[NL80211_BAND_2GHZ].channels &&
+	    pdev->reg_freq_2ghz.end_freq) {
 		if (ab->hw_params->single_pdev_only) {
-			phy_id = ar->pdev->cap.band[WMI_HOST_WLAN_2GHZ_CAP].phy_id;
+			phy_id = pdev->cap.band[NL80211_BAND_2GHZ].phy_id;
 			reg_cap = &ab->hal_reg_cap[phy_id];
 		}
 
-		freq_low = max(reg_cap->low_2ghz_chan, ab->reg_freq_2ghz.start_freq);
-		freq_high = min(reg_cap->high_2ghz_chan, ab->reg_freq_2ghz.end_freq);
+		freq_low = max(reg_cap->low_2ghz_chan, pdev->reg_freq_2ghz.start_freq);
+		freq_high = min(reg_cap->high_2ghz_chan, pdev->reg_freq_2ghz.end_freq);
 
 		ath12k_mac_update_freq_range(ar, freq_low, freq_high);
 	}
 
-	if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP && !ar->supports_6ghz) {
+	if (ar->mac.sbands[NL80211_BAND_5GHZ].channels &&
+	    pdev->reg_freq_5ghz.end_freq) {
 		if (ab->hw_params->single_pdev_only) {
-			phy_id = ar->pdev->cap.band[WMI_HOST_WLAN_5GHZ_CAP].phy_id;
+			phy_id = pdev->cap.band[NL80211_BAND_5GHZ].phy_id;
 			reg_cap = &ab->hal_reg_cap[phy_id];
 		}
 
-		freq_low = max(reg_cap->low_5ghz_chan, ab->reg_freq_5ghz.start_freq);
-		freq_high = min(reg_cap->high_5ghz_chan, ab->reg_freq_5ghz.end_freq);
+		freq_low = max(reg_cap->low_5ghz_chan, pdev->reg_freq_5ghz.start_freq);
+		freq_high = min(reg_cap->high_5ghz_chan, pdev->reg_freq_5ghz.end_freq);
 
 		ath12k_mac_update_freq_range(ar, freq_low, freq_high);
 	}
 
-	if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP && ar->supports_6ghz) {
-		freq_low = max(reg_cap->low_5ghz_chan, ab->reg_freq_6ghz.start_freq);
-		freq_high = min(reg_cap->high_5ghz_chan, ab->reg_freq_6ghz.end_freq);
+	if (ar->mac.sbands[NL80211_BAND_6GHZ].channels &&
+	    pdev->reg_freq_6ghz.end_freq) {
+		/* 6 GHz is reported as part of the 5 GHz band capability */
+		if (ab->hw_params->single_pdev_only) {
+			phy_id = pdev->cap.band[NL80211_BAND_5GHZ].phy_id;
+			reg_cap = &ab->hal_reg_cap[phy_id];
+		}
+
+		freq_low = max(reg_cap->low_5ghz_chan, pdev->reg_freq_6ghz.start_freq);
+		freq_high = min(reg_cap->high_5ghz_chan, pdev->reg_freq_6ghz.end_freq);
 
 		ath12k_mac_update_freq_range(ar, freq_low, freq_high);
 	}
@@ -645,6 +658,7 @@ ath12k_reg_build_regd(struct ath12k_base *ab,
 		      enum wmi_vdev_type vdev_type,
 		      enum ieee80211_ap_reg_power power_type)
 {
+	struct ath12k_pdev *pdev = &ab->pdevs[reg_info->phy_id];
 	struct ieee80211_regdomain *new_regd = NULL;
 	struct ath12k_reg_rule *reg_rule, *reg_rule_6ghz;
 	u32 flags, reg_6ghz_number, max_bw_6ghz;
@@ -709,14 +723,15 @@ ath12k_reg_build_regd(struct ath12k_base *ab,
 		   alpha2, ath12k_reg_get_regdom_str(new_regd->dfs_region),
 		   reg_info->dfs_region, num_rules);
 
-	/* Reset start and end frequency for each band
+	/* Reset start and end frequency for each band of the radio this
+	 * event belongs to. reg_info->phy_id has already been validated.
 	 */
-	ab->reg_freq_5ghz.start_freq = INT_MAX;
-	ab->reg_freq_5ghz.end_freq = 0;
-	ab->reg_freq_2ghz.start_freq = INT_MAX;
-	ab->reg_freq_2ghz.end_freq = 0;
-	ab->reg_freq_6ghz.start_freq = INT_MAX;
-	ab->reg_freq_6ghz.end_freq = 0;
+	pdev->reg_freq_5ghz.start_freq = INT_MAX;
+	pdev->reg_freq_5ghz.end_freq = 0;
+	pdev->reg_freq_2ghz.start_freq = INT_MAX;
+	pdev->reg_freq_2ghz.end_freq = 0;
+	pdev->reg_freq_6ghz.start_freq = INT_MAX;
+	pdev->reg_freq_6ghz.end_freq = 0;
 
 	/* Update reg_rules[] below. Firmware is expected to
 	 * send these rules in order(2G rules first and then 5G)
@@ -728,7 +743,7 @@ ath12k_reg_build_regd(struct ath12k_base *ab,
 			max_bw = min_t(u16, reg_rule->max_bw,
 				       reg_info->max_bw_2g);
 			flags = ath12k_get_bw_reg_flags(reg_info->max_bw_2g);
-			ath12k_reg_update_freq_range(&ab->reg_freq_2ghz, reg_rule);
+			ath12k_reg_update_freq_range(&pdev->reg_freq_2ghz, reg_rule);
 		} else if (reg_info->num_5g_reg_rules &&
 			   (j < reg_info->num_5g_reg_rules)) {
 			reg_rule = reg_info->reg_rules_5g_ptr + j++;
@@ -743,7 +758,7 @@ ath12k_reg_build_regd(struct ath12k_base *ab,
 			 */
 			flags = NL80211_RRF_AUTO_BW |
 				ath12k_get_bw_reg_flags(reg_info->max_bw_5g);
-			ath12k_reg_update_freq_range(&ab->reg_freq_5ghz, reg_rule);
+			ath12k_reg_update_freq_range(&pdev->reg_freq_5ghz, reg_rule);
 		} else if (reg_info->is_ext_reg_event && reg_6ghz_number &&
 			   (k < reg_6ghz_number)) {
 			reg_rule = reg_rule_6ghz + k++;
@@ -752,7 +767,7 @@ ath12k_reg_build_regd(struct ath12k_base *ab,
 				ath12k_get_bw_reg_flags(max_bw_6ghz);
 			if (reg_rule->psd_flag)
 				flags |= NL80211_RRF_PSD;
-			ath12k_reg_update_freq_range(&ab->reg_freq_6ghz, reg_rule);
+			ath12k_reg_update_freq_range(&pdev->reg_freq_6ghz, reg_rule);
 		} else {
 			break;
 		}

base-commit: 9f0fe5ad0c9af369400bb87143bc936ebb741391
-- 
2.56.0


