Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41DB1C369A7
	for <ath12k@archiver.kernel.org>; Tue,  8 Apr 2025 06:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LIxkWENj/q2hTkMwvmODIhHwoW25U8wZdObE/3hO0NI=; b=udmb0YNVbqIfZ9r9Y98JACbs6+
	+4P0klmVjEs/BK7nUUsTcYaubQCyFsG3ANQo21wuCCoBx5pbCTXp491MjPnBkYhVVNxmgnmLTcPla
	2nx3F+mb043FpZFNQ7Y08Gc5s9JAAOkG3WwmLBqyx4U7/Hy3G0pN+SF4aNDY5kNd1TQzcNSioyOZ4
	40HcNXhag/GDl/7tF9ynAjP3UczNlcdvmZtrPwE+nCX0g1Ux/QpyF4gao783nPkTsKsyojJQPM8LM
	+4llt2UojdmE8dVqORi2qeR30kPDl0lZwBPh/gwH7i0P8w2ODoBEv5SmXEcWtcrUjfKvQFbUfGc9k
	V6lw9+RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u22By-00000002rtI-4Aar
	for ath12k@archiver.kernel.org;
	Tue, 08 Apr 2025 06:12:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2272-00000002qpn-2EGg
	for ath12k@lists.infradead.org;
	Tue, 08 Apr 2025 06:07:09 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GMAN020154
	for <ath12k@lists.infradead.org>; Tue, 8 Apr 2025 06:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LIxkWENj/q2hTkMwvmODIhHwoW25U8wZdObE/3hO0NI=; b=DsNBpDpHYogO5ivX
	rtKEac5xXk9Q4qsqnusChpqD30EvEDslUg+/Xfb1Xo8TtB1MQZ8xXeOg0XhQVA8u
	3rGPK+DB6tocg48AhuBwdc5O19gUWiNJU0D5c029Umlpp4+5GkJn7vfHWzSB1Ayj
	feHeWaBw3fH3St2SEjlcOR4tIZZf0SJo2YFML33HkV75yaR1oFqguNnOF2dXz2so
	JC116sOqU6fw+yVUmWHIuKk3VR+bOPl02RyvjIQllSVFpvE6YktMDF6ipfy1B6Uf
	jJm+NyUH2+7w0TZANZ2vMI6s/UazFLapkjFnYv/gea5YH+E9fIwzzL7XCtw0q+s4
	E7a0RA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2ppaf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 08 Apr 2025 06:07:08 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-739731a2c25so3627682b3a.1
        for <ath12k@lists.infradead.org>; Mon, 07 Apr 2025 23:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744092427; x=1744697227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LIxkWENj/q2hTkMwvmODIhHwoW25U8wZdObE/3hO0NI=;
        b=FagY+yYtsplmUgVm/mQMw7FehZQRICglapEOLz/mHGAx5tH6C2k3ci74ENeqfO1sgt
         o5C5ScTINkNsRBe9iAXAia2uz19zX0vIPNkZCz7rvFPX8asQ2Qox+VnaV8YGSnLOSBC4
         QjVXn7lsog2clvtowmwG+mKSB7dtBBpbzQ59Q0Bdconq4L7DsYUvM8bc3eK1UrN/VqeD
         7Qzh9lrilOG/da+wKq6mRsThZ2XC1Efiy1OgXuw7TVTqZ1ldAnRbzwlIGp7tu2hwdSv5
         GpO53zKJsyBvkEZKvHHSUMnTUqsaXBCAdn6GT446k8tgaAKf5V/ysa+FjF8mQuYa8M2K
         5Vuw==
X-Forwarded-Encrypted: i=1; AJvYcCW2u7nmaP2qHbsa8aWON/3ylF11/VKA9mOoaqKeBP6Se+gDWCykuBx3CSmiwDA+D4KSPC7Td7M=@lists.infradead.org
X-Gm-Message-State: AOJu0YyXr/p/J8ooqaVK/pNhiPshyXKWzeZMDklup3xfhGKsSdDkAMnU
	6OhuDPAoknL9xSUDfWnivwpvrKxqm7RUNvK6ne9JOeAdEejV4btbR+5sth1TsklYUN2PShkZCgK
	PGLMtNR+b0uMJKlJVGDrpx/tm+WVo9fxsE5xaqx+eB9pwr76NInAs26VSZRqCfzWzMD2e
X-Gm-Gg: ASbGncsy6qIVO6XFFCWrBRorE3mfpPzZjWrPwaIy52MhiNOKPV58/+35+Qru8w9R/5K
	vsPr/O1ks33ugWfQPPzxtNe5ilOInvqcpTsjPZXo7QuBbiZ5Hu84StnMpitsFIrSp7GHJLVl9j0
	rQSbcDNElEKUXPIAy5glSDcQTTzEnbhWfZ1ll/3aujunZzdmCtH7yStXCTUejodpa+/5bc050Km
	D2xrLGu8ikseKLTlF+8ZeFhEy8/5ZND5qCzueM+kvitOwioMUTsFTb3KI5k7QSMO56NZUp1N/cl
	H0mu8Uk1+bn7wO5gVYhCAsMI4UlQcrGD1CKpk78X+CWKCKpK+5mLZK4s5vqNEhY/UcMLXOIxwdR
	RlsK+VTQImEsw5CAYUZ6UiEDUNOEbr4Ew+8iSyBeI
X-Received: by 2002:a05:6a20:e615:b0:1f5:6e71:e45 with SMTP id adf61e73a8af0-2010472df50mr23137223637.27.1744092426944;
        Mon, 07 Apr 2025 23:07:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUfZpNpImfeyNF3xfOncodEa1J6cUs6peESY7TuolTeZvZk3fkw9PWN6do2t15rjWkh0MPUA==
X-Received: by 2002:a05:6a20:e615:b0:1f5:6e71:e45 with SMTP id adf61e73a8af0-2010472df50mr23137196637.27.1744092426609;
        Mon, 07 Apr 2025 23:07:06 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc35079fsm6863981a12.41.2025.04.07.23.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 23:07:06 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Tue, 08 Apr 2025 11:36:36 +0530
Subject: [PATCH ath-next v4 8/9] wifi: ath12k: handle ath12k_core_reset()
 with hardware grouping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-fix_reboot_issues_with_hw_grouping-v4-8-95e7bf048595@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: D6EiKQO-TVnH7CucYrhI67BWy_qg14cD
X-Proofpoint-GUID: D6EiKQO-TVnH7CucYrhI67BWy_qg14cD
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f4bd0c cx=c_pps a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=WsyaGQEz6myPfAgSfy8A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_02,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_230708_578454_4CFC667B 
X-CRM114-Status: GOOD (  16.00  )
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

Currently, in ath12k_core_reset(), the device is powered up immediately
after a power down. However, with hardware grouping, when one device
asserts, all partner devices also asserts. If there is a delay in
processing these asserts, by the time this device powers up, other devices
might still be asserting, leading to an overall recovery failure.

To prevent this issue, ensure all asserts for a group are processed before
initiating the power-up sequence.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index a1c9b8771e9c4c84548da2cb4054b0403aa8c759..55db189d82346438272c94f25b62dd0db8716efb 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1582,7 +1582,8 @@ static void ath12k_core_restart(struct work_struct *work)
 static void ath12k_core_reset(struct work_struct *work)
 {
 	struct ath12k_base *ab = container_of(work, struct ath12k_base, reset_work);
-	int reset_count, fail_cont_count;
+	struct ath12k_hw_group *ag = ab->ag;
+	int reset_count, fail_cont_count, i;
 	long time_left;
 
 	if (!(test_bit(ATH12K_FLAG_QMI_FW_READY_COMPLETE, &ab->dev_flags))) {
@@ -1641,9 +1642,31 @@ static void ath12k_core_reset(struct work_struct *work)
 	ath12k_hif_ce_irq_disable(ab);
 
 	ath12k_hif_power_down(ab, false);
-	ath12k_hif_power_up(ab);
 
-	ath12k_dbg(ab, ATH12K_DBG_BOOT, "reset started\n");
+	/* prepare for power up */
+	ab->qmi.num_radios = U8_MAX;
+
+	mutex_lock(&ag->mutex);
+	ath12k_core_to_group_ref_put(ab);
+
+	if (ag->num_started > 0) {
+		ath12k_dbg(ab, ATH12K_DBG_BOOT,
+			   "waiting for %d partner device(s) to reset\n",
+			   ag->num_started);
+		mutex_unlock(&ag->mutex);
+		return;
+	}
+
+	for (i = 0; i < ag->num_devices; i++) {
+		ab = ag->ab[i];
+		if (!ab)
+			continue;
+
+		ath12k_hif_power_up(ab);
+		ath12k_dbg(ab, ATH12K_DBG_BOOT, "reset started\n");
+	}
+
+	mutex_unlock(&ag->mutex);
 }
 
 int ath12k_core_pre_init(struct ath12k_base *ab)

-- 
2.34.1


