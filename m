Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E206C19F32
	for <ath12k@archiver.kernel.org>; Wed,  5 Mar 2025 18:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BA/2qFxYmbwcqPma/aszST1uYFQi7XJIrgTUYSCXqn0=; b=FM9qN9ctgcejsBd7Y+CjAIaPqS
	FruVsGTZzjSGWgKfNgfUia2D6j5cvLIf8JSzcR9rFND8fGpnGLgplvvl8dwyLSIT3IXmnre/Wxdil
	A+63Up1STanCaXzD2MEVc8U4MaNXyf04/1eAG9kjD0pLGOO/Z6cbpJJuZGVxx3gxRCQENpJSZrklN
	yqTvptUnG6CFC17VVP7jRZCQck5TksUNihxcBwTUi9+aFFvwS5BV2jSAmvx//z95O9MKZJMt9g7BH
	KqiijJm6ZlgQTD/nquCzij6uBSU0mk2UnRRFRcg+swjYGmYP+r9WMx8Cb9wb16ynX9sI+umZQE4Ks
	zC1qw+Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tptjF-00000008xap-1H7s
	for ath12k@archiver.kernel.org;
	Wed, 05 Mar 2025 18:44:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tptjC-00000008xZl-1gZX
	for ath12k@lists.infradead.org;
	Wed, 05 Mar 2025 18:44:23 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525AwF4I014538;
	Wed, 5 Mar 2025 18:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BA/2qFxYmbwcqPma/aszST1uYFQi7XJIrgTUYSCXqn0=; b=AZ6NdsgxLz10/jIE
	hmq/quYFORPRJoVJxfQUgvr/HgfOamr0gR/0yYrFTU4xS5F7KzSysc4+vL5La2lz
	26HTtbq2bGiyAFrm2DxbktYdPHebocAeJHjs0Jr2ZoFujxFXhGH+YxtWrWK2UAsW
	FHuOpj5hDb4uZ8iVWNcYINaGUAJIEJPsR6lg4Q/kVeXz8j2JYXUKe6i4l82gaDzE
	wv3jpLEggcVZMmHfRqVTvMmKNJk5erWh1Pv4flGKCDKlM5VVKyRQ2f7ubKI7JLfX
	fCT1BWHw1HS5ykQJn6BLv5XXQY9xeIFpjis05NIjX5/W0o1a6RKO4XpcQhyRQBWM
	DDC4Wg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6vpfpx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 18:44:18 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 525IiHNt022904
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Mar 2025 18:44:17 GMT
Received: from [10.216.44.194] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Mar 2025
 10:44:13 -0800
Message-ID: <0b0d9e1e-b968-4ffa-8f61-4ac2c02de3c3@quicinc.com>
Date: Thu, 6 Mar 2025 00:14:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/13] wifi: ath12k: add AHB driver support for IPQ5332
To: <ath12k@lists.infradead.org>
CC: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        <linux-wireless@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Balamurugan S
	<quic_bselvara@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>
References: <20250228184214.337119-1-quic_rajkbhag@quicinc.com>
 <20250228184214.337119-9-quic_rajkbhag@quicinc.com>
Content-Language: en-US
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <20250228184214.337119-9-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UwTuhe1qE4EUXdEibtT6ykrnurHBTNzB
X-Authority-Analysis: v=2.4 cv=LYfG6ifi c=1 sm=1 tr=0 ts=67c89b82 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=8wJXLLSO5PcA3Y4IdE0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: UwTuhe1qE4EUXdEibtT6ykrnurHBTNzB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_07,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_104422_470379_7B73775F 
X-CRM114-Status: GOOD (  11.27  )
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

On 3/1/2025 12:12 AM, Raj Kumar Bhagat wrote:
> +static int ath12k_ahb_probe(struct platform_device *pdev)
> +{
> +	struct ath12k_base *ab;
> +	const struct ath12k_hif_ops *hif_ops;
> +	enum ath12k_hw_rev hw_rev;
> +	u32 addr;
> +	int ret;
> +
> +	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to set 32-bit coherent dma\n");
> +		return ret;
> +	}
> +
> +	ab = ath12k_core_alloc(&pdev->dev, sizeof(struct ath12k_ahb),
> +			       ATH12K_BUS_AHB);
> +	if (!ab)
> +		return -ENOMEM;
> +
> +	hw_rev = (enum ath12k_hw_rev)of_device_get_match_data(&pdev->dev);
> +	switch (hw_rev) {
> +	case ATH12K_HW_IPQ5332_HW10:
> +		hif_ops = &ath12k_ahb_hif_ops_ipq5332;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}

The ab should be freed before returning.
Will fix this memory leak in next version (v9).

