Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C461DC3600C
	for <ath12k@archiver.kernel.org>; Tue,  8 Apr 2025 06:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TBNsYFDvRWgIGDQos+hDO8AQ7SgvMSnwcorWv3miZ/Q=; b=OgXsoimFtebeqoT6N0ps+/WLrM
	wOBX+iGiMFdMlA4lrLB2rSyM1nN2uTae/t+5+zes5x1qR8euYyXtybso04IpED1okHk8+YPVFwp+G
	l0vk2EMH6r8gwma++2wyIi/XXkRfVSxpeg+zf//1x6kZlLB7QoGAHh+cyOcqZiKaVQvTWRgDGBI4E
	97oPsZRVnmEM8mIBjByYfHpPQuIlt3MigTx7ZB54MwXQi0LOlmfD2zas4AEpGSuSPrCsvReIGKqGj
	SqSU2LMngK+0itxy0umiZrrwHbFnssj1A9GS/QMFTx5TSWg/QP+Pkh+X+EZMpDQOXxkEdq4ud6KvJ
	4nSu1OnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u22Bz-00000002ru3-25XO
	for ath12k@archiver.kernel.org;
	Tue, 08 Apr 2025 06:12:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2275-00000002qqI-2pr8
	for ath12k@lists.infradead.org;
	Tue, 08 Apr 2025 06:07:12 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GOeW006585
	for <ath12k@lists.infradead.org>; Tue, 8 Apr 2025 06:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TBNsYFDvRWgIGDQos+hDO8AQ7SgvMSnwcorWv3miZ/Q=; b=if4O7gDJWETnX+vS
	JgacxQhsi06ndsmYzIVb1jfx4hT4IhXNoBS3tAiBigfUkTNMslPdzqA83/RzxhC2
	NDw1Q2hN8M6vtKBwuD+2o/PHK/kygCKrpLvnmml3JuWVx0PvKfY/e3QGWVs57GPD
	VOA3OaJiYfKaZlcMQ/6ZfmAMZyiyofw8gLzM/pNsSCt+YdvFfqafHPD2z6wjAzwg
	WRNSyG3pKFJ2G6JMUjzJOv4jfQqO2dfXZh13Jg/q3A2zTf0JaHpLdnGA4l4xCj8V
	Ej0q8WV94zaA/hjb+zhn9bzaf4LVGXOllOZhdRgc1AgNMTiIrQTbMUDRDdt4CQt2
	Um1tLQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftekqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 08 Apr 2025 06:07:11 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-736c1ea954fso2757117b3a.3
        for <ath12k@lists.infradead.org>; Mon, 07 Apr 2025 23:07:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744092430; x=1744697230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBNsYFDvRWgIGDQos+hDO8AQ7SgvMSnwcorWv3miZ/Q=;
        b=n7w9wUCBEGbnop4jCqgygQZClZKL42vv9ZtG2hYs8PnEhTHwKj/AV0fcRQFz+GhQ0H
         SYzzFO7gBkwqskXD3AU3yHo+dtPwK243B/C9lAD3fDqJVXCA3KhfA5flNCAWFAH1+U+i
         59/uolI+Ydl0EEt6MyaLGSoI5w/viZZ2fKBPEBbPmLU46CsQnO4iW3sR7npEP4x9rQRx
         8JsR6HyEg4jUWf7Gb6DsopITQdGG0BzrKeTej2LkkAzox3moeiZFxV70BByYbtAanLno
         ihXozJJId55Lf+kDJtyrPj9VphF8KSARhFr8u9b3UhfvWBCXJgmKgBLe1HriGuuOHujp
         VsXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzrTawlh+aL1R1G5i0eV6U64TWXnN3SCohZbfFT941pWQgBVdRIWd6fEMum5gr6TBY1ZGP9tg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzcpdr+Ipad+j+B4pBIOktdVqgaPPuDADJYgSYKaH0P7cfimUqu
	jAmZWA9QX2NGkFgteS0b3LB0DHqRJCzOcn3Lj0l/84jgUX6uRWpzPhuhE9QKO0Jjpyb+nx8G9zA
	wDBZWAL4CES7hpSMgMrZOaqzNI5cxMR6Ad3jAYl8LiqLQDRuhQxPQbTpk4Qixy2s4EvS6
X-Gm-Gg: ASbGncuhfYVgfC6DZ72z5u6D6R31+wo+OMkL5fwjEeKpyWWM9rvJqeqRNz2ninb7qXK
	WGsZGL5FO75AoE+7IrhC4QzcePqx/WzIBw9lMnvavkQssHktPt/dT17Eg/IACFBrd/niZCt5Io6
	JNNPQPdR7v5zcTWOVLzZkbQqsMNmsjjVfMTkIFAtErut/mdMzA+5HM9ZK2Eq4a3f/pC8fQo9Niy
	wfldsFGCFx1bZOFIhK8FfM1gf7uQ6gHMztIDnTnLkGsk7tv0x0+WWil1O7hi5kGt8STydpHZ0M4
	6VgcPw/Wi3eK1k82Ze0Rqw/H2qqgVC2b03OKpW3BNvpp2z5h2KoGqExZVeDw9TyjHFk0R72i53Q
	cMQiFIH7Agl73hXGKiWN2MXmcDzIblHLGPQ3+Dh+f
X-Received: by 2002:a05:6a21:398a:b0:1f3:3ca3:8216 with SMTP id adf61e73a8af0-2010447b49bmr22460074637.5.1744092430040;
        Mon, 07 Apr 2025 23:07:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnZbvQpsmy69UjkGjJMMc2V92O5njwVfVcsI9+dfavomT4AnX/sa54dA8IjoGEF2kgN6ADhg==
X-Received: by 2002:a05:6a21:398a:b0:1f3:3ca3:8216 with SMTP id adf61e73a8af0-2010447b49bmr22460036637.5.1744092429644;
        Mon, 07 Apr 2025 23:07:09 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc35079fsm6863981a12.41.2025.04.07.23.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 23:07:09 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Tue, 08 Apr 2025 11:36:37 +0530
Subject: [PATCH ath-next v4 9/9] wifi: ath12k: reset MLO global memory
 during recovery
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-fix_reboot_issues_with_hw_grouping-v4-9-95e7bf048595@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f4bd0f cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=W2Wr2cnFbXLycozjVykA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: tK5pl0DfIqvtYb7LG7ZxalB5vxYeekAU
X-Proofpoint-ORIG-GUID: tK5pl0DfIqvtYb7LG7ZxalB5vxYeekAU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_02,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_230711_723203_8FD8FF1A 
X-CRM114-Status: GOOD (  19.65  )
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

When operating with multiple devices grouped together, the firmware stores
data related to the state machine of each partner device in the MLO global
memory region. If the firmware crashes, it updates the state to 'crashed'.
During recovery, this memory is shared with the firmware again, and upon
detecting the 'crashed' state, it reasserts. This leads to a loop of
firmware asserts and it never recovers.

Hence to fix this issue,  once all devices in the group have been asserted
and powered down, reset the MLO global memory region.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c |  3 +++
 drivers/net/wireless/ath/ath12k/qmi.c  | 22 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/qmi.h  |  2 ++
 3 files changed, 27 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 55db189d82346438272c94f25b62dd0db8716efb..9b23329f1bf2a1a84f2b5dee1b67db469d3a8ce5 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1657,6 +1657,9 @@ static void ath12k_core_reset(struct work_struct *work)
 		return;
 	}
 
+	/* Prepare MLO global memory region for power up */
+	ath12k_qmi_reset_mlo_mem(ag);
+
 	for (i = 0; i < ag->num_devices; i++) {
 		ab = ag->ab[i];
 		if (!ab)
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 7df6c6eebed6855ab42519610962d2b21825d9ec..c867130f1ddc87ba3ea65d03a6fe99a06c6fe2ab 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2439,6 +2439,28 @@ int ath12k_qmi_respond_fw_mem_request(struct ath12k_base *ab)
 	return ret;
 }
 
+void ath12k_qmi_reset_mlo_mem(struct ath12k_hw_group *ag)
+{
+	struct target_mem_chunk *mlo_chunk;
+	int i;
+
+	lockdep_assert_held(&ag->mutex);
+
+	if (!ag->mlo_mem.init_done || ag->num_started)
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(ag->mlo_mem.chunk); i++) {
+		mlo_chunk = &ag->mlo_mem.chunk[i];
+
+		if (mlo_chunk->v.addr)
+			/* TODO: Mode 0 recovery is the default mode hence resetting the
+			 * whole memory region for now. Once Mode 1 support is added, this
+			 * needs to be handled properly
+			 */
+			memset(mlo_chunk->v.addr, 0, mlo_chunk->size);
+	}
+}
+
 static void ath12k_qmi_free_mlo_mem_chunk(struct ath12k_base *ab,
 					  struct target_mem_chunk *chunk,
 					  int idx)
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index 7c44ced22c6f610fc32b1db9c073de73020d8e16..96e6c3daecfea48efc8fb65ccfddcd516ef2f3ce 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -42,6 +42,7 @@
 #define ATH12K_BOARD_ID_DEFAULT	0xFF
 
 struct ath12k_base;
+struct ath12k_hw_group;
 
 enum ath12k_qmi_file_type {
 	ATH12K_QMI_FILE_TYPE_BDF_GOLDEN	= 0,
@@ -622,5 +623,6 @@ void ath12k_qmi_deinit_service(struct ath12k_base *ab);
 int ath12k_qmi_init_service(struct ath12k_base *ab);
 void ath12k_qmi_free_resource(struct ath12k_base *ab);
 void ath12k_qmi_trigger_host_cap(struct ath12k_base *ab);
+void ath12k_qmi_reset_mlo_mem(struct ath12k_hw_group *ag);
 
 #endif

-- 
2.34.1


