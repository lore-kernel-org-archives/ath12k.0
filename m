Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C61BC4829A
	for <ath12k@archiver.kernel.org>; Sun, 11 Feb 2024 14:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hlKpg9+BHEDjOOwYDTsy/ZpeasKv7giejYp8qUONndg=; b=M1e6Gb5Vpoi8zwb/gizBcIK3L/
	Xmx5OTVxv1xoub4G/WM7/gcz50iProCMA+aCqPLgwDm3RETiIMDRdvWyTxfuEoEz9ltEO9OlHGR74
	ACY4GSw+saPt41pDbiPFXimbhxV4/ckvpQYRYviB+BSS2uRipihdhh4i+GcnKV0cA8EPpDGmeBX7C
	SPwrl+K3d4hKdlgOj/fwLxz+84s0TCkXMYgIo2QjKEp7SAOdSl7ObUOk19bbDwvLpN7Zmf76zrr7D
	M0pV633yty0WyU8mTPUxxNvoR6IULm/RS2BxwdbV3Ai4O03qMFxEXtiMRJReUrJbepPCQ21RiTLHi
	ho4DqN3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZBFO-00000002rmG-15jh
	for ath12k@archiver.kernel.org;
	Sun, 11 Feb 2024 14:55:58 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZBFK-00000002rjn-1awG
	for ath12k@lists.infradead.org;
	Sun, 11 Feb 2024 14:55:55 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4108db2ded5so7228335e9.1
        for <ath12k@lists.infradead.org>; Sun, 11 Feb 2024 06:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707663352; x=1708268152; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hlKpg9+BHEDjOOwYDTsy/ZpeasKv7giejYp8qUONndg=;
        b=irnTJcdyu0z4SEkUpVNwyPORYfADe12jA2CBqEjf7h1L11g6BWRMZrH5vVBS1OWTlD
         v01gkBXlL5VwSYE8oDY3X3N/wUqlM7JAse85ZU2BgW9EG2SuSISfVV3kHFkCHX4AdEmR
         gJE2nIAq8ABbYMq2XERPe8YlEkA2af35FgpANL+pfNmAWF8k+3qeoUjJ6ErUvhVcDE/w
         8piKDfT5KvoYo6O+6QTDit5AYRr2WLIX0ARe2v/LVU+d1pVX2XWE7wS0JyWxXx+edxIM
         X8EnhH/VZYDKv3YKA14iC0ZsfgR7srT5qVtRQmoFpskDLz1WXeslXoLEUASEefnZifOD
         EUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707663352; x=1708268152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hlKpg9+BHEDjOOwYDTsy/ZpeasKv7giejYp8qUONndg=;
        b=MO1ZhvDJy7wlL5LKTZev7kilgSBnvyx8QXa01Y90gx/1aVPH4uVYqasgNnpRKNC4MD
         ozur2LrN9RvyeefaOjmjiyTH2ooJ8h4XW5Lo/AMMRz+Dzfg0hrwiSUerv8uk+rX1d6HL
         odFQL+nBD+D8AKs9slMWJzLr3bXUaEXl4zjHcEDzWBk5ndimPeVrnHgbuHaZ5yhixxLV
         VLvkC+FWYzEGnVERJU84gTTUhJFH4yJzuk63uE6HqOah15ps4LERfMAFQuxhHQ3SyAeP
         YN9lS6bEkegKnoJR5qN1rRomoM2ljnBOduCjGTWrLN2FOf5eTjFJbKD9yNoIxfYP2Mad
         kV2Q==
X-Gm-Message-State: AOJu0Yyq3LGhbISHxl54ZprgrqziBLDiyKwk8AJPoPV/ajPA3596pGIk
	czk1rvitnfE3x3z6N1vJIO2OgR6Iv34mMnQ8tV6LyWO1PHOsGYOXC/feE5h7
X-Google-Smtp-Source: AGHT+IHIIkEdzUNXVIM1fcs1I98irQSeAdaD5rNitgawv52fHSKAfgMfY0ML8AAstbg+xedot6W1kw==
X-Received: by 2002:a5d:42d1:0:b0:33b:1562:cf4c with SMTP id t17-20020a5d42d1000000b0033b1562cf4cmr3360829wrr.14.1707663352256;
        Sun, 11 Feb 2024 06:55:52 -0800 (PST)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id cf2-20020a5d5c82000000b0033b7263702csm3779424wrb.29.2024.02.11.06.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Feb 2024 06:55:51 -0800 (PST)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 2/2] wifi: ath12k: Remove unused scan_flags from struct ath12k_wmi_scan_req_arg
Date: Sun, 11 Feb 2024 15:55:48 +0100
Message-ID: <20240211145548.1939610-3-nico.escande@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240211145548.1939610-1-nico.escande@gmail.com>
References: <20240211145548.1939610-1-nico.escande@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240211_065554_438314_FAE76F21 
X-CRM114-Status: UNSURE (   7.87  )
X-CRM114-Notice: Please train this message.
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

As we did for ath11k lets remove the unused scan_flags from struct
ath12k_wmi_scan_req_arg. This will prevent us from using out of sync values
between WMI_SCAN_XXX & scan_f_xxx bitfield. 
While at it remove the underlying wrapping struct/union construct as it serves
no purpose anymore.

Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
---
 drivers/net/wireless/ath/ath12k/wmi.h | 55 ++++++++++++---------------
 1 file changed, 25 insertions(+), 30 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 4bd1d0f270a1..892f21f95ee5 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -3311,36 +3311,31 @@ struct ath12k_wmi_scan_req_arg {
 	u32 idle_time;
 	u32 max_scan_time;
 	u32 probe_delay;
-	union {
-		struct {
-			u32 scan_f_passive:1,
-			    scan_f_bcast_probe:1,
-			    scan_f_cck_rates:1,
-			    scan_f_ofdm_rates:1,
-			    scan_f_chan_stat_evnt:1,
-			    scan_f_filter_prb_req:1,
-			    scan_f_bypass_dfs_chn:1,
-			    scan_f_continue_on_err:1,
-			    scan_f_offchan_mgmt_tx:1,
-			    scan_f_offchan_data_tx:1,
-			    scan_f_promisc_mode:1,
-			    scan_f_capture_phy_err:1,
-			    scan_f_strict_passive_pch:1,
-			    scan_f_half_rate:1,
-			    scan_f_quarter_rate:1,
-			    scan_f_force_active_dfs_chn:1,
-			    scan_f_add_tpc_ie_in_probe:1,
-			    scan_f_add_ds_ie_in_probe:1,
-			    scan_f_add_spoofed_mac_in_probe:1,
-			    scan_f_add_rand_seq_in_probe:1,
-			    scan_f_en_ie_whitelist_in_probe:1,
-			    scan_f_forced:1,
-			    scan_f_2ghz:1,
-			    scan_f_5ghz:1,
-			    scan_f_80mhz:1;
-		};
-		u32 scan_flags;
-	};
+	u32 scan_f_passive:1,
+	    scan_f_bcast_probe:1,
+	    scan_f_cck_rates:1,
+	    scan_f_ofdm_rates:1,
+	    scan_f_chan_stat_evnt:1,
+	    scan_f_filter_prb_req:1,
+	    scan_f_bypass_dfs_chn:1,
+	    scan_f_continue_on_err:1,
+	    scan_f_offchan_mgmt_tx:1,
+	    scan_f_offchan_data_tx:1,
+	    scan_f_promisc_mode:1,
+	    scan_f_capture_phy_err:1,
+	    scan_f_strict_passive_pch:1,
+	    scan_f_half_rate:1,
+	    scan_f_quarter_rate:1,
+	    scan_f_force_active_dfs_chn:1,
+	    scan_f_add_tpc_ie_in_probe:1,
+	    scan_f_add_ds_ie_in_probe:1,
+	    scan_f_add_spoofed_mac_in_probe:1,
+	    scan_f_add_rand_seq_in_probe:1,
+	    scan_f_en_ie_whitelist_in_probe:1,
+	    scan_f_forced:1,
+	    scan_f_2ghz:1,
+	    scan_f_5ghz:1,
+	    scan_f_80mhz:1;
 	enum scan_dwelltime_adaptive_mode adaptive_dwell_time_mode;
 	u32 burst_duration;
 	u32 num_chan;
-- 
2.43.0


