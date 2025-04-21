Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 193BBC369D8
	for <ath12k@archiver.kernel.org>; Mon, 21 Apr 2025 02:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=orF1MVpJ3be9RzJ7K3Owwnxk1u4lAzoPL/V0kF7zq+8=; b=zaSkxaLmMvjNPRw61ccgV9YfhG
	71c0SCPGUxKZaqTcG4rfRzJ2wvzqOE/aJIzEWkIgPiwHZil2tpE36tQ7GBVA9jIXpmMWoNueOgodX
	F9v34NzKDdDjTqtf7cKvAzVGw8ip9iM7OvbBGhNJnDxA6T0BkEiGTxaJ6X21lxvvsiEbuWkQS+SF7
	INIIfy8DfLZnWeMrtBISaYgZN9HCwJVBh7fimmoit/fy1WOvWwiZQBthSqJPNh93/5qh5wEgnJzm/
	q2ZDfs4//RpJtk/IYfjB6hOmliBpfg4q9c/ZjrFrGTedXW8GnPLuBfOi/f1/sy3Ryoki310SGtxtq
	DK7eSrPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6h0X-00000003SCs-3SmE;
	Mon, 21 Apr 2025 02:35:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6h0T-00000003S86-0CEJ
	for ath12k@lists.infradead.org;
	Mon, 21 Apr 2025 02:35:38 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KNSC8d005295
	for <ath12k@lists.infradead.org>; Mon, 21 Apr 2025 02:35:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=orF1MVpJ3be
	9RzJ7K3Owwnxk1u4lAzoPL/V0kF7zq+8=; b=GWFHhld4ckstcftnjhhe7gvn0Oz
	M4vFGGC+o3ZIsuRCedxbpAgB/j2MHIzZO5KbCLt7BV+Xfar9aTomgPsQ7UbxkTKo
	uSVkMm1QbVvQOYIQr1KzYFZMuQAqMHYJgZ6TarXE2mt76HZxXbYYwaC29M0C52pm
	Z7973B9Q8TAn7c91v7l9NqrewkdufurbUL68WflzlCqXAs31mK8ZFRZcymP6EW2v
	ScskfwZvePwEINghXf3hAs7Ekr2/iN72x/tHNTIxtedZK5mr6CT3HRt+quWBQSJL
	Tvaq3Nr04PNrWFj90ndD4DjvYaWzRHjB88MgzeQC89nvEsx0L46hWPVPscg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4641hhjx6d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 21 Apr 2025 02:35:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22aa75e6653so29248045ad.0
        for <ath12k@lists.infradead.org>; Sun, 20 Apr 2025 19:35:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745202929; x=1745807729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=orF1MVpJ3be9RzJ7K3Owwnxk1u4lAzoPL/V0kF7zq+8=;
        b=df3nPpWDGxdjkJzqzjG2w3Yp900299pceasF9K/xhvVFslaJYuIQEvGWk4+InW60bE
         O88rM2r+n4gLQGg+QAqRgIZRBBjSOv0XsAEh2kBi3zPyDWFsakzQjDCZ2VuuRIHaYami
         6GgMnM8sKxFEHL7DioGHizrLAVBqMbdF+1/6dML2mDhwCOyXiSW4tvoemXEcYtxZbzvx
         oShrKvFM73Yr8nl4sCs0FauhkrbH9yFWTLqbywvryYH3Pv6bxkgpMO5zh00J26r9pGjY
         lhh5Z0s1dkAvXSezZqyUPFDAU4orZCOI4Z2F6V3S3NGP1xDMXaiZkeFH7XY19lM+9pgp
         ZSUQ==
X-Gm-Message-State: AOJu0YwkyRgks1xgZUXK1gbODA302ETLoTZzKn2zVxCHRbHNWSIR/Ikm
	QrBmSzyiVVz5Bmd4vB2GwoCOZ7a83Sit0Rh4T7wL6xsjeoGmElJXgpTD4VNq7g+OmyeD5F5O2ek
	I2GVKhjbsxyl5lfZsTUqOLlttbUcAHuaVzYWdmcgsUVxPlI4wBm030bwOU4dG/Eq0oMYTG6c=
X-Gm-Gg: ASbGncvdTdJBFQadP3mK+2QVQ9FOc72gJBhYSCQ0mlekCNJrOkvKE4x5rKJhoRVohAf
	N2YqqoZSDfhK/XYF7BlXLQI014Lb/X2+djv8gVpzII4NvRQfWGWQeyFAOqsY1E8szOYszhULxoL
	ircQwJURHvoRjpb3IFL1XiVMkzzw4tEFIxZ5s2MT20Ics3F0yLGD89SwUn9QQWkjixFSSfC2Gj3
	z3o/3tf6w4gSD1Iwe7dqev2OznKCIMBAxUIFcWK7qpsqfAfQWBRj7rKy6c+mr1SZ47RnBYRenjv
	rgxB1HBdZWPjllCLc32GJkxjr2ntcg9BSFwtfZruj4Cr/rYlJyvaV7hWD2X7z+Y3LwSIpzKLS9K
	iHRbA+E8ZUdI=
X-Received: by 2002:a17:902:c944:b0:221:7e36:b13e with SMTP id d9443c01a7336-22c5357e7a5mr160362135ad.12.1745202929031;
        Sun, 20 Apr 2025 19:35:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4MvvIu8esok8nWOcLznbF+CtoOIC4TSGQumWfQQfJuHZWBGl+D+5PWzzoY1QA9tyt1v/Shg==
X-Received: by 2002:a17:902:c944:b0:221:7e36:b13e with SMTP id d9443c01a7336-22c5357e7a5mr160361915ad.12.1745202928598;
        Sun, 20 Apr 2025 19:35:28 -0700 (PDT)
Received: from kangyang.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4287sm54631685ad.130.2025.04.20.19.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 19:35:28 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
To: ath12k@lists.infradead.org, kang.yang@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 06/13] wifi: ath12k: add monitor mode handler by monitor status ring interrupt
Date: Mon, 21 Apr 2025 10:34:37 +0800
Message-Id: <20250421023444.1778-7-kang.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1.windows.1
In-Reply-To: <20250421023444.1778-1-kang.yang@oss.qualcomm.com>
References: <20250421023444.1778-1-kang.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Fe43xI+6 c=1 sm=1 tr=0 ts=6805aef7 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=21B3b2Y6f7DkZEkmencA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 92ApVMpF7cdIv7ykDdqR7lUU0qM8PQ_3
X-Proofpoint-ORIG-GUID: 92ApVMpF7cdIv7ykDdqR7lUU0qM8PQ_3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_01,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=830 mlxscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_193537_089372_C99B8FB4 
X-CRM114-Status: GOOD (  13.62  )
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

Monitor status ring interrupt is configured in previous patch. So add
handler function __ath12k_dp_mon_process_ring() for monitor mode.

Will implement detail processing in patch 7 and 10.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp.c     |  6 +++++-
 drivers/net/wireless/ath/ath12k/dp_mon.c | 12 ++++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 5eec14a7b1ea..b835c76d6d66 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -933,7 +933,11 @@ int ath12k_dp_service_srng(struct ath12k_base *ab,
 				int id = i * ab->hw_params->num_rxdma_per_pdev + j;
 
 				if (ring_mask & BIT(id)) {
-					/* TODO: add monitor mode function */
+					work_done =
+					ath12k_dp_mon_process_ring(ab, id, napi, budget,
+								   0);
+					budget -= work_done;
+					tot_work_done += work_done;
 					if (budget <= 0)
 						goto done;
 				}
diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 28fb9d4aa673..0f7d0d517372 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -3727,6 +3727,14 @@ int ath12k_dp_mon_srng_process(struct ath12k *ar, int *budget,
 	return num_buffs_reaped;
 }
 
+static int
+__ath12k_dp_mon_process_ring(struct ath12k *ar, int mac_id,
+			     struct napi_struct *napi, int *budget)
+{
+	/* TODO:Implement monitor mode for WCN7850 here. */
+	return 0;
+}
+
 int ath12k_dp_mon_process_ring(struct ath12k_base *ab, int mac_id,
 			       struct napi_struct *napi, int budget,
 			       enum dp_monitor_mode monitor_mode)
@@ -3737,6 +3745,10 @@ int ath12k_dp_mon_process_ring(struct ath12k_base *ab, int mac_id,
 	if (ab->hw_params->rxdma1_enable) {
 		if (monitor_mode == ATH12K_DP_RX_MONITOR_MODE)
 			num_buffs_reaped = ath12k_dp_mon_srng_process(ar, &budget, napi);
+	} else {
+		if (ar->monitor_started)
+			num_buffs_reaped =
+				__ath12k_dp_mon_process_ring(ar, mac_id, napi, &budget);
 	}
 
 	return num_buffs_reaped;
-- 
2.34.1


