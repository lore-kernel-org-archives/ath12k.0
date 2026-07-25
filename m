Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F739C53209
	for <ath12k@archiver.kernel.org>; Sat, 25 Jul 2026 18:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1nx9ftBvzkJRdfVo/u4AmKjPWikvN0dHE7MjZ+firGU=; b=lmDOYMd6f2gnbIoxroa4+lFo+G
	PxAoD0+9hj9daRaxsU5N9fl5rVOBeOyrwXAzLD2H47faEwUzn+ckCmTb5G50Q4R6WodCbZjtz5dRT
	89RSJvh7PRgoDtgs9yig2zkdnNMDW4hYWifyGoH+zzzKZ6U38TVrglEO5ELwUU+iX3kCZ+FoSxOyJ
	tuJxnY/ZiAbIOJuqj4+wyodsZ4849KV28iLHZRJHlzWHTl89NfHP8sMzVo2qBZUFW7P/XvXGg1CRL
	0gzhnZ0Xa1ZaK1ryAzAZ77bmm13Swc2IKxZCdM451suSo419XZnZcPCO3sR2vDrJx05DUdBzJzLXH
	aK/ya+zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wngqq-00000000dPS-0Esr;
	Sat, 25 Jul 2026 18:11:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wngqn-00000000dOd-3pQY
	for ath12k@lists.infradead.org;
	Sat, 25 Jul 2026 18:11:55 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66PGvJsQ2205553
	for <ath12k@lists.infradead.org>; Sat, 25 Jul 2026 18:11:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1nx9ftBvzkJRdfVo/u4AmKjPWikvN0dHE7MjZ+firGU=; b=MVxezweSTthbYFLe
	yaWTq2MIoa9JIG8i32UpCp43VyfLRWwjVk9elK9CHL2LnIqAxYu9Sjz+LMgTkN4y
	re9zHe8kD4UJzo/4+2+R1qekUasoa584pHwkEajm7G+jsdWy0YL3abEcuXwdKA6r
	PKu/Z0Xfj3cSHA8wzcQX6X0Xx77GmuTpFBjRMFKC0GWSOfwDM17qd/3RxxRMatoO
	F5T/0fNsCNzRpUu1FT/w58BXIlg8S0ZYq2KGemI9tqlbMcoFldo+Ilv+839bYOXC
	6v6TKkyr+GbP3f8Fi2gf3S0uFGxzMR3oxPCTWR5XY2bza/jJF+0VpVb1FPLKPr+O
	FN1G4w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmpee98uq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 25 Jul 2026 18:11:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e2237bc43so2559841a91.1
        for <ath12k@lists.infradead.org>; Sat, 25 Jul 2026 11:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785003113; x=1785607913; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1nx9ftBvzkJRdfVo/u4AmKjPWikvN0dHE7MjZ+firGU=;
        b=bARnvbRktTMcK7QxTDuGdnvIOlrFU4waAkpEb+PFUIne1XOxHFmlgQ3DVLewklqUaY
         Z/615uyBNgSmFbXdWqXS7o1m6mhLxb/axDp8Vg49MeS3MidJoV9RRcZ2Q3Y3H73eH0RR
         TOWKn0NTCHD2/9l8UKAMYHmvE9DfpV3Oe3+J4LXoefaS9ukH6YSjnpf1wTjE/t0wuTix
         L38tdl9IoHZLSHFPcRByfkbNLFDr86KgxMEK6God7+TR4yeo4DP72hl14Yx48STlM4a0
         J0NLM7YjOXZcxQ7hwnYslZfNKNd9pjAbTSiCaQdh5WyDjWKPgofEGwCsKVqRv/RKD2i9
         yXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785003113; x=1785607913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1nx9ftBvzkJRdfVo/u4AmKjPWikvN0dHE7MjZ+firGU=;
        b=VMF0lV0D9fLtld9f5nJhjEgxBUic6d1Cf2VBlflP7irzyW/3k+rfebRFiH+CxhxgKC
         qI3xWeJa0tEsaa0rLJPI8UCHWXqqM9Z+hTkLxL9khb1kJVn4yksJua/ihhNEdkwiNeoq
         efY+RsCUoUHuWX70AOOubvp3XfSD6XvXIhbbxDbvIp1qRjHW9tZpkzMCk0ddFjdhxjc3
         GK29vaNl3Ck2V04G2rOI901xsQZf8U6IpMGEzoF9Rb7/9Aro/rBvAsSqOnUiVeQAV/OI
         o+DszEso+p1IIwFvumjnecd5TeFhToHTC0rLKmOQf6nW7LWMFE3n6OrFqxt0doIJCPD7
         +crg==
X-Forwarded-Encrypted: i=1; AHgh+RrlFtbzDgYR55wH5qGeKLvm0mU7K9uFcX1dxInkz534rn7tjvmxYIJAGU6Spvy+HUW60JlOaDg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwBeF5mmgDH4wQz7VyJ9xQPOts/q9i+bRiEap6WhgF1HxzYQWgm
	fYK3b+pLZgb9P2OSzJ+S2gvBVZRod9hRlUqaCo1FS96wd5Z/5diaiMh1mDd0DNdp9g+YGr0EIgC
	gAFcWlnlSHLblkdpQyhZ53pDnTTm3D+6Ungv1vLSKF8KzjQVgmUbRxU9S9Ix+qlLv
X-Gm-Gg: AR+sD12kq8VfLNYAd4fpTA1nmiIARMYG9Oup/MaI1qwRDBZhO5AqpNMsUzeqCT/RHCX
	ZcBXS17iyZZYFi74pw95fN8jiE94bcSkdt21HxVwQfhBwcI+y+G7G41HysFrTuFDEcnj0z3SvmO
	V7Cb2t5TA7Hha3WsExHtuiaxIEZDZE4mQFQm9OHMAc75VE4TofjZ54oC1Zejb30OmOAdTkcoOi1
	beqRguBMb1aY/zHS293V3xXUsEo0Jhh6ZcnxgbWnBlv8EZCHdIU/ILs2JCVwpjFoNad/zTh+ruZ
	u12GsDfi0GjyIK9Mt951I+COZOACXak3nP7S1JKe1WGCI3lnBJqyUU62ww+AYaYAlKTeh27TQSs
	yndCIIf2KdAhUhpEv9NXaV2eN+fQ2zPIblj/8FsmhOaHk9eAnDpa1dPE=
X-Received: by 2002:a17:90b:184e:b0:380:9504:9780 with SMTP id 98e67ed59e1d1-38f2977882cmr2975769a91.29.1785003112826;
        Sat, 25 Jul 2026 11:11:52 -0700 (PDT)
X-Received: by 2002:a17:90b:184e:b0:380:9504:9780 with SMTP id 98e67ed59e1d1-38f2977882cmr2975747a91.29.1785003112333;
        Sat, 25 Jul 2026 11:11:52 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13003f12sm64692635c88.2.2026.07.25.11.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 11:11:50 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Sat, 25 Jul 2026 11:11:46 -0700
Subject: [PATCH ath-next 2/2] wifi: ath12k: rename firmware_mode enum
 members to use QMI namespace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260725-consolidate-firmware_mode-v1-2-aedff0ce0ba5@oss.qualcomm.com>
References: <20260725-consolidate-firmware_mode-v1-0-aedff0ce0ba5@oss.qualcomm.com>
In-Reply-To: <20260725-consolidate-firmware_mode-v1-0-aedff0ce0ba5@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Jr3Bas4C c=1 sm=1 tr=0 ts=6a64fc69 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=qg84H81dDRxm8dBP63MA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI1MDE3MyBTYWx0ZWRfX39bIA0MidQgN
 QOltTHN6oUk0sHGaQjsKHnnoY9x8dQDJM1G8YHLrXd1FZ4gdnvenZIc9FyOx9YMySK8Lxqv6U2m
 k4VvgqgmcblO2A9IQG7Edd35frca9IQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI1MDE3MyBTYWx0ZWRfX9n9BZYaMIPw4
 BXCSAlsjMOXxKJmAhS6+BgUiveirkp6qgLrm/gVtKViq9dqKKcKOR8PXU0Di2QRamkeMq3xRGD5
 QEmdXxmKnm5KFs6T2JTFaxDTDGGZFcZd/8mzpbw5FFhjuhcLOnjb7gxa+ZGLWs7ZrTFKEHB7ZnG
 IO1jCTAXq8EMshU+7f1Fo1LzLamZI7pUr/7CLIWcqVzkov5LbZ40j7dtKmdSvBcKIObfAft95a0
 ptmdjdiABEdVcQnkuE/p5zAP5i/j/M1mEZcuMS8mQ8enheZ1wvFZIego+8+y/tht6Be0pnx0uIX
 Nc/Nqnj3u+jPUKrcJxulgZZJFG7niJsBEMq2CCnv8xyqHUfj0aUsY9VMNuSZIj2Dcsfl1Mx/cZs
 SPVJpGI0uxsEnXN9OiETa6ilang9p4Sj9LkQqtcR9a9hELunFHu6sOPj4NoMv3A+Z/MeaCGuSql
 7dBkpYb+rudux14gMnw==
X-Proofpoint-ORIG-GUID: rimmAonRFYLghylJit2dYQr6ff_rUPUt
X-Proofpoint-GUID: rimmAonRFYLghylJit2dYQr6ff_rUPUt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-25_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607250173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_111153_982633_102A3809 
X-CRM114-Status: GOOD (  17.76  )
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

The enumerator names ATH12K_FIRMWARE_MODE_* lack the QMI infix that all
other constants in qmi.h use (ATH12K_QMI_FILE_TYPE_*,
ATH12K_QMI_BDF_TYPE_*, ATH12K_QMI_MEMORY_MODE_*, etc.).  Rename them to
ATH12K_QMI_FIRMWARE_MODE_* for consistency and to prevent a future
re-introduction of ATH12K_FIRMWARE_MODE_* names causing a silent collision.

While here, add a comment noting that values 2-3 are reserved by the
firmware QMI ABI to explain the gap before ATH12K_QMI_FIRMWARE_MODE_OFF = 4.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 2 +-
 drivers/net/wireless/ath/ath12k/mac.c  | 2 +-
 drivers/net/wireless/ath/ath12k/pci.c  | 2 +-
 drivers/net/wireless/ath/ath12k/qmi.c  | 4 ++--
 drivers/net/wireless/ath/ath12k/qmi.h  | 8 ++++----
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index a052a77828f3..d023c646478f 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -795,7 +795,7 @@ static int ath12k_core_soc_create(struct ath12k_base *ab)
 	int ret;
 
 	if (ath12k_ftm_mode) {
-		ab->fw_mode = ATH12K_FIRMWARE_MODE_FTM;
+		ab->fw_mode = ATH12K_QMI_FIRMWARE_MODE_FTM;
 		ath12k_info(ab, "Booting in ftm mode\n");
 	}
 
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 553bcad0b5d0..6ed1f5502507 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -859,7 +859,7 @@ struct ath12k *ath12k_mac_get_ar_by_pdev_id(struct ath12k_base *ab, u32 pdev_id)
 		return NULL;
 
 	for (i = 0; i < ab->num_radios; i++) {
-		if (ab->fw_mode == ATH12K_FIRMWARE_MODE_FTM)
+		if (ab->fw_mode == ATH12K_QMI_FIRMWARE_MODE_FTM)
 			pdev = &ab->pdevs[i];
 		else
 			pdev = rcu_dereference(ab->pdevs_active[i]);
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 907d29b1020c..6441927b5382 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -1556,7 +1556,7 @@ static int ath12k_pci_probe(struct pci_dev *pdev,
 	ab_pci->ab = ab;
 	ab_pci->pdev = pdev;
 	ab->hif.ops = &ath12k_pci_hif_ops;
-	ab->fw_mode = ATH12K_FIRMWARE_MODE_NORMAL;
+	ab->fw_mode = ATH12K_QMI_FIRMWARE_MODE_NORMAL;
 	pci_set_drvdata(pdev, ab);
 	spin_lock_init(&ab_pci->window_lock);
 
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index c466c3ae793a..280e50a1f31d 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -3460,7 +3460,7 @@ static int ath12k_qmi_wlanfw_mode_send(struct ath12k_base *ab,
 
 	ret = qmi_txn_wait(&txn, msecs_to_jiffies(ATH12K_QMI_WLANFW_TIMEOUT_MS));
 	if (ret < 0) {
-		if (mode == ATH12K_FIRMWARE_MODE_OFF && ret == -ENETRESET) {
+		if (mode == ATH12K_QMI_FIRMWARE_MODE_OFF && ret == -ENETRESET) {
 			ath12k_warn(ab, "WLFW service is dis-connected\n");
 			return 0;
 		}
@@ -3623,7 +3623,7 @@ void ath12k_qmi_firmware_stop(struct ath12k_base *ab)
 
 	clear_bit(ATH12K_FLAG_QMI_FW_READY_COMPLETE, &ab->dev_flags);
 
-	ret = ath12k_qmi_wlanfw_mode_send(ab, ATH12K_FIRMWARE_MODE_OFF);
+	ret = ath12k_qmi_wlanfw_mode_send(ab, ATH12K_QMI_FIRMWARE_MODE_OFF);
 	if (ret < 0) {
 		ath12k_warn(ab, "qmi failed to send wlan mode off\n");
 		return;
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index 27b69847a15e..6da10f3cb597 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -603,13 +603,13 @@ enum ath12k_qmi_mem_mode {
 
 enum ath12k_qmi_firmware_mode {
 	/* the default mode, standard 802.11 functionality */
-	ATH12K_FIRMWARE_MODE_NORMAL,
+	ATH12K_QMI_FIRMWARE_MODE_NORMAL,
 
 	/* factory tests etc */
-	ATH12K_FIRMWARE_MODE_FTM,
+	ATH12K_QMI_FIRMWARE_MODE_FTM,
 
-	/* firmware offline */
-	ATH12K_FIRMWARE_MODE_OFF = 4,
+	/* firmware offline; values 2-3 reserved by firmware ABI */
+	ATH12K_QMI_FIRMWARE_MODE_OFF = 4,
 };
 
 static inline void ath12k_qmi_set_event_block(struct ath12k_qmi *qmi, bool block)

-- 
2.43.0


