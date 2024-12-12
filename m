Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0022E77180
	for <ath12k@archiver.kernel.org>; Thu, 12 Dec 2024 00:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g4bubB7HxTfp2qVzUUWbwlPS9OLKYPj1IaPi0pZsMzc=; b=HD/OSpwjME2IFg7ZPNFma89ITP
	MzKg4fqX79mUn5m/WYg4PnntsW8mMKf3dxVAjaKlJLWS+9EyR0OP/KTgB2R7lF0RxL89uZLkQYYV1
	e8qXQJPITfAGLHdTnivhE+DVmYPDX3gTj9GNnPsOTg3IDDSbsJMtlASB2vIAheUygxB3ayJwC2GfN
	xiXABWbNTsRPCMPti2Xt94LRnkoGcJM/BdREjI5rHf7f3HxSrhxFyJ+2+Jcdb/bXIKtkyMqmF+xOe
	YD95dnkMQNE5VsET6bfwRhrzxcEWUhD7oSWbeXjpUrQ2UFGxjeymxd7M77XlukpzmZRpY4N1xGWal
	ExZCk/iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLXOY-0000000Gd4e-2y7i
	for ath12k@archiver.kernel.org;
	Thu, 12 Dec 2024 00:49:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLXOV-0000000Gd24-47MO
	for ath12k@lists.infradead.org;
	Thu, 12 Dec 2024 00:49:33 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BBHDDpW010709;
	Thu, 12 Dec 2024 00:49:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g4bubB7HxTfp2qVzUUWbwlPS9OLKYPj1IaPi0pZsMzc=; b=KdjMv0hPNuJ05mta
	mWIcWXPLMn4iJzrutUl6zwgzrnW7Aw35T4XFBtW2ajtSYveWK9fL/a+RXMDo2sf8
	qqxS8OLSh1jQ37LRo6nndSiwundADDgCzOilSf70DQUkQ6sR9CC08OG11iO+cCNs
	SYIJxc7BHtxU1eWiQHV9nGcZR1FAECfh7oapQcvV/5wu3opqy7K1o43u18zKTL7p
	SAsg6W8ef6C54Sw+BUVhFEtB+kY3AhtuHtIorKO0vpJ1Mfxb6B4068GpYZ8mi4fh
	qqsvBx01H6tXhZQHC9nAnrxFcY97C2iy5bNmCadEkrcovtsw2I1ks3H4XfIjFs5H
	sdP8/g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f1xd3e2w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 00:49:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BC0nTDM007030
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 00:49:30 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Dec 2024 16:49:28 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 4/4] wifi: ath12k: Fix uninitialized variable access in ath12k_mac_allocate() function
Date: Thu, 12 Dec 2024 06:19:06 +0530
Message-ID: <20241212004906.3087425-5-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241212004906.3087425-1-quic_periyasa@quicinc.com>
References: <20241212004906.3087425-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: I87xiaYzMLbomnasFc2kOTq9dVZVG5nL
X-Proofpoint-GUID: I87xiaYzMLbomnasFc2kOTq9dVZVG5nL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 clxscore=1015 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_164932_137902_A1531B34 
X-CRM114-Status: GOOD (  16.89  )
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

Currently, the uninitialized variable 'ab' is accessed in the
ath12k_mac_allocate() function. Initialize 'ab' with the first radio device
present in the hardware abstraction handle (ah). Additionally, move the
default setting procedure from the pdev mapping iteration to the total
radio calculating iteration for better code readability. Perform the
maximum radio validation check for total_radio to ensure that both num_hw
and radio_per_hw are validated indirectly, as these variables are derived
from total_radio. This also fixes the below Smatch static checker warning.

Smatch warning:
ath12k_mac_allocate() error: uninitialized symbol 'ab'

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Fixes: a343d97f27f5 ("wifi: ath12k: move struct ath12k_hw from per device to group")
Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 5cdc1c38b049..98b2f853d243 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -10962,8 +10962,20 @@ int ath12k_mac_allocate(struct ath12k_hw_group *ag)
 	u8 radio_per_hw;
 
 	total_radio = 0;
-	for (i = 0; i < ag->num_devices; i++)
-		total_radio += ag->ab[i]->num_radios;
+	for (i = 0; i < ag->num_devices; i++) {
+		ab = ag->ab[i];
+		if (!ab)
+			continue;
+
+		ath12k_mac_set_device_defaults(ab);
+		total_radio += ab->num_radios;
+	}
+
+	if (!total_radio)
+		return -EINVAL;
+
+	if (WARN_ON(total_radio > ATH12K_GROUP_MAX_RADIO))
+		return -ENOSPC;
 
 	/* All pdev get combined and register as single wiphy based on
 	 * hardware group which participate in multi-link operation else
@@ -10976,14 +10988,16 @@ int ath12k_mac_allocate(struct ath12k_hw_group *ag)
 
 	num_hw = total_radio / radio_per_hw;
 
-	if (WARN_ON(num_hw >= ATH12K_GROUP_MAX_RADIO))
-		return -ENOSPC;
-
 	ag->num_hw = 0;
 	device_id = 0;
 	mac_id = 0;
 	for (i = 0; i < num_hw; i++) {
 		for (j = 0; j < radio_per_hw; j++) {
+			if (device_id >= ag->num_devices || !ag->ab[device_id]) {
+				ret = -ENOSPC;
+				goto err;
+			}
+
 			ab = ag->ab[device_id];
 			pdev_map[j].ab = ab;
 			pdev_map[j].pdev_idx = mac_id;
@@ -10995,10 +11009,11 @@ int ath12k_mac_allocate(struct ath12k_hw_group *ag)
 			if (mac_id >= ab->num_radios) {
 				mac_id = 0;
 				device_id++;
-				ath12k_mac_set_device_defaults(ab);
 			}
 		}
 
+		ab = pdev_map->ab;
+
 		ah = ath12k_mac_hw_allocate(ag, pdev_map, radio_per_hw);
 		if (!ah) {
 			ath12k_warn(ab, "failed to allocate mac80211 hw device for hw_idx %d\n",
-- 
2.34.1


