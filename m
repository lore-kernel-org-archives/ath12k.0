Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A035CC0218F
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 09:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nbnJssJZG3MOTVpEih44BprCyGfRnM+RbClZRhYaWK4=; b=E1wMeAO/i0jYy1phMQsRlFEc9p
	0DwZIjAqfBMuwQdgWKAwT/PB4hWajashHgMjnviF5nhb4ftzRmrdfItY5r/mktgqn+vCy/xrT9I8x
	AddudNA6gcNvc+PQZL9bqv6d2IqlHgrDV1aQaP7Bz/NGFcJrJGSmfKdxpmQX3NoKM52MYime9n5b3
	QDGFhTzYCxb8e4eKCUvniO4cVP2ZxkR4Nt4Qsvebv5SH9AkiZpQKdbXQ2O59TyHgJqL12v6gVBeDr
	7FtnY2LSoxifcjs0LKLjXnY4wr3v3v3gZAosMNTTP1hOYneLPJtPaWoSo80pAWC2KJSVU3EESIIps
	+pBt9zzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfEtb-0000000Haz1-1c2S
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 09:07:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfEtZ-0000000HayZ-1I3x
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 09:07:02 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5141axeW004786;
	Tue, 4 Feb 2025 09:06:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nbnJssJZG3MOTVpEih44BprCyGfRnM+RbClZRhYaWK4=; b=kvCj+tqFzDrlG3jF
	Tf393bAmOjilXKI0mc8AeJAsIHwF+pFND+bz2ovQvZyqB4f9i/3ycUPZKpeJqq79
	SiLsSPqZ7cANqdoRy0VN9prW5vrPzu2cv0/lty04M4LnuUjADzaGquk1qZRJefwn
	tRzkWGe0qvzfdbGOZ24AphjKAMyELOb218AwIhwrsy1Nj3OzoKe3r2k/mULy28DS
	c+xBTtcuuOX9B0vJ9dK0RR1Jq5dX8KXp7LmaoUzCjE5rgoFT0rGRXBv11zpNeCuE
	/279bIUaQDlfakDLbBULCnnsx+/UZYx9O5Cd9Qhmtd/Y3el6Ds4gE+6BA4LrvsPl
	+Vp4Zw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k9cn0ud4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 09:06:58 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51496vZB017428
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Feb 2025 09:06:57 GMT
Received: from [10.216.42.141] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Feb 2025
 01:06:54 -0800
Message-ID: <c7d9842a-96bf-41aa-8046-52c3e45f90d4@quicinc.com>
Date: Tue, 4 Feb 2025 14:36:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/13] wifi: ath12k: add support for fixed QMI firmware
 memory
To: Krzysztof Kozlowski <krzk@kernel.org>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250130043508.1885026-1-quic_rajkbhag@quicinc.com>
 <20250130043508.1885026-8-quic_rajkbhag@quicinc.com>
 <4c9b512f-59d2-4d96-a899-5af4de2c823e@kernel.org>
 <7d5f7b4c-2a55-41c7-b85c-cb4cd76d553f@quicinc.com>
 <962dc257-f7a6-49c7-b760-a31fd84e7a56@kernel.org>
Content-Language: en-US
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <962dc257-f7a6-49c7-b760-a31fd84e7a56@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bwnGYCj7eok16Tun1dxNjPyrsV-sb_0N
X-Proofpoint-ORIG-GUID: bwnGYCj7eok16Tun1dxNjPyrsV-sb_0N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_04,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 spamscore=0 bulkscore=0 mlxlogscore=973 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_010701_373129_211AB0D6 
X-CRM114-Status: GOOD (  15.76  )
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

On 2/3/2025 3:42 PM, Krzysztof Kozlowski wrote:
> On 03/02/2025 10:44, Raj Kumar Bhagat wrote:
>> On 1/30/2025 1:16 PM, Krzysztof Kozlowski wrote:
>>> On 30/01/2025 05:35, Raj Kumar Bhagat wrote:
>>>> @@ -2646,6 +2663,136 @@ static int ath12k_qmi_alloc_target_mem_chunk(struct ath12k_base *ab)
>>>>  	return ret;
>>>>  }
>>>>  
>>>> +static int ath12k_qmi_assign_target_mem_chunk(struct ath12k_base *ab)
>>>> +{
>>>> +	struct device_node *mem_node;
>>>> +	struct resource res, m3_res;
>>>> +	u32 bdf_start_addr;
>>>> +	int i, idx, ret;
>>>> +
>>>> +	for (i = 0, idx = 0; i < ab->qmi.mem_seg_count; i++) {
>>>> +		switch (ab->qmi.target_mem[i].type) {
>>>> +		case HOST_DDR_REGION_TYPE:
>>>> +			mem_node = ath12k_core_get_reserved_mem_by_name(ab, "q6-region");
>>>
>>>
>>> Why cannot you use existing API for reserved memory -
>>> of_reserved_mem_lookup()?
>>>
>>
>> The of_reserved_mem_lookup() requires reserved memory node to read the memory and
>> return in the structure "struct reserved_mem".
>>
>> The of_reserved_mem_lookup() would be used after we get the reserved memory node
>> using the API - ath12k_core_get_reserved_mem_by_name(ab, "q6-region");
>>
>> In next version we would use of_reserved_mem_lookup(), Something like below:
>>     mem_node = ath12k_core_get_reserved_mem_by_name(ab, "q6-region");
> 
> Then why do you need ath12k_core_get_reserved_mem_by_name() in the first
> place? Just use of_reserved_mem_lookup() directly. Why do you need to
> parse phandle before of_reserved_mem_lookup()?
> 

Sorry, I'm having difficulty understanding this.
We have the WiFi node at ab->dev->of_node, but we don't have a node for the reserved-memory
'q6-region'. The of_reserved_mem_lookup() function requires the device node for 'q6-region'.

Could you please suggest how we can use of_reserved_mem_lookup() without obtaining the
'q6-region' node first.

