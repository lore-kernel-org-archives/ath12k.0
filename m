Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0148C6FD1D
	for <ath12k@archiver.kernel.org>; Mon, 20 Mar 2023 05:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uAL8r7lfFhJfDtT7xz49Rr4T6vbBBUOwVM0Zg3ifjeg=; b=H+9zjx6YcVyxfg
	bqc/SEyZwNL0Yvg4w+wPaU0ZEoqCgHzJPPf++OOJrsfJyAc1Geywn8gx+lRtTWZD9o8AxFaGU4A1N
	A35dsfrbh7TJlyWGVwoocgeoDQ75W+QEt2z1Plz7GMaXfCLJMlVQQnxT7kU4pJaXkeKNPLo2DF9Bh
	T14w33BqqUQzy3AF5RFMh+pp1nGcPxbImkYcIBcYtlkaMJpfwhy6T7DBSk74O4pt7d3qnN0AbPQrm
	1hgBRnBkMrJCuTtVs1w2UQoxwM4uTfzhBn0VNfANoJLdiynDZeyN5sUeCAlRCgVDtzrWB/4n4vuma
	kQY4c1v5cV2arM34m+aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pe80w-0089fa-1M
	for ath12k@archiver.kernel.org;
	Mon, 20 Mar 2023 05:24:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pe80s-0089f9-2B
	for ath12k@lists.infradead.org;
	Mon, 20 Mar 2023 05:24:56 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32K5JuUs007595;
	Mon, 20 Mar 2023 05:24:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=76vbbFBc6MgdFQbXsyq2x2M8Ahqw1IG43KAL/fmeqq0=;
 b=o2HpkFhLhbu0yZNfN7okhkYSCJ8T51p9vd8Fp7sos2gIDB5uW+keLhk7b51VJZBLDZ3N
 pDTvED4ZDtnV9+xbo4lRtRVAoLZWpzo9WFS/SnUwxk30thjI1H275pMMwdPolUlycFLt
 nUS3PqnaFosPzwNxKyqhCsD0fWop3ObAre7oYnezNepGhfPcTmVZ5zKqlS1wkMnHl8iK
 T/tw6Bycn+h2y1JOkiw4BKrey0EgnYEk28IQ0rpZ3kEDgZeIeAy6UJPKGKnYeVVki8/t
 aSv184wpyRkRoAmse705Fl3qOxDIuQiYhFYvwNmovaWNDseFFhRBvx8SYkOrkV+W/lBJ Yg== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pd5d23vyq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Mar 2023 05:24:47 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32K5OkVw010701
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Mar 2023 05:24:46 GMT
Received: from aarasahu-linux.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Sun, 19 Mar 2023 22:24:44 -0700
From: Aaradhana Sahu <quic_aarasahu@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Aaradhana Sahu
	<quic_aarasahu@quicinc.com>
Subject: [PATCH] wifi: ath12k: fix packets are sent in native wifi mode while we set raw mode
Date: Mon, 20 Mar 2023 10:54:27 +0530
Message-ID: <20230320052427.12271-1-quic_aarasahu@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lacF2JBA2yWji8Ly4cpTUNfKcaKYCXQg
X-Proofpoint-GUID: lacF2JBA2yWji8Ly4cpTUNfKcaKYCXQg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-20_02,2023-03-16_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 mlxlogscore=985 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303200047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_222454_861937_7D083223 
X-CRM114-Status: GOOD (  14.43  )
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

Currently, if we set raw mode as encap type, packets are sent
in native wifi mode which is default mode. This is caused by
no check being present for raw mode in ath12k_dp_tx_get_encap_type
function, so it's always going in native wifi mode.

Fix, this issue by adding check condition for raw mode.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_tx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index fd8d850f9818..d3c7c76d6b75 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -13,6 +13,10 @@ static enum hal_tcl_encap_type
 ath12k_dp_tx_get_encap_type(struct ath12k_vif *arvif, struct sk_buff *skb)
 {
 	struct ieee80211_tx_info *tx_info = IEEE80211_SKB_CB(skb);
+	struct ath12k_base *ab = arvif->ar->ab;
+
+	if (test_bit(ATH12K_FLAG_RAW_MODE, &ab->dev_flags))
+		return HAL_TCL_ENCAP_TYPE_RAW;
 
 	if (tx_info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP)
 		return HAL_TCL_ENCAP_TYPE_ETHERNET;

base-commit: 3df3715e556027e94246b2cb30986563362a65f4
-- 
2.17.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
