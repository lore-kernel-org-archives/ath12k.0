Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C192C4829D
	for <ath12k@archiver.kernel.org>; Sun, 11 Feb 2024 14:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oAn2AS+0LO75NkItpaZHGDtD144iwOC08hKoiH7RRq0=; b=yh+yvcKu2o3Tmp0X451OvTCpio
	8uAFZCokgkzsH3neaWWzJi/Wm0X06e4bhCtBqxjzRWLx/akimMe7i2xQgBp+fHsqGQFPa/GE+ABg8
	KwwNwkWp03bU8m4GG4aUN46oVbk6ZdR7j7zXcEIbp7SM6UR1fCGWBVHLxG3iPvea1rrR6b8/3arBs
	aT0pOGgv3kZb+RUYdT4pAtFR3MgC1bIVqfInWwSy2DCQP7FhO3OlI8iM9dOMOL76lULwiZMcYdIWX
	rXGFmIJ7Mg/DoA8WNgrOGI4fZh/rVWMkOK6wEztRtMGIvBT40FWtsb6rp0jyQjVP5RqJF1/ER/h9c
	eAJpmgpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZBFN-00000002rm3-3cM8
	for ath12k@archiver.kernel.org;
	Sun, 11 Feb 2024 14:55:57 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZBFJ-00000002rja-2DsJ
	for ath12k@lists.infradead.org;
	Sun, 11 Feb 2024 14:55:55 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-410cba44286so1604345e9.3
        for <ath12k@lists.infradead.org>; Sun, 11 Feb 2024 06:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707663351; x=1708268151; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAn2AS+0LO75NkItpaZHGDtD144iwOC08hKoiH7RRq0=;
        b=FqxCXAWcL/NCg/Z7K+k0r+B8V2gNhp21gxymKXN2qh1waeHR8bVkfkWEB1pfLD9be5
         M9KIwhL6BIZresEYwtTq3ZumThq8dHjIYqggPPCzbq6NVUubT98jOFE39yw5i1sXHdbj
         7+tipUGtaHHiTtOu2FYW7bFOwYn5DYMutdu51L7LM5Uhu4K2cVT94LpdM+0h85biunZ0
         8GA7u5cboX1o3q8xP9b4vWpyxfrZjRuYIT0Lzct88amx+k1N4fcSvVngQywuRXVMzAM3
         gzCE7oo8OXgTf/kIFGS4Rf0KHkigko+D2Y+BHTILLUoCt7P26cZ215wXaPGoX19naMz/
         MQBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707663351; x=1708268151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oAn2AS+0LO75NkItpaZHGDtD144iwOC08hKoiH7RRq0=;
        b=c3PEVgH2dZE+pmPNnclH3Jex085kT/AQJa7BtVmyXJmxvyW/BwkTEGEb3gGNKRljOf
         Ud3sf2turGB0PYm8bxxnNLa3KEuCZ8q5Yw0dn9JkcMYlHyNGNtlP9esemNfc35r3HFzu
         8xDTov7bghgkCk4Hy8EHg6AjkZa11keqgq4eEYgtOoSpyDhIRfufZrxjPFPBD6SzJWd+
         gnkDl5wG7xldT5WO+TJLyJTXOLBfZhk/O+lQCFE9BWJXebwJXzUWNjsrj39JQjFdBwbv
         5AkTyJ+XaAVTuboqwWCArdbf2Co8NBYQlXcw55KCz3VBk9r63atkEBdOIfQlpVGI0IQy
         VrCA==
X-Gm-Message-State: AOJu0YwnptsdS88t0/ku4miogepLeDfdm/NG1sIxaqwNRe7y9lvVUlcg
	vQNVuVULQLAKJxFcjsuDSZu1ZvpX2cuGVE3Hmnrlrxs19ur+2uW4a3EDPssH
X-Google-Smtp-Source: AGHT+IHFNpT7vRUPtRfvLinZI28Y8eMsTlQazNuTi7Et68dVRe4OyBj3BrFYUNN4gQMQ5P+bWcTa8g==
X-Received: by 2002:a5d:628e:0:b0:33b:28:1084 with SMTP id k14-20020a5d628e000000b0033b00281084mr3363122wru.33.1707663351353;
        Sun, 11 Feb 2024 06:55:51 -0800 (PST)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id cf2-20020a5d5c82000000b0033b7263702csm3779424wrb.29.2024.02.11.06.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Feb 2024 06:55:50 -0800 (PST)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 1/2] wifi: ath12k: Do not use scan_flags from struct ath12k_wmi_scan_req_arg
Date: Sun, 11 Feb 2024 15:55:47 +0100
Message-ID: <20240211145548.1939610-2-nico.escande@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240211145548.1939610-1-nico.escande@gmail.com>
References: <20240211145548.1939610-1-nico.escande@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240211_065553_632582_788D1A03 
X-CRM114-Status: GOOD (  12.36  )
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

As discussed in [1] to fix the mismatch between the WMI_SCAN_XXX macros &
their corresponding scan_f_xxx bitfield equivalent, lets stop using the
scan_flags in the union altogether.

[1] https://lore.kernel.org/all/4be7d62e-cb59-462d-aac2-94e27efc22ff@quicinc.com/

Tested-on: QCN9274 hw2.0 PCI CI_WLAN.WBE.1.3-02907.1-QCAHKSWPL_SILICONZ-10

Signed-off-by: Nicolas Escande <nico.escande@gmail.com>

---
 drivers/net/wireless/ath/ath12k/mac.c | 4 ++--
 drivers/net/wireless/ath/ath12k/wmi.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index a737a09a0b9c..7d3f5321a36d 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3201,7 +3201,7 @@ static int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
 		for (i = 0; i < arg.num_ssids; i++)
 			arg.ssid[i] = req->ssids[i];
 	} else {
-		arg.scan_flags |= WMI_SCAN_FLAG_PASSIVE;
+		arg.scan_f_passive = 1;
 	}
 
 	if (req->n_channels) {
@@ -7555,7 +7555,7 @@ static int ath12k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
 	arg.dwell_time_active = scan_time_msec;
 	arg.dwell_time_passive = scan_time_msec;
 	arg.max_scan_time = scan_time_msec;
-	arg.scan_flags |= WMI_SCAN_FLAG_PASSIVE;
+	arg.scan_f_passive = 1;
 	arg.burst_duration = duration;
 
 	ret = ath12k_start_scan(ar, &arg);
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 84d7d6584fba..2c2a010d88df 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -2194,7 +2194,7 @@ void ath12k_wmi_start_scan_init(struct ath12k *ar,
 				  WMI_SCAN_EVENT_BSS_CHANNEL |
 				  WMI_SCAN_EVENT_FOREIGN_CHAN |
 				  WMI_SCAN_EVENT_DEQUEUED;
-	arg->scan_flags |= WMI_SCAN_CHAN_STAT_EVENT;
+	arg->scan_f_chan_stat_evnt = 1;
 	arg->num_bssid = 1;
 
 	/* fill bssid_list[0] with 0xff, otherwise bssid and RA will be
-- 
2.43.0


