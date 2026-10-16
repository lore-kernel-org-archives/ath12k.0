Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B233CCA462
	for <ath12k@archiver.kernel.org>; Fri, 16 Oct 2026 03:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UYyU8dza59LzeIk7p98sajZ/7kGqJMFs9Tw/nO1ZWKU=; b=V80xX+kzDMUUi3ebzo5lIyiV1c
	0DQUiiMNI3YInTmzJtxBdWKGo9RfBin0EnL6p+mRXfjYjo7VDAbbGYiCwyVUN4FwAhFvV5pAnxhjq
	2oSnPnxgmwEAot4vhoQxmNrDbOjVCfTpzkVPax+zz8JHkzNOeDl/c6TRgOdhb7NRYlmBTJyUQuVC2
	K88HyQkdv0tEW79z/IEUlfLXh4jKxh0y0elEOeJxrB5GD01N9SUM3RUGxALtwD6I8nKMHhNsfXPZe
	RKYWGwZem+JUB0OqV2RfS83SjmA5PvFwQfGWnb7D6ra4u8vvJZSGMeHyw81IVsXQ/FxDEb0Q/Bfeo
	ynRjIheA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYX8-00000001q1W-3sQB;
	Fri, 16 Oct 2026 03:23:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYX7-00000001pzy-34lO
	for ath12k@bombadil.infradead.org;
	Fri, 16 Oct 2026 03:23:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=UYyU8dza59LzeIk7p98sajZ/7kGqJMFs9Tw/nO1ZWKU=; b=YTpXIQtikmHhXlg379bcIGbMGA
	FKYtAJ68JqqbdXe+EysHTAWUu42EowI46i5VQhFSX625Ic+oZFiuxI75t9yVcCyiaFieo8vSA9eIq
	++hntjF/yydW6SpE+fbKmV6wr0qHinXhOyIZSd8tNIpVnTF8DTaoVQkFEcgSE8kGyOP/jokzLS62w
	Zx1L7JY3sbhbIcGHZz2y+lDb9qqjeZHfs36+taI/At5eVKzbWiUgy09vF8u1Ey2yFrSqmasj1ud0N
	h6QQDBzpsllkDIWKp2e61ztkx9VJ7m2jHeD33yyc4GAq5k/LXubWV96YRq0jt520bEcWRAxsKpWQk
	YfGzSByQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHYX2-000000012e7-0Mvs
	for ath12k@lists.infradead.org;
	Fri, 16 Oct 2026 03:23:00 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FNhhar1596368
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 03:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UYyU8dza59LzeIk7p98sajZ/7kGqJMFs9Tw/nO1ZWKU=; b=AHS9v6IB3IaQ0++Y
	4FgCfLf00lSxGcC3jhJHfnIaW77kMAPBb7tM9qAl/JCfX8JGCH3tVg5Ojl+OrAVZ
	5ZVzXaWh9xv7Yv2rqc9hOiGH6tta/9D16gluQM7W4aLS8Z4NcttjSxljaEny4Q4P
	YmJ7h3zFkU80BJuB7jB3T7xFhz7sZQW+kNJKEQnrhuFN2QxfEvuZ5bJJgKtZGn1v
	OGhRibPRXQBYF2O8UzNjlBlqsgZoaeRPzj/vJfaDjjOElFLAMqgBRycUr1W/Oqmu
	RLvZS08WKxEmxADSf6H0BHoMz6QvEqdNBQQ+8iu+dUbXwk/fkp03HYUPHj+GDz5Z
	PUfiJg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2vbjqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 03:22:54 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c5aef2a74so6885161eec.0
        for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 20:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792120974; x=1792725774; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UYyU8dza59LzeIk7p98sajZ/7kGqJMFs9Tw/nO1ZWKU=;
        b=eKBQ36KLy5msFuMPAX/iD+HVfuksIXYzPNgB2BtUCQphZPB7ujXa6h+1r8DkNiFUHc
         XiFEbKbIt/WSSx/fDSjaqxT7SCAE2xToXPVbozAaKbiiU48DtOBIR5wGifpmZeAwFN4D
         5LKnqAEjNPvdEW/OpIH8ro3FDwLcSSPD6Z7tq67bJ0zJlzPeLrrFXEjIRUnMjC8LcjAB
         nNvjGScN2y6jkXw+OX9QhUyrvYc4N8SyLrJPL6QsHWaujurkuHJ58b519sdj4Enide3b
         hYggZRLbGMBeF9cFCnY0lkPcLlRhWF1FjfA1XKySn5bxu9pKk0eIvMQx3H6dU9sx3Lkz
         eS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120974; x=1792725774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UYyU8dza59LzeIk7p98sajZ/7kGqJMFs9Tw/nO1ZWKU=;
        b=U9jo0P/T8T7XbVLSKOz9T/GyMiqSgiiCSjNxYcfwF7CbDrTS9zE01+YRnWn52fbcZD
         zUUPb0GlRmcOXTgjFausY7qi2vgGaWZmUv0n9SWwn30VTa4G5XkrqeepDdmXywWvls3/
         fA4wtTNVE6fLaGL2iNje0ZtGKUyjy7Q2mol7UFcY5blPpXU+pFRbK1cmOU4/bUhWkFeb
         tMMVV4o43/tUMvqjTeGc6Suq33o7ASmg9EPuUq89jcsoTwxsrNI9lCnwnTtjx9CDx3Hv
         LBzvCeQLANQvmKrSQV0VR93lI0n98BVF3egd6d6IjnDKLVnX2Ae29PJh9iQk3v3ZTX5u
         zgzw==
X-Forwarded-Encrypted: i=1; AKwUvByEpUvqiACNbkJlUecVgcOk0Mv0+GL1j3USuHu9Cl3uJ9/pKruvu031vYpqimoU8Pxk1JVQyu0=@lists.infradead.org
X-Gm-Message-State: AFq9FYIH5hOYOnPpcu+ywukofnO5yqaEcP1VddP8paKpGLvZw4ol4xtv
	38quvNYLhO7Qn4cV9OYgtxqjEFgKxDWDljXWpAOfwYE7WEasLpGi0Yx5ruIxPNkjYD9VB9c5rcx
	LHcfMm1ebJtjopRPWroV3BVR8/XkTh03R8vmKEKRvtkFPHokaKexPcL47rdBW/+kN
X-Gm-Gg: AYBFou3Fxn0CxHrCOI1BLUZB6bXPoiIcsdPD5Uzn1qaL5KB0rUxolyaZUEE14DeijED
	8SMTa8NgKriPWJJfLW56W5t9e/iUG4J1Y1f8LHJwSEeiVU9hMDzwR+R+2HYnGKMLma+HVd73cIC
	XTuXLBtvZWCUediWKFkJY6J06FAcHJNwQPWYTLXymKzmLx2DxugZas2ytz7x6JP8UfcG4wZtq0X
	uQEe2reARTQ0kn5ucuNFXbTBGIjN2mv5T9QxRoE0npH/pO5xxa+6UmThh/HvfCPjfnnFPOGZkc+
	3qTnLll2pwoP+wu0ZIRJgjPieX8prTt2Aj3P5T/0LsuZp0LHP0BPRXdJe1DcNmpXAelkFvNNua6
	2pYfJLmjta8TmpClF2crCk+TLCCG6XCEwsHKdwfR2SQ/A8xBysDtkTU4nXRdxpF5HdXF5pj3gm2
	S24Nz9c2VYAs46dZHwoP+KsA==
X-Received: by 2002:a05:693c:821a:b0:35c:813a:1c81 with SMTP id 5a478bee46e88-35c813a23b6mr14072755eec.18.1792120973539;
        Thu, 15 Oct 2026 20:22:53 -0700 (PDT)
X-Received: by 2002:a05:693c:821a:b0:35c:813a:1c81 with SMTP id 5a478bee46e88-35c813a23b6mr14072720eec.18.1792120972992;
        Thu, 15 Oct 2026 20:22:52 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm2256698eec.13.2026.10.15.20.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:22:52 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 08:51:51 +0530
Subject: [PATCH ath-next v2 14/17] wifi: ath12k: store and use MSI data per
 CE and DP interrupt group for QCN6432
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-mpp-bringup-v2-14-f510c33bfcf5@oss.qualcomm.com>
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
In-Reply-To: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfXx2UXckJ/VJPz
 SEA3rg6dM2oHqCmj/qs7/gs8Bqp1xVCe2NZP0sSpkxAG/PUlJv2YOaM/2TyixA+Cukwix+DEf9G
 Rt2ymWPIoIZBObOSlnzmc8chfcChSiCOucTN2YoctORBCcrPtfRvr7F1Ru6PJuw7oSVEESMZCsP
 UPcDZc1P1hYs3rL2eLBZ3ZfeS/Ordl4z3ZdcQJrToMv7wJdHMOaAOR1kdSI0P7JBtROvsLQIW6P
 KWDSu5fhjzzmOaBgbHRc58Abf9FvCwJnkOe88RCxBTVLVdFNZBzNFxXzJnt5Uvz89teBvtrXmBF
 Hr5I46oD3Un1bUQ80ovqayFPnOJbp870MHgg0phA4l5p04R952mXl1gINouSO2euBVsXAF0mOov
 Z5bkPBlBKnK/1lh/0vk+AqL78sw/ZP0Mi7oEBG9/sauNVHpM8fw9CB2N4y80BRbzl8aHYMT+aMK
 h7kZYeI/hg1q4a5Fb9w==
X-Proofpoint-ORIG-GUID: XOFpZAcrU35pN-s5M9K9vxVkyAFRUd15
X-Proofpoint-GUID: XOFpZAcrU35pN-s5M9K9vxVkyAFRUd15
X-Authority-Analysis: v=2.4 cv=G/CJgNk5 c=1 sm=1 tr=0 ts=6ad1988e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=JOiqKhmsGJDeROXOrEsA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX0H1F2WKfL7Zl
 2WwwUqyiJnQOUcUw8AHoa2sY9YUsp3Pf8rMD2+4NX9qz3MGB/k5GbIay9EoMAoEd2FFHdtVnyQV
 lPo8CkR8lEPeK+anofObYwJuPJH9NRc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_042256_874940_B058E326 
X-CRM114-Status: GOOD (  13.75  )
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

From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>

Store MSI data values for each interrupt vector during configuration
and use them for ring setup on hybrid devices. Hybrid devices require
explicit MSI data values rather than calculated offsets.

Add ce_msi_data and dp_msi_data arrays to store values captured from
MSI descriptors. Use stored values for ring configuration on QCN6432,
ensuring hardware uses exact platform MSI allocated values.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Co-developed-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ce.c   | 7 ++++++-
 drivers/net/wireless/ath/ath12k/core.h | 2 ++
 drivers/net/wireless/ath/ath12k/dp.c   | 9 +++++++--
 drivers/net/wireless/ath/ath12k/pcic.c | 2 ++
 4 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ce.c b/drivers/net/wireless/ath/ath12k/ce.c
index c99e915e3885..cc8ed8451a2f 100644
--- a/drivers/net/wireless/ath/ath12k/ce.c
+++ b/drivers/net/wireless/ath/ath12k/ce.c
@@ -270,7 +270,12 @@ static void ath12k_ce_srng_msi_ring_params_setup(struct ath12k_base *ab, u32 ce_
 
 	ring_params->msi_addr = addr_lo;
 	ring_params->msi_addr |= (dma_addr_t)(((u64)addr_hi) << 32);
-	ring_params->msi_data = (msi_data_idx % msi_data_count) + msi_data_start;
+
+	if (ab->hw_params->hybrid_bus_type)
+		ring_params->msi_data = ab->msi.ce_msi_data[ce_id];
+	else
+		ring_params->msi_data = (msi_data_idx % msi_data_count) + msi_data_start;
+
 	ring_params->flags |= HAL_SRNG_FLAGS_MSI_INTR;
 }
 
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index bbbde9f05ea9..575139555dd7 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1172,6 +1172,8 @@ struct ath12k_base {
 		u32 ep_base_data;
 		u32 addr_lo;
 		u32 addr_hi;
+		u32 ce_msi_data[CE_COUNT_MAX];
+		u32 dp_msi_data[ATH12K_EXT_IRQ_GRP_NUM_MAX];
 	} msi;
 
 	/* must be last */
diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 6cf254b2d2a7..0f0800388935 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -225,8 +225,13 @@ static void ath12k_dp_srng_msi_setup(struct ath12k_base *ab,
 
 	ring_params->msi_addr = addr_lo;
 	ring_params->msi_addr |= (dma_addr_t)(((u64)addr_hi) << 32);
-	ring_params->msi_data = (msi_group_number % msi_data_count)
-		+ msi_data_start;
+
+	if (ab->hw_params->hybrid_bus_type)
+		ring_params->msi_data = ab->msi.dp_msi_data[msi_group_number];
+	else
+		ring_params->msi_data = (msi_group_number % msi_data_count)
+			+ msi_data_start;
+
 	ring_params->flags |= HAL_SRNG_FLAGS_MSI_INTR;
 }
 
diff --git a/drivers/net/wireless/ath/ath12k/pcic.c b/drivers/net/wireless/ath/ath12k/pcic.c
index 13097cdf2794..b6d306fd3b99 100644
--- a/drivers/net/wireless/ath/ath12k/pcic.c
+++ b/drivers/net/wireless/ath/ath12k/pcic.c
@@ -275,6 +275,7 @@ static int ath12k_pcic_ext_irq_config(struct ath12k_base *ab,
 			}
 
 			ab->irq_num[irq_idx] = desc->irq;
+			ab->msi.dp_msi_data[i] = desc->msg.data;
 			disable_irq_nosync(ab->irq_num[irq_idx]);
 		}
 
@@ -318,6 +319,7 @@ static int ath12k_pcic_ce_irq_config(struct ath12k_base *ab,
 		}
 
 		ab->irq_num[irq_idx] = desc->irq;
+		ab->msi.ce_msi_data[i] = desc->msg.data;
 		ath12k_pcic_ce_irq_disable(ab, i);
 		vec_idx = (vec_idx + 1) % num_msi;
 

-- 
2.34.1


