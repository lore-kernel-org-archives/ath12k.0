Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDDBC19F4F
	for <ath12k@archiver.kernel.org>; Wed, 24 Apr 2024 19:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P1EqBmSFbdoMe3tHwmrA3zCTkkvZw5Ppb5miNaMYCAk=; b=ev6UiX56QsHtqzOmDdy0j/cfLS
	NSprkowlAn315U8oI0ZejO+2Oy0rBKuUhFpG9ItJisoF25FlwPkicEYxELzryOKkUudjF43rPKgg+
	vGmf1pNjqfdEgx84d2Cyc09BB3B8p1qt+s5dhF23lvvwmsm9k3tD4IgXYVwDSRzzOZEQkaxLQt53/
	roQ5AIVR+e1VZZGq1lY4XOTNSgJC/cSb7dysqauEJ0cPi9DK94Eoj2j60xJvnUvrAdP8iPojoS7PI
	rI3zpHAdR67cqAAVnq5nmLH3MDZHDCJ9xMjsiJv16pTEuVEPPhAkTG5pozGYf1jk+GV2DkJbq8VuL
	U3EnqodA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzi2u-00000005bEA-1AQX
	for ath12k@archiver.kernel.org;
	Wed, 24 Apr 2024 19:12:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzi2r-00000005bCR-3STg
	for ath12k@bombadil.infradead.org;
	Wed, 24 Apr 2024 19:12:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=P1EqBmSFbdoMe3tHwmrA3zCTkkvZw5Ppb5miNaMYCAk=; b=Vs7WcQrkRjEYaBX7VECgQUk5cl
	qX04c+LKkpUOA/4Ho4sPv9Srz41RXFCXjQxUkNgj80ateqSgo7CSaktEGbf1JHzoSRJdBXiFL5gCQ
	6IGhh2Hp1TMtHrl7+0Vxdiw6F4W4ppdqurWe/RlQMGkPeqf/IR4JSIgmJluYoB8kX4YjhpOsJbzBS
	EGKGzJmZNNuV6S725jt80eRFEBuOmnVOmcD4MBuvX/xBkSX4micNyw7X3Xb32gj7fHMQSVS9RHYxT
	wZ+eEOp0AK7uo17TO7N01mFDf7+C6pfOuWiSnQTUiSnnS+Xi6IzXJ2tTJb6yWHh/hb22EsU6ytFRJ
	pdCznahQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzi2Y-0000000EWB0-25za
	for ath12k@lists.infradead.org;
	Wed, 24 Apr 2024 19:12:34 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43OImTr5027552;
	Wed, 24 Apr 2024 19:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=P1EqBmSFbdoMe3tHwmrA
	3zCTkkvZw5Ppb5miNaMYCAk=; b=E8ifjS9a3+EIbpQ9ixMSDt68z+hFKuyksRO8
	rzuCwgz7tKKm97YKCbOGMT8TwheNWERJIvxEyb5qnV+k34RPaA9SYS9DiFQPurxN
	qVf5kDSeqapx4rlPUodDk5D7NpKVxZjh07jLqjRb0YIAXl9Qt35244cEt1YVNoTp
	4EtjKBDAE2ea4CS3cnjbmwxbH4vYjPe5589F3z+LCOiAim1Y1IloeOxpeWkF9xBX
	1PovRRDOxjjoGDWDtmq2aK6N0eh/HYZJPvPmu+8hkgF//G9trf1IvcXIt+QBHeBN
	Hv2kehWYYDXTLSZMM9R4caIxltnwHx7j2QOg0lbcPZdeIEUaFw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xpv9fj080-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Apr 2024 19:11:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43OJBrqe017566
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Apr 2024 19:11:53 GMT
Received: from pradeepc2-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 24 Apr 2024 12:11:53 -0700
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Pradeep Kumar Chitrapu
	<quic_pradeepc@quicinc.com>
Subject: [PATCH V3 5/6] wifi: ath12k: refactor smps configuration
Date: Wed, 24 Apr 2024 12:11:40 -0700
Message-ID: <20240424191141.32549-6-quic_pradeepc@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240424191141.32549-1-quic_pradeepc@quicinc.com>
References: <20240424191141.32549-1-quic_pradeepc@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jyiUNvMQSzVzMuesLeNHeHcsGzig74m6
X-Proofpoint-ORIG-GUID: jyiUNvMQSzVzMuesLeNHeHcsGzig74m6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-24_16,2024-04-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0 phishscore=0
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404240091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_201224_528952_A6ECBCA2 
X-CRM114-Status: GOOD (  13.45  )
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

Move fetching smps value to a new function and use u16_get_bits
to extract smps value from capabilities. This will help in
extending the functionality when SMPS support in 6 GHz band gets
added in subsequent patches.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 32 ++++++++++++++++-----------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 8836dc67f7e0..65688e55c285 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -2086,18 +2086,29 @@ static void ath12k_peer_assoc_h_he_6ghz(struct ath12k *ar,
 				     ampdu_factor)) - 1;
 }
 
+static inline int ath12k_get_smps_from_capa(const struct ieee80211_sta_ht_cap *ht_cap,
+					    int *smps)
+{
+	if (!ht_cap->ht_supported)
+		return -EOPNOTSUPP;
+
+	*smps = u16_get_bits(ht_cap->cap, IEEE80211_HT_CAP_SM_PS);
+
+	if (*smps >= ARRAY_SIZE(ath12k_smps_map))
+		return -EINVAL;
+
+	return 0;
+}
+
 static void ath12k_peer_assoc_h_smps(struct ieee80211_sta *sta,
 				     struct ath12k_wmi_peer_assoc_arg *arg)
 {
 	const struct ieee80211_sta_ht_cap *ht_cap = &sta->deflink.ht_cap;
 	int smps;
 
-	if (!ht_cap->ht_supported)
+	if (ath12k_get_smps_from_capa(ht_cap, &smps))
 		return;
 
-	smps = ht_cap->cap & IEEE80211_HT_CAP_SM_PS;
-	smps >>= IEEE80211_HT_CAP_SM_PS_SHIFT;
-
 	switch (smps) {
 	case WLAN_HT_CAP_SM_PS_STATIC:
 		arg->static_mimops_flag = true;
@@ -2571,16 +2582,11 @@ static int ath12k_setup_peer_smps(struct ath12k *ar, struct ath12k_vif *arvif,
 				  const u8 *addr,
 				  const struct ieee80211_sta_ht_cap *ht_cap)
 {
-	int smps;
+	int smps, ret = 0;
 
-	if (!ht_cap->ht_supported)
-		return 0;
-
-	smps = ht_cap->cap & IEEE80211_HT_CAP_SM_PS;
-	smps >>= IEEE80211_HT_CAP_SM_PS_SHIFT;
-
-	if (smps >= ARRAY_SIZE(ath12k_smps_map))
-		return -EINVAL;
+	ret = ath12k_get_smps_from_capa(ht_cap, &smps);
+	if (ret < 0)
+		return ret;
 
 	return ath12k_wmi_set_peer_param(ar, addr, arvif->vdev_id,
 					 WMI_PEER_MIMO_PS_STATE,
-- 
2.17.1


