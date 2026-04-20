Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3F5F588E3
	for <ath12k@archiver.kernel.org>; Mon, 20 Apr 2026 16:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Sxo5kEtdYHH/dmttcUyKVQWx6oJy7kEINBaa4a+z/+s=; b=EbrFFDDwhbfucDaKpBoHRonvAx
	vZSZbfbFEz1W6jZjpXFUvCU2zUhYRquKbIPn1U4hKYq8OMkwqqpaCYKhkR0EdhcpsNA5PyptBa3/C
	38M4dxYthwt8rb2m4iqH5qQSlplkX2ROvQrI61HY88IRo4MjIE1VIGMVkjlwpGUadILCcbT8FW0Gm
	iyuLeITaoKTEflJ4L3THk2MFsDlSeyw8GC6q/ZikQfMTx8h9pU8GPdybEZNOzQLl7RO7052njWsTZ
	EFShhSOKTNCSPBxlQE2NdNuwtVTEcz+5A7bAlHEBefs6UEGclodEQK/2ZBo73qsYGi5d0xzsx+evb
	ZRaDdNdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wErDB-00000007Otq-3YMC;
	Mon, 20 Apr 2026 16:11:01 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wErD9-00000007Ot5-3r25
	for ath12k@lists.infradead.org;
	Mon, 20 Apr 2026 16:11:01 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c6dd5b01e14so1092349a12.0
        for <ath12k@lists.infradead.org>; Mon, 20 Apr 2026 09:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776701459; x=1777306259; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sxo5kEtdYHH/dmttcUyKVQWx6oJy7kEINBaa4a+z/+s=;
        b=LaNlPFAZ6IwOtbLRQQZCQeIdfM6HkaC+8rpz0liro7Wp3vShVP6inPi7AhguQxT1Wz
         EOTAEg9N68Q/uh6eqrePlkuwMyqPkOyZoo17Y06/Acgg+oV4djUClwtdHwfur+vchfq9
         ia/3VUkgVPDuzAInbqe/i30FRHbhrfHYJJKmXDimO7FpxsnUTqleRNkouizNDrh5d9gc
         uoLdQ9YWYz7xMFTZa+dFQsME0lq//FEzYaAjbpWG8bPgyDKxRK0uHCjPDU2dhR37KGca
         7x2SxdnFvGmWzO9kBmvvD9tZVldmptSduyPO1ys9sHxAjDWmBYWWSBbHkQe65GLc4RYt
         DzTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776701459; x=1777306259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sxo5kEtdYHH/dmttcUyKVQWx6oJy7kEINBaa4a+z/+s=;
        b=E2yP2v0bghZmjX4EmqJCR4gCeIue12qa2KACsYL/z9k4Zu3+CZcPdhwN72aIxwhiUk
         zw8wrZLq/RnV1i35IS7VFKDdkOy3TyFxDRLbnVdMCIWaANxtbPhq5UdMUHjhZUNuba/a
         yJ4xMTfWsjxspKWFDD6j68+YahIY6n4jcQm8H//CuoRq0dBtg39ItzHpL2WGclOohhS1
         vmamxcp1G689hyEAbJHGpxVMmA5B1bRascUX0octg2igEyEP+gI/6ihMT3phGp3yiW+Q
         2UhbWKrIwEpHfIkcx+rlcFljjt00tkCnftZDrOiDHSMua7Z0BIsnGFMTx/6KI/iqshkd
         MOQQ==
X-Forwarded-Encrypted: i=1; AFNElJ9foutz294uWYGvpVOwn3oU0YMkQvaVc6lzvN2Pi0VQq3sQqYNQ5KcAWY7AFu70SvL+EAzqjew=@lists.infradead.org
X-Gm-Message-State: AOJu0YwcJHs6oxZUGpOZnK/9pJfB9JFykMqMk2ygljlDGSeTjZJ4coHY
	2295kyaohCjFTaz+Cqb52zduEuGTooXK0u8hUs38rbuCdRwxc1E7UY/q
X-Gm-Gg: AeBDieuxNu/CQ9uLRGSQJSwUsy/02PQY2b3H/4bzXqO0A/hH29+F013lj7x3+Yu8TyG
	SwiiG3DvI3SN0RwB0ItEdNLDRe1+6dIjgVVwkivxFmxTjiJPWBPU48kbEfo/X//Z+1qcJAEF7+L
	XUYPbrYOhTa5SkqFhblBoJ10GzDtFoWeGm7LxIpaHrl26K5FDHZD+JCJri6iMJhuCDrHUaLabYd
	LiCf1XlQXjvv0ckqs2PBl9njteFHHRG7gy+5xdjlNpoe8L+BIHSc1ccDxDXptNUKW/ocXUXpIfe
	RYLWx3zj5Af6SVt0NdazF396h6S042itKr6pvPSAlTUUbU8v3hCclNfsGHL6nnrKWwlAXNimw8B
	bDGA0Ic66CyqPy65UlCZClVGFn40lObnyn2O/qzBdN+Il+SphmTmVO3J+7dL4YV+Ut0btJlzwb1
	lz642HLlVp50UyD/rCr3Opd5EkNMg2NW8hbeYP7mHONacbbxYGeKD6RY3qtw==
X-Received: by 2002:a05:6a20:7285:b0:39f:27ab:2454 with SMTP id adf61e73a8af0-3a08d90d557mr15520783637.49.1776701458590;
        Mon, 20 Apr 2026 09:10:58 -0700 (PDT)
Received: from lenovo.localdomain ([123.110.133.16])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797701b1a3sm8243470a12.19.2026.04.20.09.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 09:10:58 -0700 (PDT)
From: Yu-Hsiang Tseng <asas1asas200@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	ath12k@lists.infradead.org
Cc: Sriram R <quic_srirrama@quicinc.com>,
	Rameshkumar Sundaram <quic_ramess@quicinc.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: [PATCH] wifi: ath12k: fix false positive RCU warning on PREEMPT_RT
Date: Tue, 21 Apr 2026 00:10:49 +0800
Message-ID: <20260420161049.695518-1-asas1asas200@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_091059_958142_297CA315 
X-CRM114-Status: GOOD (  11.03  )
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

ath12k_mac_get_arvif() asserts that the caller holds an RCU read lock:

    WARN_ON(!rcu_read_lock_any_held());

On PREEMPT_RT kernels built with CONFIG_PROVE_RCU=n, this produces a
false positive splat whenever firmware stats events are processed,
even though the caller does hold the RCU read lock.

Root cause:

  - On !PROVE_RCU, rcu_read_lock_any_held() is a static inline that
    returns !preemptible() as a proxy for "in an RCU read section".

  - On PREEMPT_RT, rcu_read_lock() does not disable preemption. A
    task can therefore be preemptible while legitimately holding an
    RCU read lock.

  - ath12k_wmi_tlv_rssi_chain_parse() holds the RCU read lock via
    guard(rcu)() before calling ath12k_mac_get_arvif(), so the
    warning is incorrect.

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
Signed-off-by: Yu-Hsiang Tseng <asas1asas200@gmail.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

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
 
-- 
2.53.0


