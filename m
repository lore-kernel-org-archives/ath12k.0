Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C7EC25B5F
	for <ath12k@archiver.kernel.org>; Wed,  8 May 2024 20:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jNrDtn27oVxV5kFcxP+0iR2Qf2JJDbM9jTCpvNmplXA=; b=JxgLoKscNimqdcQDGWbBc7CuKc
	Km/0CBxesAUY/en2FCvq7q3JMEtfBASMA+Gwk5JH14CaeaQtEsm9nvzXjCYpi6BvTilXqrhH7TpRB
	KIx4+6C1QNI4ysPVqORExOBVEprIqIfapmybClKGCY/RpaFbHK4Elw2yzuLZdrhqXvCgy4WoVaqJf
	Gih4SB+7PI5Rdo1ctdosZ6ITGa7xLJWPKrkSWqv8YORVsr4DZ96KueHiqjKU2jlW0QPCZkpKTxIwu
	32Ps0Hl7Y7IK5K+PXSWD4vfA7NVoJ0Hed6/8EWQbVS03txc6L1/5Flmp1iyVP41M7PrDMZDrsrOb9
	xZ/+g+cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4nuz-0000000GtRF-2JZs
	for ath12k@archiver.kernel.org;
	Wed, 08 May 2024 20:29:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4nuv-0000000GtNe-2gAx
	for ath12k@lists.infradead.org;
	Wed, 08 May 2024 20:29:36 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 448CXL6g006531;
	Wed, 8 May 2024 20:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=jNrDtn27oVxV5kFcxP+0iR2Qf2JJDbM9jTCpvNmplXA=; b=hx
	Z6BBpI5M/fxBRVFeNMTqgBLx+ho+Q2V6Jy6/ulHREFb+hUlbOwx8vEsmxnBkrTGZ
	XOWk3mFEf5ffCy6u4uqxzG7OCQMUqW1+ROgaQgvexyYVUB6cLOKZHaUQeP6ThmXj
	QlXJSDB4GrrwIdHMDiGDjtUpRu6/fhEYExvM6Xt2hHHpYRekLykyFFFnIt2CqGJb
	GMXMEzXE2gMMA/HKOTZaFqwoB7A5lWZyYY5JRyiy+xX8PpSM4/2u6zRgFywIAsnx
	cHHysSndU/6QO59LqM/qXIsfn/IpQ+wNok/Yo82LIJvPGT3fQh4D8UsJPvW+LAI0
	lwVhggKp1vaOx3AaxJww==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y09geh25p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 20:29:29 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 448KTOZG002782
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 May 2024 20:29:24 GMT
Received: from alokad-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 8 May 2024 13:29:23 -0700
From: Aloka Dixit <quic_alokad@quicinc.com>
To: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
CC: Aloka Dixit <quic_alokad@quicinc.com>,
        Jeff Johnson
	<quic_jjohnson@quicinc.com>
Subject: [PATCH v2 3/9] wifi: ath12k: rename MBSSID fields in wmi_vdev_up_cmd
Date: Wed, 8 May 2024 13:29:06 -0700
Message-ID: <20240508202912.11902-4-quic_alokad@quicinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20240508202912.11902-1-quic_alokad@quicinc.com>
References: <20240508202912.11902-1-quic_alokad@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GwqbT81GaRvVP4WD9MPAfem1wFddC8hF
X-Proofpoint-ORIG-GUID: GwqbT81GaRvVP4WD9MPAfem1wFddC8hF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_09,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0 malwarescore=0
 mlxlogscore=785 impostorscore=0 clxscore=1015 adultscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405080151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_132933_753279_01DD7641 
X-CRM114-Status: GOOD (  10.30  )
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

Rename trans_bssid to tx_vdev_bssid to make it similar to vdev_bssid.

Rename profile_num to nontx_profile_cnt, and profile_idx to
nontx_profile_idx which make it clear that these configurations
correspond to nontransmitted MBSSID profiles.

These members are currently unused in the driver.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/wmi.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 86a0ef09aa39..4051ed5a0b0a 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2768,9 +2768,9 @@ struct wmi_vdev_up_cmd {
 	__le32 vdev_id;
 	__le32 vdev_assoc_id;
 	struct ath12k_wmi_mac_addr_params vdev_bssid;
-	struct ath12k_wmi_mac_addr_params trans_bssid;
-	__le32 profile_idx;
-	__le32 profile_num;
+	struct ath12k_wmi_mac_addr_params tx_vdev_bssid;
+	__le32 nontx_profile_idx;
+	__le32 nontx_profile_cnt;
 } __packed;
 
 struct wmi_vdev_stop_cmd {
-- 
2.39.0


