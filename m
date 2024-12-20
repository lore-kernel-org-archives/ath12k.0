Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051D7E77188
	for <ath12k@archiver.kernel.org>; Fri, 20 Dec 2024 22:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9LkFprxiUsD1tk8g3pSzxnZakkpVhYTWUC5dUvvw9cU=; b=q6bqzyW/4o3CH5NPQSbCjqMrvo
	AHnL4XRPI39wpI1KhT4kzCwZo6sd4iI0LFh3WmXySxufuSlaRdzqA0JeN8HRvJUAH3fJrk6ES/LBO
	eOsoM+98XlGbInkzlBSTIf9OOK+4D3ECN9EVvCnv7WtHmBorliVzOB+xAFyAjVIZfjWX1dcVaLbWi
	YjSsMM2vunCFZnP4y+zQQYksR9WxYntSEKqPRcwhuCHqkN7xpLFFL8mLHnSHDhaYP5zrk2ju0WYDd
	e2Dg/QaYsFSvB4BO+K1tEeqz2nFHgbDTHaPj4dXxSJC55eoNFqUFg/nG0TCQD4nqgN+fCvAUA/ye/
	E129LsCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOl8G-00000006AOP-3GWJ
	for ath12k@archiver.kernel.org;
	Fri, 20 Dec 2024 22:06:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOl8E-00000006AO3-2yzj
	for ath12k@lists.infradead.org;
	Fri, 20 Dec 2024 22:06:04 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKEfnYW003929
	for <ath12k@lists.infradead.org>; Fri, 20 Dec 2024 22:06:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9LkFprxiUsD1tk8g3pSzxnZakkpVhYTWUC5dUvvw9cU=; b=OX6qF5HNDalc8WsU
	j1l+fCGALZntBY47aJJj/THHl+B7bxzD94dCk8um1GMoOrr92fRm9RLRh/nsGZNN
	x6zNnGIhaQjZC1Rfvg6TFDqHZgejTEHTtdhD2eHIf4X4c8qTpYwRAD8hvq2Cr9d0
	W2huSD4ejU53l7/ToTzgNE/1VfoAuR30ZbK2T6G5XCwuhZwjqqqEwtVa74xOuAfk
	DAXqXsVf4fXjRm8iL44FPC0eOiFPiADkmyLTOEJoIP6DeZEAhus6lCameWkKP22x
	i3BQOYf9JISQPokSXU0dqGglf/wJHUSXHGbhdv3eb4xcZr1mh2QCePY5Xcqwu3QL
	yr1Ldw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43najt11b3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 20 Dec 2024 22:06:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7b704c982eeso9512785a.1
        for <ath12k@lists.infradead.org>; Fri, 20 Dec 2024 14:06:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734732360; x=1735337160;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9LkFprxiUsD1tk8g3pSzxnZakkpVhYTWUC5dUvvw9cU=;
        b=UFsECE4kgSpfc539sl2Oy16Wt62uPnV60ywB7ZQGVE2UcZQmzCZR/o2IUlDZ6i/rZu
         SVhGEkooULtTiBpzJzgbqHsAmeJrIFiACNMZUNYZittcQzikUK5UOrJusL3T8tzkiecv
         GYNUkfQ1m2NFhmGZJ88YFK+EYt7iWgz+cXOuM+igj1aEDS1zXO+/ckEe6Uz/knWU6nTI
         f1LI7x1KL5Fo+hT1rsh4t4iUkQSgcTJOcMMp4hNXEJde2f2+8WCP2gaMJNDZTMVxN+yo
         m3DDAWY6dLm8FNwp7pidizUJaG3x1lNeKmB/V/Cr9EAk1lqesUJ1tqkcADmIIPLx1SFM
         xaew==
X-Forwarded-Encrypted: i=1; AJvYcCWIS3KPAcT7RYnwVu5GMtVPhA+MJcK7sq/oLrKl/LAK6FCZa2cD1rQUbLXl1AmTI6Pn0FUgPsQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxxPXboprAF3DgavffcZBg/v5MyAgl4R8arPWONwM5yK2851+px
	rmAyF7t+JeU5loTO64kRO3bNtCIemqiGvk/d3+NaVXDZEemfC7iGMlKE8/RWHAhR3jOYuyWLof6
	rWZurHOYX1AbA0iFY02Af//kub5lajvcVzygG/OathH2fwk+edhdLMY4jclU6
X-Gm-Gg: ASbGnctabljiNUYcd1kAUlZyYewKpUvK75LudUaBGf/l+l/114NNaNRxAmiIgi4Rl0O
	9KfI4uQU3yD2/7HJ2drkDixKhhdLlyOQGlbUb2dHgwOmvok3yuEoQ3CxJnKjeFTuO+JWPemeGim
	w5Nsb3avLlJsdHXYEEky35y1ujKwDF+FxmV+fGMyJdGkqSIK/1xWCS7+DUpgc+mijhAurXJy4p6
	D0QzZdriRzOkvK0ZC5FDb/OzCbDRZe401gKBY2yGk7kMTSbXQonkyH7/l3PJzV3CZckQ6MdW9bf
	WyY6KJd6JuBIyY51MEV+MqWF+iVqAd3T6PQ=
X-Received: by 2002:a05:620a:17a0:b0:7b6:e126:3dee with SMTP id af79cd13be357-7b9ba71292cmr244462085a.3.1734732360461;
        Fri, 20 Dec 2024 14:06:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEHDi1i1hytvqYgiaDYCCC63bgwu6iKUJ6GlNcbQHn3uxugwlsISW/jSe1exPxzhd8K+GSWew==
X-Received: by 2002:a05:620a:17a0:b0:7b6:e126:3dee with SMTP id af79cd13be357-7b9ba71292cmr244459385a.3.1734732360111;
        Fri, 20 Dec 2024 14:06:00 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80675a3ebsm2100297a12.7.2024.12.20.14.05.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 14:05:58 -0800 (PST)
Message-ID: <2d1570a2-511a-4200-b4cc-60f56cfe4423@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 23:05:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 1/5] dt-bindings: net: wireless: Describe ath12k
 PCI module with WSI
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
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
 <768ef22a-855b-472d-9432-49db7daaf2df@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <768ef22a-855b-472d-9432-49db7daaf2df@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YN2WMx9EGrehmjSosuseTztRKg50FBoQ
X-Proofpoint-ORIG-GUID: YN2WMx9EGrehmjSosuseTztRKg50FBoQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_140602_759658_014E8675 
X-CRM114-Status: GOOD (  14.82  )
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

On 20.12.2024 11:05 PM, Konrad Dybcio wrote:
> On 20.12.2024 10:47 PM, Jeff Johnson wrote:
>> On 12/20/2024 12:03 PM, Konrad Dybcio wrote:
>>> On 5.11.2024 7:04 PM, Raj Kumar Bhagat wrote:
>>>> The QCN9274 WiFi device supports WSI (WLAN Serial Interface). WSI is used
>>>> to exchange specific control information across radios using a doorbell
>>>> mechanism. This WSI connection is essential for exchanging control
>>>> information among these devices. The WSI interface in the QCN9274 includes
>>>> TX and RX ports, which are used to connect multiple WSI-supported devices
>>>> together, forming a WSI group.
>>>>
>>>> Describe QCN9274 PCI wifi device with WSI interface.
>>>>
>>>> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
>>>> ---
>>>
>>> I think this description is missing the key points:
>>>
>>> * what is that control information (power, data, radio stuff?)
>>> * what happens when the OS is unaware of all of this (i.e. what happens when
>>>   we don't send any configuration)
>>> * is this configurable, or does this describe a physical wiring topology
>>>   (what/who decides which of the group configurations detailed below take
>>>    effect)
>>>
>>> And the ultimate question:
>>> * can the devices not just talk among themselves and negotiate that?
>>>
>>> Though AFAICU PCIe P2P communication is a shaky topic, so perhaps the answer
>>> to the last question is 'no'
>>>
>>> Konrad
>>
>> We already pushed the non-RFC version to our -next tree so we cannot update
>> the commit description without a forced push.
>>
>> https://lore.kernel.org/all/20241211153432.775335-2-kvalo@kernel.org/
>>
>> However, Raj Kumar can submit an update to the description in the file, which
>> is probably the better place to have this information anyway.
> 
> Sounds good

(although bindings usually land with Krzysztof's or Rob's review tags,
but that's between you and them to talk about now)

Konrad

