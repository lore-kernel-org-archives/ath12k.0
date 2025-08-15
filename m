Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DDBACA0EDC
	for <ath12k@archiver.kernel.org>; Fri, 15 Aug 2025 02:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yaaM+XL5Gi6ry6IeNjfcORLxBbF4Fo80QQCM6SflmPs=; b=xwERpcoBVLXCXzccrFbdCe0P4R
	VNO3USsoWF2+DcZhS2UG0A34LTV1uxscxpgIxhhgVxkOHrPAZRKRjk+hXFJmg0lpetGVbAKGIivxQ
	s0mbF5M+w2TnErHR132xBfCMga64Np9KEFNoiNDkCgJEsQc+fPgRKm9SFu3A2uO4Hq5U/n970V/dV
	zkDPnqBeGuyBZNymQHEe+jKVSQud+OtLwZiZM1OdE3QhaKSVNVMM3ulIzv3ZysX4xYOTq2ZkFXDzX
	VgNu0UKNiiJdjQs0uYl4GzK9STw0eb9ZriFkG6Zkd7iNAAI68nveEwaPqA+BgijlIxGPm1ew3kiux
	9XO7rq9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umjqK-000000017P2-0FS6;
	Fri, 15 Aug 2025 02:06:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umjpo-000000017Iv-0eBP
	for ath12k@lists.infradead.org;
	Fri, 15 Aug 2025 02:06:25 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EJfRHP029021
	for <ath12k@lists.infradead.org>; Fri, 15 Aug 2025 02:06:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yaaM+XL5Gi6ry6IeNjfcOR
	LxBbF4Fo80QQCM6SflmPs=; b=D9lY/Bz0dtoZ9elsLZLHUqY1O5enfjIAmcK+t6
	/RNRRhCOAxn11MA3oUAK0MPKM/OO4eKSSxGARBbYt+WJBOoFlEk3P8S+9zaEAw27
	FB4DLqKuSCVLGhuFRTODlzYpraaewybXZ47u82Hhgn+BBxTj+tnB2olbux+K/gFo
	OiaXpr/cgYqfjSTLxK4jQDaVW16vmM3FpixVmlRG7UgbNHczqbJulwjRfWoPwKii
	eKrT1swk4dgUVmhT/b14n3TPgsPXOFbqC6PFkIa1d9uB1Rcv/XYxR6avrcceJ6fz
	eexLp03y+cV4zCO+UT1A7Fp3SCNK350x8OEZQAHYovHcM/Og==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g9qa0s6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 15 Aug 2025 02:06:23 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76e2e8908fdso1292089b3a.1
        for <ath12k@lists.infradead.org>; Thu, 14 Aug 2025 19:06:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755223582; x=1755828382;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yaaM+XL5Gi6ry6IeNjfcORLxBbF4Fo80QQCM6SflmPs=;
        b=S4j99nRlgRWWIiTNhoSNE4PbPOC8OduInhNT/FwGzVOqvNqaQmlthWpKVWpP1fwITf
         KF/gzbL31vXPhUJnq8d/Zu2o+2Bqny1mzUj8fib9mSd3h+IxS8KqZ1Lsr6RhZMJAdUzi
         kQ5Tv4zJ8fJmuMJxgGTq/ekSryqd4mUy2CE9qNJs79tJegB1WN2RUkE9tAKDu0naiHVF
         5FPRh5B856fUV9uE0FqD8+ZGtBv8hPy37lusqMpcGHenyokS4uxwfxb2yzbe3/w4H+nB
         UteKFsN6VfUL+IfaRMo5LQ1HIpht9ZgW7oezixwV5JzkuPealw9PAc1/PTdsowNTxGJA
         l2ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVx6mKMT4vwaxaXIMkp5zyFocSaDeffT1rdEtwikhBfepOndlPm0DWk/joQrXTVqiYLQcmC34Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YxVlMORjFg28GluMJQqsHTZc4oqP+CnwgdLSggWpuREltw3CuxW
	v/D+YucOQeNNlusm5g8WDqxVjDb6jBYWrDq8ki77E6BaiQS9voXxQRI+7aJlisJIknI3ZvnWa44
	s7/XOKAmsu6GVH38xgcLOfPLph2Yrk98GKEJ+Z8iYmJXcHN9CTh9LsIjzAhQERb3A
X-Gm-Gg: ASbGncs6G1Trkh44H47yGCrES4e7T7avTBLGtjnAt6btwEgiwvrSreWG/ZwAOFOLLoQ
	+2+TkIqu5nlxBbmUIKm9rr84ik4hdPdVvQ6i7vjEKMbW1r/K0+wI3+J/s6ztcLrhupYUSC5QFG/
	4fv/6/Cc3R+Cr9EFipK7l89m3OaUInuQ+fuElTQF1/31HIl1CkU3ZHhmxA1atEYnK74usXIUotT
	4JJ3mcRRzuSoGcwic9svUch9JWrKdUjPIp09XwBP730xJ7s3eTUi/3vCAbdkkuHZdvPbDjIYaiX
	3oMd6nYU1aNHtO3NsXR7dDy8+Y4IqxPDFFmZY67CUS0pM7evecBaZhlgXFGxLCACAzW+eC54Fqc
	PISpcbUFwKFJTeB3d
X-Received: by 2002:a05:6a00:3997:b0:76b:f1c0:224b with SMTP id d2e1a72fcca58-76e4485ae74mr372745b3a.23.1755223582235;
        Thu, 14 Aug 2025 19:06:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiOav9YzVv+68s1XTQezP9a0+HNLO7H+DTaN2Oo1vUFa2w/+pnDcr2oWE+MaetHJSTw+Y80g==
X-Received: by 2002:a05:6a00:3997:b0:76b:f1c0:224b with SMTP id d2e1a72fcca58-76e4485ae74mr372708b3a.23.1755223581711;
        Thu, 14 Aug 2025 19:06:21 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e45593060sm35807b3a.86.2025.08.14.19.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 19:06:21 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 10:06:04 +0800
Subject: [PATCH 6.15] wifi: ath12k: install pairwise key first
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-backport-6-15-y-ath12k-pairwise-key-v1-1-d6c977acb35b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAyWnmgC/5WNQQ6CMBBFr2Jm7RCmUkBX3sOwqGWQCUKxRZQQ7
 m7DDdz85P2f/LdCYC8c4HJYwfMsQdwQgY4HsK0ZHoxSRwaVKp2WdMK7sd3o/IQ5ksYFzdSS6nA
 04j8SGDuOXVbXpjCKdWEgPo2eG/nulhvkCWmoYttKmJxfdvVM+/aXZSYkPJcNFSWXWZrbqwshe
 b3N07q+T2JAtW3bDzhL02/jAAAA
X-Change-ID: 20250813-backport-6-15-y-ath12k-pairwise-key-a4dda7a2e57a
To: Jeff Johnson <jjohnson@kernel.org>, stable@vger.kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, johan@kernel.org,
        gregkh@linuxfoundation.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=CNMqXQrD c=1 sm=1 tr=0 ts=689e961f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8
 a=EUspDBNiAAAA:8 a=bwSFjXmOb-h8CDtPQtgA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 7YUW7wNhTfjWUS-cM9i33S0d5HcUsZWv
X-Proofpoint-ORIG-GUID: 7YUW7wNhTfjWUS-cM9i33S0d5HcUsZWv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE2NCBTYWx0ZWRfX2ky0eh4r0wNw
 qDrgiR/fan69FMvV0g8B9Le66RpjTT5i10G3KG6rrXmOGG4gwMZokzWlPPXonT4dRBf8phyEclF
 iEjA8DrZHTolpia/y0sU9kXj/D/Rv/VL0m8H84e5KvIs2HvDmh/9o5Rl1RZZM4F6wQ8aqWrKcAj
 P+nt8epMJKXPxtk3FDH/XPaSl9yH6LuyW2DvORdv9XGxAT1qNugnIKy5mKN578GmQASvAhj5IGF
 whXJsMiLlokEbJLtYkrZWYcL6UKZIRHm4TSKuwOTyIltPBSphzvCPp6i+xDpN/BBJ/T3Csx9lsS
 PbI4Jra9p06tnHlUk96Y0FYucreFKc38snB8GIzCj8liMOJseLwKF52EWY5nJDHP8AkGyjFSLRu
 ahTCnEze
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_190624_199976_0FD4BF11 
X-CRM114-Status: GOOD (  20.14  )
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

[ Upstream commit 66e865f9dc78d00e6d1c8c6624cb0c9004e5aafb ]

As station, WCN7850 firmware requires pairwise key to be installed before
group key. Currently host does not care about this, so it is up to kernel
or userspace to decide which one will be installed first. In case above
requirement is not met, WCN7850 firmware's EAPOL station machine is messed
up, and finally connection fails [1].

Reorder key install for station interface in that case: this is done by
caching group key first; Later when pairwise key arrives, both can be
installed in required order.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00217-QCAHKSWPL_SILICONZ-1

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218733
Link: https://lore.kernel.org/all/AS8P190MB12051DDBD84CD88E71C40AD7873F2@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM # [1]
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
for stable kernel 6.15.y
---
 drivers/net/wireless/ath/ath12k/core.h |  4 ++
 drivers/net/wireless/ath/ath12k/mac.c  | 76 ++++++++++++++++++++++++++++++----
 drivers/net/wireless/ath/ath12k/wmi.h  |  1 +
 3 files changed, 74 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index f5f1ec796f7c55a8f06724380714d10ed28e9748..4cff5e42eb34d261cdc418e6a105f5f4c5ff79b9 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -303,6 +303,10 @@ struct ath12k_link_vif {
 	struct ath12k_rekey_data rekey_data;
 
 	u8 current_cntdown_counter;
+
+	bool group_key_valid;
+	struct wmi_vdev_install_key_arg group_key;
+	bool pairwise_key_done;
 };
 
 struct ath12k_vif {
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index d1d3c9f34372da18759c6b7801c5cd9d3f092d40..647543f5f360f2ede581274499668f272ff77042 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4641,14 +4641,13 @@ static int ath12k_install_key(struct ath12k_link_vif *arvif,
 		.key_len = key->keylen,
 		.key_data = key->key,
 		.key_flags = flags,
+		.ieee80211_key_cipher = key->cipher,
 		.macaddr = macaddr,
 	};
 	struct ath12k_vif *ahvif = arvif->ahvif;
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
-	reinit_completion(&ar->install_key_done);
-
 	if (test_bit(ATH12K_FLAG_HW_CRYPTO_DISABLED, &ar->ab->dev_flags))
 		return 0;
 
@@ -4657,7 +4656,7 @@ static int ath12k_install_key(struct ath12k_link_vif *arvif,
 		/* arg.key_cipher = WMI_CIPHER_NONE; */
 		arg.key_len = 0;
 		arg.key_data = NULL;
-		goto install;
+		goto check_order;
 	}
 
 	switch (key->cipher) {
@@ -4685,19 +4684,82 @@ static int ath12k_install_key(struct ath12k_link_vif *arvif,
 		key->flags |= IEEE80211_KEY_FLAG_GENERATE_IV |
 			      IEEE80211_KEY_FLAG_RESERVE_TAILROOM;
 
+check_order:
+	if (ahvif->vdev_type == WMI_VDEV_TYPE_STA &&
+	    arg.key_flags == WMI_KEY_GROUP) {
+		if (cmd == SET_KEY) {
+			if (arvif->pairwise_key_done) {
+				ath12k_dbg(ar->ab, ATH12K_DBG_MAC,
+					   "vdev %u pairwise key done, go install group key\n",
+					   arg.vdev_id);
+				goto install;
+			} else {
+				/* WCN7850 firmware requires pairwise key to be installed
+				 * before group key. In case group key comes first, cache
+				 * it and return. Will revisit it once pairwise key gets
+				 * installed.
+				 */
+				arvif->group_key = arg;
+				arvif->group_key_valid = true;
+				ath12k_dbg(ar->ab, ATH12K_DBG_MAC,
+					   "vdev %u group key before pairwise key, cache and skip\n",
+					   arg.vdev_id);
+
+				ret = 0;
+				goto out;
+			}
+		} else {
+			arvif->group_key_valid = false;
+		}
+	}
+
 install:
-	ret = ath12k_wmi_vdev_install_key(arvif->ar, &arg);
+	reinit_completion(&ar->install_key_done);
 
+	ret = ath12k_wmi_vdev_install_key(arvif->ar, &arg);
 	if (ret)
 		return ret;
 
 	if (!wait_for_completion_timeout(&ar->install_key_done, 1 * HZ))
 		return -ETIMEDOUT;
 
-	if (ether_addr_equal(macaddr, arvif->bssid))
-		ahvif->key_cipher = key->cipher;
+	if (ether_addr_equal(arg.macaddr, arvif->bssid))
+		ahvif->key_cipher = arg.ieee80211_key_cipher;
+
+	if (ar->install_key_status) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	if (ahvif->vdev_type == WMI_VDEV_TYPE_STA &&
+	    arg.key_flags == WMI_KEY_PAIRWISE) {
+		if (cmd == SET_KEY) {
+			arvif->pairwise_key_done = true;
+			if (arvif->group_key_valid) {
+				/* Install cached GTK */
+				arvif->group_key_valid = false;
+				arg = arvif->group_key;
+				ath12k_dbg(ar->ab, ATH12K_DBG_MAC,
+					   "vdev %u pairwise key done, group key ready, go install\n",
+					   arg.vdev_id);
+				goto install;
+			}
+		} else {
+			arvif->pairwise_key_done = false;
+		}
+	}
+
+out:
+	if (ret) {
+		/* In case of failure userspace may not do DISABLE_KEY
+		 * but triggers re-connection directly, so manually reset
+		 * status here.
+		 */
+		arvif->group_key_valid = false;
+		arvif->pairwise_key_done = false;
+	}
 
-	return ar->install_key_status ? -EINVAL : 0;
+	return ret;
 }
 
 static int ath12k_clear_peer_keys(struct ath12k_link_vif *arvif,
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index bd7312f3cf24aa1352c807c5216dc010b7414058..d0cc697a418e10c70adc585d7e9e5759bd53d4ce 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -3725,6 +3725,7 @@ struct wmi_vdev_install_key_arg {
 	u32 key_idx;
 	u32 key_flags;
 	u32 key_cipher;
+	u32 ieee80211_key_cipher;
 	u32 key_len;
 	u32 key_txmic_len;
 	u32 key_rxmic_len;

---
base-commit: 097aa9a71fd56cdc62c11bdf45a84f07acaa3604
change-id: 20250813-backport-6-15-y-ath12k-pairwise-key-a4dda7a2e57a

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


