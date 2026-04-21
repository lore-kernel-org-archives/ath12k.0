Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEACEF327D4
	for <ath12k@archiver.kernel.org>; Tue, 21 Apr 2026 17:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uu5+POdFqqclIWWOEr3Sv9HNAu+bDuUYEserSDIYQ6I=; b=nG7LWtfVS7BJ26uXVDk2XSgSZ3
	QS92ztcEnfdz7R2+45YiIs9RjBl48dEBoJr+wF30fgHygQ7w81kRAuBrjlKmCNXd8WCENyfOacp8n
	dyJLripLIWsNCWXklFubJmO1yUwUnKdwKs+lOEDufWfzUcyNRxPSdTR+1HStRouTCdGK/+ApV/Wfq
	NssHFODsM1dQO5IQqx5uhxIVGPeVvnzb841nNrYpfCrhTSuHMBw1PTQd+aowrUVyzNm4nre0NAO17
	VlHC45ETN/zpODvBIRTgdLaGOqNK44PzzTVvx2ZdSCQUq0vjAuYdIWZKKhjwwu+foEA0ilea19stO
	BW01ftvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFEre-00000008y6H-2LvX;
	Tue, 21 Apr 2026 17:26:22 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFErb-00000008y5q-3zKP
	for ath12k@lists.infradead.org;
	Tue, 21 Apr 2026 17:26:21 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2ad9516a653so23568695ad.0
        for <ath12k@lists.infradead.org>; Tue, 21 Apr 2026 10:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776792378; x=1777397178; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uu5+POdFqqclIWWOEr3Sv9HNAu+bDuUYEserSDIYQ6I=;
        b=SFX3R5oflJhCO23vyx10277VMMaQtWF+Hg+O2xE7vo9no5sPSIFNwCooCPYwD6EXDg
         DJRGHPc3PNOsbp8lAZHdcTOD9EDrfU0ZpU4eJ6Rk1+tUmJLoYaFYTLI2i18aRz3CUgKy
         seqNlL/4POapsagU/hGGwjAqwx++mGYDcoqjsy2bSfzHUUCZhW3WDZs+NTaT/ZSF6mDF
         igwfFrruHGqb3Un6sT77G84rFDG3KIR8q6gytDbh2jfqchnTfdS5LUTqVLndKo5yBxvT
         RWCDpHJmlAcwSkz3vJC3xr9pUezKs2ScUU0nK/0ci1FExWatjRzCpA3nIaZaog76gxXZ
         eBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776792378; x=1777397178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Uu5+POdFqqclIWWOEr3Sv9HNAu+bDuUYEserSDIYQ6I=;
        b=I4sj693xCDhXgEafHL+LJzr4jxweX8Li/G6yxnFJGrqmJumz4S+S6WPsDwDeuapsfU
         hJsgm0/x54EQH0HnnkA/hBEVz+5isrQStofJe4VjCBhoofJvfB68raGpaQa+kOtEinY0
         cHztyTJQPbgXP/S4iNZhkiJbxFRE2R+jOU5RMfCKWRA+ImWehDsd5xvf7BSmmHGHm9XQ
         n2ZHH7jXzUvu8inBjDYxz12KyLjCx7o6Ly4b9RIp/1pDx3+/gk2fMN6jo7ytdbqTmf1l
         jEUwQ2OygDBbyuNqsnLEw3lrgLRKPBgiVBE3RM9wZYtHavff6UmTp7JzXGwIty2Qe+1U
         BI1w==
X-Forwarded-Encrypted: i=1; AFNElJ9w/7ZEI2ZQLsDCEzXjSRj6UEw0bmePrca8RclUqMjMrWLY02jUa1XHRfJPUr4IYK97UMqV34o=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2NdkK6s60CFwNgw4OSsR49B6vzVfb53i2Xr4DjJ8mqValApF4
	DwnkfulD58iYZIdzaM87gYOyRBjNdFb0Qe+L8q8pI3qALBgC+GqwxKCF
X-Gm-Gg: AeBDieuDNPF2dvE8KCAEWOrUqV9pGoMqioEDcjITm/4jr9qE89FZPOS5l77Td4m3lWZ
	BYtdpasug+ofyFG0GAuAyFkpu1WngEExD14jQqEwJpfches8i9oDqMLFCA3FFb8a/TU24zV115+
	YyFtEATikvW2I1a5EesHa0XkZvb8F84pJtPY8d0vO53AHkjPWPCUrbXuLmFTfxJtvLmK1CQIYYi
	qSTVs5hy3TT/t87NORRJQkHyZ97lS1lM1cDloXn0t94v0emwKa5D6IJok5Qzm1zQEKjVZya7zN9
	e7U2+po79s3/VIVAkoxrBcbeta8xGvfExzC3UHtcW+F+ofhb0hfR7hFZX3FgU6pr9mNa6rGCyva
	9gJ7H753Yv3ARc+9RpWfeffWupjasVcvCesnfIsJQ71nBKM28oLQ6ua0zPlni6BpCkj1lZ+reWq
	OnVT0FdW6+uX9fC4BhpfyxnQgPza9bxoSqFSImXPx25cShdxw=
X-Received: by 2002:a17:902:db0d:b0:2b2:4fe3:7b89 with SMTP id d9443c01a7336-2b5f9f52879mr182995625ad.38.1776792378433;
        Tue, 21 Apr 2026 10:26:18 -0700 (PDT)
Received: from lenovo.localdomain ([123.110.133.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa507cbsm144897015ad.37.2026.04.21.10.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 10:26:18 -0700 (PDT)
From: Yu-Hsiang Tseng <asas1asas200@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	ath12k@lists.infradead.org
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Rameshkumar Sundaram <quic_ramess@quicinc.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: [PATCH v2] wifi: ath12k: fix false positive RCU warnings on PREEMPT_RT
Date: Wed, 22 Apr 2026 01:25:00 +0800
Message-ID: <20260421172500.1050754-1-asas1asas200@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <4cdf2e61-fe69-4168-9df7-55bb71585dfe@oss.qualcomm.com>
References: <4cdf2e61-fe69-4168-9df7-55bb71585dfe@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_102619_997903_5F6040F4 
X-CRM114-Status: GOOD (  12.93  )
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

Two functions in ath12k assert that the caller holds an RCU read lock:
ath12k_mac_get_arvif() and ath12k_p2p_noa_update_vdev_iter(). Both use:

    WARN_ON(!rcu_read_lock_any_held());

On PREEMPT_RT kernels built with CONFIG_PROVE_RCU=n, this produces a
false positive splat whenever these functions are invoked from paths
that do hold the RCU read lock (e.g. firmware stats processing or
mac80211 interface iteration).

Root cause:

  - On !PROVE_RCU, rcu_read_lock_any_held() is a static inline that
    returns !preemptible() as a proxy for "in an RCU read section".

  - On PREEMPT_RT, rcu_read_lock() does not disable preemption. A
    task can therefore be preemptible while legitimately holding an
    RCU read lock.

  - Callers such as ath12k_wmi_tlv_rssi_chain_parse() (via guard(rcu)())
    and ieee80211_iterate_active_interfaces_atomic() do hold the RCU
    read lock, so these warnings are incorrect.

Typical splat seen on a WCN7850 station with periodic fw stats
processing:

  WARNING: drivers/net/wireless/ath/ath12k/mac.c:791 at
    ath12k_mac_get_arvif+0x9e/0xd0 [ath12k]
  Tainted: G W O 6.19.13-rt #1 PREEMPT_RT
  Call Trace:
   ath12k_wmi_tlv_rssi_chain_parse+0x69/0x170 [ath12k]
   ath12k_wmi_tlv_iter+0x7f/0x120 [ath12k]
   ath12k_wmi_tlv_fw_stats_parse+0x342/0x6b0 [ath12k]
   ath12k_wmi_op_rx+0xe9e/0x3150 [ath12k]
   ath12k_htc_rx_completion_handler+0x3df/0x5b0 [ath12k]
   ath12k_ce_per_engine_service+0x325/0x3e0 [ath12k]
   ath12k_pci_ce_workqueue+0x20/0x40 [ath12k]

Replace the WARN_ON() with RCU_LOCKDEP_WARN(), which is gated on
debug_lockdep_rcu_enabled() and therefore compiles out entirely
when PROVE_RCU is disabled. PROVE_RCU kernels continue to get the
full lockdep-based check.

Fixes: 3dd2c68f206e ("wifi: ath12k: prepare vif data structure for MLO handling")
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
Suggested-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Signed-off-by: Yu-Hsiang Tseng <asas1asas200@gmail.com>
---
Changes in v2:
  - Also fix the same WARN_ON() in ath12k_p2p_noa_update_vdev_iter()
    (suggested by Baochen Qiang)
  - Update commit message to cover both call sites

Link to v1: https://lore.kernel.org/ath12k/20260420161049.695518-1-asas1asas200@gmail.com/

 drivers/net/wireless/ath/ath12k/mac.c | 3 ++-
 drivers/net/wireless/ath/ath12k/p2p.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index fbdfe6424fd7..a772a5b6adc9 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -788,7 +788,8 @@ struct ath12k_link_vif *ath12k_mac_get_arvif(struct ath12k *ar, u32 vdev_id)
 
 	/* To use the arvif returned, caller must have held rcu read lock.
 	 */
-	WARN_ON(!rcu_read_lock_any_held());
+	RCU_LOCKDEP_WARN(!rcu_read_lock_any_held(),
+			 "RCU read lock not held");
 	arvif_iter.vdev_id = vdev_id;
 	arvif_iter.ar = ar;
 
diff --git a/drivers/net/wireless/ath/ath12k/p2p.c b/drivers/net/wireless/ath/ath12k/p2p.c
index 59589748f1a8..caa92612372b 100644
--- a/drivers/net/wireless/ath/ath12k/p2p.c
+++ b/drivers/net/wireless/ath/ath12k/p2p.c
@@ -123,7 +123,8 @@ static void ath12k_p2p_noa_update_vdev_iter(void *data, u8 *mac,
 	struct ath12k_p2p_noa_arg *arg = data;
 	struct ath12k_link_vif *arvif;
 
-	WARN_ON(!rcu_read_lock_any_held());
+	RCU_LOCKDEP_WARN(!rcu_read_lock_any_held(),
+			 "RCU read lock not held");
 	arvif = &ahvif->deflink;
 	if (!arvif->is_created || arvif->ar != arg->ar || arvif->vdev_id != arg->vdev_id)
 		return;
-- 
2.53.0


