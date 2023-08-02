Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2225C001DE
	for <ath12k@archiver.kernel.org>; Wed,  2 Aug 2023 08:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sRTBQMYuiJRv3xWknmTAt/xrxZWjurb0DX/6SiGZGGc=; b=4/AQIk4qyXfvrA
	fDs8s82sucMYHn22Dyhl58i99HQHAPVt5CfJDQWn9Le9OF7aJWirWSjlAKldjBWsbx2KvZWviFyyZ
	AeJCImggYam6Z/wDj/2aGKnGoT6f+zbVHDMVd3rOyKSeqYwdBhB+9CeX/h/+hwRqq97+ipRR9/4lI
	sNGWJGaYzGy6UqbjdwwvHfQOaMMs1WpQc8rG/KhNFHbnL420pLyiXm4bXKDhmAxBq1sauqtbwGIHe
	k9rDIYR1z5tjf1Xi4P8f8+1F4vW1KWX2xPk4ph/IBIRjrXPsaTuZYwDy0Ccf56KA5VyKejajk6oxJ
	INQUQt78bE++mCAjWg9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR7i1-004QhY-23
	for ath12k@archiver.kernel.org;
	Wed, 02 Aug 2023 08:59:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR7hz-004QgX-1k
	for ath12k@lists.infradead.org;
	Wed, 02 Aug 2023 08:59:56 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3723ooRO003360;
	Wed, 2 Aug 2023 08:59:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=BPNj3WBwZPid6XX1bIT2mYw1j4mY+nQIjFgJv4VMRrM=;
 b=CEPFZ0K5STQif94eiC04YvHSbgO2ZZWbHjEwQ0CKaQZavdCJzRndW7x0DIPurzwQD+SS
 F+No4lesbqX5RraKOZs7cAXVdMVV/0v0fiM9XDghBCC+n1PUoSDF+rJfuZYL2CXXL1+c
 rx5o0I70rbocu/+hN6AbzNsEh2V6Sqk4WLo5rKYwi6dkX6GScNlZQtbT5e48KV0KkEXy
 G2zbK2iJgbI3G813ltOcWvBB79cuxrvHzv+seMQQW90ZZWhC0vPsBedHyIVe+KaylgS+
 qM9DW0Yxaf1Fk4aeiohPbVenis/U1nIHiDPkLIMmfWbu/Ficg/LRXE2VNSsa1lm9czHC eQ== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s75dg9xg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Aug 2023 08:59:54 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3728xqTe024024
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Aug 2023 08:59:52 GMT
Received: from mdharane-linux.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 2 Aug 2023 01:59:51 -0700
From: Manish Dharanenthiran <quic_mdharane@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Manish Dharanenthiran
	<quic_mdharane@quicinc.com>
Subject: [PATCH 1/2] wifi: ath12k: fix WARN_ON during ath12k_mac_update_vif_chan
Date: Wed, 2 Aug 2023 14:28:51 +0530
Message-ID: <20230802085852.19821-2-quic_mdharane@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230802085852.19821-1-quic_mdharane@quicinc.com>
References: <20230802085852.19821-1-quic_mdharane@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TotQ17KKdDHu1EaQV0ImR8RioII7V87K
X-Proofpoint-ORIG-GUID: TotQ17KKdDHu1EaQV0ImR8RioII7V87K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-02_03,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 mlxlogscore=776 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308020079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_015955_711839_14CE802B 
X-CRM114-Status: GOOD (  17.36  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Fix WARN_ON() from ath12k_mac_update_vif_chan() if vdev is not up.
Since change_chanctx can be called even before vdev_up.

Do vdev stop followed by a vdev start in case of vdev is down.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0-02903-QCAHKSWPL_SILICONZ-1

Signed-off-by: Manish Dharanenthiran <quic_mdharane@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 1bb9802ef569..0ab95e138d1d 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5698,13 +5698,28 @@ ath12k_mac_update_vif_chan(struct ath12k *ar,
 		if (WARN_ON(!arvif->is_started))
 			continue;
 
-		if (WARN_ON(!arvif->is_up))
-			continue;
+		/* Firmware expect vdev_restart only if vdev is up.
+		 * If vdev is down then it expect vdev_stop->vdev_start.
+		 */
+		if (arvif->is_up) {
+			ret = ath12k_mac_vdev_restart(arvif, &vifs[i].new_ctx->def);
+			if (ret) {
+				ath12k_warn(ab, "failed to restart vdev %d: %d\n",
+					    arvif->vdev_id, ret);
+				continue;
+			}
+		} else {
+			ret = ath12k_mac_vdev_stop(arvif);
+			if (ret) {
+				ath12k_warn(ab, "failed to stop vdev %d: %d\n",
+					    arvif->vdev_id, ret);
+				continue;
+			}
 
-		ret = ath12k_mac_vdev_restart(arvif, &vifs[i].new_ctx->def);
-		if (ret) {
-			ath12k_warn(ab, "failed to restart vdev %d: %d\n",
-				    arvif->vdev_id, ret);
+			ret = ath12k_mac_vdev_start(arvif, &vifs[i].new_ctx->def);
+			if (ret)
+				ath12k_warn(ab, "failed to start vdev %d: %d\n",
+					    arvif->vdev_id, ret);
 			continue;
 		}
 
-- 
2.17.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
