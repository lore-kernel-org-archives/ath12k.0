Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50FFC83026
	for <ath12k@archiver.kernel.org>; Mon, 30 Jun 2025 07:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PBaPrfoVHDoZhimDvHLYVvAmF2xfILiS0UdtilZz3jg=; b=AEDJ+eC2zSGpCF4Zn1JDl37PHQ
	UMNwbIcS9K2etxvLosSGoFn0BKqLg4Drf8diVjJ7/ZSzzmS0opG5LvKqINvLZ+yLMgcBEV1pEtTKx
	wThz+yZGu4eo130eU6y8YLLu6/BFHgTUvGqwSDwVcfwo+5Tq8/Rk21BQnHH/QJWM71fH8tUHTKS+B
	3dvLldz5TFpk7tnBdI2lDGYHTwR7TbZXR23rd3L+Y4zyF7mJ1J9E07YHBiOBoB6nhmZKUmEvaOcb5
	b2jnaxIK/pxA/yTTxBPTqhggxzpR4ICG4ThhQ9Vnmzut71g+FCUU+OuuiG9G8LbPdZoM57rdtkGPU
	8oQnNlJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW8gl-00000001QAj-1iGd;
	Mon, 30 Jun 2025 07:12:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW8gi-00000001Q8P-1VEG
	for ath12k@lists.infradead.org;
	Mon, 30 Jun 2025 07:12:25 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TNFHsB021411;
	Mon, 30 Jun 2025 07:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PBaPrfoVHDoZhimDvHLYVvAmF2xfILiS0UdtilZz3jg=; b=ehJ4qblKH2Df7USM
	pEVX8F2AUm80mTcsWfkB1jD1r/f17lTpnVY+8WEJLWVzNQTXIMTwG1WnK9264OFm
	bVrhogXLwQCufumD0erVT6pJ8J6l/cqTCll6f6z3BWaWuUJtaf2+uiSgXM8kzZ+C
	xj9EmQSOWLkBXHylw1JwHhQezgtIbWa5AuNDDIO54jXK7MJ1ex3nqIgD3csrJOfb
	afArDeqHtfW7G5W4/ynRJyo8f+jv/sw776sEmGRC23OFxV69sTph42UjCmUeTNb/
	lwS26BTTGuEDgGXjreudd6DKR0VZbam1hdGQng3ojTcsI4nO4ksq0Diq1MWjlUpY
	7ojyew==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63k3vmu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 07:12:23 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55U7CNac030507
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 07:12:23 GMT
Received: from hu-sarishar-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 30 Jun 2025 00:12:21 -0700
From: Sarika Sharma <quic_sarishar@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Sarika Sharma
	<quic_sarishar@quicinc.com>
Subject: [PATCH ath-next v7 3/5] wifi: ath12k: add EHT support for TX rate
Date: Mon, 30 Jun 2025 12:41:12 +0530
Message-ID: <20250630071114.3474672-4-quic_sarishar@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250630071114.3474672-1-quic_sarishar@quicinc.com>
References: <20250630071114.3474672-1-quic_sarishar@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=686238d7 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=nwLLUvrA-SLCDLgIScsA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA1OCBTYWx0ZWRfX1a8/B41Brx3U
 EZZa4KJafUdngzrFFyYTjPFnzOFlAAAmvQ3fRQj2x4pDQ4ROjHwnA20/HuHapa/8RrH1/dYRoKc
 +UZ1c2LqU6mTOuRYAPZ0ulXX1A+xAbpVRLboKLDHrJnQmiFfl16GDV1yex+1HYi7L72zlpoW0fU
 sYs7XbQqGzRsGdIjCKqvDK3Ff07jZmqVuaK202lAkYK3evXOopALD3zQcg430fslnhu1NwheTpY
 FSzS5MuApCJs+o1fEjL52y1Jx2In7upQmtTjstcSi1UMbpoRuec9wiCTq9VQCwagSsGQj+jaW+D
 GDMU+ojh87pBM6k+qGVxHlh2NGkFEDq96vsH9YWgaqZOkjx7n/Hx+QqBSNa3ly4pTNAvePbZ2Ot
 /3cP1iW/7xynDGFbEy5zC1HhfzZ1wnyiKaGxo+VoWOTTDs14kvw1IOyJQxkJiST/mhpycKo7
X-Proofpoint-ORIG-GUID: zI1p40Ba6c-FPeK386NcWC7sx0EFF9Xo
X-Proofpoint-GUID: zI1p40Ba6c-FPeK386NcWC7sx0EFF9Xo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=834 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506300058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_001224_395012_107A1BB2 
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

Currently, TX rates are not supported for EHT. Hence, add EHT
handling for TX rates and update the EHT-specific fields in arsta
accordingly.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sarika Sharma <quic_sarishar@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index f0cfe03d74b6..0f5edc81fc5d 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1535,6 +1535,16 @@ ath12k_update_per_peer_tx_stats(struct ath12k *ar,
 		v = ath12k_he_ru_tones_to_nl80211_he_ru_alloc(tones);
 		arsta->txrate.he_ru_alloc = v;
 		break;
+	case WMI_RATE_PREAMBLE_EHT:
+		arsta->txrate.mcs = mcs;
+		arsta->txrate.flags = RATE_INFO_FLAGS_EHT_MCS;
+		arsta->txrate.he_dcm = dcm;
+		arsta->txrate.eht_gi = ath12k_mac_eht_gi_to_nl80211_eht_gi(sgi);
+		tones = le16_to_cpu(user_rate->ru_end) -
+			le16_to_cpu(user_rate->ru_start) + 1;
+		v = ath12k_mac_eht_ru_tones_to_nl80211_eht_ru_alloc(tones);
+		arsta->txrate.eht_ru_alloc = v;
+		break;
 	}
 
 	arsta->txrate.nss = nss;
-- 
2.34.1


