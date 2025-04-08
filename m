Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0D0C369A6
	for <ath12k@archiver.kernel.org>; Tue,  8 Apr 2025 06:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8QQxTRGzAWSkjPcsxs8V36ycVB81HcrD4UeC7M77KZM=; b=Mm/PM9ySfVv4Y2I00wCqB6FPER
	DoqXvtMIDxI6pnGHffVt8NIeR+DZ7H1A/0mKCGIFWeSKwF90xivPoa4Q42w9DfGX+PRtw2I42P3BX
	pWwk0kM0ZaMJSQW8Hs+6fzCpwZe3jiKFGfpZ4K7ZWOj9rh4K1b3qqkKHzpKojGPTjxxz39Bpux+YD
	tvYw5o9mGzad1ikUfphm7SDgmYwBYdw/xLurWw/1Uafs2UbBNI9gX3lFgmeYMHUB+4jQGbSBY4d7d
	1SwPQaEX9v6OB/KQxA6HdQQvvp+oRlTlsTN+T61kfsi9l6HvANloJC9TmM4FyYsem5MF+npMnbqKf
	VpGpQ+SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u22By-00000002rsn-2HTF
	for ath12k@archiver.kernel.org;
	Tue, 08 Apr 2025 06:12:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u226z-00000002qpB-1Vtq
	for ath12k@lists.infradead.org;
	Tue, 08 Apr 2025 06:07:06 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382JK0X014104
	for <ath12k@lists.infradead.org>; Tue, 8 Apr 2025 06:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8QQxTRGzAWSkjPcsxs8V36ycVB81HcrD4UeC7M77KZM=; b=fL38UVB7bNHdaEQj
	Wc1QFOcTKceTSt3/ZbS+K6nF5hC8r9LKlPSpPblwk7C/6VOxLcPA6SagD/by5hqJ
	C1LgeC6qrI7POL7IGnmMJIVGZfRKnRPr4z2uR6rO7cOgeE6val6/4B0HqDLI8rYE
	fWtXBPcngG4dBKeWIc4UKCNcHOl7UWYFbUe5rYXjlVDFKNPutm1a/UvOUrpdAED3
	dssyJ/VeB+oFs+kkdeWMvfRsy66TRslVuKf5pBt3Z1/1FbZSXlqa+QMSDDlwkWgW
	KIwFKxCly0Ewb8N5j8VSf/CZCO95KT4cVejRwS6OqfPG1qOt0QPwciyyxMRP4pzU
	SVOmaQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpm6nhr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 08 Apr 2025 06:07:04 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-739525d4d7bso4062153b3a.2
        for <ath12k@lists.infradead.org>; Mon, 07 Apr 2025 23:07:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744092424; x=1744697224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8QQxTRGzAWSkjPcsxs8V36ycVB81HcrD4UeC7M77KZM=;
        b=hEiSDetr9qO1qvoDNC2l4YI9sXXLuVJjV4+jG2wJJdR/c2NOmifG+aQmaK1h4c2Ukh
         5adv1csebGAzsKwS4or62TJETcREAVaClBLfKFvb9M8D3HMb24VmLiyfEh4xsp7tjhkt
         Q/i1koPtBN21EFevBxbmhisKR7+/KVZ4bGxuI/ZOTIqL2YpMoRcV93O2RCJ431iPOb5+
         ylYVRcjaDgOHIPOtnzuixX/f+dKFn/NLD9aroD31j+lmCOLA4+DgrFGdfvh9hTop9aqS
         A+4FEWs6NCYfPSpeaMt/oND6LBX0RcVRTjEDK8t+S+78QhMiejW0xJ6vUdRE7qJC1BpA
         IpwQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8B/mUIak10eiAm+xvcnpGnBmzIBo+R2IiYE1OTHDky4ZPTMx7Fo37RnyOWXvwUBmHrimVQ7I=@lists.infradead.org
X-Gm-Message-State: AOJu0YzIhpPIuTs1P0OvaUC6iRHiephEFg0czY0WaBXLM9JBhvkD4g3T
	HSj+/nz7RIgZy+s9POb+cw03zHz1DlfBufkCi3pbJBzYeQnfdTeW6GN166Wg3cJTWMa/N0LWZfa
	4J8Tg1LhAHsUXzwR8/7UzI+MpBOemSw7VCAM6oLUiP+U+IWGfuNJOeXOrU/xZq1W8ke15
X-Gm-Gg: ASbGncvzmYlUQ0jeeqIfOJzF9GdLpO3IM1rrc4oI7sYV7BNTG8ggLK3kJzFPcN0m7PN
	Px3VRBteLbqBUD2HhkvcPT77v9RzdmTiiTypbY77YtHqGKsdf0pSi8w2IkzeDSNzwMeXUgnvuLl
	d3sGBQVUAwZIOGsHdDLGPH5jdKgl/aDydhGneMurnj2dszfqWk1TndleJFbRIw0RhU2oAowUNCF
	fuGhYg4mWfYDZI558ab99wceWTgubHGTj9axB7mEovmh72FyzlF/6q2RKy3Hli9dqbYPbPrH18S
	23Kt0uzCa0/SL+SAN00ST6eTzB13r/ewd/FM/lAsg6ashV+cRD2xa2SpaXbR8XV6dVkkoL/1nc9
	+Lqh3Ofx3qhXGDRrpcVnIQRtqfjveGctw4aewvymx
X-Received: by 2002:a05:6a21:9106:b0:1f5:7873:304f with SMTP id adf61e73a8af0-201047308d3mr23586264637.37.1744092423929;
        Mon, 07 Apr 2025 23:07:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGehgwvENWYFAh7L0VL6AOYJv5Q31lAnQj6VPBRBRWbyGqHgmJcLhq5+f5Nogv81PMUJMbnA==
X-Received: by 2002:a05:6a21:9106:b0:1f5:7873:304f with SMTP id adf61e73a8af0-201047308d3mr23586228637.37.1744092423532;
        Mon, 07 Apr 2025 23:07:03 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc35079fsm6863981a12.41.2025.04.07.23.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 23:07:03 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Tue, 08 Apr 2025 11:36:35 +0530
Subject: [PATCH ath-next v4 7/9] wifi: ath12k: handle ath12k_core_restart()
 with hardware grouping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-fix_reboot_issues_with_hw_grouping-v4-7-95e7bf048595@oss.qualcomm.com>
References: <20250408-fix_reboot_issues_with_hw_grouping-v4-0-95e7bf048595@oss.qualcomm.com>
In-Reply-To: <20250408-fix_reboot_issues_with_hw_grouping-v4-0-95e7bf048595@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Kalle Valo <kvalo@kernel.org>, Harshitha Prem <quic_hprem@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: YiaS3L_MnPLkWgbtUbdrrEHRbpDD4mE5
X-Proofpoint-ORIG-GUID: YiaS3L_MnPLkWgbtUbdrrEHRbpDD4mE5
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f4bd08 cx=c_pps a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=J1AqtRd1v4e3_tdQaqEA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_02,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_230705_406971_787D793D 
X-CRM114-Status: GOOD (  15.96  )
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

Currently, when ath12k_core_restart() is called and the ab->is_reset flag
is set, it invokes ieee80211_restart_hw() for all hardware in the same
group. However, other hardware might still be in the recovery process,
making this call inappropriate with grouping into picture.

To address this, add a condition to check if the group is ready. If the
group is not ready, do not call ieee80211_restart_hw().

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 0fb3e57cd254ede767528e47e1d9d183257e5b71..a1c9b8771e9c4c84548da2cb4054b0403aa8c759 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1560,12 +1560,22 @@ static void ath12k_core_restart(struct work_struct *work)
 			ath12k_dbg(ab, ATH12K_DBG_BOOT, "reset success\n");
 		}
 
+		mutex_lock(&ag->mutex);
+
+		if (!ath12k_core_hw_group_start_ready(ag)) {
+			mutex_unlock(&ag->mutex);
+			goto exit_restart;
+		}
+
 		for (i = 0; i < ag->num_hw; i++) {
-			ah = ath12k_ag_to_ah(ab->ag, i);
+			ah = ath12k_ag_to_ah(ag, i);
 			ieee80211_restart_hw(ah->hw);
 		}
+
+		mutex_unlock(&ag->mutex);
 	}
 
+exit_restart:
 	complete(&ab->restart_completed);
 }
 

-- 
2.34.1


