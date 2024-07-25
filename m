Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E118DC52CD9
	for <ath12k@archiver.kernel.org>; Thu, 25 Jul 2024 12:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BFrTwZ0q6oFifu/385ozK3X4UqTdH4j7xrwpbXfkrb8=; b=juHJAUMHwELre5yQlxPUn34U0D
	zvy2fqujfzxXZj/FtgEQoFW9cK7E9tyEbeF9Nr0j4vmzFYku64zhO6OI5rIjOHwlYB7q/llezs8ra
	QTDuw4iP/mNky0QIgcRre9HTFFZpvl0nHq8kGfbet5D4em33FT4u+7cmzOA4SfX+C0OllvM92jdsF
	cN3qmffU8BepEOjMmTX1ES2t9DnIOz8ulIga+N/VehHzRKRaGpoBwy67zvFpsbbNQvKm1qd/jgtiT
	7FUXG/dkRwOTGFYH2hn7FyKDQeRScrvlqL9h5momkGJHt/J+/leNMO/3NIvRFD8hJ4NohPv5Sfqtz
	WjdhFhbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWx9u-00000000q52-2XFL
	for ath12k@archiver.kernel.org;
	Thu, 25 Jul 2024 12:01:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWx9l-00000000pzs-19oG
	for ath12k@lists.infradead.org;
	Thu, 25 Jul 2024 12:01:14 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46PAHshS016854;
	Thu, 25 Jul 2024 12:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BFrTwZ0q6oFifu/385ozK3X4UqTdH4j7xrwpbXfkrb8=; b=nKxdx2RVusmytMS7
	SvhHBYEWGRAX8oB6Wa65c5SWItV7Tc3/1KBhprkHWQRQbWxaiN2uLztOjUnM8uP8
	KCRblH4BVV9O7JJRAzVJOpIPjGDF0MvAleHlEZmjvW8M/0Bo3U6Jdr3qXflRmxlm
	Blq7jJDiT0xUsn6qSj32A1B4LlBZEkN3kpVb/GllHOzEIDDY3Bm00H7Ku1/3dUR1
	OMtO3eDDdB0oVpHzakYduNk5sMAU3fEavs1yAsV59CArsN7ARfMW5AnPH+jCfNKK
	00yaIVOCdJf+4Wjx3JdDsXB4K68glCJ7VrDKtKP1GBpHyM6WTkNx/6gcT+38fKpg
	O4C4cg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40gurtur05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jul 2024 12:01:12 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46PC1BeP006189
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jul 2024 12:01:11 GMT
Received: from kangyang.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 25 Jul 2024 05:01:09 -0700
From: kangyang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH 08/11] wifi: ath12k: delete NSS and TX power setting for monitor vdev
Date: Thu, 25 Jul 2024 20:00:32 +0800
Message-ID: <20240725120035.493-9-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1.windows.1
In-Reply-To: <20240725120035.493-1-quic_kangyang@quicinc.com>
References: <20240725120035.493-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TmTJZeTs9XvJ1L2EiD-pq6eXJTjlCBWu
X-Proofpoint-ORIG-GUID: TmTJZeTs9XvJ1L2EiD-pq6eXJTjlCBWu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-25_11,2024-07-25_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 mlxlogscore=743
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407250082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_050113_468637_B1854304 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
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

From: Kang Yang <quic_kangyang@quicinc.com>

ath12k_mac_monitor_vdev_create() will set NSS and TX power for monitor
vdev. But this is not needed for monitor vdev.

So delete them.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 642d756db663..bbf55cd06e4d 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1064,7 +1064,6 @@ static int ath12k_mac_monitor_vdev_create(struct ath12k *ar)
 	struct ath12k_wmi_vdev_create_arg arg = {};
 	int bit, ret;
 	u8 tmp_addr[6];
-	u16 nss;
 
 	lockdep_assert_held(&ar->conf_mutex);
 
@@ -1104,19 +1103,6 @@ static int ath12k_mac_monitor_vdev_create(struct ath12k *ar)
 		return ret;
 	}
 
-	nss = hweight32(ar->cfg_tx_chainmask) ? : 1;
-	ret = ath12k_wmi_vdev_set_param_cmd(ar, ar->monitor_vdev_id,
-					    WMI_VDEV_PARAM_NSS, nss);
-	if (ret) {
-		ath12k_warn(ar->ab, "failed to set vdev %d chainmask 0x%x, nss %d :%d\n",
-			    ar->monitor_vdev_id, ar->cfg_tx_chainmask, nss, ret);
-		return ret;
-	}
-
-	ret = ath12k_mac_txpower_recalc(ar);
-	if (ret)
-		return ret;
-
 	ar->allocated_vdev_map |= 1LL << ar->monitor_vdev_id;
 	ar->ab->free_vdev_map &= ~(1LL << ar->monitor_vdev_id);
 	ar->num_created_vdevs++;
-- 
2.34.1


