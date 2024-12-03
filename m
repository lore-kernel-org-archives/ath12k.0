Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91055E6C61A
	for <ath12k@archiver.kernel.org>; Tue,  3 Dec 2024 09:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G1muunHMO0qhemB3t3/pd4lMQXg4gXbg6foMud8uBek=; b=fTzl/fnGvgVrKOW2wGSIIhmOhv
	YbARwD3GlZdkDcHXSBJFgwK6q1rifJqXc8SbQma13vOME5lg0l+eA4Qfb2yMTrc35XRg+BOYKanUV
	E45qwM5ZM6uWmNjVB5psFdpav33eSQomZEA9YMZNO/7+G6m6C0WnqJQ8AHoLWHroQD4UFuE7TLuUh
	PlEn9ZH+yO86GWSsP0HxsyI9s0tWnMnJdvJmVRMLlgCwYgfH/rs5d494EIKh76bry9wsRA9jsZSk2
	wPz235VczKmxTyImnFqeIbwJY/PAHxTf1zkOnDgVvig7FVC/q1bp6NCrDv+GjZg36vTGNJsFX8ZLQ
	cpCKmLnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIOtd-00000008oIr-1Uh3
	for ath12k@archiver.kernel.org;
	Tue, 03 Dec 2024 09:08:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIOse-00000008o99-1E63
	for ath12k@lists.infradead.org;
	Tue, 03 Dec 2024 09:07:41 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B38fkLe021814;
	Tue, 3 Dec 2024 09:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G1muunHMO0qhemB3t3/pd4lMQXg4gXbg6foMud8uBek=; b=aDIyNH7wsDc4imd0
	CGqT+ATgS/Om2x/pDEPUQ2AhBEIwgcx9MQsW1CsBUOYghxUTj3Z02NCb+jBMjJ7+
	mjS1RmpYXXUC2a1NGuuJKWBis5mS0Qq2peeVTIGNP608RjMfYgBp3j75Q7raes9o
	E3sLsyisgBBW+rOIUN7MZ58gc4G1Z4KfB8nAZh6GoNZ+WaXpmxMnVmCDfgZCE6gx
	0Yc9TPzzGSuaC539Q0xNhnUj6y40xu9AGBAnWAn5r2N6u45HVSrB34YuuKUW6F5g
	sMcCs7O1aIHssZnSB7HLq3tYyk6F3OtepMRwkafvTBo+RcVbyOmeo5DSl/YKlAC/
	2j0hOw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437uvjyckv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 09:07:38 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B397bM5024022
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 09:07:37 GMT
Received: from [10.151.41.184] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Dec 2024
 01:07:32 -0800
Message-ID: <2abf7644-7c52-4069-9a50-559e7414e18f@quicinc.com>
Date: Tue, 3 Dec 2024 14:37:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/22] wifi: ath12k: add ath12k_hw_regs for IPQ5332
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        P Praneesh <quic_ppranees@quicinc.com>,
        Balamurugan S <quic_bselvara@quicinc.com>
References: <20241015182637.955753-1-quic_rajkbhag@quicinc.com>
 <20241015182637.955753-6-quic_rajkbhag@quicinc.com>
 <940da07b-1286-4b88-8384-16ca2f996d90@oss.qualcomm.com>
Content-Language: en-US
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <940da07b-1286-4b88-8384-16ca2f996d90@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uUGqDSzVQVFXBkHouEIG0RRlNkZTq_KY
X-Proofpoint-ORIG-GUID: uUGqDSzVQVFXBkHouEIG0RRlNkZTq_KY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 impostorscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_010740_344179_C2B51443 
X-CRM114-Status: GOOD (  12.01  )
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

On 10/19/2024 1:28 AM, Konrad Dybcio wrote:
> On 15.10.2024 8:26 PM, Raj Kumar Bhagat wrote:
>> From: P Praneesh <quic_ppranees@quicinc.com>
>>
>> Add register addresses (ath12k_hw_regs) for new ath12k AHB based
>> WiFi device IPQ5332.
>>
>> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
>> Co-developed-by: Balamurugan S <quic_bselvara@quicinc.com>
>> Signed-off-by: Balamurugan S <quic_bselvara@quicinc.com>
>> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
>> ---
> 
> [...]
> 
>> +	/* CE base address */
>> +	.hal_umac_ce0_src_reg_base = 0x00740000,
>> +	.hal_umac_ce0_dest_reg_base = 0x00741000,
>> +	.hal_umac_ce1_src_reg_base = 0x00742000,
>> +	.hal_umac_ce1_dest_reg_base = 0x00743000,
>> +};
>> +
>>  static const struct ath12k_hw_regs wcn7850_regs = {
>>  	/* SW2TCL(x) R0 ring configuration address */
>>  	.hal_tcl1_ring_id = 0x00000908,
>> @@ -1126,7 +1210,7 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
>>  		.internal_sleep_clock = false,
>>  
>>  		.hw_ops = &qcn9274_ops,
>> -		.regs = NULL,
>> +		.regs = &ipq5332_regs,
> 
> This makes me believe the patches should be reordered (or perhaps
> this should be squashed with "add ath12k_hw_params for IPQ5332"?)
> 

Sure, in next version we will squash patch[2/22] to patch[8/22] into single patch that will add the complete hardware parameters.


