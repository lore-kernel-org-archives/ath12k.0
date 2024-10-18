Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0971FD3C54E
	for <ath12k@archiver.kernel.org>; Fri, 18 Oct 2024 05:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oDjMkjWkI4vyW5bveH/t0zlOacnVpuxfJw7TV23/5x0=; b=1+Oemz93HRpyicY7r3fKkLSSvJ
	hbruNtZZUH1iJsMikMvp00Sp0Kp5/6Y4NAc1ibj0eSSC2G2tuo54EuU/dqJCWCt1jvZ79hDkHCN/+
	qUP5AQXTWyuGMKYhhDM745nNMQ00MOOryqxrCHZlcQRI7vDqLt02/t53wPHvlwndY2bE3pR4OX2h6
	yw5pyZARMDIDDjO91f7fDcNeEowKAIUGz7JJXFZNRTMkv9mYotUx2HLt0MKzQCYFxuJLzN4DYy1gN
	kcCkIqKU69UIYvF65wCqylWG9Obzh7BMAzC9IblJ3Shb8LJEJkPMcQ038A5PXpEyJ9+mt0PMS9lnY
	BqUYVx4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1fyD-0000000H2ax-30b3
	for ath12k@archiver.kernel.org;
	Fri, 18 Oct 2024 05:56:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1fp6-0000000H0Dg-47Wh
	for ath12k@lists.infradead.org;
	Fri, 18 Oct 2024 05:46:54 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I1gNMA022066;
	Fri, 18 Oct 2024 05:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oDjMkjWkI4vyW5bveH/t0zlOacnVpuxfJw7TV23/5x0=; b=Paho3IxiCbR9NV9m
	yScuFMzd2jxZa1nK0+qNiW5dFSO9nHgR/w/3ZYuYXnbSf8JvyoOUQmesR8uAfWad
	Gn3rfChvG4OesCt03yLTUVHK6lQbB+CbGqgQFwFUqzjoZ0JblrUlB7Jrwonfif/x
	d2gNvDy6lmIOJptdWpn5yg5ukU/eIcNbKtDM24xTgSBWEAp8KT8ISi9T8Lf6gL/Q
	QlJvnU7zOI5Z11Bz/jshZVINpow8a0Q81n2HOPGnkv5TgzEwA2R3OWe224ghVAas
	BP2zoE77+up9QgIqJLVNFIfTtdn0djafpepNYFOHwpJuxLV4f3h+PMTaA6gByemO
	NqKVww==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42be8c8gsm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 05:46:51 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49I5kpcU017379
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 05:46:51 GMT
Received: from kangyang.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 17 Oct 2024 22:46:49 -0700
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v5 6/8] wifi: ath12k: delete NSS and TX power setting for monitor vdev
Date: Fri, 18 Oct 2024 13:46:18 +0800
Message-ID: <20241018054620.2080-7-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1.windows.1
In-Reply-To: <20241018054620.2080-1-quic_kangyang@quicinc.com>
References: <20241018054620.2080-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mKgqYme_X41Cp0x_8CkXwTD5cEx46tSO
X-Proofpoint-ORIG-GUID: mKgqYme_X41Cp0x_8CkXwTD5cEx46tSO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 spamscore=0 bulkscore=0 phishscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=683 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_224653_080867_FA090592 
X-CRM114-Status: UNSURE (   9.59  )
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
index c292ac45d780..d4b3c7899281 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1147,7 +1147,6 @@ static int ath12k_mac_monitor_vdev_create(struct ath12k *ar)
 	struct ath12k_wmi_vdev_create_arg arg = {};
 	int bit, ret;
 	u8 tmp_addr[6];
-	u16 nss;
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
@@ -1187,19 +1186,6 @@ static int ath12k_mac_monitor_vdev_create(struct ath12k *ar)
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


