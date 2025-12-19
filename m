Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7762D767DC
	for <ath12k@archiver.kernel.org>; Fri, 19 Dec 2025 11:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fMdx0pQw++OdmVRdKAe5y5wrvzemap1JR50aCfUHmCw=; b=KfP5pQXpUlVY1fgqGnbzh37g7o
	ChKLycvsTJ6KNfx1T4LjKUe+sahII1SdMehYgAXmwjDLndOTnkKEf+AE1dPB6QD91eS4zhO1Uxbza
	7irGm/sJlfhl6SxsvG6inUMuG06kD5Oxl6Y0C8PeyEJvyr0VuFs9m6OCSkfG3K5Sg4bAdsXlO5Wed
	J/OivsgNtOLcZ8k7QkucL47gzU5vXsiyf7aW28SCXikZdi7JPvPVUd40F2YHDv46tJqGdCVXVCQX/
	WP1zdqlbNdokZoMzIq2ndyg2sL199lzI2iy34soSUG+9P8u0d4Ci+FaEBzLUhaDIl5/p6uPUtAgcJ
	8zOP9LRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWYjy-0000000ACGx-0UGO;
	Fri, 19 Dec 2025 11:33:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWYjv-0000000ACGc-17Zn
	for ath12k@lists.infradead.org;
	Fri, 19 Dec 2025 11:33:44 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBHOXs4100960
	for <ath12k@lists.infradead.org>; Fri, 19 Dec 2025 11:33:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fMdx0pQw++OdmVRdKAe5y5wrvzemap1JR50aCfUHmCw=; b=fUZDRAx6yVvWka15
	K+Uc8YxCFiSuV3wtdByC0G7h4K2/0IFH7uwYhL9Wi8L98WrNwXEuwMLFp3YJ7DEQ
	vDIYPLb5ajcrHChN2wx5eVjP62eVzFsSb43ge/IVBqv5hN/L8EFzddicwUug0ZYs
	6Aqk/l4MSAPpTehblYmqu34znUJLK0AS6/uPRQkAnR1qgS0sDYzbkdc71BYMdEnM
	UYDjeoO7VKSTU+xyRkp9ftJd/ya/FzBtynmy+pKXdsvRySWcKBKN+fwamzwrG3cb
	xx+scurk0kLu02MCNMMwa7C8qdpoglOPpydzjRvUl5xkT/pS81Z616nFe0+KoUuj
	mO4OQg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2c2fyd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 19 Dec 2025 11:33:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b196719e0fso48084385a.2
        for <ath12k@lists.infradead.org>; Fri, 19 Dec 2025 03:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766144021; x=1766748821; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fMdx0pQw++OdmVRdKAe5y5wrvzemap1JR50aCfUHmCw=;
        b=knA1dVe7WyuKel2IM0jcYOAnRno9tNrNAefBJrthqFJEeQ55MEi4TCKMAMSnLJ3SZt
         tfQFLyTVnKv6TzqwRHpVCpy4mcgGvBj3EbfySF8LBtxyXcYAglBiiKaDBXKJ1jAG32Ky
         uNCIVPo0AY6ETBz0ankCnoGtinnhdCkGF4kOM/451M/OwpIKiFYiFCa9hrI1390h1BUF
         ohCJhUy4KoYn+C68gTa86FgY6yXojM0NGGLxX/ibgcmJOKrPTV/xVCwGZL/M56zRXWte
         PRmix44+trb5SM7pbn02UukBmzwE05+6zAGKX5EL2JJb9pBWHEtevvprHKbHThq5oz8p
         EWpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766144021; x=1766748821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fMdx0pQw++OdmVRdKAe5y5wrvzemap1JR50aCfUHmCw=;
        b=ZXb44C2dWS0e8IfMI5rAG7rwo05WIquqjD/Rasf1R/vXpziDbOzwooOPNjl0tSr97N
         Dwvzy6R+vqbnJfx9FaekMl6j+ee9k/dZy4jnSMmRf5XCxi0Ipmz0pOlRMV6Fz8l6TUmR
         UKQxd7a0O4AugoQepkQ+YuFnPF5Oc36cZmhojMrAupSdarcMmQ0tB7uF1Vvl3tiq/MB9
         cMek7LR5ksJOXKadBB28i4p0s3bqbcv2iDUl1gF2B/JRd1cmCKIhXOaLTrDsyD2B9Q/r
         dwfcFoFMJheaU7//eRB8ww4vRaafgc7KMRN7gQhtH4swz7+iBI+da99rrqilzeZdWndm
         DRpA==
X-Forwarded-Encrypted: i=1; AJvYcCV9oNg3yVh0BvfQHIpJLTLDr2DBVu51OY6xzOgQi6tgg/2UKikpSX3xRsIXGMCICcVLoQTkNmE=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywag+9VBLbS8TTAiNeHNt1R7p3mfNUMJSIFbBNAnUJ/AcyfOtsi
	HmzrOXDK9cH41uGEVg2Nk3+xIZynoG/ILSIsGz1Lb1OFdha6V4/gTB1vhgx3Uo1ofyq7MvZ5Dcz
	EucS9BXELQblVuMYr43JjVNHSUpvzZf7h60MAyqfbhlAW3ZeGPU+PRb5fI9KQRl/p
X-Gm-Gg: AY/fxX4EdUJYXuNln23/qo0aVZky3enNJycCvFljBXaLkj7PgiZmUMDDHl6z15syVqh
	RQ6id1ecGLVG4oKUUiX5VAUFPLLZW7eAnWEUyWyx2Pn6i3S41LsBlrDUPZkX6ALFw+egA3pZpyG
	nQHJQ7yEGG9OWpsHOkfnczp5jIw6kpy+WQPVdU49/M/Peys8Brc2iB3DCci9O6RNWYDTKl6YoHJ
	mTZi5Nixa3ZemWGzju6N0JrGwbYLcuwtlQBFwDrsngJWiwmOm+qMjptLrbAj640er2AbNPstQKf
	SDKYT620ZME9RrlRY/3J2hw8oYoFB1f+T3SHLuEcrBurSzxMNFY+HO1L6RZacwqi+twTWixUjDU
	D17EObmg1xTOyWNuwo3FD9VE0SVMPeogkRqryAnOcAUstHX5U6LcFcXpvpAdiWbsEUQ==
X-Received: by 2002:ac8:7c49:0:b0:4ee:1a3:2e79 with SMTP id d75a77b69052e-4f4abddcae9mr23007281cf.8.1766144021169;
        Fri, 19 Dec 2025 03:33:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFxqo/hY71IEBjcEElYEuPuhI0i/EacL5t30/TgMJPWqpmemlVJCS5TEqzKfvpqnuLoUyc/eg==
X-Received: by 2002:ac8:7c49:0:b0:4ee:1a3:2e79 with SMTP id d75a77b69052e-4f4abddcae9mr23007011cf.8.1766144020662;
        Fri, 19 Dec 2025 03:33:40 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0b12dsm207708366b.48.2025.12.19.03.33.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 03:33:40 -0800 (PST)
Message-ID: <864b2dd7-aaea-418b-baf1-a0d1b452cf95@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 12:33:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-bindings: arm: qcom: Document Microsoft Surface
 Pro 11
To: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        ath12k@lists.infradead.org, Dale Whinham <daleyo@gmail.com>
References: <20251218-surface-sp11-for-next-v3-0-875afc7bd3b7@gmail.com>
 <20251218-surface-sp11-for-next-v3-1-875afc7bd3b7@gmail.com>
 <438a352e-5174-4361-b6e5-6ff5fe1ce0c0@oss.qualcomm.com>
 <CA+kEDGE42HhaWZy1o9DjpwcjPiJcqvq52o-_g+auOkp26ukULg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CA+kEDGE42HhaWZy1o9DjpwcjPiJcqvq52o-_g+auOkp26ukULg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA5NSBTYWx0ZWRfX/Ey/cB6c5dnK
 ijk0jUcEMKDzhBmt0PDuwRML6S9yJBNG9Zeb3FhmiOFxHipU4mV7Rv8pZwiMpuu9h8x2YZJ5111
 z+IIy4uW2Y4yhuvkvPPIy/ViiNutdYvsZz0eenOEistH4n6a+oAbRgNFfDFtB8ktfagzKIrLloq
 Y5r4BpMk9G02TqElRF7UkG6mg0v+CDQ9aLFna9S3+IImffwGCaKD1PRaNzyozIz1qxIiDBXV7I6
 cH/jrIfvsRzeXTLmmnISYtbSi4wMSl85XmEY1WBVMZIITfBTkEFVb1YvhSx0UDjkGB4aEYglJfi
 SZVlYQSixC3I2j+T32ELdeXg/iw+ur1O22RQFca+9Ahb+SgR7r/1qUURAFZCPNFpHr3/IMcg6wy
 nfwTzaXqI+8pJdUR25A4utzgMwdjbByRZzPbJ4fXCAffnqrMEoGaXyHVMQXnT7T6OmQukMP2xmN
 XfZZDHcnV/3JA6sE/1A==
X-Authority-Analysis: v=2.4 cv=dOmrWeZb c=1 sm=1 tr=0 ts=69453816 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=F5t3yZrAjdDg94tw__kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: cMdyLYUXsC3xoqKI1M8gEpd4hHBicQ5j
X-Proofpoint-GUID: cMdyLYUXsC3xoqKI1M8gEpd4hHBicQ5j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_033343_314234_51E8EF1C 
X-CRM114-Status: GOOD (  14.81  )
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

On 12/18/25 5:35 PM, Jérôme de Bretagne wrote:
> Le jeu. 18 déc. 2025 à 15:15, Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> a écrit :
>>
>> On 12/18/25 12:56 AM, Jérôme de Bretagne via B4 Relay wrote:
>>> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
>>>
>>> Add the compatibles for the Qualcomm-based Microsoft Surface Pro 11,
>>> using its Denali codename.
>>>
>>> The LCD models are using the Qualcomm Snapdragon X1 Plus (X1P64100),
>>> the OLED ones are using the Qualcomm Snapdragon X1 Elite (X1E80100).
>>>
>>> Due to the difference in how the built-in panel is being handled
>>> between the OLED variant and LCD one, it is required to have two
>>> separate DTBs, so document the compatible string for both variants.
>>>
>>> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
>>> ---
>>>  Documentation/devicetree/bindings/arm/qcom.yaml | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>>> index d84bd3bca2010508a8225b9549d8c634efa06531..7c99bc0d3aae3dc6e9c08fef0a535e114a3297a8 100644
>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>>> @@ -1067,6 +1067,14 @@ properties:
>>>            - const: qcom,x1e78100
>>>            - const: qcom,x1e80100
>>>
>>> +      - items:
>>> +          - enum:
>>> +              - microsoft,denali-lcd
>>> +              - microsoft,denali-oled
>>> +          - const: microsoft,denali
>>> +          - const: qcom,x1p64100
>>> +          - const: qcom,x1e80100
>>
>> As the bot pointed out, this is valid, but not what you want:
>>
>> This expects
>>
>> "microsoft,denali-(lcd/oled)", "microsoft,denali", "qcom,x1p64100",
>> "qcom,x1e80100"
>>
>> whereas you're looking for 2 entries:
>>
>> - items:
>>         const: microsoft,denali-lcd
>>         const: microsoft,denali
>>         const: qcom,x1p64100
>>         const: qcom,x1e80100
>>
>> - items:
>>         const: microsoft,denali-oled
>>         const: microsoft,denali
>>         const: qcom,x1e80100
> 
> I was trying to group the 2 variants together, as they are very much
> related. Your description captures the 2 variants way more precisely,
> I will switch to 2 distinct entries in v4.

Unfortunately, in math terms, this is a:

ab + ac + bc

situation, as in you see there's a lot of repetition, but there's no way
to find a common neat factor for every entry

Konrad


