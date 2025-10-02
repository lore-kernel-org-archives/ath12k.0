Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25366CAC5BB
	for <ath12k@archiver.kernel.org>; Thu,  2 Oct 2025 00:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MvqYCDWWc9Leq6edaeAnFDM+2mMR+2P4GgAXH+a2E1s=; b=k67zaIW7V5X46x2P3harLm7tzd
	RNTRtPqucfC9r24ArXvyOHETypaf7UWcD5vb5etc0hAKJ1qC9/OO/pflBRLQkLo9NjOt2j9xs32aH
	0PTP2dtwj7EIXSO23NvMFNyv1iJoeXD2qCc8wdVUKcJuyu9VCtzW0fJBQIsoll351Ugd+O6xsH8Ql
	cRZZcbCm7gi35sUASd6N1Vn3PkjpVyEStveK0pb3KkIWeTLGyD8iKQyCB0cMAeY2TQE+L+ZUPEq+f
	/mW0Zm5vm1BiLsYNLbQRxNnmayCZkg32dIvMIRvR8d4aThibIDnNEw3KdBOaskF1E+5wEm72M+ccB
	cGroL20g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v46rM-00000009HLQ-3jq4;
	Thu, 02 Oct 2025 00:07:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v46rJ-00000009HKK-424U
	for ath12k@lists.infradead.org;
	Thu, 02 Oct 2025 00:07:47 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IcGhd031548;
	Thu, 2 Oct 2025 00:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MvqYCDWWc9Leq6edaeAnFDM+2mMR+2P4GgAXH+a2E1s=; b=d18IkN68uDwGFH/Q
	ZvFTqhUUaDsQuAN4ZJXwMm2lBioQCj3nCZP9YEarXTjMe6uoGRtAAWnwThLBfn+N
	qMkUpexGjbmahaE8pg7OUI8rHEw85zTX07JQSfD5+5F6GoNRkKIHVK2Wsn6HWCS1
	qnQ03YDm0/8mOsOJy7BxL40ns9OnnbDlSLIsFaiLlc2DbHyjNyn6kb9YxwkR0/1P
	rFRPRryTjhXAJtbNG1M1KZLK2lHFiH98kUqEyDYVQl6kTizRp0RKnoJd63uxsLyG
	SgIR0MU/bmy7vO8hHArg6loafsR87WZNzpiFdkiXPVjtgolrV8XLNqfJBcJLx9mJ
	tCqhnQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6vr67vk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Oct 2025 00:07:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59207iRe013981
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 2 Oct 2025 00:07:44 GMT
Received: from ath12k-linux2.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Wed, 1 Oct 2025 17:07:43 -0700
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Baochen Qiang <quic_bqiang@quicinc.com>,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Subject: [PATCH ath-next V16 2/2] wifi: ath12k: fix TX and RX MCS rate configurations in HE mode
Date: Wed, 1 Oct 2025 17:07:32 -0700
Message-ID: <20251002000732.1916364-3-quic_pradeepc@quicinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251002000732.1916364-1-quic_pradeepc@quicinc.com>
References: <20251002000732.1916364-1-quic_pradeepc@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TkZCx4FGp8UHE3-MOlOxqc0cnsu9e547
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxNyBTYWx0ZWRfXy87i2jIcSDiJ
 GGm9S6LYfBaOGntpLyk3N3sQMvhyoVgQu0gu/B5/cyoGyE0so1A0eWJLu+/zkJfORV58UxuXzYW
 W0lc+igtFiZZXV0WU4WkvkFZNyfGDmy2pVUAp4oPVg1C+rKv+cUzBcvy4qY8W0pNq6xq3EC2smN
 Hm1XiQccAAzeKN2TqD4LXY/i6j/PoCQKmb/tGNWNDGT4QwMpw1Oexv/TEOwV7C8bGIzUeMhkG7P
 ZFf05dggqvegwSUEFTlcosKjr75hkSfUPAOsHnf0tvi734m+jZpIPObu+fgpRBk2ZLOkdK+j7SX
 CPXpINpSQUWo/NStgvdj0WTNBEFOCgNsBK4lSIsEbu3bdV4oMfThSzezo+EmRki3051rxkLeQyw
 U2+kTvWkEygOy4u4k0QbV86DV2WcdQ==
X-Authority-Analysis: v=2.4 cv=IeiKmGqa c=1 sm=1 tr=0 ts=68ddc250 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=-WEFs_rbKGq8kVQlx6kA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: TkZCx4FGp8UHE3-MOlOxqc0cnsu9e547
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_07,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 priorityscore=1501 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_170746_035839_9A5D3029 
X-CRM114-Status: GOOD (  11.84  )
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

Currently, the TX and RX MCS rate configurations per peer are
reversed when sent to the firmware. As a result, RX MCS rates
are configured for TX, and vice versa. This commit rectifies
the configuration to match what the firmware expects.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 0d425a1bc0ab..19be450b42ff 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -2624,9 +2624,8 @@ static void ath12k_peer_assoc_h_he(struct ath12k *ar,
 	switch (link_sta->bandwidth) {
 	case IEEE80211_STA_RX_BW_160:
 		v = le16_to_cpu(he_cap->he_mcs_nss_supp.rx_mcs_160);
-		arg->peer_he_rx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_160] = v;
-
 		v = ath12k_peer_assoc_h_he_limit(v, he_mcs_mask);
+		arg->peer_he_rx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_160] = v;
 		arg->peer_he_tx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_160] = v;
 
 		arg->peer_he_mcs_count++;
@@ -2636,10 +2635,10 @@ static void ath12k_peer_assoc_h_he(struct ath12k *ar,
 
 	default:
 		v = le16_to_cpu(he_cap->he_mcs_nss_supp.rx_mcs_80);
+		v = ath12k_peer_assoc_h_he_limit(v, he_mcs_mask);
 		arg->peer_he_rx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_80] = v;
 
 		v = le16_to_cpu(he_cap->he_mcs_nss_supp.tx_mcs_80);
-		v = ath12k_peer_assoc_h_he_limit(v, he_mcs_mask);
 		arg->peer_he_tx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_80] = v;
 
 		arg->peer_he_mcs_count++;
-- 
2.43.0


