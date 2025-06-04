Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C1DC5AE59
	for <ath12k@archiver.kernel.org>; Wed,  4 Jun 2025 02:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g5LR+hVQCBJO0O2U99YQ7WdCDgRl8VME2BoHUymTfGU=; b=reREUHY4lRUdZ9HYTO1g5fBjZj
	7mwLzC/ZVY+lQeIFq7YIjd+GfRcuvVV8reSyFkm25lSbla8blGV9EDJO8M/63U1hUrh1IjnxgjlmE
	Qhznd2khTdVFTRd4RaIc3pnORkmlohvw/dK4q2fF71slAfhsZD7TLhk3ZiK+qbtVXwWdrBX7GpJb1
	jGl6G2yFLX9Z1t6R/qwxY6Iyh2XQYMFzPyX61BS+NmN9ThXx+8fpJPSjGq2Av6gwCkev8G+/zQc1N
	oSRtquLYbIwKmHCarUs79XuLu/B5rdoSNHk5EheX7FpHs292lBSv3KZh9C5KlbHgv+duS7br7X1l9
	IA/MjBEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMdRx-0000000CGZo-0gJJ;
	Wed, 04 Jun 2025 02:01:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMcT3-0000000C7hr-1DKR
	for ath12k@lists.infradead.org;
	Wed, 04 Jun 2025 00:58:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 040AF4A4C0;
	Wed,  4 Jun 2025 00:58:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7B86C4CEF3;
	Wed,  4 Jun 2025 00:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748998736;
	bh=qu8ZpozExl08qP3xK4+hHn21qz11XlWdOYePU30oZL8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZAAQ4RhkI+g+XeFCrB82SshdNhSAt+lSYITc3QJPI9k86KV9/KQZH4A/GB9yavBhc
	 TVRz8Dw3ts3CRbq+hUrMse2ccmYVYKpZr7Fdj9nlsBU7gwC3Urgkdj0t0LXkmPmgkf
	 8mpZXrITkmT9ZoLyBLZF6HtK7eVxPw9qyBzbP7k4e8z2JJEhViGeSXwWi0f1ADeXbT
	 Zuibw44FISHpgPwAyxCL6W12nRqKx1XoIHIjEDKosZ/6Z8fi6KZ0Tqh4zTPl8SZpk4
	 wwT93muQJTNHt71HmtUIrlvMlD9/dttzL95MJ/od15Xg2t3DtwHZ4Fng9hKAPD7hPv
	 tczwEwIZKx3fQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Roopni Devanathan <quic_rdevanat@quicinc.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Ping-Ke Shih <pkshih@realtek.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 101/108] wifi: ath12k: Fix incorrect rates sent to firmware
Date: Tue,  3 Jun 2025 20:55:24 -0400
Message-Id: <20250604005531.4178547-101-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604005531.4178547-1-sashal@kernel.org>
References: <20250604005531.4178547-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.9
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_175857_375136_F91BA679 
X-CRM114-Status: GOOD (  16.43  )
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

From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>

[ Upstream commit cb1790249361ba9396b06b1af2500147e6e42e5e ]

Before firmware assert, if there is a station interface in the device
which is not associated with an AP, the basic rates are set to zero.
Following this, during firmware recovery, when basic rates are zero,
ath12k driver is sending invalid rate codes, which are negative values,
to firmware. This results in firmware assert.

Fix this by checking if rate codes are valid, before sending them
to the firmware.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Reviewed-by: Ping-Ke Shih <pkshih@realtek.com>
Link: https://patch.msgid.link/20250320112426.1956961-1-quic_rdevanat@quicinc.com
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees. ##
Analysis This commit fixes a critical bug that causes firmware crashes
during firmware recovery scenarios, making it an important candidate for
stable backporting. ### Issue Analysis **The Problem:** The commit
addresses a scenario where during firmware recovery, when a station
interface exists but is not associated with an AP, the `basic_rates`
field becomes zero. The original code uses `ffs(bss_conf->basic_rates) -
1` to calculate the basic rate index, which produces a negative value
(-1) when `basic_rates` is zero, since `ffs(0)` returns 0. **Code
Changes Analysis:** 1. **In `ath12k_recalculate_mgmt_rate()`:** ```c -
basic_rate_idx = ffs(bss_conf->basic_rates) - 1; + if
(bss_conf->basic_rates) + basic_rate_idx = __ffs(bss_conf->basic_rates);
+ else + basic_rate_idx = 0; ``` 2. **In
`ath12k_mac_bss_info_changed()`:** ```c - if (mcast_rate > 0) + if
(mcast_rate > 0) { rateidx = mcast_rate - 1; - else - rateidx =
ffs(info->basic_rates) - 1; + } else { + if (info->basic_rates) +
rateidx = __ffs(info->basic_rates); + else + rateidx = 0; + } ``` ###
Why This Should Be Backported **1. Firmware Crash Prevention:** The
commit directly prevents firmware crashes by ensuring invalid rate codes
(negative values) are never sent to firmware. This is a critical
stability fix. **2. Small and Contained Fix:** The changes are minimal
and focused - just adding proper validation for the `basic_rates` field
before using it in rate calculations. The fix doesn't introduce new
features or architectural changes. **3. Common Scenario Impact:** The
issue occurs during firmware recovery when station interfaces exist but
aren't associated - a scenario that can happen during normal operation,
especially in environments with frequent disconnections or recovery
events. **4. Consistent with Stable Tree Criteria:** - Fixes an
important bug affecting users (firmware crashes) - Changes are minimal
and low-risk - No new functionality introduced - Confined to the ath12k
subsystem **5. Similarity to Backported Commits:** This fix follows the
same pattern as the historical examples that were backported (marked
"YES"): - Similar Commit #1: Fixed incorrect multicast/broadcast rate
setting that caused broken mesh paths - Similar Commit #3: Fixed invalid
AMPDU factor calculation - Similar Commit #4: Fixed failed frame
transmission handling to prevent metric calculation issues - Similar
Commit #5: Fixed firmware crash due to invalid peer NSS values **6. Low
Regression Risk:** The fix uses safe fallback behavior (defaulting to
rate index 0) when `basic_rates` is zero, which is much safer than
sending negative rate codes to firmware. The commit addresses a clear
bug that causes firmware stability issues in a common operational
scenario, with a minimal and safe fix that follows established patterns
for stable tree inclusion.

 drivers/net/wireless/ath/ath12k/mac.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 06b2baccd1335..b06836525e2c4 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3413,7 +3413,10 @@ static void ath12k_recalculate_mgmt_rate(struct ath12k *ar,
 	}
 
 	sband = hw->wiphy->bands[def->chan->band];
-	basic_rate_idx = ffs(bss_conf->basic_rates) - 1;
+	if (bss_conf->basic_rates)
+		basic_rate_idx = __ffs(bss_conf->basic_rates);
+	else
+		basic_rate_idx = 0;
 	bitrate = sband->bitrates[basic_rate_idx].bitrate;
 
 	hw_rate_code = ath12k_mac_get_rate_hw_value(bitrate);
@@ -3811,10 +3814,14 @@ static void ath12k_mac_bss_info_changed(struct ath12k *ar,
 		band = def.chan->band;
 		mcast_rate = info->mcast_rate[band];
 
-		if (mcast_rate > 0)
+		if (mcast_rate > 0) {
 			rateidx = mcast_rate - 1;
-		else
-			rateidx = ffs(info->basic_rates) - 1;
+		} else {
+			if (info->basic_rates)
+				rateidx = __ffs(info->basic_rates);
+			else
+				rateidx = 0;
+		}
 
 		if (ar->pdev->cap.supported_bands & WMI_HOST_WLAN_5G_CAP)
 			rateidx += ATH12K_MAC_FIRST_OFDM_RATE_IDX;
-- 
2.39.5


