Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCFED0C5F9
	for <ath12k@archiver.kernel.org>; Fri, 25 Oct 2024 10:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PwYWGdB45qg/3CamTEfHajoG/yYk5oPu6x2vS9FthPY=; b=xS5+IhavCWZyM5hnNHEUncJfox
	fgfWjCFgwQrFsEIkuLhY5wGQVtW+92LQ1xEO+VMT+kZUVkdyCbVpOm8z9eYS0GkIQ10Mp0V/hNPt/
	+Vs/YamkrEeKuiUOuyIqxfNzNBfRX48fbIpgBeXc6FgIix88FEJVauoGlZRmX8waRUSJhENb1l3VS
	3Fryp8+8Fjr2g1SFIUgt0+mp31oWEqCXSzQ2cdhNNSkPu1iCI3LFV0xhfd84sN3y5mneQdFDk6+/O
	CgFKi5Ptw83MwZQv2drHE0Tkjj1X9MasAwqIlYAyb5sXW+bQX/UrtUgbTO8FLI2hgwVMtr1W4PJak
	BnCXrbAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4HBy-00000003ISL-3wSx
	for ath12k@archiver.kernel.org;
	Fri, 25 Oct 2024 10:05:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4H6x-00000003HDQ-2gFU
	for ath12k@lists.infradead.org;
	Fri, 25 Oct 2024 10:00:05 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49P1BrSe004522;
	Fri, 25 Oct 2024 09:59:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PwYWGdB45qg/3CamTEfHajoG/yYk5oPu6x2vS9FthPY=; b=G3TRUDixCpwVp/37
	eY2953pgVDCWctZFVnwujl30TbLM7k3Hpsf5X5T4RnafIpoMNhu8okxsTXNwk/y1
	WFn3/aBkknSS119Y6ZoozDkRlKhQuCoAVRiKmdzjmepTwiuQ1eZ01SQlln8iMuwZ
	opeAR+8ovLlW90i/jyerf9H7yz3zct9ylkgXNnQyY1m0aGNvIrTZzQIj/0To82K1
	xfJ1IgfY9n1Gu15hNJYtx5Tf04Fz2TV8hFpz+/dHp1081Ss8AFMkym6hG2nF6+vE
	eAQG6JQ547jiV/YHfQcmVMeu70uFlldtEHCUYeLJOgLM8a3jStv6MQo9uz0lW+Gu
	VoIvFA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em688g37-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 09:59:57 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49P9xua0011713
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 09:59:56 GMT
Received: from [10.151.41.25] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Oct
 2024 02:59:52 -0700
Message-ID: <b2a18ac5-727d-4f5b-9465-c360e6432dc5@quicinc.com>
Date: Fri, 25 Oct 2024 15:29:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/6] dt-bindings: net: wireless: update required
 properties for ath12k PCI module
To: Krzysztof Kozlowski <krzk@kernel.org>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn
 Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20241023060352.605019-1-quic_rajkbhag@quicinc.com>
 <20241023060352.605019-2-quic_rajkbhag@quicinc.com>
 <87db3d68-ab1a-4cc4-9857-416de39cea0f@kernel.org>
 <e2c1ce1a-89af-4feb-a21a-9ca2578430e7@quicinc.com>
 <b97b8350-3925-40b0-8f87-f89df429a52a@kernel.org>
 <e7b27f57-efb2-45ea-bbe0-e5aeb90cbff9@quicinc.com>
 <606083d8-4332-45e4-be41-08ca5425cc03@kernel.org>
 <94defe49-c87a-44f6-8768-03f3d6687ac3@quicinc.com>
 <50c0f184-030b-4a19-bf8a-077505170f03@kernel.org>
Content-Language: en-US
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <50c0f184-030b-4a19-bf8a-077505170f03@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DTVJxZ-XF8nN1HLYhmgfBnExrhPnEtDh
X-Proofpoint-GUID: DTVJxZ-XF8nN1HLYhmgfBnExrhPnEtDh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=533 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_030003_856616_98E56D6C 
X-CRM114-Status: GOOD (  19.34  )
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

On 10/23/2024 5:38 PM, Krzysztof Kozlowski wrote:
> On 23/10/2024 12:28, Raj Kumar Bhagat wrote:
>> On 10/23/2024 12:29 PM, Krzysztof Kozlowski wrote:
>>> On 23/10/2024 08:53, Raj Kumar Bhagat wrote:
>>>> On 10/23/2024 12:17 PM, Krzysztof Kozlowski wrote:
>>>>> On 23/10/2024 08:45, Raj Kumar Bhagat wrote:
>>>>>> On 10/23/2024 12:05 PM, Krzysztof Kozlowski wrote:
>>>>>>> On 23/10/2024 08:03, Raj Kumar Bhagat wrote:
>>>>>>>> The current device-tree bindings for the Ath12K module list many
>>>>>>>> WCN7850-specific properties as required. However, these properties are
>>>>>>>> not applicable to other Ath12K devices.
>>>>>>>>
>>>>>>>> Hence, remove WCN7850-specific properties from the required section,
>>>>>>>> retaining only generic properties valid across all Ath12K devices.
>>>>>>>> WCN7850-specific properties will remain required based on the device's
>>>>>>>> compatible enum.
>>>>>>> Just not true. These apply to all devices described in this binding.
>>>>>>>
>>>>>>> NAK.
>>>>>>>
>>>>>>> Don't send patches for your downstream stuff.
>>>>>> This is not for downstream. This series is the per-requisite for ath12k
>>>>>> MLO support in upstream.
>>>>>>
>>>>>> In the subsequent patch [2/6] we are adding new device (QCN9274) in this
>>>>>> binding that do not require the WCN7850 specific properties.
>>>>>>
>>>>>> This is a refactoring patch for the next patch [2/6].
>>>>> It's just wrong. Not true. At this point of patch there are no other
>>>>> devices. Don't refactor uselessly introducing incorrect hardware
>>>> Ok then, If we squash this patch with the next patch [2/6], that actually adding
>>>> the new device, then this patch changes are valid right?
>>> Yes, except I asked to have separate binding for devices with different
>>> interface (WSI). You add unrelated devices to same binding, growing it
>>> into something tricky to manage. Your second patch misses if:then
>>> disallwing all this WSI stuff for existing device... and then you should
>>> notice there is absolutely *nothing* in common.
>>>
>> I understand your point about having separate bindings if there are no common
>> properties. However, the title and description of this binding indicate that it
>> is intended for Qualcomm ath12k wireless devices with a PCI bus. Given this, the
>> QCN9274 seems to fit within the same binding.
> Feel free to fix it. Or add common schema used by multiple bindings.
> 
>> Additionally, there will likely be more properties added in the future that could
>> be common. For example, the “qcom,ath12k-calibration-variant” property (which the
> You are supposed to add them now, not later. See writing bindings. They
> are supposed to be complete.
> 

Sure will add "qcom,ath12k-calibration-variant" in next version.

>> ath12k host currently doesn’t support reading and using, hence we are not adding it
>> now) could be a common property.
> What is "host"? Either the device has this property or not. Whether host
> supports something does not really matter, right? You have hardware
> property or you have it *not*.

Ah, my bad. I meant to say “ath12k driver”.

