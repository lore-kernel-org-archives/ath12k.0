Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051EDC369CB
	for <ath12k@archiver.kernel.org>; Fri, 18 Apr 2025 02:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zkJ3M8XR1D7NZo+boMIyj9qewdmhkLRjngxZsxxlwf0=; b=itMIsN1ViflCBFWQy492egsbT9
	/Qn57DazaTWadmSl/EYUfC28y8erSsmvInLI/oimxD1/PoWAErRk5Uwrc7sbNUGnS1pUs4Gw7KEen
	S1jQBCXh6vBQb5u8C6JYbRBmbIyLGKi+UQLjxxU7izle9GK7Ic8MMg+f3NZvZtp6c6Y0aNU/aVenH
	WTnjDDLJJ0dV5+mEqNpEbqgLSFTOrpYXHgLC20vc+nQcorJiU5xZrBVLiQ6u9Oxo6h7yNA9zNrv62
	FYbwN6VcWC5JXlQ+b7I4HPdsYVPj03A/B+c60vOBE1F3UySrucpY/jOIqCVfHo1MmDjep2J23L2sg
	pNzfQkkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5btv-0000000Eun4-3E7G;
	Fri, 18 Apr 2025 02:56:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5btt-0000000Eul5-0reP
	for ath12k@lists.infradead.org;
	Fri, 18 Apr 2025 02:56:22 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I1qhAZ004986;
	Fri, 18 Apr 2025 02:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zkJ3M8XR1D7NZo+boMIyj9qewdmhkLRjngxZsxxlwf0=; b=ABFWjdtLHUzmKDNu
	8eqeW30WxQmzPRw768WZUS6ZgJf7IyEu3F8ptvyEW5h7kHldBpg41qmg0AU/mpzY
	yFhi5PFIbHTeGTwFayugwYkcPSS0Qo5tfHFFs65ZoDPTqQe40IniDLOIBja5YzPZ
	ExjBTiD29d0NNP/vONbkG2Ed/mYCUjdc92VlEenCaej94A+waTyOSbY9K7531zq8
	R1BMJrq5Q8zHiI/FRGAnzbTHwxlfB9+1Xg8bRuE+TbBSdgRM5ZtsUTIv1WJiQuQB
	V02TE6KLL7i89+LJj0bi4F0+2drf8bnbPPwPPU2y5VO5fwmqxe0+SIx6dyJVz7O6
	B1n3wQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf6a0tqd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 02:56:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53I2uH8A023703
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 02:56:17 GMT
Received: from [127.0.1.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 17 Apr
 2025 19:56:15 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
Date: Fri, 18 Apr 2025 10:55:45 +0800
Subject: [PATCH ath-next 12/15] wifi: ath12k: save max transmit power in
 vdev start response event from firmware
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250418-ath12k-6g-lp-vlp-v1-12-c869c86cad60@quicinc.com>
References: <20250418-ath12k-6g-lp-vlp-v1-0-c869c86cad60@quicinc.com>
In-Reply-To: <20250418-ath12k-6g-lp-vlp-v1-0-c869c86cad60@quicinc.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
	<jjohnson@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1fczznorDVybeXxoW1_D8TQ_YMk8NiHa
X-Authority-Analysis: v=2.4 cv=JNc7s9Kb c=1 sm=1 tr=0 ts=6801bf52 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=upFSAyc-DGgn5qUoGdQA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 1fczznorDVybeXxoW1_D8TQ_YMk8NiHa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_01,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_195621_379028_BBCCB9C4 
X-CRM114-Status: GOOD (  12.17  )
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

Save the max transmit power received in the vdev start response event from
firmware. A subsequent patch will use this to calculate the final power

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h | 2 ++
 drivers/net/wireless/ath/ath12k/wmi.c  | 3 ++-
 drivers/net/wireless/ath/ath12k/wmi.h  | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 9f64fa00b131357c5c1b75f4eacae912f563416d..40fdc9cf3f8abbca4f60a36455e1344a1d63ddc9 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -786,6 +786,8 @@ struct ath12k {
 	u8 ftm_msgref;
 	struct ath12k_fw_stats fw_stats;
 	unsigned long last_tx_power_update;
+
+	s8 max_allowed_tx_power;
 };
 
 struct ath12k_hw {
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 385f59077050ce89aa9aab19b0ffc9af98e35549..6fa7cba35ab8f6d2420213c452a2722bed57b80a 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -6342,13 +6342,14 @@ static void ath12k_vdev_start_resp_event(struct ath12k_base *ab, struct sk_buff
 	ar->last_wmi_vdev_start_status = 0;
 
 	status = le32_to_cpu(vdev_start_resp.status);
-
 	if (WARN_ON_ONCE(status)) {
 		ath12k_warn(ab, "vdev start resp error status %d (%s)\n",
 			    status, ath12k_wmi_vdev_resp_print(status));
 		ar->last_wmi_vdev_start_status = status;
 	}
 
+	ar->max_allowed_tx_power = (s8)le32_to_cpu(vdev_start_resp.max_allowed_tx_power);
+
 	complete(&ar->vdev_setup_done);
 
 	rcu_read_unlock();
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 5f0f9f120497c5746ae9175c3fa9e119a61ab91c..e4d383c090a60461b1af4529c6d5ef2fa4a2f2e9 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -4162,6 +4162,7 @@ struct wmi_vdev_start_resp_event {
 	};
 	__le32 cfgd_tx_streams;
 	__le32 cfgd_rx_streams;
+	__le32 max_allowed_tx_power;
 } __packed;
 
 /* VDEV start response status codes */

-- 
2.34.1


