Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBD5CD128A
	for <ath12k@archiver.kernel.org>; Sun, 31 Mar 2024 18:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q93c9sBFJCr+/QZpXrD44ARUzrI3QNyDoaClgJ2Gp30=; b=bfC3DxSOG2zwgqdVEWV3e6Vhf4
	Xo0+QFclunMXNQt+rt1eg5LwAeZV8XpFqcnQILN2VlKUpexMJ899jzsswRgsj/LDKuGlk4SccFguW
	BmUvbq8iaX5RVnHspJxmG3MSQa7rnyeRLd06SxOYrFwP7WpR0PJROxMPWNYCypLVZ8DPrLG1vXykp
	qo/CVbUZTvZA8lkFOWnxIlpfLVDyu7kpFlvnfR/Z4/I8lWlcfnRj4iGoGFrfiAqFZ1L0T785oDEun
	YsThMqaJNFgoYKmTFOaQxZnsQJyQdnB6cblrLEnkoWcxvTVXFse7VxH9SY+rpgWnnfc34b1kBdYdS
	p+eOUA7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqzzH-0000000661X-3VoH
	for ath12k@archiver.kernel.org;
	Sun, 31 Mar 2024 18:32:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqzzD-0000000660S-2VNu
	for ath12k@lists.infradead.org;
	Sun, 31 Mar 2024 18:32:57 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42VIWsmT004760;
	Sun, 31 Mar 2024 18:32:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=q93c9sBFJCr+/QZpXrD44ARUzrI3QNyDoaClgJ2Gp30=; b=oz
	9RfGWcAEPC/jHYX5d9lUB8QUubds3+ushwZg9Tfx/Aim854FyJJIaN9wDsPZ0F4D
	LSd7zEPP9PXcizcGmU9/QfCeVSSgBCnqGrsO80WOCuFg+SIFW4flLWUlNrEQDsM3
	xtb9/VZlE2THWg1WkdYFyhEqQq3vSjdlqK96Bxe7eC7IpQBfhVe7FrxjBtPBZ2PV
	J5Z5mzl6vD4W1boJRcqzjm1Bnfnf76nJu5ZpLa/+2yYP4fCbtmK3YWsupW/Rzrgk
	Lj/7a0zxYPqm99x3T8QxP+9QjTmzHc001DUwLbm+GkTgUCiQWtez6LQnpgIs/wBG
	kwmSTrnlTNzMn1TKFjeg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x6aybadhc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 31 Mar 2024 18:32:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42VIWrrN022089
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 31 Mar 2024 18:32:53 GMT
Received: from hu-kathirve-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sun, 31 Mar 2024 11:32:51 -0700
From: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>,
        Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
Subject: [PATCH 2/2] wifi: ath12k: match WMI BSS chan info structure with firmware definition
Date: Mon, 1 Apr 2024 00:02:32 +0530
Message-ID: <20240331183232.2158756-3-quic_kathirve@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240331183232.2158756-1-quic_kathirve@quicinc.com>
References: <20240331183232.2158756-1-quic_kathirve@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vMg0IO-ZptBn5EVv2M52T1SsOWB7lGtF
X-Proofpoint-GUID: vMg0IO-ZptBn5EVv2M52T1SsOWB7lGtF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-31_13,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 impostorscore=0 mlxscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403310142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240331_113255_672150_3EAF22E8 
X-CRM114-Status: GOOD (  13.17  )
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

From: P Praneesh <quic_ppranees@quicinc.com>

struct wmi_pdev_bss_chan_info_event is not similar to the firmware
struct definition, this will cause some random failures.

Fix by matching the struct wmi_pdev_bss_chan_info_event with the
firmware structure definition.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Fixes: d889913205 ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")

Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/wmi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index f67e355ee202..96e8fb164bd4 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -4021,7 +4021,6 @@ struct wmi_vdev_stopped_event {
 } __packed;
 
 struct wmi_pdev_bss_chan_info_event {
-	__le32 pdev_id;
 	__le32 freq;	/* Units in MHz */
 	__le32 noise_floor;	/* units are dBm */
 	/* rx clear - how often the channel was unused */
@@ -4039,6 +4038,7 @@ struct wmi_pdev_bss_chan_info_event {
 	/*rx_cycle cnt for my bss in 64bits format */
 	__le32 rx_bss_cycle_count_low;
 	__le32 rx_bss_cycle_count_high;
+	__le32 pdev_id;
 } __packed;
 
 #define WMI_VDEV_INSTALL_KEY_COMPL_STATUS_SUCCESS 0
-- 
2.34.1


