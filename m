Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C90F9C4829D
	for <ath12k@archiver.kernel.org>; Tue,  6 Feb 2024 11:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2mIZfcyLh28SVhNb9Kcwit7KXxWjsONUsVR+djd/jHU=; b=zyNa1RMMDO0pHBJy/GbpfaFC4c
	rDKhFsqtOh/ofvXYD/owoSUovRAAwvryS6gR6D091HUuO6K1sQUjsOTyXKrwSFROXCEK1B3cKOh1k
	XlpOI4ZTpgZidVNnk/jy4nFlfk9z5X0KcdbBCLi6rFNONfE2XnAOCv3hU/dZfG0WUMLEkHSyL69l4
	Qa3vdKsJUbzV0S55KMA4MObuzevgPPbkZa9q/+FpP7u0qfXtsNBmKQV4NNRG5XK4A4RVZR+9CJc6o
	I3jorHx2myBvuBCZWG2e1xpCBU+oSe487dGVWlLuoGLPfcVZ7+BLqp/Z8SBamfKUNzfNcpvXbjN8a
	1ROqejgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXJta-00000007OT3-26YR
	for ath12k@archiver.kernel.org;
	Tue, 06 Feb 2024 11:45:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXHeZ-00000006gF0-0uSa
	for ath12k@bombadil.infradead.org;
	Tue, 06 Feb 2024 09:22:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2mIZfcyLh28SVhNb9Kcwit7KXxWjsONUsVR+djd/jHU=; b=lbfHYcdD2lAGsQf920z2m1ba7L
	F7+HkLb2AGXyWSiixUB1nvPzboyYf3DsNLyC0bPTpZunyiFtsU2+Zu3k7xwOLu00xOyNr7Qc2fEfn
	uiouYLgw9JMq9cJbsY4OblihumbZABTnmAr/NHY3+NyKSyJbVCYdDm77lJqmuP7Qa7+UVAs4ES0ix
	Q++NuhX+X1Tkj9jENYzPMjr1jh7Mb5AWPA0Tfj/bbwIkeAhFxhQPTXPfilKrSifWoDV+DM/3elfax
	RwCaywBAn07fBFusbQikeEsL6Pqvid4pPx0F+cYSVPSG3noOKJ3JZGVgc92l6NuQcx6PU9jkyiMjq
	j/IRgASg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXHeV-0000000CR1Y-3f8R
	for ath12k@lists.infradead.org;
	Tue, 06 Feb 2024 09:22:06 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4166Eo7g005947;
	Tue, 6 Feb 2024 09:22:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=2mIZfcyLh28SVhNb9Kcwit7KXxWjsONUsVR+djd/jHU=; b=T4
	WFjb+oPGrk6v5uX6gkPEHO4tNGwDM5XNDdTAp/CL6b/SctffjGusHIkCqmiqW8/K
	V9UfoctGDzALIxA/c8hxSEPHOe2dum94M3fC5UE++EoJCYRxBfGpFGTPW/Noh2U0
	6ApTne7gO8r8LcNClFKWAC2JZbQwKya0rrZbNilXIBA7XdoRLH6mJL/86j3jao53
	jYXznEIiYSbL4uQBclj5Qzld+dLHpg4PaS9+0uhNj1ZKKWVXRoLcBWmqO3W42Q3M
	tkcW2rBgGKIF0kmtELcRKiQAKySDbwWDnHqwVRyY71FTUrOYXzB9qBuUtRh6TlrX
	bhUEn9fUuW+2McINz15A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w3cafrprx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Feb 2024 09:22:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4169M1rW020657
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 Feb 2024 09:22:01 GMT
Received: from hu-ramess-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 6 Feb 2024 01:21:59 -0800
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>,
        Rameshkumar Sundaram <quic_ramess@quicinc.com>
Subject: [PATCH v2 12/12] wifi: ath12k: support get_survey mac op for single wiphy
Date: Tue, 6 Feb 2024 14:49:54 +0530
Message-ID: <20240206091954.4144454-13-quic_ramess@quicinc.com>
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
X-Proofpoint-ORIG-GUID: PDi5bOJjImS0im4GPdtR1sIW3k34G7iX
X-Proofpoint-GUID: PDi5bOJjImS0im4GPdtR1sIW3k34G7iX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-06_02,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 mlxscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=695 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402060065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_092204_461797_8378C544 
X-CRM114-Status: GOOD (  15.17  )
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

The radio for which the survey info needs to be collected
depends on the channel idx which could be based on the band.
Use the idx to identify the appropriate sband since multiple
bands could be combined for single wiphy case.

Also use the channel idx and sband to identify the corresponding
radio on which the survey results needs to be populated.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 1e1de27e5d14..8f867fb99b5f 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7702,7 +7702,6 @@ ath12k_mac_update_bss_chan_survey(struct ath12k *ar,
 static int ath12k_mac_op_get_survey(struct ieee80211_hw *hw, int idx,
 				    struct survey_info *survey)
 {
-	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
 	struct ath12k *ar;
 	struct ieee80211_supported_band *sband;
 	struct survey_info *ar_survey;
@@ -7711,12 +7710,6 @@ static int ath12k_mac_op_get_survey(struct ieee80211_hw *hw, int idx,
 	if (idx >= ATH12K_NUM_CHANS)
 		return -ENOENT;
 
-	ar = ath12k_ah_to_ar(ah, 0);
-
-	ar_survey = &ar->survey[idx];
-
-	mutex_lock(&ar->conf_mutex);
-
 	sband = hw->wiphy->bands[NL80211_BAND_2GHZ];
 	if (sband && idx >= sband->n_channels) {
 		idx -= sband->n_channels;
@@ -7731,6 +7724,21 @@ static int ath12k_mac_op_get_survey(struct ieee80211_hw *hw, int idx,
 		goto exit;
 	}
 
+	ar = ath12k_mac_get_ar_by_chan(hw, &sband->channels[idx]);
+	if (!ar) {
+		if (sband->channels[idx].flags & IEEE80211_CHAN_DISABLED) {
+			ret = 0;
+			memset(survey, 0, sizeof(*survey));
+			goto exit;
+		}
+		ret = -ENOENT;
+		goto exit;
+	}
+
+	ar_survey = &ar->survey[idx];
+
+	mutex_lock(&ar->conf_mutex);
+
 	ath12k_mac_update_bss_chan_survey(ar, &sband->channels[idx]);
 
 	spin_lock_bh(&ar->data_lock);
@@ -7742,9 +7750,8 @@ static int ath12k_mac_op_get_survey(struct ieee80211_hw *hw, int idx,
 	if (ar->rx_channel == survey->channel)
 		survey->filled |= SURVEY_INFO_IN_USE;
 
-exit:
 	mutex_unlock(&ar->conf_mutex);
-
+exit:
 	return ret;
 }
 
-- 
2.25.1


