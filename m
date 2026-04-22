Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D757EFA1FDE
	for <ath12k@archiver.kernel.org>; Wed, 22 Apr 2026 18:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dXm+cvPf8Xjp+Os3ArHn258/YE9KQwcLs3zxc5vFNZA=; b=hz+Y/3JATL/0hLB31xJXHITZy+
	BovYXjsxbIT/WpDNJswz05buKaIDVyu5vnYgXy0b3jr/wETv/cT8kXAmF5149FvAjumLIWG+PakBJ
	Lh4MxRHGLDPMqIlw1mHmh2FNYWNr5ylXKesHrA0cEhRnRob+8UcxROs9YlBlI3l5KA6oGGRqi0IQZ
	IvevF07mKHnbNwzO6klwhmScZEcqHvrzxvRTsJt+IjXD7HOYVzI5eqCxd+7AJgDPNA99mFfDuHb6S
	qvKE4OtoIGJPNeLxPgS4WLvaAkh8QiW6pxPPmYx8Q7Bpk2yy62hsT7e4rW0iPYM5xM//v3Lh9hrgD
	b29P9lDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFc04-0000000Abic-2Dos;
	Wed, 22 Apr 2026 18:08:36 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFbzx-0000000Abhr-3lPf
	for ath12k@lists.infradead.org;
	Wed, 22 Apr 2026 18:08:34 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-35da8d037a5so2819014a91.0
        for <ath12k@lists.infradead.org>; Wed, 22 Apr 2026 11:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776881308; x=1777486108; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dXm+cvPf8Xjp+Os3ArHn258/YE9KQwcLs3zxc5vFNZA=;
        b=qJAPoxmT58603Vpdz5j6o2JyBn5wJEsh7b5oppRg1UlzLQTJ7QjUsRfVZwcf8hY1mT
         UDWIhlsJJ8XpjBA+/MVL9Khz6jmKxj3fO/LWMOReO7rX58dYY6xKd2o/BypMFYE/wF4Y
         L5jZw/Hg3xzSbmJj5KblSw8ZnnXqA2lDI62DCVO6nHKRyH1Sixq4e5NmI2sEIdd6Elle
         gA2MCwDbZ8HpIgQQEEW8xHLry8x0lrgfcq3Obfj5sdH89e1lFIpHFyfDLv1Gwz82ZSQJ
         UvKIDEoZ+H4iqKRvBrhCsDoBJB9E9Bof7Wnypn0teOZRCWayYeIk1SBwBLab9aL/caNW
         ANTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776881308; x=1777486108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dXm+cvPf8Xjp+Os3ArHn258/YE9KQwcLs3zxc5vFNZA=;
        b=D3dYSRimi45aAKvvjMrRcTtYsUOrf/mfaqIOGGmDNr1DhHw29k8nhomNHHINtfcjLs
         vYfRREiO9LWoilDJrxTq2hAL3r2JvYzyjomqdVJJ7cRi9HC+0KqD0eEC0oKsPV4ehRkN
         3+teng/y2snLBu3xxuzQT7StKd4yAKL4glk27yp4HSQE2w5Wj7dbe9V7xCRbRA1vo8+q
         4yE3YycTfAHwqsnq+CoLsHmX6HbPjQ/zkarPJ8mSBVgD21fqD7fczsbeEUCF6DAr4tu2
         hhr/CIAGJarv22+zn2Wny1+kJMmIO2OArbOzj3VNBa5UrNfBOz9E3dyU1RfgrWYsOrBu
         s3PA==
X-Forwarded-Encrypted: i=1; AFNElJ8A8BGvJ1pxEA3gNw4LQ/EJgalXGuNX0IVuWE8PdqZyAvTz2CimGuYURzFo4r/v+2kFlbeHj+U=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyul0GWNM+euvjubhIkSjNIi+rvLHGH+Vcap+pSqBG+dt0XTrCN
	hjoR+Bi7lIcPvW/2hACxfuvyvLxhshIWUuakdLIIu3qHaJizzs5msCQ1
X-Gm-Gg: AeBDieu3j9xtFwp4shGXeYC6rjzI79aUU80lWXcAXcnpLOshK2ZdAzCTHFcQjcbo6xJ
	tNvnyfjlkqv8ycGnVw/nnLwlZn2egSbQumckz2CIrQQTdeB/WfI1EvJGjRidwPEjg/amniZTMv6
	qhq26nGjGvIY/RS9ewvFSoh2Gq6FNrPSQNwEa6gsCjQt9+zg0sKnSCkwgpyhL5LVcEwbGXOnMkM
	fNkLGSmbelthAZ6mPDnU4yZgtwgk20Dh7YeZWicHsOJH0r7RXjHQjkpcfhNYY0ec+TERv6KLcnN
	+ZaGz9RIDrg0JYkrlflpPpVVGaLO/UjcCUBJ6ijFYMNMK1LPwh3kVGY5uqb91u6eYMn3uWz4GX5
	ts0NDDpia5wlWVj1wiaqGmjtlWZZp81n2jrLOK4GDDKTFub/VTnUPL2DCpdiDmcHfvWU6LYjLjJ
	6AriyzD6UQ/SAyQvbQu/0NH83TfSHofbzQ/AX5rrRovay4xnD3F4YY/OdQ2gEzpBrAwjrc804Kx
	C4v6g==
X-Received: by 2002:a17:90a:e704:b0:35f:b1ad:fdfc with SMTP id 98e67ed59e1d1-361404b0aaemr22056621a91.27.1776881308057;
        Wed, 22 Apr 2026 11:08:28 -0700 (PDT)
Received: from lenovo.localdomain (211-23-53-87.hinet-ip.hinet.net. [211.23.53.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab3a929sm166137985ad.72.2026.04.22.11.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 11:08:27 -0700 (PDT)
From: Yu-Hsiang Tseng <asas1asas200@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	ath12k@lists.infradead.org
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: [PATCH v3] wifi: ath12k: use lockdep_assert_in_rcu_read_lock() for RCU assertions
Date: Thu, 23 Apr 2026 02:08:14 +0800
Message-ID: <20260422180814.1938317-1-asas1asas200@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_110829_941415_7AE513D0 
X-CRM114-Status: GOOD (  12.78  )
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

On kernels using preemptible RCU (CONFIG_PREEMPT=y or CONFIG_PREEMPT_RT=y)
without CONFIG_DEBUG_LOCK_ALLOC, this produces a false positive splat
whenever these functions are invoked from paths that do hold the RCU
read lock (e.g. firmware stats processing or mac80211 interface
iteration).

Root cause:

  - Without CONFIG_DEBUG_LOCK_ALLOC, rcu_read_lock_any_held() is a
    static inline that returns !preemptible() as a proxy for "in an
    RCU read section".

  - With preemptible RCU, rcu_read_lock() does not disable preemption.
    A task can therefore be preemptible while legitimately holding an
    RCU read lock, making the proxy unreliable.

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

Replace WARN_ON(!rcu_read_lock_any_held()) with
lockdep_assert_in_rcu_read_lock(), which is gated on CONFIG_PROVE_RCU
and therefore compiles out entirely when PROVE_RCU is disabled.
PROVE_RCU kernels continue to get the full lockdep-based check, and
the new helper precisely checks for rcu_read_lock() rather than any
RCU variant, which better matches the callers' expectations.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Fixes: 3dd2c68f206e ("wifi: ath12k: prepare vif data structure for MLO handling")
Suggested-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Signed-off-by: Yu-Hsiang Tseng <asas1asas200@gmail.com>
---
Changes in v3:
  - Use lockdep_assert_in_rcu_read_lock() instead of RCU_LOCKDEP_WARN()
    for clearer intent and more precise semantics (suggested by
    Sebastian Andrzej Siewior)
  - Reword commit message: this affects preemptible RCU in general,
    not only PREEMPT_RT
  - Move Tested-on before the official tags per ath convention

Changes in v2:
  - Also fix the same WARN_ON() in ath12k_p2p_noa_update_vdev_iter()
    (suggested by Baochen Qiang)
  - Update commit message to cover both call sites

Link to v1: https://lore.kernel.org/ath12k/20260420161049.695518-1-asas1asas200@gmail.com/
Link to v2: https://lore.kernel.org/ath12k/20260421172500.1050754-1-asas1asas200@gmail.com/

 drivers/net/wireless/ath/ath12k/mac.c | 2 +-
 drivers/net/wireless/ath/ath12k/p2p.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index fbdfe6424fd7..df2334f3bad6 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -788,7 +788,7 @@ struct ath12k_link_vif *ath12k_mac_get_arvif(struct ath12k *ar, u32 vdev_id)
 
 	/* To use the arvif returned, caller must have held rcu read lock.
 	 */
-	WARN_ON(!rcu_read_lock_any_held());
+	lockdep_assert_in_rcu_read_lock();
 	arvif_iter.vdev_id = vdev_id;
 	arvif_iter.ar = ar;
 
diff --git a/drivers/net/wireless/ath/ath12k/p2p.c b/drivers/net/wireless/ath/ath12k/p2p.c
index 59589748f1a8..19ebcd1d8eb2 100644
--- a/drivers/net/wireless/ath/ath12k/p2p.c
+++ b/drivers/net/wireless/ath/ath12k/p2p.c
@@ -123,7 +123,7 @@ static void ath12k_p2p_noa_update_vdev_iter(void *data, u8 *mac,
 	struct ath12k_p2p_noa_arg *arg = data;
 	struct ath12k_link_vif *arvif;
 
-	WARN_ON(!rcu_read_lock_any_held());
+	lockdep_assert_in_rcu_read_lock();
 	arvif = &ahvif->deflink;
 	if (!arvif->is_created || arvif->ar != arg->ar || arvif->vdev_id != arg->vdev_id)
 		return;
-- 
2.53.0


