Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D7DE77188
	for <ath12k@archiver.kernel.org>; Fri, 20 Dec 2024 22:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4nXlmOB68+QOEFBXeep/xRRq4DE+UR1z1GZdCojJSEE=; b=2f+yjj0+s9RkHOp0SZWdDikrBL
	C8emS7xk0khp8S5DMNqqLFJNjeY7ii9p5zyblnw7IX+LWeMXNSWlRCBVSal+S1K7IDmw9M0QBj9oB
	fHr+1soK57bWgHunfb8tyjRxfZWHzyjWKK5w7AHARBNaJqs2jbsLjWgWMcWt+/Jr8+5xFaxMCu9qE
	mbxMPNsLQFWiLyqzPSeYb0D4OdCqIeNF3E6bQeJa8zvZuw1Ax4yhX7nxg5F921z2as4CjgI+Dd0i2
	Nyhyjg/2zTEiTWJsYGOVNvLEg/gD18Wacogvwh9wViMCKGbIfKtcyx3qVp6bOG4aHav8KVeSGqPCX
	4P8UZLng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOl7O-00000006AHA-1Pve
	for ath12k@archiver.kernel.org;
	Fri, 20 Dec 2024 22:05:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOl7M-00000006AGg-1hzz
	for ath12k@lists.infradead.org;
	Fri, 20 Dec 2024 22:05:09 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKLSiMc028142
	for <ath12k@lists.infradead.org>; Fri, 20 Dec 2024 22:05:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4nXlmOB68+QOEFBXeep/xRRq4DE+UR1z1GZdCojJSEE=; b=jM4tac5BpDylR9/B
	rf26wgMUoNCUHR6nLjoRVZ5ivHx1uNfXax3XRQ4xQ6PUyIcYK6GeNT3Kd5DfieP6
	XoY0eRyA4KsIsFMjiSgkHTwqLpBvqY/WkjHXt+Z74g6GmNJxacaBalHz4eUsxOXY
	aZSnpQsG4wM2qDzXIbMIjN9gRrzAUtxbtFLemYEiUMBeQ35FdXGvtyVUx0PyUzLE
	qiXxmHW+g/dPjtCQ5c9ajnfN6FI4Gv97admJU0p/SXG/YPACp9hB32v/kJr+efJY
	1+zJgiviAoS84JXyOkmBVal8QMh0Wf7d092U2726zS5b4iDpmeDGiPvaebkIemJ1
	bufTsA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43nghf81y8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 20 Dec 2024 22:05:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-467bb3eeb04so4592931cf.2
        for <ath12k@lists.infradead.org>; Fri, 20 Dec 2024 14:05:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734732306; x=1735337106;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4nXlmOB68+QOEFBXeep/xRRq4DE+UR1z1GZdCojJSEE=;
        b=Zne9k7noNX8ixlKIaMG3Ham5lwtCRfqlxdTPrlQeO79lRM920fTvfxyevooxpfuK/X
         iQ8z5uNCG6Ajp3ImmOz6MrEa1Xc5MFpLgAVRdBCmyxHuCr6sOeQ3yx2ulpDC8A95cqZB
         fGFhsGWGtVGeu+dnhSIJd+vBVlgyoQCiNmoCU9OiZwUwMmX6nCxo/4V/JWJpT9fxnJtx
         Pcr5zwCLlTa2AN67iEcJiszyBHioASUqa9a05yTJPrDOsLPsIuguOzW/jYkNazTVPvWL
         v1Dq1T5mo/1B9vFOwctu5NC1uf1FEffptWevNGUALiYQi1zkArxVBNyUM9OpPSjj9FIx
         WZpw==
X-Forwarded-Encrypted: i=1; AJvYcCUHH8HI7naPS4IOfN/l1T1RBqCVUGY4BNZ9JgveT1q3GO4jRnbF4/2xbCHxn4H9BO6+ROEzgYM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxtefEKZMvxNZXRgnu5qqstcEheWPPYQCoSueOVImnHX4sFk5Oi
	lKeoP3L5HxNrfNk6iNL4WDAJehso5Pem5cB9gpnMD79fCxT3pY657o8SC5o2ds0xd2khixzxpWj
	5hW8XGnzakfVFRR5RFdEjTuOOttIQRP5KGSyDHikUaNbAWnOrGD7SoOrAKu6R
X-Gm-Gg: ASbGncsn7Md1G9dVioICuDBlLlOkBVOE51ZGZSjDEoD1+faBK7lpeLAhlw6fM3C+xrr
	p3PZMwoeAN5Kmtrd92qsVwLOE5rGRSVTLw0uC6aEMvQD8hPoxiWFKsnwXe6v7NbfxA5uf0p8rEa
	HsgCSUbBIouCucsq0uAhwSejpuRQKwuUkZaMrpg7Hl0RDA94azcNHeAKTPe+cyLw/VulCfS6Z9N
	upDBpqRZbi0APjhi672ME4417sKQ3k30Xnx9QE0VTAleLeOG9j3d9sgWNAcBHMdSMenUJsZXPEZ
	JS1Nx/P2j6JuYxlCbs5YcgG9LFabMvvQld4=
X-Received: by 2002:a05:6214:2a4e:b0:6d8:ae7b:6b3 with SMTP id 6a1803df08f44-6dd233b3944mr28522326d6.12.1734732306279;
        Fri, 20 Dec 2024 14:05:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmjK+yjXoyEKenhMrKpOs87S43uRGWsCZ/F/zqhyQ4b6IznVFNEJlW+armIOoWtpiVDZsBVA==
X-Received: by 2002:a05:6214:2a4e:b0:6d8:ae7b:6b3 with SMTP id 6a1803df08f44-6dd233b3944mr28521986d6.12.1734732305820;
        Fri, 20 Dec 2024 14:05:05 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e8961a6sm214801166b.57.2024.12.20.14.05.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 14:05:05 -0800 (PST)
Message-ID: <768ef22a-855b-472d-9432-49db7daaf2df@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 23:05:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 1/5] dt-bindings: net: wireless: Describe ath12k
 PCI module with WSI
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20241105180444.770951-1-quic_rajkbhag@quicinc.com>
 <20241105180444.770951-2-quic_rajkbhag@quicinc.com>
 <9cbdca90-e76c-4ebb-a236-a0edbd94a629@oss.qualcomm.com>
 <62c599b5-20b2-4e1e-810d-e4502abbc682@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <62c599b5-20b2-4e1e-810d-e4502abbc682@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bRwuWPPmv6u921iUuci_ejy9W_k8R1DY
X-Proofpoint-ORIG-GUID: bRwuWPPmv6u921iUuci_ejy9W_k8R1DY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 bulkscore=0 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_140508_585075_F747639D 
X-CRM114-Status: GOOD (  17.68  )
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

On 20.12.2024 10:47 PM, Jeff Johnson wrote:
> On 12/20/2024 12:03 PM, Konrad Dybcio wrote:
>> On 5.11.2024 7:04 PM, Raj Kumar Bhagat wrote:
>>> The QCN9274 WiFi device supports WSI (WLAN Serial Interface). WSI is used
>>> to exchange specific control information across radios using a doorbell
>>> mechanism. This WSI connection is essential for exchanging control
>>> information among these devices. The WSI interface in the QCN9274 includes
>>> TX and RX ports, which are used to connect multiple WSI-supported devices
>>> together, forming a WSI group.
>>>
>>> Describe QCN9274 PCI wifi device with WSI interface.
>>>
>>> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
>>> ---
>>
>> I think this description is missing the key points:
>>
>> * what is that control information (power, data, radio stuff?)
>> * what happens when the OS is unaware of all of this (i.e. what happens when
>>   we don't send any configuration)
>> * is this configurable, or does this describe a physical wiring topology
>>   (what/who decides which of the group configurations detailed below take
>>    effect)
>>
>> And the ultimate question:
>> * can the devices not just talk among themselves and negotiate that?
>>
>> Though AFAICU PCIe P2P communication is a shaky topic, so perhaps the answer
>> to the last question is 'no'
>>
>> Konrad
> 
> We already pushed the non-RFC version to our -next tree so we cannot update
> the commit description without a forced push.
> 
> https://lore.kernel.org/all/20241211153432.775335-2-kvalo@kernel.org/
> 
> However, Raj Kumar can submit an update to the description in the file, which
> is probably the better place to have this information anyway.

Sounds good

Konrad

