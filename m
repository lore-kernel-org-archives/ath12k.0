Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41185606A321
	for <ath12k@archiver.kernel.org>; Tue, 10 Nov 2026 21:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sZOdDErQ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H+1WVWID
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=kn3iaBA+TWk0hHS2rgVYu4JsxeOy72hg1sbB0FgdpYA=; b=sZOdDErQPt1O58Hyc5GaF9HWuX
	vjxwQ91O7qElcUQfy6E8axSCI9s/PpFqrUMPTl7iNhwvR3MwGPErv5J5DQGnNgcLSpIBYllwMLVNq
	4bOxutI3s+onjXZ3Y28MxZdJFeQC4tC20+3b1FdDW94X/zZqxDuXg3Q28CMSgfVVY9slPIrDCreFe
	ht1rFUU7Mf2HwBE+Hqoy96oQXDR+HEEPCUNje/pXPHbeThX7lJsyNEybpZkmRgtVpUn9mtcE8/M9P
	2UWRgXdMWG3zaAwRlTWqmdzR+CNB4lttgt8RQljSqm8ZFil/zAlMmwdJ/1DNRq7k+YfdQauY+cuob
	7pz+M7Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtUU-000000053vf-1njq;
	Tue, 10 Nov 2026 21:34:54 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtUR-000000053v1-3VXt
	for ath12k@lists.infradead.org;
	Tue, 10 Nov 2026 21:34:53 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so31196935e9.0
        for <ath12k@lists.infradead.org>; Tue, 10 Nov 2026 13:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794346489; x=1794951289; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kn3iaBA+TWk0hHS2rgVYu4JsxeOy72hg1sbB0FgdpYA=;
        b=H+1WVWID/DRjT2l/biMJc/MtEe5aaorgm/S+4ZLt0VPJovrjo9rHTpd5O8g8VwEDel
         OsxUte1aBYr0qJOQQAOO50pURhuiXQBMdCQs+MIvfDSsfUaY7BLjzWfRNjewAco+v0Id
         OnaV+wG5M9Pjy6deOnOCu14YOk8ARqgih4FWU/tLTFARL7DiMmDqLoqhFj12oRUeM/Fd
         v46k1OVfHQkIxegFdzVG2veNs7EDdL8sH+BlNQCADtQ6odZz3Us9UI1jMeshvKgb5Lyr
         QVYuy7Bhh0LaknNx+vGlrRfzq2mpn1LTm/sdkVZ0sOeoFmECKioXbUduJCqodFkK5oer
         3rqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794346489; x=1794951289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kn3iaBA+TWk0hHS2rgVYu4JsxeOy72hg1sbB0FgdpYA=;
        b=dQG0aMxChu16c1in8KJQ2R+DEDZVbO4didQoq6iuQK0qBDNNvdmGaJRnKrx+lojG7h
         DdFviVUWuGVabhbJZwQfJeGhUfsWdUrXL9iBWzHWkmjKXJHdKzz8nQ3OSyFc+C2xf+RX
         Njs3n4GA8UyDX6JQur0Vsxyk2G2hy1eyPP+u+VqFejmAxGk75UXxtyuGC87amzwJJQze
         x7LjPB98PTXpxPUTb2TE3O8FQQ9CpSawMIiH+l2a4TevEhIU59xEoYmpBpw5CiJMhG+M
         5hQNZLdNA4sPyeB03aPtPPRtbynTN9XoKe2SguIX/6nckq20rF9ehV0bcaMXOjJfWVc4
         3COw==
X-Forwarded-Encrypted: i=1; AL+hErGfoNcAaow3lwMWadZGKEddgHv0F1/TGp2VNzueKqX1dTPRaxdzv2qc+R1xn0UjxL3z114VrmU=@lists.infradead.org
X-Gm-Message-State: APuU4Z91jOYjirbkNnm55zqOTkozhJ7fpus2TtgIdgJaj+xZV51s/HIP
	xP+JMPgrtxKIPwMMsozqSAjgtQI+vrizxFyR05HIphrCAHEeku4RkKA6
X-Gm-Gg: AYBFou13pUzmTqukmI/QboOA9EBqAiyMXOZTCVzvxk4ReLTFoLNClNSzetpW4tXKEgf
	+IhsH0ZSGndqwMOoThuTUhv/cgkka/Q3Baa4GeAkd3wQv7TQtKBeSYkJ6cM19aYzB5A6roLCVnf
	1ffeSG0DdzF0Db/sSiq80xdz1zfl31M88k7JBr4jjYX/UvCu0YZDFx82U4haHAR3XawNAUQAB9e
	CWGpp1uCWxb9FLaiRnuVmoJcr7J28u4Qg2d00nvl/NCkA9Z3y38fWBV7mJdedTDQvau+V5lNAXh
	gSExhPPMFi1LzaUepg60h/vy2/t/ccVGURxKzss5ysVHqFTvFWZ1nvyXk8BeWkHssS8f9NkzBjO
	10HwAOvLzknlsseYi1ptumoiAmrMNtn/yywmvtkwyzmGDiB/IhDVTAB4Er7uxVzcYLVcdyfwGN8
	6BC883m9vY18obefZJT0BhMPY9WRDGm5QG2HMofiXbyIGbi20DEPy7qQtz+y6tpqC+ssXig9yix
	GG7w/WAo71PjkdmQTnZ+9/d8BdYo0ULbQ+2UaJGUfzSdy3NAkLCbC5EgChV5Xg0cSMg2JwXrwrN
	D2DhAiE6vMUpHcLlsAKXmxpJ0ATC7IHVyr/2b7QeCUwQe7Nz8Zz6KiLv
X-Received: by 2002:a05:600d:82e3:b0:4a2:1867:10e8 with SMTP id 5b1f17b1804b1-4ba093953c6mr5795205e9.25.1794346489304;
        Tue, 10 Nov 2026 13:34:49 -0800 (PST)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fef1d0sm87113475e9.13.2026.11.10.13.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:34:49 -0800 (PST)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vladyslav Tymoshchuk <tvlad744@gmail.com>
Subject: [PATCH] wifi: ath12k: report an aborted scan before cancel_hw_scan returns
Date: Tue, 10 Nov 2026 23:34:38 +0200
Message-ID: <20261110213438.342-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_133451_883689_EBC98CF1 
X-CRM114-Status: GOOD (  16.01  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Suspending while a hardware scan is running makes mac80211 warn on
resume:

  phy0: resume with hardware scan still in progress
  WARNING: net/mac80211/ieee80211_i.h:2444 at ieee80211_resume+0x60/0x6c [mac80211]
  Call trace:
   ieee80211_resume+0x60/0x6c [mac80211] (P)
   wiphy_resume+0x84/0xdc [cfg80211]
   dpm_run_callback+0x40/0x124
   device_resume+0x154/0x1f8

__ieee80211_suspend() cancels the scan with ieee80211_scan_cancel(),
which for a hardware scan only calls the cancel_hw_scan() callback and
leaves it to the driver to call ieee80211_scan_completed().
ath12k_mac_op_cancel_hw_scan() waits for the firmware to stop the scan,
but ieee80211_scan_completed() is called from scan.vdev_clean_wk. That
is a wiphy work, and wiphy_suspend() has already run the pending wiphy
works before calling into mac80211, so the work only runs after the
resume and mac80211 finds the scan neither completed nor aborted.

Flush the work in ath12k_mac_op_cancel_hw_scan(), as
ath12k_mac_op_cancel_remain_on_channel() already does.

Tested-on: WCN7850 hw2.0 PCI WLAN.GNG.1.0-03342-QCAGNGSWPL_V1.0_V2.0_SILICONZ-1.81206.153

Fixes: 3863f014ad23 ("wifi: ath12k: symmetrize scan vdev creation and deletion during HW scan")
Signed-off-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>
---
Reproduced with "iw dev wlp1s0 scan trigger" followed 0.3 s, 1 s and
2.5 s later by "rtcwake -m freeze -s 20" on a OnePlus Pad 3 (SM8750,
WCN7880 hw2.0), associated to an AP:

  without the patch    3/3 suspends warn
  with the patch       0/3

After the runs with the patch the interface is still associated and a
new scan returns results.

I tested on a 7.3-rc5 based tree with out-of-tree patches for this
device. The function is the same in ath-next; I applied the patch there
but did not build or run that tree.

I used an AI assistant (Claude) for the analysis and to draft this
patch and its description; I reviewed the result and ran the tests on
my device.

 drivers/net/wireless/ath/ath12k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 9fd3841f71b7..d4c1f7cd7040 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5875,6 +5875,7 @@ void ath12k_mac_op_cancel_hw_scan(struct ieee80211_hw *hw,
 		ath12k_scan_abort(ar);
 
 		cancel_delayed_work_sync(&ar->scan.timeout);
+		wiphy_work_flush(hw->wiphy, &ar->scan.vdev_clean_wk);
 	}
 }
 EXPORT_SYMBOL(ath12k_mac_op_cancel_hw_scan);

base-commit: d0fbb39d65dc9dcb4175fa6b23e473dec3670f4d
-- 
2.43.0


