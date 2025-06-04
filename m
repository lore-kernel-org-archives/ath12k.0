Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50FBC5AD49
	for <ath12k@archiver.kernel.org>; Wed,  4 Jun 2025 02:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f/hitUT486dGD/SkFLhpOmSfv01wLQHzVoU+nn0el+c=; b=t6iKK78anjJpTdMnd8ZhZOWF9k
	NCjuzW79leFiPKivZVoQU+a4LD5dTyqLRhrarBM4XjF6t9Y8C3iIwFQIUwGzJWxbWxquHLzWElMHY
	8GDhx6uDgPJJ6RvsYLcNxYPbpnXjFd0+ClqJbsIyK63uuKcM269KlVsk3SGbIMCaF9fdjbaPV0H+L
	uIvRbYzCSeAUOdPat5NorqN9iI9uZYobsjgliHA9FeACAWi4IZLsj8kyU94eyDCgjWoTyPsnLHwkY
	LQySRI8sKd1IE+1n4xGiBPpnmdjyRVop3DUU7N+g+/T0OB6BhC+ql0pBkihtZqQ8st6Lv1nyK/Jm0
	kWJL8Ucw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMeF3-0000000CMPW-1kf8;
	Wed, 04 Jun 2025 02:52:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMcXx-0000000C8b6-0LBF
	for ath12k@lists.infradead.org;
	Wed, 04 Jun 2025 01:04:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 81C23629E7;
	Wed,  4 Jun 2025 01:04:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1B89C4CEF1;
	Wed,  4 Jun 2025 01:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748999040;
	bh=Hk1M88m9ulqr2UOUxPK5AyrP3Jw9ei/XLLUfhKJwLW8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gp3NSkTSHNjRiADoa52S67UcdDXlUgYHc5nqxgjV5TAOyieqNbT3yTfNaEixK1rjH
	 V+/paxi+eGOdKa8nV00akgtl1K03jnNN+za88TPEQT4Noo/QHwmytEzpoMQyi+6B/u
	 KD7r/DI+Hx4T8n+95dPxIwxLPM80mybtzZjFcA1mskZ7YDV2TBgJOCHgkGSJO3LQc3
	 heSodenseU7Odv+PFtdKpO3y5fZb4VW29RGJCPZWqhJhQ3GPm6I1d6H44OxU0bIkwy
	 OO7COBYNtkyTBEw0qCc8G2xdTzhIK58YzGx4k+5Jp1l/alSHIFicn0WWvTod9jNdaZ
	 q2hBblim3TfGQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Hari Chandrakanthan <quic_haric@quicinc.com>,
	Nicolas Escande <nico.escande@gmail.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 60/62] wifi: ath12k: fix link valid field initialization in the monitor Rx
Date: Tue,  3 Jun 2025 21:02:11 -0400
Message-Id: <20250604010213.3462-60-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604010213.3462-1-sashal@kernel.org>
References: <20250604010213.3462-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.92
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Hari Chandrakanthan <quic_haric@quicinc.com>

[ Upstream commit 2826139f9295821fe2b049318a1cc057ec003131 ]

Currently, the link_valid field is not initialized in the monitor Rx path.
This can result in random values for the link_valid and link_id leads to
undefined behaviour in mac80211. Therefore, initialize the link_valid
field in the monitor Rx path.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Hari Chandrakanthan <quic_haric@quicinc.com>
Tested-by: Nicolas Escande <nico.escande@gmail.com>
Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Link: https://patch.msgid.link/20250324062518.2752822-2-quic_periyasa@quicinc.com
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Based on my analysis of the commit and the code context, here is my
assessment: **YES** This commit should be backported to stable kernel
trees. Here's my extensive analysis: ## Technical Analysis **Code Change
Impact:** The commit adds a single line `status->link_valid = 0;` at the
beginning of the `ath12k_dp_mon_rx_deliver_msdu()` function in the
monitor Rx path. This initializes the `link_valid` field in the
`ieee80211_rx_status` structure before any subsequent processing. **Root
Cause and Problem:** 1. **Uninitialized Memory Issue**: The
`ieee80211_rx_status` structure contains the `link_valid` field (1 bit)
and `link_id` field (4 bits) that were not being initialized in the
monitor Rx path. 2. **Undefined Behavior**: Without initialization,
these fields contain random stack memory values, which can cause
unpredictable behavior in mac80211 when it processes received frames. 3.
**MLO Context**: The `link_valid` and `link_id` fields are specifically
used for Multi-Link Operation (MLO) in WiFi 7, where mac80211 needs to
know which link a frame was received on. ## Why This Should Be
Backported **1. Bug Fix Nature:** - This is clearly a bug fix that
addresses undefined behavior caused by uninitialized fields - The commit
message explicitly states this fixes "undefined behaviour in mac80211" -
Similar to reference commit #2 (which was backported) that fixed
uninitialized variables **2. User Impact:** - Uninitialized fields can
cause mac80211 to make incorrect decisions about packet processing - May
lead to packet drops, incorrect link handling, or other unpredictable
wireless behavior - Monitor mode is commonly used by network analysis
tools, making this user-facing **3. Risk Assessment:** - **Very Low
Risk**: The change is minimal (single line initialization) - **No Side
Effects**: Setting `link_valid = 0` is the correct default for monitor
mode - **Safe Change**: Only affects the monitor Rx path, doesn't change
core functionality **4. Code Pattern Consistency:** Looking at the
regular Rx path in `dp_rx.c`, I can see the same pattern: ```c if
(pubsta && pubsta->valid_links) { status->link_valid = 1;
status->link_id = peer->link_id; } ``` The monitor path was missing the
corresponding initialization, creating an inconsistency where: - Regular
Rx path: Properly sets `link_valid = 1` when appropriate - Monitor Rx
path: Left `link_valid` uninitialized (now fixed to `link_valid = 0`)
**5. Containment:** - Change is confined to a single function in the
monitor path - No architectural changes or new feature additions -
Follows established kernel practices for field initialization **6.
Stable Tree Criteria Match:** - ✅ Important bug fix (undefined behavior)
- ✅ Minimal risk of regression - ✅ Small, contained change - ✅ No new
features - ✅ Affects user-facing functionality (monitor mode) **7.
Reference Precedent:** This follows the same pattern as the backported
commit #2 which fixed uninitialized variables and commit #3 which fixed
incorrect field usage, both of which were deemed suitable for
backporting. The commit properly addresses a real bug that could affect
users of monitor mode with ath12k WiFi 7 devices, with virtually no risk
of introducing regressions.

 drivers/net/wireless/ath/ath12k/dp_mon.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 35f22a4a16cf2..69bf75ebd7518 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -1077,6 +1077,8 @@ static void ath12k_dp_mon_rx_deliver_msdu(struct ath12k *ar, struct napi_struct
 	bool is_mcbc = rxcb->is_mcbc;
 	bool is_eapol_tkip = rxcb->is_eapol;
 
+	status->link_valid = 0;
+
 	if ((status->encoding == RX_ENC_HE) && !(status->flag & RX_FLAG_RADIOTAP_HE) &&
 	    !(status->flag & RX_FLAG_SKIP_MONITOR)) {
 		he = skb_push(msdu, sizeof(known));
-- 
2.39.5


