Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B1DC02194
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 16:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Prt8xOPE4tzYuuC2GdD2b9BREl1EzNERXgEX3LdMYw=; b=iXvpH3cAr3rBejKRspLHuly3qJ
	uXmkSw3bngTGXcWB9HPZoZ/bgIJkD2rGLiUBwtTRj/FhJEry+H+E7jDanHj177e8X+Nmhl9lj4wIB
	TwXjHF1QfdwpIOVpuoPgcWL2zBMdr5lcuRZJRZkg6yFKMH3s40PTv/gI0+r3RgvmtVgrgPT+5NQGI
	XrGTNIRdAKBHMp045RuTbKL0/qSg9BLV3cnqfgR+fJnYKLTCxPuzEylFXfXQcU9ERmtAFMXY6so9/
	0RUhuBNO8VxM3350S9muE7ciQkzslVEBYdtkfTjA/sl0LABDA+yWImXi5eEnDBKSdIBmyYh0ILIG7
	ucbeChrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfLcV-00000000wJT-13Pb
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 16:17:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfLbM-00000000wBu-1gFg
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 16:16:41 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514EWWI4016940;
	Tue, 4 Feb 2025 16:16:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Prt8xOPE4tzYuuC2GdD2b9BREl1EzNERXgEX3LdMYw=; b=hRliQO/BB8VXK+iU
	03snTgLVxtZUR3NwJVBTM0RlC5+q2FVKqLn5yX0Ggr70MgbMF65hkuTesT2b4UC4
	G+W6aBhrfK1axekqYqx2C1sanmhbvr23clTYStKlUQWAsjEfZ8cLGL37PT+JM2aF
	HV50cvQb1p11okbqvrrcjZEM4bP5h8IjPI9T4m3yT+UmJKBX/xXUrg9M4guxQfZ6
	vGRWutGyo/8mdu4rN960a8gRd3lHMnlKyHuRPEqiOBPxBKtDwcUdEo6lvv676zS5
	TGIUwAF+hs81dJh0S1xoGLAcmDvbaa6+7tCeMDAIJzts6p+nksD3T+WR8rpI9Rra
	IfbNDQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kmre08kp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 16:16:37 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 514GGaWq007150
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Feb 2025 16:16:36 GMT
Received: from [10.216.42.141] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Feb 2025
 08:16:32 -0800
Message-ID: <e05719c5-15b8-4ee7-85a3-5dd9d00f5b0e@quicinc.com>
Date: Tue, 4 Feb 2025 21:46:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/13] wifi: ath12k: Power up root PD
To: Krzysztof Kozlowski <krzk@kernel.org>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        "Sowmiya Sree
 Elavalagan" <quic_ssreeela@quicinc.com>
References: <20250130043508.1885026-1-quic_rajkbhag@quicinc.com>
 <20250130043508.1885026-10-quic_rajkbhag@quicinc.com>
 <02d3f555-c2e9-40ed-8695-8ae7f260e259@kernel.org>
Content-Language: en-US
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <02d3f555-c2e9-40ed-8695-8ae7f260e259@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8WNBpYl_UMi4pz-k9IFQYjBjVXRBXcG1
X-Proofpoint-GUID: 8WNBpYl_UMi4pz-k9IFQYjBjVXRBXcG1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_08,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 spamscore=0 mlxlogscore=874 bulkscore=0 priorityscore=1501 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_081640_456259_5431FC52 
X-CRM114-Status: GOOD (  10.53  )
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

On 1/30/2025 1:28 PM, Krzysztof Kozlowski wrote:
> On 30/01/2025 05:35, Raj Kumar Bhagat wrote:
>> +
>> +static void ath12k_ahb_unregister_rproc_notifier(struct ath12k_base *ab)
>> +{
>> +	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
>> +
>> +	if (!ab_ahb->root_pd_notifier) {
>> +		ath12k_err(ab, "Rproc notifier not registered\n");
>> +		return;
>> +	}
>> +
>> +	qcom_unregister_ssr_notifier(ab_ahb->root_pd_notifier,
>> +				     &ab_ahb->root_pd_nb);
>> +	ab_ahb->root_pd_notifier = NULL;
>> +}
>> +
>> +static int ath12k_ahb_get_rproc(struct ath12k_base *ab)
>> +{
>> +	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
>> +	struct device *dev = ab->dev;
>> +	struct device_node *np;
>> +	struct rproc *prproc;
>> +
>> +	np = of_parse_phandle(dev->of_node, "qcom,rproc", 0);
>> +	if (!np) {
>> +		ath12k_err(ab, "failed to get q6_rproc handle\n");
>> +		return -ENOENT;
>> +	}
>> +
>> +	prproc = rproc_get_by_phandle(np->phandle);
>> +	if (!prproc)
> 
> Nothing improved here - you still leak the reference.
> 

Thanks, will take care of np refcount leak in next version.

>> +		return dev_err_probe(&ab->pdev->dev, -EPROBE_DEFER,
>> +				     "failed to get rproc\n");
>> +
>> +	ab_ahb->tgt_rproc = prproc;
> 
> And here.
> 

Thanks, will handle rproc refcount leak.

