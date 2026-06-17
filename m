Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB13CCD98E2
	for <ath12k@archiver.kernel.org>; Wed, 17 Jun 2026 09:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YmgotrVByV7ndgg+t5wTgSkSWrKs9Rj+oRvM7lmSuPY=; b=gEf2U/Gvke1wEKuGY7f88LprF0
	1zB9GZvgnLPrsYHlXpjbKGnROeBOMmhkVgLyCernOMt41GKi8kX0oRV4pgQx9QZz8kjes/yLd3mYX
	mWoyiWUM/p2jUoU9xnFErNdnosH3TPotmOOfO2Yr4SQc9pKXx1DGFnn95Hje1njU3MXXttb4KPWPy
	iOb8H4wd16ab4LwOrwL27UhS6ZLSCPGMip+e5R9sBhFr8wQU5+xeKG+ca2SHO62+ec9ckrG5H5VJF
	/R+RuBlG7/lDU2kas5NERFHdRxfyF5nWp9WEQdFSOiMwGTje96eiIEMRXu8mTQ9VVYnHff7WkYGdS
	8GRPStCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZmZk-0000000GwyF-2mNZ;
	Wed, 17 Jun 2026 09:28:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZmZi-0000000Gwx9-2Has
	for ath12k@lists.infradead.org;
	Wed, 17 Jun 2026 09:28:47 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8V6PD2291351
	for <ath12k@lists.infradead.org>; Wed, 17 Jun 2026 09:28:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YmgotrVByV7ndgg+t5wTgSkSWrKs9Rj+oRvM7lmSuPY=; b=V7kXOq+afa9OPpPl
	OMB8urvLQc8e/DBWGWyBlzWZCWgY03SrnvCLyvgxfrtFMSPj1PHO66NeUYbSxD0N
	c9hkg5uID2s8a5FXFITe4t6teTGcu2jfNuRjAidY/R3tdIrscGFovb39npa0ug07
	/J2PwJj4iIVuRF1LbGqWpu9vLf3YfeG9iUZMO1CRdsk1q6jrvEMe7UCDC625KOyO
	wYYYdXuSdEKialLWfeQI9nEJPitf8sNVJZhRI6kyPhP8HQQOCL19Du+x8zLoIhw+
	tX9O4mysXJiCXLO4vmPZDHRg4YS1lquYD9zG/WL/o4FXadfsJHF3ZYSFF6vFqJcs
	7WaRvA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueevjfnx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 17 Jun 2026 09:28:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c69f08f527so14724845ad.3
        for <ath12k@lists.infradead.org>; Wed, 17 Jun 2026 02:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781688524; x=1782293324; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YmgotrVByV7ndgg+t5wTgSkSWrKs9Rj+oRvM7lmSuPY=;
        b=b3lP/CdV/rfo4d+irM5kNfYBUcZA4JHc1wdtxyYm9VcWySZdrjd5F4VYMJ+XDQvRLk
         Uzr55nQE0xTlwhZKPuBtbU9mX2Q6N29f+glsHBGNq2yUwtTcHKD/AsnzW11BzGJYDMhh
         rZj9/r6lMfWlNKAeHc45zTn2T9G/lw0CJ82eS7FNRqyJRe9yo+scMS5Ad37lJsY7fjuN
         XLJaLGMJH5YSYIsTO4OF9wV8i6aG/ebuScOI6TAo6yWqgMgMFhIkhrk928kQQ5rptIY3
         v/AAyJ2+nc8WEP0yOBOzF/3y2bbvkazff/ks6IUZyAgo3DyZ+3yfn123r1FKOoPVBt7i
         MHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781688524; x=1782293324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YmgotrVByV7ndgg+t5wTgSkSWrKs9Rj+oRvM7lmSuPY=;
        b=EIDapoYr2XglZaLs4ZiqVTXDMj5lJOYEJQ+eNQ3OHl6nGS37f1zJ0/HfhD8ZDpIQ7/
         ZSdAQaeJcbX+1yKkp33d0kXDB5TPvUDmOdVkRfKbNWnBssGrkpSWkdm77i4hs60+19LK
         JeRzvnbdtAKcfMWMjKyDEvUPp1hZU9lUafv3jd5LC1mzhkovLP6o+5kGObV+O+koXKIS
         NCxp0g1xxshmDb+K/a0R0mhVSuL/BxBNLp8ME6OacHyVoS+8A4At5P/R/G306RMwZzQb
         Bt9Yvp8D9B1ROCRB1a4MIqZNs6F9/OLnts4GN0ZvRbmpQNkk9zkqywUxd2GvEI2EyVfN
         1W1w==
X-Forwarded-Encrypted: i=1; AFNElJ8oRDl2eSy42KWmgQjbVOO2vOAMARwKl0sEOj4U487D/7XsPaOpP5JGfzcSDDwMCbD4AwoskaM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4xbOr2cEMIsAnHHt7Xi99y7XZSgztGRdMjm3X6ZWYsP5IWxqu
	Vs1d15YSXfc7A1kz0GvQAYah8pFqMR+phEG9i5E0SxQ3+33JotBFwIXSakIqjFdYRBkQFHV7FRW
	vMdbyqC6DFXrbh4wRIv1eV+QlDcQdwqPC2sDugbCNpLobKT0sUu6e9yDFJ86t2JqL
X-Gm-Gg: AfdE7ckhyAvmNrIuVY6iewQpG4pHr00LHd49VTJAj6OFm3MNA5dCibkz9qseitmoVip
	urWx9PeqbrV9/Qo46zMgm8IzMfaBfPQQd0j5LW/TdPZL9TSnHJWXrayYrfVels7PuDeYEzY/pyD
	UDrordVJfw9Jnd/hx5fkZ88R58UzKzjEvSdeZIc03AFmEh44NlTJoLFCkYHAkE0nocmWRa7rw2U
	vRLT1FZtG+W8WwB3jVgA0RMtBsxg8cG3GKtXOiPdJDHg7ejNmutmquKkM29660gD6Faw4h4k+b3
	f19oQK9zzdc0DAZpU3iz6Cg5Dqvs7T0Fec4euYWf9VED0A9PCeeAD1F8q+bTrzAlSzuWRalrixx
	uJpXTW4vACuG0gkyRSGT+dQ47bL2AH6Ksb2s9XYhxzCPLQX75RmhHHtT+Xq8IjG46
X-Received: by 2002:a17:903:b0d:b0:2c6:95d1:3bbc with SMTP id d9443c01a7336-2c6bc1e0086mr29694775ad.24.1781688524177;
        Wed, 17 Jun 2026 02:28:44 -0700 (PDT)
X-Received: by 2002:a17:903:b0d:b0:2c6:95d1:3bbc with SMTP id d9443c01a7336-2c6bc1e0086mr29694505ad.24.1781688523641;
        Wed, 17 Jun 2026 02:28:43 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c432c8ca31sm157080445ad.55.2026.06.17.02.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 02:28:43 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 17:28:20 +0800
Subject: [PATCH ath-next 2/2] wifi: ath12k: fix MLO peer delete race
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-ath12k-mlo-peer-delete-race-v1-2-ab3c4f455dfb@oss.qualcomm.com>
References: <20260617-ath12k-mlo-peer-delete-race-v1-0-ab3c4f455dfb@oss.qualcomm.com>
In-Reply-To: <20260617-ath12k-mlo-peer-delete-race-v1-0-ab3c4f455dfb@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA4OSBTYWx0ZWRfXzig850BQYD6a
 Ge/yrJDjLMICxSRQAWIAEJPEG7EK9jsbpimVmK7yaF7wjAXAfQNYOuNiAuGqzPB5QAujPFaZcaK
 MRibtHR7A4Y8tEPDgw6UghqzQKOnWMjr4mA3rIb1YBuN8HUxqsVDCU0C814er4PJZ8cU1GDwV0h
 QDnm3kSwJdp4ice/T+U3vEsBuXRiawhEfFMgJnMtChFSapJfRCVrIH24YIO5nnp7IMbSNylimm7
 SEnCC2CjZ/n549Fr7VcvN8YR+mUc8i/QiOMsBNKB4yVSV64p1E8mXghVfoqp7AoI2jv/3Bat6Vl
 ygJAJ4p4oa5d+Zo3yPSrbZTSHY7JOJXUCKo7MOTasVSA/W9PkDGPrsxGtWHEK6UA9tjwakECK7i
 4JS2KfaWUZdTJDcdc0CNwygTlcqfgNo9Nco8feK7D6mgEzl0rGYy5u/+FqfSHiQNysxdQa4aDbc
 bsqLGSzAwhPYckWC4PA==
X-Authority-Analysis: v=2.4 cv=LM1WhpW9 c=1 sm=1 tr=0 ts=6a3268cd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=MeHltSpte_P3IK7tgeMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: lHgeBjgGfSdj7P_uMUOpJcy8JtHr5JKx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA4OSBTYWx0ZWRfXxdFNTaoy8XQQ
 GaqkbAA8MF0IW8/UGJBLZjajZA+B+XZ45+6WdkGBMbbhn3nSRC6FlMkt8P4RsBQ4P6+8PIq+5fy
 SYgcrdG5Ozxu7rZ08i//2zFbdPekyyQ=
X-Proofpoint-ORIG-GUID: lHgeBjgGfSdj7P_uMUOpJcy8JtHr5JKx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_022846_720548_C086FF21 
X-CRM114-Status: GOOD (  20.63  )
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
 drivers/net/wireless/ath/ath12k/peer.h |  19 ++++-
 drivers/net/wireless/ath/ath12k/wmi.c  |  16 ++--
 6 files changed, 136 insertions(+), 38 deletions(-)

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
index c222bdaa333c..98509c63c580 100644
--- a/drivers/net/wireless/ath/ath12k/peer.c
+++ b/drivers/net/wireless/ath/ath12k/peer.c
@@ -9,6 +9,55 @@
 #include "debug.h"
 #include "debugfs.h"
 
+void ath12k_peer_delete_wait_register(struct ath12k *ar,
+				      struct ath12k_peer_delete_wait *wait,
+				      u32 vdev_id, const u8 *addr)
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
+void ath12k_peer_delete_wait_unregister(struct ath12k *ar,
+					struct ath12k_peer_delete_wait *wait)
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
index 49d89796bc46..3dc720a3dc12 100644
--- a/drivers/net/wireless/ath/ath12k/peer.h
+++ b/drivers/net/wireless/ath/ath12k/peer.h
@@ -9,13 +9,28 @@
 
 #include "dp_peer.h"
 
+struct ath12k_peer_delete_wait {
+	struct list_head list;
+	u32 vdev_id;
+	u8 addr[ETH_ALEN];
+	struct completion done;
+};
+
+void ath12k_peer_delete_wait_register(struct ath12k *ar,
+				      struct ath12k_peer_delete_wait *wait,
+				      u32 vdev_id, const u8 *addr);
+void ath12k_peer_delete_wait_unregister(struct ath12k *ar,
+					struct ath12k_peer_delete_wait *wait);
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


