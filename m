Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A8ECD11DD
	for <ath12k@archiver.kernel.org>; Mon, 25 Mar 2024 21:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6vu5LSNElxlwZObCgswq7FQDRY7WTqZ5f0rO/+SUyhQ=; b=M91FKxKGsKFQAXk4g4xXqBaQ3b
	4LP4Mqnoe933CFJF4VF3x8d9xh2JJJmO0Yv+zpBGDLgvmj8ILeWWestCC4NObPsZUkBbFZq169fNU
	51O9ThB8IqJ6dPATE1ZqxQrc20SC4i5FF2HhUHNmAD8Zf0cDQeVVghj4nOEzskk5jJfEutpCSNi7h
	B3TLcBTGZJHmgWcpk1CsSjzRKJUWA/722mJq+Ez0lvcxbRNcmW3/QqbkfckOWA2pBy6jWRKjkg1tp
	NSmv11XW9cJiI3bZ7WkyOL8PvmyV7jZpHQ7yj3xWPtcCfE5D/2q94P0OXUVeSx9jE3mzq+yoIorah
	k9aXSdpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rormv-0000000219Z-2Kly
	for ath12k@archiver.kernel.org;
	Mon, 25 Mar 2024 21:23:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rormp-0000000215j-3A5G
	for ath12k@lists.infradead.org;
	Mon, 25 Mar 2024 21:23:22 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42PLNJVi024920;
	Mon, 25 Mar 2024 21:23:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=6vu5LSNElxlwZObCgswq
	7FQDRY7WTqZ5f0rO/+SUyhQ=; b=H0MESbn2LB2MjAHk1xjFUpPut71Xel7XZ/OT
	Xkh6VbxnsVGNdLmbkEl4r2o/LS70VrssBCDMfDPjdTW25b34R/GXkeB+ljtgi5cS
	gZShMBnB2jph4zG7atKbvQBVSs90vXF48dfXDQBsArgEyzRhxpo8j+NXW7yCCUbS
	+vCh8N1sXya3Tl60plCrlg6VLT3p3n1FHuzEQiy5Hu18weux7jOf/p8yFJNSDh1e
	84+kuPvtVyg+4Ul03QNdP8VUzogtOPprSm+KoigRmgk3I4K2B/4r46bcFhyqUYXs
	me2B7g0/VD1+xcxWdsLCru4I9kldBXo3pakcDk/BM7AqwbF/SA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x31wst6wc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 21:23:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42PLNIpg023122
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 21:23:18 GMT
Received: from pradeepc2-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 25 Mar 2024 14:23:17 -0700
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Pradeep Kumar Chitrapu
	<quic_pradeepc@quicinc.com>
Subject: [PATCH 3/6] wifi: ath12k: fix survey dump collection in 6 GHz
Date: Mon, 25 Mar 2024 14:23:01 -0700
Message-ID: <20240325212304.28241-4-quic_pradeepc@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240325212304.28241-1-quic_pradeepc@quicinc.com>
References: <20240325212304.28241-1-quic_pradeepc@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: brVnu-dqIWNi2RMsEz8WWsneCWNrSeX7
X-Proofpoint-ORIG-GUID: brVnu-dqIWNi2RMsEz8WWsneCWNrSeX7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-25_21,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 mlxscore=0 mlxlogscore=810 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403250132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_142320_034720_752928AA 
X-CRM114-Status: GOOD (  11.55  )
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

When ath12k receives survey request, choose the 6 GHz band
when enabled. Without this, survey requests do not include
any 6 GHz band results, leading to failures in auto channel
selection.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index b91d34b602dd..6d7df18ec424 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7419,7 +7419,13 @@ static int ath12k_mac_op_get_survey(struct ieee80211_hw *hw, int idx,
 
 	if (!sband)
 		sband = hw->wiphy->bands[NL80211_BAND_5GHZ];
+	if (sband && idx >= sband->n_channels) {
+		idx -= sband->n_channels;
+		sband = NULL;
+	}
 
+	if (!sband)
+		sband = hw->wiphy->bands[NL80211_BAND_6GHZ];
 	if (!sband || idx >= sband->n_channels) {
 		ret = -ENOENT;
 		goto exit;
-- 
2.17.1


