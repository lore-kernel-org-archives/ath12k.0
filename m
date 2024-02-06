Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A10C4829A
	for <ath12k@archiver.kernel.org>; Tue,  6 Feb 2024 10:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iqzwNh6n8/rOaJXI1v/YDFdWAXqXCCPPLM46xMXriYI=; b=X/9cJajm1VUvwvdF2QeIp5rKZT
	ScmZuz6xs6ByLMBejc9TyRoWViidjm6izv+32gu/Pw0pq9BgKiysTHVLj1aKA+MavXVVVAwPsfoiz
	c8ITB/Y8bVw9tdFOD/1ZFEQLUiN7prFoAIWFNrYA67NKTqgiBPzzTAHePQLgmOGBN1mfZranQ+HsV
	2nhdDB5y3VHf6EJUI0bKRgXRz9cgJWqPA7K5wf5U+guQsB/2yDJtnQ/iT2G6xM7LEclMfIrB4rfzC
	JNQgXjBm1Rt8Gm8qByRWKLNfzWA6/o4GbZJnPzLwhuIypt4e+yBssQO6bWH+46lKML8tS048zdrZg
	FWx4rt0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXIj7-000000073Bj-2Tcu
	for ath12k@archiver.kernel.org;
	Tue, 06 Feb 2024 10:30:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXHew-00000006gMF-3Bqj
	for ath12k@bombadil.infradead.org;
	Tue, 06 Feb 2024 09:22:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iqzwNh6n8/rOaJXI1v/YDFdWAXqXCCPPLM46xMXriYI=; b=c0f41qxTN2oBKr9tzozFxkxsXq
	J4qbWFo71RCCdTFmfySozWPUfcaz/UdgBBbiVmvIxTStUxYU40Usp0WFp92PxHsuqnfpRcCgwgsu5
	Ai83XgwdgfDTEyqI46HnDZn3UwCjD9qx0I2Geaxt5S9kbvErKSj0BOdKCHY/L6Z8QCZ5xSbnrsmlD
	Hv4aQplQyBPZ7AwmfGLEhvEEJMoLlxWmxeFctDmOICR/H2AWeZdnNcapgCzDD/o8tfOGJ5YKuM5oX
	lzTDbzsQ/B1R+xMy5J+3TL0HHEpTf0kkCEJ8F5RgWD2/GQFQBWnvup5K78rTrKdEmd+4nmOlgAc+0
	U/O8Nurw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXHeg-0000000CR3b-1eN0
	for ath12k@lists.infradead.org;
	Tue, 06 Feb 2024 09:22:27 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4168NiIL018044;
	Tue, 6 Feb 2024 09:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=iqzwNh6n8/rOaJXI1v/YDFdWAXqXCCPPLM46xMXriYI=; b=PN
	+aYy5xcQ8yshsoPL/PppKPRxA6ywGgIBsMYeMNd757ycMepIq1KYd5ogbVzZOcOr
	o30eTBGBP9xyFP2GatdWwYIb5/+un/Qtvlh4Po7BcZCgWfB6Uwuwuf9YtD1tVMoP
	chwnhBIs1/eIV//fJSytM2e85Hh+FgxEEQVae2mAZ5BvGfqGCfi+u4iOS1Aztzf1
	nkKHTVZt0p/deFCIRql/4tjmrHZKgeU7j9RugCOpF4qrvjAb8lbyL0/xAd6lgWYk
	2UKLAW20qKv2KAo+MZMy7Jm+tIHVQLnKmEiUa2cs3y/g6qhJ1iNyy0W/9sxl9XYD
	/1Pm4H3Uuwu/D/PcZfEA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w3h7hr3t3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Feb 2024 09:22:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4169LxGk021348
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 Feb 2024 09:21:59 GMT
Received: from hu-ramess-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 6 Feb 2024 01:21:57 -0800
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>,
        Rameshkumar Sundaram <quic_ramess@quicinc.com>
Subject: [PATCH v2 11/12] wifi: ath12k: Modify rts threshold mac op for single wiphy
Date: Tue, 6 Feb 2024 14:49:53 +0530
Message-ID: <20240206091954.4144454-12-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240206091954.4144454-1-quic_ramess@quicinc.com>
References: <20240206091954.4144454-1-quic_ramess@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Q6uVqVXkw2GJyHHAwNAq0ptMA3YMgsmO
X-Proofpoint-ORIG-GUID: Q6uVqVXkw2GJyHHAwNAq0ptMA3YMgsmO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-06_02,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=765 mlxscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402060066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_092217_892687_369227BB 
X-CRM114-Status: GOOD (  13.48  )
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

From: Sriram R <quic_srirrama@quicinc.com>

Since multiple radios are abstracted under a single wiphy,
apply the rts threshold value to all the vdevs of the radios
combined under single wiphy.

This also implies that vif specific rts threshold support
needs to be added in future from cfg80211/mac80211.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index a85468cc63da..1e1de27e5d14 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7153,11 +7153,24 @@ static int ath12k_mac_op_set_rts_threshold(struct ieee80211_hw *hw, u32 value)
 {
 	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
 	struct ath12k *ar;
-	int param_id = WMI_VDEV_PARAM_RTS_THRESHOLD, ret;
+	int param_id = WMI_VDEV_PARAM_RTS_THRESHOLD, ret, i;
 
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
 
 	return ret;
 }
-- 
2.25.1


