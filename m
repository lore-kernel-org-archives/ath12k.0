Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E454AF364B1
	for <ath12k@archiver.kernel.org>; Thu,  9 Apr 2026 18:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kLOLuOwfq3+RKuL9d7Vb9jCVumI7Dw9kQT1jzNszUNY=; b=V2LuXevuKCfOsWUG3bKLKORng4
	wD7+qwSpAMGdY9QZnNMlCV0WPkxEk1D0gpi8dbpDoKxkfZ/qnnNhCdLuKRQIROKuLpqZuLtDStRnF
	d2w6qQNnyD6cN5SuUnhKzeHcGFNt9jTzXKEaffEP5uKwuYQRLhYVKWIR0Z9YbVxB32Pl4L3NDReq1
	4HB3cSUupK1ByyPEuB7gK59mPOD0JYQS24fMiXJ1TsvKXCfnHyPVOBInyl+JC2qSBzZFWrOSYdUgu
	1GHTP/HflmN0rCTxTl0DIQ6o0/Pd3739DP/I0Ge28tUCikllg/JZZvIphnTxHsyB9LCXGFVPS5Uk3
	AstEilUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAuMi-0000000B6lP-2sxS;
	Thu, 09 Apr 2026 18:44:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAuMf-0000000B6k0-28KQ
	for ath12k@lists.infradead.org;
	Thu, 09 Apr 2026 18:44:30 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639DdTDk2812257
	for <ath12k@lists.infradead.org>; Thu, 9 Apr 2026 18:44:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kLOLuOwfq3+RKuL9d7Vb9jCVumI7Dw9kQT1jzNszUNY=; b=FeAEk9oJAe9ji7xI
	Yp64MUaQ4bvaqppQp4FOpaxXO64K7DdfFLIvdVBX1Pqjh9z8sP1GV/N7be1KC09j
	1POwsbof6NT63ViDPOFQBzyassE578ZP9BqdhTvTzdTbZJ5t3782Rvhzkjh41yGI
	OHmO6uzDux1iscABZlbd+nFAm8gWsE4FVjk/mGBhYqvnuw7oCUwGfdbvOVilWA9a
	PgeiXNBJBjO8B4ls10WNSiKjFt/oPB3lQkdxV3hzmW80l8nfS42paLuaNEQOljl0
	BK14ddZyaRlc4YgMTCtGIko0Bq9sxmu6dJ3+oNg8VvJax5VyHaj00e7o6QcTEAqZ
	/0JQlA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ded6h94f6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 09 Apr 2026 18:44:28 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1270dcd11c1so1676269c88.0
        for <ath12k@lists.infradead.org>; Thu, 09 Apr 2026 11:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775760267; x=1776365067; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kLOLuOwfq3+RKuL9d7Vb9jCVumI7Dw9kQT1jzNszUNY=;
        b=BmgUR320zMOzYpr6gRg58oUvldKNMEV2ooS2lvxNsdgj3ANqe6A2/83V1F+3Jb4LUM
         HpfTm8ju4vVfrJKhhTsJkv7jeieTI8Y/ex5VbVvak+XU0qROF2GWF5iUOOo4Vd6yUPRa
         nbqSP+5UlCEvEzu+MetsEk6NcjyrnbzblTT+CQGey7AjbHFepDHqgvN8Wsxf5W6bbS7h
         xO2hRfoH2WZw4kvun7Ifio4wX+GfcNT9KsC6mN0FGL69KMg3Jks7nsTUscNtF3m42Qv1
         X/uHi3qWPma58weybjCUauKNhs0haMsc5Q8OUo5F0RANb1OLW4rLmxD6wAp2ybU+xabg
         Ua+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775760267; x=1776365067;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kLOLuOwfq3+RKuL9d7Vb9jCVumI7Dw9kQT1jzNszUNY=;
        b=i8kgZkDywocETAkQahl4wxDVoVhswqti6NNMg0TfmVXqe5l8OEg4GvENYKPVY6hZ3e
         Pa+Kl9R7OHaA9zdXwY9NQe80Tc4sDz61/uKNVucPEI8dt5wo/Ij6luJaG1Kdh4ujjhqe
         AVbEdrddpo8l5o1vxCxxFj9MzPmFAiqRF7WTjcqGt2NSSF/LRsErWDNaEaPfRNcqFk7S
         6sEeOeM6n+KgVgVZVrX2/2DIgig8z9DREgnD0HtNEi5cza/kxdCKORExaarnM525Hu00
         94Fm66bVuiRtL95IiGuUCA8qNorX9GexzXKKvt8G3z/o3R9e6owS/9IQt91v21xMYgBi
         Q34w==
X-Forwarded-Encrypted: i=1; AJvYcCUpg/j3em3EJCHkfH7YI/TYqbAs21jrDz/+YGl1EYjEYQT5g8s5iLRXNrPUm6igMgfXxF5e1DY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyNFitQM61eKLrEjmuoCDmkQGaUPxbAWFNvwF6fvvCuSduqTbC1
	qIact2MSWJW2GcD+QDAyI2/2+Na6Se7K9wLLm1apeV0yfkNo6Y0t3RzLOE6QIgWMzU5cO/lHA7/
	m7wx/cwCnfvZxQ6JOaGVeNXxyzH3mjNXVfi8hp9/T3EZswgC7XFbnPbQZoJI05+IU
X-Gm-Gg: AeBDievrBhNMi2Rbe+s84T+wu+H4NapI6ANJslzwzreYbg3SpP+k2yigCw3kVo6Jz+F
	bsKO/9nA3FEnWFJ5brr6ViR2O3SI4QxvePTjaGPhnYFEMZ/lah5Plc4ZAc+T4q5PvAgrKiFiJVo
	XKRJ0EssIFTMbAEOQe0y5dEApZQ1xwwL3kK8zgEjggBNhV9CX7x43fY0yWXBSPWuP6+OqGHdmPl
	Zn64ulgOspsjdxnGoec8+65RtnKUqjPXLsdP1UqKoeqAzRaUsZQ+b95rT/X+twH/ZbYxjqcY1sS
	bNtRVCUoJi2vJXyLujNmb9pUXVdyM2elOYLlr9+Geem7eb9om0oIKwc0iMtQawN6jYRmhbPAbia
	ce2R4aCUdDBzD78rzTUl9uSLTEMySxVb6Sw0oSscKL0go4dujvyoTim3pEexysvXfCAJ1Wdu43D
	iM
X-Received: by 2002:a05:7022:e986:b0:127:15cd:9f52 with SMTP id a92af1059eb24-12c34e37b1fmr127131c88.5.1775760267334;
        Thu, 09 Apr 2026 11:44:27 -0700 (PDT)
X-Received: by 2002:a05:7022:e986:b0:127:15cd:9f52 with SMTP id a92af1059eb24-12c34e37b1fmr127060c88.5.1775760266762;
        Thu, 09 Apr 2026 11:44:26 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c34352490sm513985c88.0.2026.04.09.11.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 11:44:26 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 11:44:23 -0700
Subject: [PATCH ath-next 1/2] wifi: ath12k: Fix HTC prototype ath12k_base
 parameters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-ath12k-htc-proto-v1-1-cda86d6355f1@oss.qualcomm.com>
References: <20260409-ath12k-htc-proto-v1-0-cda86d6355f1@oss.qualcomm.com>
In-Reply-To: <20260409-ath12k-htc-proto-v1-0-cda86d6355f1@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=RfCgzVtv c=1 sm=1 tr=0 ts=69d7f38c cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=TfkjnaP5MeWC5N93_1wA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: _9HKcUHfB-0rz-ZWTF6NwN7claGsh9xW
X-Proofpoint-ORIG-GUID: _9HKcUHfB-0rz-ZWTF6NwN7claGsh9xW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE3MSBTYWx0ZWRfX9/6t/v4Davlw
 OHDCxgukV2GCmRQe5C278QwLVpRRl3ZAjoJWcP89v2rNtyTKW2EnWU40QiCG3Anv2P62DWJgS+o
 6YRTqcVNUOGW7exTfe2nuGaQy7oVActJwv9CqB2okeaZm1RolF/qU7A4igYC2dTHgFPe2Tj3OBD
 PBwXwQTvFc+9e7Xf+B4vfoRTb7SaQlbFOS9YKzHiEx0YWvQZw2iMFWt1O400WcGNbXnwLDjxLG9
 Gns8w6/BVcv1xyv0x+zN53o+CvDC17KRhd5phXjPM6KN2qK3c3OY+uZYHf/+KG/3Ylu/8t3+TLy
 EbLFE75YvO3c4fWQ6U0hphTWUC9PTP/p3KKO4fng6wREpSbCs2EFHVlq5mnujJ+9ezrlNyOuSco
 YTWYIKrFzwakSr6SFbFO0ZJuhSA5ph6ePkYIROnXds/Pj9rhaQkBf1vpqq2/2f+F9osyORGK8S/
 m3ohOUX6OXKSwWM7//g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_114429_553795_65229AE6 
X-CRM114-Status: GOOD (  13.57  )
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

Per ath12k convention, a pointer to struct ath12k_base should be named
'ab'. However, in htc.h, several function prototypes do not follow the
convention, and instead use 'ar'. Conversely, in htc.c, the function
implementations all correctly use 'ab'. So update the prototypes to
match the implementations.

No functional changes, compile tested only.

Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/htc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/htc.h b/drivers/net/wireless/ath/ath12k/htc.h
index 7e3dccc7cc14..05b3e593542d 100644
--- a/drivers/net/wireless/ath/ath12k/htc.h
+++ b/drivers/net/wireless/ath/ath12k/htc.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef ATH12K_HTC_H
@@ -301,7 +301,7 @@ struct ath12k_htc {
 	u8 wmi_ep_count;
 };
 
-int ath12k_htc_init(struct ath12k_base *ar);
+int ath12k_htc_init(struct ath12k_base *ab);
 int ath12k_htc_wait_target(struct ath12k_htc *htc);
 int ath12k_htc_start(struct ath12k_htc *htc);
 int ath12k_htc_connect_service(struct ath12k_htc *htc,
@@ -309,8 +309,8 @@ int ath12k_htc_connect_service(struct ath12k_htc *htc,
 			       struct ath12k_htc_svc_conn_resp *conn_resp);
 int ath12k_htc_send(struct ath12k_htc *htc, enum ath12k_htc_ep_id eid,
 		    struct sk_buff *packet);
-struct sk_buff *ath12k_htc_alloc_skb(struct ath12k_base *ar, int size);
-void ath12k_htc_rx_completion_handler(struct ath12k_base *ar,
+struct sk_buff *ath12k_htc_alloc_skb(struct ath12k_base *ab, int size);
+void ath12k_htc_rx_completion_handler(struct ath12k_base *ab,
 				      struct sk_buff *skb);
 
 #endif

-- 
2.43.0


