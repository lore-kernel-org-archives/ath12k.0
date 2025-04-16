Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82D2C369AB
	for <ath12k@archiver.kernel.org>; Wed, 16 Apr 2025 02:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OrtISGEA3SFyW8S+AUyrjuUbU86NuEPTPudr+ZzNkBc=; b=la9YuEv2B2eNb1cb189QigZ7gW
	Cyswj2s+lKCAfO4LWX4B2Yuf8/zAJ4pbRPMem+LLvbVpWNomZQx4X4dHyf0tVAXw5Csqr82uyCiGy
	0LWbMhWl+BKJDnx24JgC6vsMo1pLhGn8SnU4Pk3NGxAnIvH8jcAkthFi1Cc4MV2mzl18Tob9E2lbM
	kzcUt0pIrqXA0AYTl0l9thQZUq2Z07I8mB0/1TR2CqK1df/fz/L43QGoWzkUUuoH3k4HGSJ0sdjXd
	98mOLhhznIEHw+OaOKVqrUSnjraZGGtZ4Zh6Ydyldlr6HmsFL8FvaEkQxbiXjEbQWqaB4A7HlCiaw
	5zUzG8pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4sLK-00000007vDC-2uUj;
	Wed, 16 Apr 2025 02:17:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4sLI-00000007vBj-1q5F
	for ath12k@lists.infradead.org;
	Wed, 16 Apr 2025 02:17:37 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FIbqjm005878
	for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 02:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=OrtISGEA3SFy
	W8S+AUyrjuUbU86NuEPTPudr+ZzNkBc=; b=pykj+XsYC4ist0zjU68oq3phgWSh
	VDktj9kMd6PtJO7K+KLA+oaDdknxRDniRi7FHDQX6RWPUTzMLATmkTgylPSvvs+o
	hwGiytCRXNZdHS81DArRmTOaJQoQ5z5eEa1BWQqWvb7RkiZrphAGjNg/FDxA8Lh1
	qcDNrD1hFFcg7ctDGxnnkLi/JAb9yKg6MqtVqNKx4ogDcOn0lcvJIISbiKM39Oaa
	8V49rR1TF4TEFkpm/yd2QoSufRJ+Wn5iXQLdvb4DiArMs1UGXUls4HoqCYsNqKa7
	Fax3GypPklYEFz0+JXtMCJ1fnbmtMHBuwtllP/aoz0jb7tqa2Sxzk0NIRA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvja63c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 02:17:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff58318acaso9371992a91.0
        for <ath12k@lists.infradead.org>; Tue, 15 Apr 2025 19:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744769855; x=1745374655;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OrtISGEA3SFyW8S+AUyrjuUbU86NuEPTPudr+ZzNkBc=;
        b=MH4CPzbANnh0k0l6EKm92J728i17zu4kMbGtxOQ1bSm2rj1PJJ7rqdypq439k0lytd
         j+36+z/g+YviknoPq+KZmFNQSgprLxRPYHd4054vvU7dzG2+eDm0x380pw6l83ecrGER
         6xkXF1xVpQFDxOn0daTOsD8+wN7Ambm+S7AsiO7393NXp395Z6cA6SLvG1Gir/RfNSBV
         goc08+5tDPgjjMwypPVz3JoCfgjJIQfHM/Kwcyc3l47r7xq2Za6mxwpQCO6Gjen4KpzS
         oIxhHATTw8q1wyfZYXh6c0hV4soNa7AcLHsldY0kVgiTNhP+Jayn7rz/6C/r1QEUINoR
         h+Tw==
X-Gm-Message-State: AOJu0YyLjWtzYl+gqx7/qDzVfMreDd7ayxvUnTtjvaVBOINMO/weV7Hd
	K65jBBqvgIYPRiQbfbFwgiW0RVzMjzHEVVeDFtJY+rVajkIAHmv2+nOosvpPE4/wGW3UWjrvrgx
	a0rQ4m5s92qjVw0HP1xxJ4GMgTWpUJdgcjg61zQidYemtxEyjP7AIGIUi29W1YLhyYeSQ
X-Gm-Gg: ASbGncscQI5/1bAqddrYYQ0TlQIappTrL3PJPWWVLvI+t1XM1cUhKn8xLR4yJA2BS5Y
	4ZHSUnGEify9r18s0gJ1ybNNEQZp1jRWv8M58+/ItPEFq0bdXMz90Ezzsof5X3WE5bPIFxB3llj
	oSmhOLPXlKyAVYu9hmwfWjYMNg7ztjSR4gE7efMiF0aFsleYecBk3SY2HbQoCaOielgfhPWYWNU
	aZrfN80vwxnJY7ys+LEdo/WNg+iRGQ4ehHo+bwD3Pn3jI1cULDtLipW8qMlDGzICGUbaxy/J5OW
	tyJQaxxTamnR5eqL+JNMEp4pzy8tZlVxRgm7bdsUtE2cegchRMvRYKAJpv+zVxN7eQRc0gY08zo
	bysw1hn4MMrO4E/BiBYhzHViPfERGCeNDltUgZx9fzhWPaw==
X-Received: by 2002:a17:90b:2811:b0:2ff:6fc3:79c3 with SMTP id 98e67ed59e1d1-3085eeb4950mr2356145a91.9.1744769854637;
        Tue, 15 Apr 2025 19:17:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbhVTPuLFueShCaT/rFALm6H1O4ogb8Kyz9h3ZBq3IoBywGStUHAirdJA2BDDW/kE4pUxTPw==
X-Received: by 2002:a17:90b:2811:b0:2ff:6fc3:79c3 with SMTP id 98e67ed59e1d1-3085eeb4950mr2356121a91.9.1744769854271;
        Tue, 15 Apr 2025 19:17:34 -0700 (PDT)
Received: from che-siroccolnx03.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308611d6d18sm396452a91.2.2025.04.15.19.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 19:17:33 -0700 (PDT)
From: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: fix node corruption in ar->arvifs list
Date: Wed, 16 Apr 2025 07:47:24 +0530
Message-Id: <20250416021724.2162519-1-maharaja.kennadyrajan@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=67ff133f cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=FH1iE1U44W5z0wy2VbUA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 7rKukiG-6VaGzKEs0fqoG67PwO_58Q-W
X-Proofpoint-ORIG-GUID: 7rKukiG-6VaGzKEs0fqoG67PwO_58Q-W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_191736_480781_A5928B93 
X-CRM114-Status: GOOD (  15.47  )
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

In current WLAN recovery code flow, ath12k_core_halt() only reinitializes
the "arvifs" list head. This will cause the list node immediately following
the list head to become an invalid list node. Because the prev of that node
still points to the list head "arvifs", but the next of the list head
"arvifs" no longer points to that list node.

When a WLAN recovery occurs during the execution of a vif removal, and it
happens before the spin_lock_bh(&ar->data_lock) in
ath12k_mac_vdev_delete(), list_del() will detect the previously mentioned
situation, thereby triggering a kernel panic.

The fix is to remove and reinitialize all vif list nodes from the list head
"arvifs" during WLAN halt. The reinitialization is to make the list nodes
valid, ensuring that the list_del() in ath12k_mac_vdev_delete() can execute
normally.

Call trace:
__list_del_entry_valid_or_report+0xd4/0x100 (P)
ath12k_mac_remove_link_interface.isra.0+0xf8/0x2e4 [ath12k]
ath12k_scan_vdev_clean_work+0x40/0x164 [ath12k]
cfg80211_wiphy_work+0xfc/0x100
process_one_work+0x164/0x2d0
worker_thread+0x254/0x380
kthread+0xfc/0x100
ret_from_fork+0x10/0x20

The change is mostly copied from the ath11k patch:
https://lore.kernel.org/all/20250320053145.3445187-1-quic_stonez@quicinc.com/

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index b501d722df31..7eccd9cf9036 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1371,6 +1371,7 @@ static void ath12k_rfkill_work(struct work_struct *work)
 
 void ath12k_core_halt(struct ath12k *ar)
 {
+	struct list_head *pos, *n;
 	struct ath12k_base *ab = ar->ab;
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
@@ -1387,7 +1388,12 @@ void ath12k_core_halt(struct ath12k *ar)
 
 	rcu_assign_pointer(ab->pdevs_active[ar->pdev_idx], NULL);
 	synchronize_rcu();
-	INIT_LIST_HEAD(&ar->arvifs);
+
+	spin_lock_bh(&ar->data_lock);
+	list_for_each_safe(pos, n, &ar->arvifs)
+		list_del_init(pos);
+	spin_unlock_bh(&ar->data_lock);
+
 	idr_init(&ar->txmgmt_idr);
 }
 

base-commit: 176f3009ae598d0523b267db319fe16f69577231
-- 
2.17.1


