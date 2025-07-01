Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB15C83F02
	for <ath12k@archiver.kernel.org>; Tue,  1 Jul 2025 11:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PBaPrfoVHDoZhimDvHLYVvAmF2xfILiS0UdtilZz3jg=; b=VABfEdX8cOX8eEjf0vtGX2ZGri
	nc48N8wPAYdB/fe2oICVUtsYjO9FY7BhWnNka0H8yLbKyOASFjXYlE7Wd/QHLOaMqwfvjl2S5RyvR
	riflKwFCw+0Jn8liluetJwvy1Q7rbWV8fxEkuRVNo9ZXKrvZKTSuEQhpVxyTcU5dzhm6bTvEhk4lf
	7QB0NPOuk68EhSWI1x6Hb4tL6MtOUsYZQGFbigr+dq6sfqPF6B7mpLiS2ZkotJ79On+Q81x9P6q4x
	TvpCLXBidRgLeZxsWMEA1yKs3VL/rH3WDo5kGXGNDJeyCHWOVba+WvKe/lZnz9jwxjjupnFCsASbe
	5r+BpbzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWYmj-00000004pDt-3Ynx;
	Tue, 01 Jul 2025 11:04:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWYiR-00000004ogo-1f8Y
	for ath12k@bombadil.infradead.org;
	Tue, 01 Jul 2025 10:59:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PBaPrfoVHDoZhimDvHLYVvAmF2xfILiS0UdtilZz3jg=; b=qe42j0YGr7x7uUaOgajtsLMi/r
	fsEh28cqmPHWTx4sYTNz5oFuzuAQdRKSp5vpYCGwoIwcCaPRc8g9PlLpwFIr0DJV4c/+O3IhXZvF4
	g0EvHW/YUm2bZFkpboRxHqJmHrfWBGScKXcuckqovqD771KC3wNyoARVt+4u0RR6FrgP4Mc0eVA3J
	Gley0XAs/klwN140aVVjZPfT8eOzGMcEkQshjNRcL/F7s5mK8k8h7h+bzqMZaA5I7W3HoEkjjFWf2
	VG2xDDI3nsNweFR+0bGbHzaStm/D3OlunFC980GTG/o+QVE1fASnWCKBCBoS4Ly9YKrzRqIGe5OzH
	1eK7/zlw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWYiO-000000074T0-1IRc
	for ath12k@lists.infradead.org;
	Tue, 01 Jul 2025 10:59:54 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5619ppP1007049;
	Tue, 1 Jul 2025 10:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PBaPrfoVHDoZhimDvHLYVvAmF2xfILiS0UdtilZz3jg=; b=j6AEDccrk4iVu+e2
	W4Rs54YreC1c9qBXcbkRHTbTURGM22JhM4pWxDm5OXU/lsrr6vdPcZNI89zY70nr
	1qv2RDaR3HFVVTRGGRo/e+wTYticrge9M7VE75WJL8HM7db2f77BvKGdjn4MYhSl
	ubcUqcG0EDaQtywBZz/huDuzj60NzQCl4s2GUrDo/iftpd1Mv7475WvFOu9PTf9r
	1hTBQ7VyI7XiBZ+IUv5ujN/QAN5T6TlsbvMkIWRdAcfstK8nIsGR2leRM57jb6vB
	VKs+4FNEX64lCloIuqKLS+G7UdSS1ZexwqFuPbhJEUmmX1LRXJsxp8+o0277lhzf
	GnbBuA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kn5jcxbd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 10:59:50 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 561AxoV5022272
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Jul 2025 10:59:50 GMT
Received: from hu-sarishar-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 1 Jul 2025 03:59:48 -0700
From: Sarika Sharma <quic_sarishar@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Sarika Sharma
	<quic_sarishar@quicinc.com>
Subject: [PATCH ath-next v8 3/5] wifi: ath12k: add EHT support for TX rate
Date: Tue, 1 Jul 2025 16:29:25 +0530
Message-ID: <20250701105927.803342-4-quic_sarishar@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701105927.803342-1-quic_sarishar@quicinc.com>
References: <20250701105927.803342-1-quic_sarishar@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=KtJN2XWN c=1 sm=1 tr=0 ts=6863bfa6 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=nwLLUvrA-SLCDLgIScsA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Sv81AqrgTNfoA05csSO6Yum6-17ffSbU
X-Proofpoint-GUID: Sv81AqrgTNfoA05csSO6Yum6-17ffSbU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA2NiBTYWx0ZWRfX5nyOFzd6lFBM
 ieDjxvLYiRaS0l+gC3ifDkz92p47ZwSEaP2tlRyUWxDPoRKqIWGZ8BNLW0UXrYi/qg/skVrunnh
 tiW9uGoZHFKcyrpgzBh+Tr7+MtgNKcliXeal8Tbhy8q4Jh6nrWcEUwfgJiUBQX4aKr/lefx5TQ5
 mwSHb/+PGaclR0tV+88sPCAg0kr/FGYoe5aCuCj7Y/qdQs3LKFvD6abHMk+J9MBrfwmcysPNt8q
 4dvseaskAt2ZbcZqkzzALb3+IIpORAFf0zodOlwTUPDgMLU+O9B0LwMcy2aCT62kmWXqEtS+K0G
 UrCwM5uQ1dhBdjo9UQpioPZTW9QUarF/19lJMhyrTxBzb7o2USyU3YSX/hPD6WGjb8p8V1S2v4q
 Ja1WH0ju5ukNnNFz0ntpg0ycx2boWP7L/q4m+9Q5A1sM3fRQzyVrEFV0ZzSu/P7CE+TbvWF6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=837 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_115952_869861_DEBDB778 
X-CRM114-Status: UNSURE (   9.99  )
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


