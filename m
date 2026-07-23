Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FBAC531CF
	for <ath12k@archiver.kernel.org>; Thu, 23 Jul 2026 12:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b94oKJI0V8oiizpWlY+ZEOOdVZp4WMCXLAjxVvV7f3A=; b=DGKyxY46ubLWfGBOfOgylQ/sT7
	M28Psoz9gb5dZLLdd8pEp9HQAKCj9rUHPqqAL5S7RRkX1fLBPpEkK/milzpdjylOsQ0HAVKMfwC9o
	qTOjfsziubcs8EyZyXClGXOwFDZXAK9opSBSbLvCbQ0uN0gd81t2reslSVB1YKWseoRxXjqR/YwcQ
	gdSqKH+X+IGUH2vZpiMLsnAW3WdZeykXNGhbdlUtq+FAk7HyZOviDKTMfxTDJn6iisD7N/8N/Fet+
	GFMiXacnwMeTTH5VeBxFUMQbjxEg532RZmFxLK/WSqw4msLCtZqigFfBI6vasHUVizipG8BdZ1VKR
	1OJ4tEaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmsxD-0000000EHc5-2ydq;
	Thu, 23 Jul 2026 12:55:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmsxC-0000000EHat-0aju
	for ath12k@lists.infradead.org;
	Thu, 23 Jul 2026 12:55:11 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qZdH3667999
	for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 12:55:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=b94oKJI0V8o
	iizpWlY+ZEOOdVZp4WMCXLAjxVvV7f3A=; b=eiqhZmLX49jV5vQNQmSHLEujs34
	8en113oKs7KNYCWlyTilZCH47Au6Hn8IK3ZHcC3mblgs1I1Wy/5vpdY14llBjwmz
	TIz0pC8lrqfGWyo3VrUFeSuImhVCMo4rGBQB1LGZgqaAQlmgJe8pT9ZhpLOsjqaG
	1bqv6s1HOWrekvW+7mv63HV9IGz/F7BzzHvhJD2yaHG3cdXVt8DnvfG6XoKWqF/Z
	Zx1SHQnimJns1EwzZh+RUR1PzdLjk5dUr6CHW/afEuEDobQazn8syYoI7gfdy2cL
	6i9rHWpmmMfaXsQtfz9+4c7hWnhbQ0HtnzylltMz43N9KHQLcxs5hZ0baWQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk5cc39nc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 12:55:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cce14a21faso6404655ad.0
        for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 05:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784811308; x=1785416108; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b94oKJI0V8oiizpWlY+ZEOOdVZp4WMCXLAjxVvV7f3A=;
        b=iRHlAmlEM7cZN1JRLQh5jXxQXSUJfRSuRKh/N7RnO5DFNqwwJFkDRarYzD+5auQ76s
         1Lbwhl1v8hLhnEuKWdRbp28bdYu59y9GbVSuanGkg7lEhNxzXrROoDn96wiuLJqBaliO
         iGc6D7mJ/ZC56ypod/rRWt9IsrPSGRXb7RvazyoEipXhjYlCJQODdUS1nQ75rAK73xrq
         jlZSD8zo5FXhAwcUQajZ5DvsiJ1tHVuY7Hdqn5uJ4mRwKJlZtcG5C6iY2cCuJ26LaBF/
         SzIUinHDLKepdUlxLcnpU4TslNSFPfHD4K0nwlTYhbuiZB3GeH+US10NiDQJK/YtjZjP
         3dRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784811308; x=1785416108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b94oKJI0V8oiizpWlY+ZEOOdVZp4WMCXLAjxVvV7f3A=;
        b=p50+novB06FIN5pBOp9yqgHSOAiDt+krmMG7m5GvQ2R+AvhylG9NU0pyQ7fb5Mq/iB
         q7x6pfWROUEVjvFKarKold+uFnrcyVUF4CMFjTHNr0g+4Ozxp6CNd3m3FrJ80by+K/C/
         I9YzXbOn9IXfZ8QIDHLfBSRRs+Nj3eIJSikOVVS/JcDOGxp+WX8OuT3EaoeuxQnxBHrF
         0MNbQKfHzlYc7AM+ohwnlDtuS/dEyx7pOuJohpyLPF5DKTUUTMt4lHCsqh2qreY64F5E
         DkjkVlMbBmYgUH20ATvaGP7iW/bGrJFWMEnOyRHXK0i/O/vU6xgPGUmiHcquMWhS/ygV
         cVWg==
X-Gm-Message-State: AOJu0YxME2KRAxPNx7K9H5782nBLq6xYmvxr+6pCce4fYdi6AFNf9AuK
	oZfiC0hcNYpKGjc8+fXGyliljAYp4kv0D47b2QXwaZdwJNoqFZqmNI+WFB+tA6VeqlnWs7PV5g0
	nPyNzfLdH4R0d+imKQ5bt19V8yL2IPvn/B7TuPMZoCROHHyHZ9JGgtunOm8WOgq9uRPXt7gN6
X-Gm-Gg: AR+sD11m2ssAYoAHdGY87t6R0JlbsWInR5NxS2dXiYSx8CuPzlKVMGyrTe2Z2OCN/Gg
	JoPGe5Qurb7jPq0VJppSRl2dcNgYenn1rqFjKa1b/2IPj0+FMhaOeintqq4yLjbcUXSLnqW2f5J
	dHH5mV+k8sIXTZsEfux6W7IgTGiJc9oqV9UoLyIxVuGFUHJdirmWviiaKkosgHeF/RF2QJxCWmu
	i9VG210lureFDphiQLYbbfY+ETtBeAHRiPL+uiFfvobYRlaPUhV88DH/7qwILZlv0bGL+LCJIVA
	SOaz0Tw5O9JUgiRJDylhC5PgPQwSIJPgJYV864kmHKc6789YRJhSsYLkFpabqS/KDZujRNavLDX
	gT6WuzmG5KadjuOh5D+2aZz8Il0Km1MG/cXAbXBeqQ26TEG3ym70A
X-Received: by 2002:a17:903:f8c:b0:2cc:fa13:dcab with SMTP id d9443c01a7336-2cfa947ec37mr26487995ad.8.1784811307779;
        Thu, 23 Jul 2026 05:55:07 -0700 (PDT)
X-Received: by 2002:a17:903:f8c:b0:2cc:fa13:dcab with SMTP id d9443c01a7336-2cfa947ec37mr26487645ad.8.1784811307305;
        Thu, 23 Jul 2026 05:55:07 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f350475sm32998385ad.70.2026.07.23.05.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 05:55:06 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next 2/8] wifi: ath12k: rename wbm_status to htt_status in HTT TX completion
Date: Thu, 23 Jul 2026 18:24:42 +0530
Message-Id: <20260723125448.922361-3-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723125448.922361-1-pardeep.kaur@oss.qualcomm.com>
References: <20260723125448.922361-1-pardeep.kaur@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: EFyVVz5VpneJCZnl2vxye40UcjiBqlmP
X-Proofpoint-GUID: EFyVVz5VpneJCZnl2vxye40UcjiBqlmP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyNyBTYWx0ZWRfX9m0jPKF8+6rT
 Pwhsi18AhF1t+4wFHyM84Fe5TwuX8usGJgpvo9xsTC084geoLGPzSAb48mLndAwdAZKD6n4rYr6
 fE+kGGYttmtBDiUE0T7Gh3Vj4QW4Yuc=
X-Authority-Analysis: v=2.4 cv=L/ItheT8 c=1 sm=1 tr=0 ts=6a620f2c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=RuwI03aZ9ZQFnXGR-2kA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyNyBTYWx0ZWRfX2cGFEAAIn11/
 V3d4yInUsV9NCVtbijauCgjxctMeq9lfo9/4/8+lw+8sQzeZXMlFy1xAddRUhV+9fLlbSUCQ4D6
 9CL17RooBA7vuPTLCMsVBNlfeNPJRL4uoJXvIIHLOVXT6rDo3TTzEkw30AEWWiJ22IbiD7hBmPl
 nPL5fkgqlQXTMDaBWNEwm9JWYD9eXmK/7wrx4R1chUdmVE7ELuqxLvp7jXt9VKkJmhRe7WuzpZg
 svxrpitIbXyRRsZuTJFBSB3dq6qsq1MmQQfgT1DDLYogNV9OVhS0eJaExlV5IB4Js7+BFHoP2A8
 So9eNHMTc/naB4FeVdh7SUzxp3Esp+f2VI29XZjG6eIzBkjW+cPcxva3WzpmVbGxaunRVZpzu0B
 K85kM/N4zZ5X3TzKHIns1ti2YEvORCyjZqvGvmqcrBeVd8cCbkRUScKHSJ8lD6g+ey4ieZDAAWw
 uwvum2XYzovQW/dTMRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_055510_300093_7D7F057B 
X-CRM114-Status: GOOD (  12.10  )
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

From: Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>

The variable wbm_status in ath12k_dp_tx_process_htt_tx_complete()
holds a value from the HTT TX WBM completion status field, not a
generic WBM status. Rename it to htt_status to accurately reflect
the field origin and improve code clarity.

Also fix ts.acked assignment inside the HAL_WBM_REL_HTT_TX_COMP_STATUS_OK
case to use true directly since the condition is always true within
that case branch.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6.r1-00402-QCAHKSWPL_SILICONZ-1

Signed-off-by: Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>
Co-developed-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Signed-off-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
index 1d55ccacbff4..a0e409452a19 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
@@ -513,21 +513,21 @@ ath12k_dp_tx_process_htt_tx_complete(struct ath12k_dp *dp, void *desc,
 {
 	struct htt_tx_wbm_completion *status_desc;
 	struct ath12k_dp_htt_wbm_tx_status ts = {};
-	enum hal_wbm_htt_tx_comp_status wbm_status;
+	enum hal_wbm_htt_tx_comp_status htt_status;
 	u16 peer_id;
 
 	status_desc = desc;
 
-	wbm_status = le32_get_bits(status_desc->info0,
+	htt_status = le32_get_bits(status_desc->info0,
 				   HTT_TX_WBM_COMP_INFO0_STATUS);
-	if (likely(wbm_status < MAX_FW_TX_STATUS))
-		dp->device_stats.fw_tx_status[wbm_status]++;
+	if (likely(htt_status < MAX_FW_TX_STATUS))
+		dp->device_stats.fw_tx_status[htt_status]++;
 	else
 		WARN_ON_ONCE(1);
 
-	switch (wbm_status) {
+	switch (htt_status) {
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_OK:
-		ts.acked = (wbm_status == HAL_WBM_REL_HTT_TX_COMP_STATUS_OK);
+		ts.acked = true;
 		ts.ack_rssi = le32_get_bits(status_desc->info2,
 					    HTT_TX_WBM_COMP_INFO2_ACK_RSSI);
 
@@ -549,7 +549,7 @@ ath12k_dp_tx_process_htt_tx_complete(struct ath12k_dp *dp, void *desc,
 		 */
 		break;
 	default:
-		ath12k_warn(dp->ab, "Unknown htt wbm tx status %d\n", wbm_status);
+		ath12k_warn(dp->ab, "Unknown htt tx status %d\n", htt_status);
 		break;
 	}
 }
-- 
2.34.1


