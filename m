Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB91C47422
	for <ath12k@archiver.kernel.org>; Thu, 11 Jan 2024 04:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=44d6ppnfHLJS5gJ5jTfkCdHMqHWLX8zv+3Xm9nssYMY=; b=A6C6oDFY7t2PY/WThRn1Zy/hCr
	1YfsumSqpki8yAJ9VbsFPx5LmCXGz5uwCjuowPH1lBvdIkKpTRLVb9/TAPBu9XqE7QvItx0+gXYw6
	fpxUKzCDuy/jMLdOWeAqHd3o9+W7rib7k2YIKwngyJIOeOQeu1+uC08wNe2omHMW0RBsYyOX8M3Rd
	3P1p+Oyi6vQb1pdVT2Nr1uFRjQBhST6FInKAfkIYt0mYxvh64ypiDXWYEbJq1Yd5L1Jr94rxEd3DS
	muO5f5Mx0miNo8Wei6lT+V+hGqZX4NhAxOcdk1X68vfvSYM/fhw/nE6cx/heiCXi7B4iKQ/TB53LL
	UwGRxAPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNn2g-00FrNy-00
	for ath12k@archiver.kernel.org;
	Thu, 11 Jan 2024 04:51:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNn2c-00FrLr-1x
	for ath12k@lists.infradead.org;
	Thu, 11 Jan 2024 04:51:44 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40B4UF6K027580;
	Thu, 11 Jan 2024 04:51:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=44d6ppnfHLJS5gJ5jTfk
	CdHMqHWLX8zv+3Xm9nssYMY=; b=Lu8XT2OQVifKeTECGr670Ie+lUu504WpTZPT
	9YsKmSm1Fe81422Ymoj/BM6q6jcNyfRxRwoTak+yQLKlXrzE6xx9fCQady02+iAh
	giiBvmTvXOmbqu1eq4jJfm+7TioXLUuGg/+BWcAa8wmA9OHCAF94IT5xKz+XJP9M
	v34ISkS+7FzWAzowMrtX8Ce2c4SW4wYlYJ0MXt6mJw+n1Kbk3L5iHnmYfM13YNlq
	FeMbsqGzjxRUvXM2hfEXo/utfZXmx6/eT+7jlC/pdWT3vZQvj6ndVN07/E3ujpdy
	Pr6F8HqIklq/fws9OTYFrQrLhMYuc+LM7XW0Q2YMBgG/E+mfcQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vhvye1n73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jan 2024 04:51:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40B4pfQD010548
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jan 2024 04:51:41 GMT
Received: from srirrama-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 10 Jan 2024 20:51:39 -0800
From: Sriram R <quic_srirrama@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>
Subject: [PATCH 11/12] wifi: ath12k: Modify rts threshold mac op for single wiphy
Date: Thu, 11 Jan 2024 10:20:44 +0530
Message-ID: <20240111045045.28377-12-quic_srirrama@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240111045045.28377-1-quic_srirrama@quicinc.com>
References: <20240111045045.28377-1-quic_srirrama@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: aI55gCjyCqZKhjCuImJ5P7gyCuDO3dvH
X-Proofpoint-ORIG-GUID: aI55gCjyCqZKhjCuImJ5P7gyCuDO3dvH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=793
 lowpriorityscore=0 spamscore=0 impostorscore=0 mlxscore=0 adultscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401110035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_205142_646478_ADD15FFD 
X-CRM114-Status: GOOD (  13.73  )
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

Since multiple radios are abstracted under a single wiphy,
apply the rts threshold value to all the vdevs of the radios
combined under single wiphy.

This also implies that vif specific rts threshold support
needs to be added in future from cfg80211/mac80211.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 00063c783e6c..900741a5f9e3 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7266,13 +7266,26 @@ static int ath12k_mac_op_set_rts_threshold(struct ieee80211_hw *hw, u32 value)
 {
 	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
 	struct ath12k *ar;
-	int param_id = WMI_VDEV_PARAM_RTS_THRESHOLD, ret;
+	int param_id = WMI_VDEV_PARAM_RTS_THRESHOLD, ret, i;
 
 	mutex_lock(&ah->conf_mutex);
 
 	ar = ath12k_ah_to_ar(ah, 0);
 
-	ret = ath12k_set_vdev_param_to_all_vifs(ar, param_id, value);
+	/* Currently we set the rts threshold value to all the vifs across
+	 * all radios of the single wiphy.
+	 * TODO Once support for vif specific RTS threshold in mac80211 is
+	 * available, ath12k can make use of it.
+	 */
+	for (i = 0; i < ah->num_radio; i++) {
+		ret = ath12k_set_vdev_param_to_all_vifs(ar, param_id, value);
+		if (ret) {
+			ath12k_warn(ar->ab, "failed to set RTS config for all vdevs of pdev %d",
+				    ar->pdev->pdev_id);
+			break;
+		}
+		ar++;
+	}
 
 	mutex_unlock(&ah->conf_mutex);
 
-- 
2.17.1


