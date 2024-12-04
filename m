Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBE5E7716D
	for <ath12k@archiver.kernel.org>; Wed,  4 Dec 2024 16:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1YiiXFeIdmx9hw3Q1w7ns/FP5fQjFfkjjTQBM2L2UKw=; b=cJX89ltfwuu3uf31tDj3Fe4iod
	5qBuRf14fnF84Yxp1ewVEVwoaNGz8KoK2U0hlz0ZjhGX5ic1hgVuEZZMYBj1nEeL6V1O++fBjBGNY
	47pP4+1Dm0R47FR7lKqbUo6dQaBZbMypulcVfzPFZ1s69jTbC9K9UlFlDxOwnpiId7Gf3mMr5vHD7
	2nTKBn+L/CcqNdpTbPSFSI83QFhQmaNKUWOQ4+i0VVQBHUiCyhS0Imsz1erEKB7VhCZW4Y7jawVvK
	ooGWEIq95WOko3x/sKrZeFGbF0t/F8JR5y7sz9geVgvJAz+DLPh+P0P1PDFcDXToHrnjo8dY/YcSb
	S/dFCJTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIsIj-0000000DCXq-2IWV
	for ath12k@archiver.kernel.org;
	Wed, 04 Dec 2024 16:32:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIsIh-0000000DCWe-2hMp
	for ath12k@bombadil.infradead.org;
	Wed, 04 Dec 2024 16:32:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=1YiiXFeIdmx9hw3Q1w7ns/FP5fQjFfkjjTQBM2L2UKw=; b=KrN53IB1ZqPrqWChuCxcoSi6Ae
	ky9dWl+US5npdcXDJ+w60gAfmmzFxfNooqu/TioJi7Z0x8k++L1Z+8ME+M2o6myl3x39y6Cj8dOh2
	uAFwLRR3mHg83bNmMDkgmXiR2s8V1ZfJdYOmBzkW4WVR/WThdbMVeQzLJLu7dTUnVT77TIEhT0VDn
	l+UB6IoA1sw4rpGv6mm0eR1u4ECiHPLck3Fv0HfCD+Nqa0SV1XjwI9uZgxkle5qzfbaqzsW2YkjhR
	T2JB+6ZD1kaHw4PY6/b06K9yq6dAUcXVmbmXn55LKBft6W00YjLBp0QDA3/tVnW4NXetKuJ3TyD/N
	0QFX/LJA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIsIe-00000002etz-2mMP
	for ath12k@lists.infradead.org;
	Wed, 04 Dec 2024 16:32:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3B0045C6F6F
	for <ath12k@lists.infradead.org>; Wed,  4 Dec 2024 16:31:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42C76C4CED2;
	Wed,  4 Dec 2024 16:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733329946;
	bh=suF5wjzH9zVda5puY3Df1rUEkESjUa138xAJbbDq2XA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fd2n3ADcilUxOZotIFVRi7WwKb4sI1aelt+fLU1dFqB5f6vH13NoZzFl4d7pBk/WK
	 G7dbvUyK+441RVWnB/5kclWyIK98dU2R0nLTiegpB24tBQLOyU1kHaehYw4I7L+UUm
	 9yGyu0f00KCA16eG4lyX0xeFjFpwtoL/W5MD7i+qSbCp2es1lAV5SdFH8dHrEHMcDc
	 0ra+Z+4l1qOwjinn+xhC798t5bMRo5PligpPlStzpiJ5EBeqGTK4dIaP9OijBiKHSG
	 fCYJzJP+m8C2vX8Qu24R3VjaITKqShBSCC41TBMjXKsPR8G2bxOnyj82E4bvwKxug8
	 uhg82kiECtMRQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 7/7] wifi: ath12k: introduce mlo_capable flag for device group
Date: Wed,  4 Dec 2024 18:32:16 +0200
Message-Id: <20241204163216.433795-8-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204163216.433795-1-kvalo@kernel.org>
References: <20241204163216.433795-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_163229_139501_75D18596 
X-CRM114-Status: GOOD (  18.61  )
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

From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

Currently, during mac80211 allocate and register single device is
considered for the registration. But, in future, during multi device
group abstraction is introduced, all the devices has to be combined
together as a single abstraction and then hardware should be allocated.

All the devices in the group should be combined together only if it
supports inter device mlo capability. The decision of whether to combine
the devices or not can be based on the mlo capability flag in
ath12k_hw_group.

By default, mlo_capable flag in the group would be set as false. During
QMI PHY capability exchange, only when we have more than one chip in the
group or if one chip, then that chip supports inter MLO, then mlo_capable
flag in the group will be enabled.

Add changes to introduce mlo_capable flag for device group and refactor
ath12k_mac_hw_allocate() api based on device group (ag) rather than
device (ab).

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 17 +++++++++++++++++
 drivers/net/wireless/ath/ath12k/core.h |  3 +++
 drivers/net/wireless/ath/ath12k/mac.c  |  8 +++++---
 drivers/net/wireless/ath/ath12k/qmi.c  |  6 ++++--
 4 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 18b29515c6ae..49d1ac15cb7a 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1439,6 +1439,7 @@ static struct ath12k_hw_group *ath12k_core_hw_group_assign(struct ath12k_base *a
 	ab->device_id = ag->num_probed++;
 	ag->ab[ab->device_id] = ab;
 	ab->ag = ag;
+	ag->mlo_capable = false;
 
 	return ag;
 }
@@ -1548,6 +1549,22 @@ static int ath12k_core_hw_group_create(struct ath12k_hw_group *ag)
 	return 0;
 }
 
+void ath12k_core_hw_group_set_mlo_capable(struct ath12k_hw_group *ag)
+{
+	lockdep_assert_held(&ag->mutex);
+
+	/* If more than one devices are grouped, then inter MLO
+	 * functionality can work still independent of whether internally
+	 * each device supports single_chip_mlo or not.
+	 * Only when there is one device, then it depends whether the
+	 * device can support intra chip MLO or not
+	 */
+	if (ag->num_devices > 1)
+		ag->mlo_capable = true;
+	else
+		ag->mlo_capable = ag->ab[0]->single_chip_mlo_supp;
+}
+
 int ath12k_core_init(struct ath12k_base *ab)
 {
 	struct ath12k_hw_group *ag;
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 64252d6491cd..458e3d0071a8 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -844,6 +844,7 @@ struct ath12k_hw_group {
 	 */
 	struct ath12k_hw *ah[ATH12K_GROUP_MAX_RADIO];
 	u8 num_hw;
+	bool mlo_capable;
 };
 
 /* Master structure to hold the hw data which may be used in core module */
@@ -1066,6 +1067,8 @@ u32 ath12k_core_get_max_station_per_radio(struct ath12k_base *ab);
 u32 ath12k_core_get_max_peers_per_radio(struct ath12k_base *ab);
 u32 ath12k_core_get_max_num_tids(struct ath12k_base *ab);
 
+void ath12k_core_hw_group_set_mlo_capable(struct ath12k_hw_group *ag);
+
 static inline const char *ath12k_scan_state_str(enum ath12k_scan_state state)
 {
 	switch (state) {
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 1cf724a530b5..c4eab4c1c10e 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -10968,10 +10968,12 @@ int ath12k_mac_allocate(struct ath12k_hw_group *ag)
 	/* All pdev get combined and register as single wiphy based on
 	 * hardware group which participate in multi-link operation else
 	 * each pdev get register separately.
-	 *
-	 * Currently, registering as single pdevs.
 	 */
-	radio_per_hw = 1;
+	if (ag->mlo_capable)
+		radio_per_hw = total_radio;
+	else
+		radio_per_hw = 1;
+
 	num_hw = total_radio / radio_per_hw;
 
 	if (WARN_ON(num_hw >= ATH12K_GROUP_MAX_RADIO))
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 2591d132a3fc..ba3cd2342465 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2023,9 +2023,9 @@ static void ath12k_host_cap_parse_mlo(struct ath12k_base *ab,
 	u8 hw_link_id = 0;
 	int i;
 
-	if (!ab->single_chip_mlo_supp) {
+	if (!ab->ag->mlo_capable) {
 		ath12k_dbg(ab, ATH12K_DBG_QMI,
-			   "intra device MLO is disabled hence skip QMI MLO cap");
+			   "MLO is disabled hence skip QMI MLO cap");
 		return;
 	}
 
@@ -3170,6 +3170,8 @@ int ath12k_qmi_event_server_arrive(struct ath12k_qmi *qmi)
 	mutex_lock(&ag->mutex);
 
 	if (ath12k_qmi_hw_group_host_cap_ready(ag)) {
+		ath12k_core_hw_group_set_mlo_capable(ag);
+
 		block_ab = ath12k_qmi_hw_group_find_blocked(ag);
 		if (block_ab)
 			ath12k_qmi_trigger_host_cap(block_ab);
-- 
2.39.5


