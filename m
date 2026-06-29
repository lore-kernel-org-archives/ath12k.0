Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD20EC43458
	for <ath12k@archiver.kernel.org>; Mon, 29 Jun 2026 07:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i+ibs0BXtdFZyrd+Y8jWE14DhKLfJywF8YZWUNeuBxg=; b=13ALMhqGu1B3aPg5zJTV0PevNa
	WGfXXoHyXaoI4A4KyKzE1PoCTDdM0TrpHGEFscV3ceCgNHy/8m5f3LC91OwWd+cxCR1zfsJt2hYaD
	PdnRH2gFat9CPEtV5SgMDZB+aR5mFZR8GacrTxzYvB6JbUSardV82E1OlEBuJmKjTjvWAJI1dLcHJ
	nkzU5tuhZY2KB26w7btz8I6kL+7VYnUZK2s91j0NYiSE875IfQ+y5bZltUKW2VN4rO/4lCClaOpR0
	aKyOrS3GoP6Nvm5Vo4P1+1u3VL/wJqdsteNSDix+NJmUY7NPJQPxlOcKMz7KGVy/RD8s2eyUUDQ6T
	v3LDcuyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5zv-0000000DpTB-2SzD;
	Mon, 29 Jun 2026 07:01:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5zt-0000000DpRn-372w
	for ath12k@lists.infradead.org;
	Mon, 29 Jun 2026 07:01:39 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6rPGT2143174
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 07:01:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i+ibs0BXtdFZyrd+Y8jWE14DhKLfJywF8YZWUNeuBxg=; b=nMpRwyWiiUOfIP99
	Me6vWw5b1Nf2D+wBqhsbiyf97vuwCSwsZrb00KU2ZQ0hROhMtr8hmW1jCKOCkIci
	jJAGwsSrv1HOEU3m8ioP6678DA+FsOnWy/KbGxmjNNBK8ZTVgRA2Ql33tQobBHe9
	ojG+pOhI1VIIs4RLb4aUKOYHPQVduRVSHdRxIRfcUsSzLGIIY6nJ19MfaaOx6aGj
	zQpuI9KC2q0wERjLRt2h+KablgcSX68IrDY7RMUQXdkrKU+jJPmQt7bX3ibmChGe
	wZsKcgPFD0POZx2c3BpicCe5JlJaQrjy+5J21jKBuGvTgH/kKorBGf5AqCec4Su3
	7cZOQQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26u758jx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 07:01:36 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c98775daee6so723757a12.1
        for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 00:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782716495; x=1783321295; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i+ibs0BXtdFZyrd+Y8jWE14DhKLfJywF8YZWUNeuBxg=;
        b=VwAXJhcDv6JWmDVS27GhibHBWuH8cm12lR0r3D+7C24zgpX7DEKWwjLEQKWZxxpLr/
         Vpk+64wGwSl+uRIgaO/RYanCCXRo/25IXxty8IAgp7FgptCMaueKzvrQzhIyhikv5IRw
         ugaWYHO7xZslpttEYXgGwEmUkt1GNPO2vPojsvwS+YycRdy5bu7qLyqLLgNsRG7eWpLT
         uv4pI35nOHkbbMISh1gYZ627xRRYtyfTRXlIFzLCxv4JACmujJqDTCzqjaB0/jnHN0df
         SfOGtdHcs7zzKmwozHwHLCAu6LKAekSCwRewSBnwUNWYBdUE7LhzW6dyvIKepzm1lO+g
         CkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782716495; x=1783321295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i+ibs0BXtdFZyrd+Y8jWE14DhKLfJywF8YZWUNeuBxg=;
        b=WFxbbXgE3ltFoTm/72fDzgWi7NIapGOpUNJgkrd0HF/KStMhDw+4UfPCzFV32LQvgv
         fLyrRsCC2uTGyOE/SjF5Mz+oRpl+apIVKHoHRFzGRXHt537HRI2/NabvSHEJunY5uaoI
         ITo29ExAaM23TvdNaaTyoCbmzZigkOx/LqqLMsUtBOAsZNyKKr6LQcx3YwiePsYDfm11
         s0+Hosq4QaVo7ZcsAL8XHNTStXkHLMnZBz1veZFi6GnMD3Dqov/vmtN0K1VaImTBq506
         MHFuLGvDeeqSnPhaMEqv/ieVmufXQyEoemqJPSXgA51ifltPiQqVNW13R0YIsWgWNH0q
         aLXw==
X-Forwarded-Encrypted: i=1; AHgh+RouwdCsRoSBF0Aj1js0I3Tx7gaPKVxGqvi6l5KrL7WZMe7ld1M3ch9/W7goHT8PV7ZeRidC0UQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi2XxtmiGY3C46wV9OLv5DyYM1Wij/P/FtqLTXOK9x2nDscBXC
	fEInOvgDHUrAI4qideyEJh2ofSmNAx4sexdouLL1xWwqqB2GI1EjoNNS2q1LXcv47x41PEU0YZb
	b3xDGDH7bgO2Ae774/LMYd+QGY6rKf9T47ubfnOSFEtqFhnNz5hRXIXuYKn3rALod1ytUajYfrf
	0=
X-Gm-Gg: AfdE7cnEEy4Z9EhSRQA0FX7E/OCmPrHMsSr22eJFwCLjHT/MSB0xGECo7O/XNvpriaI
	DV2sl2GCPshGW+pMXXPfDFbi5G4bzgLNGcCauOhxLubS9F0KV0H9YvFGMfxXr/kYtGDrKxZWZAX
	mvgrWHq/DjixRj+k37CwyulIvooBfH/KeohPdvSzSq9h5XxMz/00yzTsx5+NjMnm+JFIj2EtLey
	QLutHTnG5/19bcuDSS3kWLRVV5X5NcWBj7t3aN/4Im2m2kN7O1G73AL71dvU0guL5JruUG4a4Mh
	YMrFHaKNWfGSXHuglIE1nVNCF085gtr8r+FjPvbHGFerJuHKephdpAdFmHNA3tjsYrm1RNPWVpO
	hBcAtaIOr2j5TXimd/Cth8Jfit2bKa9Tqb3DM+kd4mZMnU0s7tn/DOc/9ScK8MQo5
X-Received: by 2002:a17:90b:5906:b0:37f:fb1d:63fa with SMTP id 98e67ed59e1d1-37ffb1d6759mr2458408a91.15.1782716495112;
        Mon, 29 Jun 2026 00:01:35 -0700 (PDT)
X-Received: by 2002:a17:90b:5906:b0:37f:fb1d:63fa with SMTP id 98e67ed59e1d1-37ffb1d6759mr2458390a91.15.1782716494537;
        Mon, 29 Jun 2026 00:01:34 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e2048ffdbsm5276706a91.17.2026.06.29.00.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 00:01:34 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 15:01:18 +0800
Subject: [PATCH ath-next v2 2/2] wifi: ath12k: fix MLO peer delete race
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-ath12k-mlo-peer-delete-race-v2-2-362b25590d19@oss.qualcomm.com>
References: <20260629-ath12k-mlo-peer-delete-race-v2-0-362b25590d19@oss.qualcomm.com>
In-Reply-To: <20260629-ath12k-mlo-peer-delete-race-v2-0-362b25590d19@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA1OCBTYWx0ZWRfX/Ns23y8kGXRB
 Hal1iR1RQbLXIqQS85eHy9DB33MiYE6Wqjyv9yp/zS2hG8iUrob3oaYy+ST223sJ6IpDGH5RarH
 LdYLlv0xkLuwzRiNZ2qNp5SyxdJkOGM=
X-Authority-Analysis: v=2.4 cv=ftnsol4f c=1 sm=1 tr=0 ts=6a421850 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=MeHltSpte_P3IK7tgeMA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: KxluZS3O2a4IXRcqqfwglssCcMpJKIke
X-Proofpoint-ORIG-GUID: KxluZS3O2a4IXRcqqfwglssCcMpJKIke
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA1OCBTYWx0ZWRfXwM+uJCGfIs4J
 KewDIVU3iiLi6Pu8J0YiF3sxO66IJXeLeBYottukmwuCdOqvvIWqPlznLs0zq9t/yfgm98ebcVg
 vhZxG+pWSvBPW1vpaf5iU48J0w//in9uB/lpUQ5ikUPVW1ezuf0/OuPmbTb+nHbwSpNf9YpCjeS
 aUWOIzCYE0sZfHqzZ/OLMMXOw3bZldDzYdk2kcH9P08hI++C3GUDK97TaX/UcbcwBTZqByD+x6w
 fTiulVj4Q9dxI7mkL8Je9TwKq5LSvaNU4furi8qgFN5P3eW6PgLAs3kG4SDCQXhJAJd3srmnHcm
 BjEOQpz/sCpuQplAzbwe4Xv2ILGxohNmU2nwrr9QmmEIByJsg0yPGyCtjZ1wTpRNTSeRUnfWVVZ
 IKl8LGSd0bHbxccv9IsANcdGDEI4vHy/PVWPHLH1yJMiyiYtxiaecdPEWjQ5F1UBJ6jn1F8kYC5
 9AZAJH7E0U9abf0dr/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_000137_912135_3093A8B3 
X-CRM114-Status: GOOD (  21.30  )
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

ath12k_peer_mlo_link_peers_delete() sends WMI peer_delete for every
link before waiting for any peer_unmap / peer_delete_resp event. The
shared per-radio completion ar->peer_delete_done could not
disambiguate which peer a response was for: every call to
ath12k_peer_delete_send() did
reinit_completion(&ar->peer_delete_done), so when an event for the
first link arrived between two sends it raised the count to 1 and
the second send promptly cleared it; the wait for the second link
then timed out with

    Timeout in receiving peer delete response

Replace the shared completion with a per-radio waiter list, with
each pending ath12k_peer_delete() caller queueing an
ath12k_peer_delete_wait carrying its (vdev_id, addr) and a private
struct completion. ath12k_peer_delete_resp_event() matches the
response against the list under ar->data_lock and signals the
matching waiter.

Also correct the endian conversion in ath12k_peer_delete_resp_event()
logging, and add the missing \n in some logging.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: 8e6f8bc28603 ("wifi: ath12k: Add MLO station state change handling")
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c |   2 +-
 drivers/net/wireless/ath/ath12k/core.h |   5 +-
 drivers/net/wireless/ath/ath12k/mac.c  |   2 +-
 drivers/net/wireless/ath/ath12k/peer.c | 130 ++++++++++++++++++++++++++-------
 drivers/net/wireless/ath/ath12k/peer.h |  14 +++-
 drivers/net/wireless/ath/ath12k/wmi.c  |  16 ++--
 6 files changed, 131 insertions(+), 38 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 742d4fd1b598..f71650039292 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1524,7 +1524,7 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
 			complete_all(&ar->scan.completed);
 			complete(&ar->scan.on_channel);
 			complete(&ar->peer_assoc_done);
-			complete(&ar->peer_delete_done);
+			ath12k_peer_delete_wait_flush(ar);
 			complete(&ar->install_key_done);
 			complete(&ar->vdev_setup_done);
 			complete(&ar->vdev_delete_done);
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index fc5127b5c1a3..1436ff4316e7 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -665,7 +665,8 @@ struct ath12k {
 
 	/* protects the radio specific data like debug stats, ppdu_stats_info stats,
 	 * vdev_stop_status info, scan data, ath12k_sta info, ath12k_link_vif info,
-	 * channel context data, survey info, test mode data, regd_channel_update_queue.
+	 * channel context data, survey info, test mode data, regd_channel_update_queue,
+	 * peer_delete_waits.
 	 */
 	spinlock_t data_lock;
 
@@ -687,7 +688,7 @@ struct ath12k {
 	u8 radio_idx;
 
 	struct completion peer_assoc_done;
-	struct completion peer_delete_done;
+	struct list_head peer_delete_waits;
 
 	int install_key_status;
 	struct completion install_key_done;
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 2e5a075191ae..4c86a8eb5841 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -15040,11 +15040,11 @@ static void ath12k_mac_setup(struct ath12k *ar)
 	spin_lock_init(&ar->dp.ppdu_list_lock);
 	INIT_LIST_HEAD(&ar->arvifs);
 	INIT_LIST_HEAD(&ar->dp.ppdu_stats_info);
+	INIT_LIST_HEAD(&ar->peer_delete_waits);
 
 	init_completion(&ar->vdev_setup_done);
 	init_completion(&ar->vdev_delete_done);
 	init_completion(&ar->peer_assoc_done);
-	init_completion(&ar->peer_delete_done);
 	init_completion(&ar->install_key_done);
 	init_completion(&ar->bss_survey_done);
 	init_completion(&ar->scan.started);
diff --git a/drivers/net/wireless/ath/ath12k/peer.c b/drivers/net/wireless/ath/ath12k/peer.c
index c222bdaa333c..5084e8c42a3f 100644
--- a/drivers/net/wireless/ath/ath12k/peer.c
+++ b/drivers/net/wireless/ath/ath12k/peer.c
@@ -9,6 +9,55 @@
 #include "debug.h"
 #include "debugfs.h"
 
+static void ath12k_peer_delete_wait_register(struct ath12k *ar,
+					     struct ath12k_peer_delete_wait *wait,
+					     u32 vdev_id, const u8 *addr)
+{
+	wait->vdev_id = vdev_id;
+	ether_addr_copy(wait->addr, addr);
+	init_completion(&wait->done);
+
+	spin_lock_bh(&ar->data_lock);
+	list_add(&wait->list, &ar->peer_delete_waits);
+	spin_unlock_bh(&ar->data_lock);
+}
+
+static void ath12k_peer_delete_wait_unregister(struct ath12k *ar,
+					       struct ath12k_peer_delete_wait *wait)
+{
+	spin_lock_bh(&ar->data_lock);
+	list_del(&wait->list);
+	spin_unlock_bh(&ar->data_lock);
+}
+
+void ath12k_peer_delete_resp_signal(struct ath12k *ar, u32 vdev_id, const u8 *addr)
+{
+	struct ath12k_peer_delete_wait *wait;
+
+	guard(spinlock_bh)(&ar->data_lock);
+
+	list_for_each_entry(wait, &ar->peer_delete_waits, list) {
+		if (wait->vdev_id == vdev_id &&
+		    ether_addr_equal(wait->addr, addr)) {
+			complete(&wait->done);
+			return;
+		}
+	}
+
+	ath12k_warn(ar->ab, "failed to find link peer with vdev id %u addr %pM\n",
+		    vdev_id, addr);
+}
+
+void ath12k_peer_delete_wait_flush(struct ath12k *ar)
+{
+	struct ath12k_peer_delete_wait *wait;
+
+	spin_lock_bh(&ar->data_lock);
+	list_for_each_entry(wait, &ar->peer_delete_waits, list)
+		complete(&wait->done);
+	spin_unlock_bh(&ar->data_lock);
+}
+
 static int ath12k_wait_for_dp_link_peer_common(struct ath12k_base *ab, int vdev_id,
 					       const u8 *addr, bool expect_mapped)
 {
@@ -62,20 +111,19 @@ static int ath12k_wait_for_peer_deleted(struct ath12k *ar, int vdev_id, const u8
 	return ath12k_wait_for_dp_link_peer_common(ar->ab, vdev_id, addr, false);
 }
 
-int ath12k_wait_for_peer_delete_done(struct ath12k *ar, u32 vdev_id,
-				     const u8 *addr)
+int ath12k_wait_for_peer_delete_done(struct ath12k *ar,
+				     struct ath12k_peer_delete_wait *wait)
 {
-	int ret;
 	unsigned long time_left;
+	int ret;
 
-	ret = ath12k_wait_for_peer_deleted(ar, vdev_id, addr);
+	ret = ath12k_wait_for_peer_deleted(ar, wait->vdev_id, wait->addr);
 	if (ret) {
-		ath12k_warn(ar->ab, "failed wait for peer deleted");
+		ath12k_warn(ar->ab, "failed wait for peer deleted\n");
 		return ret;
 	}
 
-	time_left = wait_for_completion_timeout(&ar->peer_delete_done,
-						3 * HZ);
+	time_left = wait_for_completion_timeout(&wait->done, 3 * HZ);
 	if (time_left == 0) {
 		ath12k_warn(ar->ab, "Timeout in receiving peer delete response\n");
 		return -ETIMEDOUT;
@@ -91,8 +139,6 @@ static int ath12k_peer_delete_send(struct ath12k *ar, u32 vdev_id, const u8 *add
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
-	reinit_completion(&ar->peer_delete_done);
-
 	ret = ath12k_wmi_send_peer_delete_cmd(ar, addr, vdev_id);
 	if (ret) {
 		ath12k_warn(ab,
@@ -106,6 +152,7 @@ static int ath12k_peer_delete_send(struct ath12k *ar, u32 vdev_id, const u8 *add
 
 int ath12k_peer_delete(struct ath12k *ar, u32 vdev_id, u8 *addr)
 {
+	struct ath12k_peer_delete_wait wait;
 	int ret;
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
@@ -114,17 +161,25 @@ int ath12k_peer_delete(struct ath12k *ar, u32 vdev_id, u8 *addr)
 				     &(ath12k_ar_to_ah(ar)->dp_hw), vdev_id,
 				     addr, ar->hw_link_id);
 
+	/*
+	 * Register the stack waiter before sending so the resp_event for
+	 * this peer cannot arrive while no waiter is queued.
+	 */
+	ath12k_peer_delete_wait_register(ar, &wait, vdev_id, addr);
+
 	ret = ath12k_peer_delete_send(ar, vdev_id, addr);
 	if (ret)
-		return ret;
+		goto out;
 
-	ret = ath12k_wait_for_peer_delete_done(ar, vdev_id, addr);
+	ret = ath12k_wait_for_peer_delete_done(ar, &wait);
 	if (ret)
-		return ret;
+		goto out;
 
 	ar->num_peers--;
 
-	return 0;
+out:
+	ath12k_peer_delete_wait_unregister(ar, &wait);
+	return ret;
 }
 
 static int ath12k_wait_for_peer_created(struct ath12k *ar, int vdev_id, const u8 *addr)
@@ -184,22 +239,26 @@ int ath12k_peer_create(struct ath12k *ar, struct ath12k_link_vif *arvif,
 	peer = ath12k_dp_link_peer_find_by_vdev_and_addr(dp, arg->vdev_id,
 							 arg->peer_addr);
 	if (!peer) {
+		struct ath12k_peer_delete_wait wait;
+
 		spin_unlock_bh(&dp->dp_lock);
 		ath12k_warn(ar->ab, "failed to find peer %pM on vdev %i after creation\n",
 			    arg->peer_addr, arg->vdev_id);
 
-		reinit_completion(&ar->peer_delete_done);
+		ath12k_peer_delete_wait_register(ar, &wait, arg->vdev_id,
+						 arg->peer_addr);
 
 		ret = ath12k_wmi_send_peer_delete_cmd(ar, arg->peer_addr,
 						      arg->vdev_id);
 		if (ret) {
 			ath12k_warn(ar->ab, "failed to delete peer vdev_id %d addr %pM\n",
 				    arg->vdev_id, arg->peer_addr);
+			ath12k_peer_delete_wait_unregister(ar, &wait);
 			return ret;
 		}
 
-		ret = ath12k_wait_for_peer_delete_done(ar, arg->vdev_id,
-						       arg->peer_addr);
+		ret = ath12k_wait_for_peer_delete_done(ar, &wait);
+		ath12k_peer_delete_wait_unregister(ar, &wait);
 		if (ret)
 			return ret;
 
@@ -283,13 +342,14 @@ u16 ath12k_peer_ml_alloc(struct ath12k_hw *ah)
 
 int ath12k_peer_mlo_link_peers_delete(struct ath12k_vif *ahvif, struct ath12k_sta *ahsta)
 {
+	DECLARE_BITMAP(registered, IEEE80211_MLD_MAX_NUM_LINKS);
 	struct ieee80211_sta *sta = ath12k_ahsta_to_sta(ahsta);
 	struct ath12k_hw *ah = ahvif->ah;
 	struct ath12k_link_vif *arvif;
 	struct ath12k_link_sta *arsta;
+	int ret, err_ret = 0;
 	unsigned long links;
 	struct ath12k *ar;
-	int ret, err_ret = 0;
 	u8 link_id;
 
 	lockdep_assert_wiphy(ah->hw->wiphy);
@@ -297,8 +357,19 @@ int ath12k_peer_mlo_link_peers_delete(struct ath12k_vif *ahvif, struct ath12k_st
 	if (!sta->mlo)
 		return -EINVAL;
 
-	/* FW expects delete of all link peers at once before waiting for reception
-	 * of peer unmap or delete responses
+	struct ath12k_peer_delete_wait *waits __free(kfree) =
+				kzalloc_objs(*waits, IEEE80211_MLD_MAX_NUM_LINKS);
+	if (!waits)
+		return -ENOMEM;
+
+	bitmap_zero(registered, IEEE80211_MLD_MAX_NUM_LINKS);
+
+	/*
+	 * Firmware expects delete of all link peers at once before waiting
+	 * for reception of peer unmap or delete responses. Phase 1 registers
+	 * a per-link stack waiter and sends WMI peer delete for every
+	 * link; the resp_event handler matches each response to its
+	 * (vdev_id, addr) waiter on ar->peer_delete_waits.
 	 */
 	links = ahsta->links_map;
 	for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
@@ -318,29 +389,36 @@ int ath12k_peer_mlo_link_peers_delete(struct ath12k_vif *ahvif, struct ath12k_st
 					     arvif->vdev_id, arsta->addr,
 					     ar->hw_link_id);
 
+		ath12k_peer_delete_wait_register(ar, &waits[link_id],
+						 arvif->vdev_id, arsta->addr);
+
 		ret = ath12k_peer_delete_send(ar, arvif->vdev_id, arsta->addr);
 		if (ret) {
 			ath12k_warn(ar->ab,
 				    "failed to delete peer vdev_id %d addr %pM ret %d\n",
 				    arvif->vdev_id, arsta->addr, ret);
 			err_ret = ret;
+			ath12k_peer_delete_wait_unregister(ar, &waits[link_id]);
 			continue;
 		}
+
+		set_bit(link_id, registered);
 	}
 
-	/* Ensure all link peers are deleted and unmapped */
+	/*
+	 * Phase 2: wait for unmap + delete_resp on each registered link
+	 * and tear down the waiter.
+	 */
 	links = ahsta->links_map;
 	for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
-		arvif = wiphy_dereference(ah->hw->wiphy, ahvif->link[link_id]);
-		arsta = wiphy_dereference(ah->hw->wiphy, ahsta->link[link_id]);
-		if (!arvif || !arsta)
+		if (!test_bit(link_id, registered))
 			continue;
 
+		arvif = wiphy_dereference(ah->hw->wiphy, ahvif->link[link_id]);
 		ar = arvif->ar;
-		if (!ar)
-			continue;
 
-		ret = ath12k_wait_for_peer_delete_done(ar, arvif->vdev_id, arsta->addr);
+		ret = ath12k_wait_for_peer_delete_done(ar, &waits[link_id]);
+		ath12k_peer_delete_wait_unregister(ar, &waits[link_id]);
 		if (ret) {
 			err_ret = ret;
 			continue;
diff --git a/drivers/net/wireless/ath/ath12k/peer.h b/drivers/net/wireless/ath/ath12k/peer.h
index 49d89796bc46..9343944c2b8e 100644
--- a/drivers/net/wireless/ath/ath12k/peer.h
+++ b/drivers/net/wireless/ath/ath12k/peer.h
@@ -9,13 +9,23 @@
 
 #include "dp_peer.h"
 
+struct ath12k_peer_delete_wait {
+	struct list_head list;
+	u32 vdev_id;
+	u8 addr[ETH_ALEN];
+	struct completion done;
+};
+
+void ath12k_peer_delete_resp_signal(struct ath12k *ar, u32 vdev_id, const u8 *addr);
+void ath12k_peer_delete_wait_flush(struct ath12k *ar);
+
 void ath12k_peer_cleanup(struct ath12k *ar, u32 vdev_id);
 int ath12k_peer_delete(struct ath12k *ar, u32 vdev_id, u8 *addr);
 int ath12k_peer_create(struct ath12k *ar, struct ath12k_link_vif *arvif,
 		       struct ieee80211_sta *sta,
 		       struct ath12k_wmi_peer_create_arg *arg);
-int ath12k_wait_for_peer_delete_done(struct ath12k *ar, u32 vdev_id,
-				     const u8 *addr);
+int ath12k_wait_for_peer_delete_done(struct ath12k *ar,
+				     struct ath12k_peer_delete_wait *wait);
 int ath12k_peer_mlo_link_peers_delete(struct ath12k_vif *ahvif, struct ath12k_sta *ahsta);
 struct ath12k_ml_peer *ath12k_peer_ml_find(struct ath12k_hw *ah,
 					   const u8 *addr);
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 84a31b953db8..6066ca8d9fc4 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -7072,25 +7072,29 @@ static void ath12k_peer_delete_resp_event(struct ath12k_base *ab, struct sk_buff
 {
 	struct wmi_peer_delete_resp_event peer_del_resp;
 	struct ath12k *ar;
+	u32 vdev_id;
 
 	if (ath12k_pull_peer_del_resp_ev(ab, skb, &peer_del_resp) != 0) {
-		ath12k_warn(ab, "failed to extract peer delete resp");
+		ath12k_warn(ab, "failed to extract peer delete resp\n");
 		return;
 	}
 
+	vdev_id = le32_to_cpu(peer_del_resp.vdev_id);
+
 	rcu_read_lock();
-	ar = ath12k_mac_get_ar_by_vdev_id(ab, le32_to_cpu(peer_del_resp.vdev_id));
+	ar = ath12k_mac_get_ar_by_vdev_id(ab, vdev_id);
 	if (!ar) {
-		ath12k_warn(ab, "invalid vdev id in peer delete resp ev %d",
-			    peer_del_resp.vdev_id);
+		ath12k_warn(ab, "invalid vdev id in peer delete resp ev %d\n",
+			    vdev_id);
 		rcu_read_unlock();
 		return;
 	}
 
-	complete(&ar->peer_delete_done);
+	ath12k_peer_delete_resp_signal(ar, vdev_id,
+				       peer_del_resp.peer_macaddr.addr);
 	rcu_read_unlock();
 	ath12k_dbg(ab, ATH12K_DBG_WMI, "peer delete resp for vdev id %d addr %pM\n",
-		   peer_del_resp.vdev_id, peer_del_resp.peer_macaddr.addr);
+		   vdev_id, peer_del_resp.peer_macaddr.addr);
 }
 
 static void ath12k_vdev_delete_resp_event(struct ath12k_base *ab,

-- 
2.25.1


