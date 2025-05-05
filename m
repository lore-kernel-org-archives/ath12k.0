Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABDDC3ABBF
	for <ath12k@archiver.kernel.org>; Tue,  6 May 2025 00:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M4Ur2+L2RdIgcWQTmx5ttEvH3/UifpjoUhie0a3gqCs=; b=m5v2HtHxHd1Z5AS9zF6FzT5uEH
	yqbveo79M92j+JwhpUeYFOdFVxSa0a+IWGOgXJUzoNFzkof06XqSBPGtJG+eUl3DUddkRQBoxS5QD
	Mg/ThO2+Zy11FHTMLnG6NB7oKwabyFhppn8tv2tB2BHF8YHVVXs0YMGTGAHQFmugxi//v7kHWrML3
	P8RdpIIdn9j7PEPd9dw4LT1JL3wh4gNRNw0EX6mgtcx2NZ19hpT0Rc+2TolnhMZOTfNNsy0MrxTpa
	uzmLU5WEpoAOhGIES7kzP15cVU6sk5bYDh/eZsqMwj7E3Qx7XE/rXqRxsTHAkn0X2IPYi+l0LF8Q8
	9DtY2pSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC6Bg-00000009I2k-2B24;
	Tue, 06 May 2025 00:29:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4Oc-00000008neP-26aQ
	for ath12k@lists.infradead.org;
	Mon, 05 May 2025 22:34:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 13345629C6;
	Mon,  5 May 2025 22:34:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D868C4CEF3;
	Mon,  5 May 2025 22:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484485;
	bh=28MycwQojl4yf0AI0YpWwlRGwTopcRDThnxfc93eX6Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rcKUtw7Dh1L6U3jReQ0KXYCuSxuX9pqRjTF68Qd9XQQ2iZFUlq6wrKw+m6GYYFK1s
	 fJlvmr5zU3oop+W12JdE3D3J9TZX2LABGoGeVoukhj1ant3Gsuq7Bsu4ZIlZizr++v
	 eO7A8RSaGgt3MiVkUyKFtR3nHCsllB1LZss6KHgg/6pVt3sA/Ik2vPe51HGJO5Hgrh
	 1FxMXBHWcTcWIlKSKU9P6gAwzyZJJPQ9BYbBzHNQGGGLmoew13orzUOA6qFFar6BFJ
	 htfBhIH22/6z+qZkrdg47O6KhKDFNg4Vs/LmsYg0A7xmcjYjDKk3wtIomIt7cVhWSN
	 yaeJEldgwuWuQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Aaradhana Sahu <quic_aarasahu@quicinc.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 494/642] wifi: ath12k: Enable MLO setup ready and teardown commands for single split-phy device
Date: Mon,  5 May 2025 18:11:50 -0400
Message-Id: <20250505221419.2672473-494-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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

From: Aaradhana Sahu <quic_aarasahu@quicinc.com>

[ Upstream commit 5cec2d86c7f4242fb30a696d8e6fd48109bf3e8f ]

When multi-link operation(MLO) is enabled through follow-up patches in
the single split-phy device, the firmware expects hardware links
(hw_links) information from the driver.

If driver does not send WMI multi-link setup and ready command to the
firmware during MLO setup for single split-phy device, the firmware will
be unaware of the hw_links component of the multi-link operation. This may
lead to firmware assert during multi-link association.

Therefore, enable WMI setup, ready and teardown commands for single
split-phy PCI device.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Link: https://patch.msgid.link/20250207050327.360987-2-quic_aarasahu@quicinc.com
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath12k/core.c | 33 +++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/core.h |  1 +
 drivers/net/wireless/ath/ath12k/mac.c  |  9 +++++++
 3 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 212cd935e60a0..ffd173ff7b08c 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -887,10 +887,41 @@ static void ath12k_core_hw_group_stop(struct ath12k_hw_group *ag)
 	ath12k_mac_destroy(ag);
 }
 
+u8 ath12k_get_num_partner_link(struct ath12k *ar)
+{
+	struct ath12k_base *partner_ab, *ab = ar->ab;
+	struct ath12k_hw_group *ag = ab->ag;
+	struct ath12k_pdev *pdev;
+	u8 num_link = 0;
+	int i, j;
+
+	lockdep_assert_held(&ag->mutex);
+
+	for (i = 0; i < ag->num_devices; i++) {
+		partner_ab = ag->ab[i];
+
+		for (j = 0; j < partner_ab->num_radios; j++) {
+			pdev = &partner_ab->pdevs[j];
+
+			/* Avoid the self link */
+			if (ar == pdev->ar)
+				continue;
+
+			num_link++;
+		}
+	}
+
+	return num_link;
+}
+
 static int __ath12k_mac_mlo_ready(struct ath12k *ar)
 {
+	u8 num_link = ath12k_get_num_partner_link(ar);
 	int ret;
 
+	if (num_link == 0)
+		return 0;
+
 	ret = ath12k_wmi_mlo_ready(ar);
 	if (ret) {
 		ath12k_err(ar->ab, "MLO ready failed for pdev %d: %d\n",
@@ -932,7 +963,7 @@ static int ath12k_core_mlo_setup(struct ath12k_hw_group *ag)
 {
 	int ret, i;
 
-	if (!ag->mlo_capable || ag->num_devices == 1)
+	if (!ag->mlo_capable)
 		return 0;
 
 	ret = ath12k_mac_mlo_setup(ag);
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index ee595794a7aee..6325ac493f82c 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1084,6 +1084,7 @@ int ath12k_core_resume(struct ath12k_base *ab);
 int ath12k_core_suspend(struct ath12k_base *ab);
 int ath12k_core_suspend_late(struct ath12k_base *ab);
 void ath12k_core_hw_group_unassign(struct ath12k_base *ab);
+u8 ath12k_get_num_partner_link(struct ath12k *ar);
 
 const struct firmware *ath12k_core_firmware_request(struct ath12k_base *ab,
 						    const char *filename);
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 9c3e66dbe0c3b..9123ffab55b52 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -11140,6 +11140,9 @@ static int __ath12k_mac_mlo_setup(struct ath12k *ar)
 		}
 	}
 
+	if (num_link == 0)
+		return 0;
+
 	mlo.group_id = cpu_to_le32(ag->id);
 	mlo.partner_link_id = partner_link_id;
 	mlo.num_partner_links = num_link;
@@ -11169,10 +11172,16 @@ static int __ath12k_mac_mlo_teardown(struct ath12k *ar)
 {
 	struct ath12k_base *ab = ar->ab;
 	int ret;
+	u8 num_link;
 
 	if (test_bit(ATH12K_FLAG_RECOVERY, &ab->dev_flags))
 		return 0;
 
+	num_link = ath12k_get_num_partner_link(ar);
+
+	if (num_link == 0)
+		return 0;
+
 	ret = ath12k_wmi_mlo_teardown(ar);
 	if (ret) {
 		ath12k_warn(ab, "failed to send MLO teardown WMI command for pdev %d: %d\n",
-- 
2.39.5


