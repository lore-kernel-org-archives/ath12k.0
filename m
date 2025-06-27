Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81FEC83028
	for <ath12k@archiver.kernel.org>; Fri, 27 Jun 2025 19:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PBaPrfoVHDoZhimDvHLYVvAmF2xfILiS0UdtilZz3jg=; b=g0yjM9c53RSAoZhG9uTMjonY9a
	RkmE9JCFYY00T+92EG7afl7/uKM+GV4c97jkcZlHa2ZfGs94/aEdkkYk7oz52eSGrI013CSJx+D9W
	MTUOvgt1rSmYicXaVi3PQHWGeFb37oY+N9J5s2llNAUBCNP42PdBxYBm/ueqwWGesXzlmF0345CT9
	da8NcvaFigi96UhFq3m0hySIF2NS8a5FL2rCCjxiPkzfehQQsK370bze22IoKeMjsbU/0h+/tO413
	XEnzH4L/KD2hlomgHm4UZ98c5uAkC0ZNhERDj3BhhVoZ/1+9iObSr9hI6+NcxkxK9gSI6DeyySBiz
	xVU4Nj9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVEMz-0000000FY9A-1OFw;
	Fri, 27 Jun 2025 19:04:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVCPw-0000000FLUZ-432H
	for ath12k@lists.infradead.org;
	Fri, 27 Jun 2025 16:59:13 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RC95n7032643;
	Fri, 27 Jun 2025 16:59:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PBaPrfoVHDoZhimDvHLYVvAmF2xfILiS0UdtilZz3jg=; b=aTq/JyZ4FNAaxJiS
	T0x/YuhZ6dAU3GQKUMwbMO/utZZhWN2AWCZYEKDqbMU8FBaZKbD6vhRiJdM0kQDh
	vJzx47L8KunEmuqP6zvcdStUdIW/d5usc7CfKHJsSmQUmZqyMHiVArYwAZ9v3Pjc
	XtZTfAnG3qEvCbxuMJY4NpCVxdTs8744TbYueYQ1/Fx+LoQpYRowKp3SxO7DaatB
	QKTYKfoBQ3Fz913eoMlnRNaPzOMO+s7KqykWsVgMYIyKJYr/3ZcyGYbHRu3pOozH
	vhWzRArKRaDAmnCLCG4+Kvu5DC8DQYaMZxfVdiGHgokMan0azT3dlTzy/eLi5qvB
	rFaMuA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7tdhhsw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 16:59:12 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55RGxC59013612
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 16:59:12 GMT
Received: from hu-sarishar-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 27 Jun 2025 09:59:10 -0700
From: Sarika Sharma <quic_sarishar@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Sarika Sharma
	<quic_sarishar@quicinc.com>
Subject: [PATCH ath-next v6 3/5] wifi: ath12k: add EHT support for TX rate
Date: Fri, 27 Jun 2025 22:28:46 +0530
Message-ID: <20250627165848.3178339-4-quic_sarishar@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250627165848.3178339-1-quic_sarishar@quicinc.com>
References: <20250627165848.3178339-1-quic_sarishar@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685ecde0 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=nwLLUvrA-SLCDLgIScsA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEzNyBTYWx0ZWRfXwckBBdLlUCwf
 ISKKqfcA13qAxEmifJsH8oDrU2IWrp0l22lpGTP3bOGPW0gpBhncHnKZ5fVhhv4QNVKCzD50HyZ
 Qk+fZHSSCxGmju3B1nFe8toW+iTW8iC6uSXLeHLS7dTs3aICX6xEUY0V28e9oA54bbx0CAwR+7L
 VY18u8Au533JKIi0xNo46kZYSaeEg2YSLDiDIIlA2K+RnsCX9ceM4NiBjGeARXoIE0juQYLPZu1
 84fDl0Xob8lrEpaYLB16FR1PGFkPcoZmvmYLvS74fSMMdnOL99mTACjyP/zEu+8EQX2WOjEGFXh
 kcAtAzneqwu4FkfBQGM10DxkXtxxJ96OaMGA5JtOC5vX9HRBjkhfBMmzLCZx1V3zOSrh7QD0KAH
 Bmd3ewf33PKOJBbBJgO3hseKwH9PhvjnW0WQ/rf5l8/eVfx63RcIIV2tCmkpKvz3e6frkOBv
X-Proofpoint-GUID: SooWjCdDHo8xDbwp8cUBREeXEMrJVSt2
X-Proofpoint-ORIG-GUID: SooWjCdDHo8xDbwp8cUBREeXEMrJVSt2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=834 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_095913_005009_0837B313 
X-CRM114-Status: UNSURE (   9.29  )
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


