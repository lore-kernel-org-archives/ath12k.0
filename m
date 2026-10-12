Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D03CA9ED5
	for <ath12k@archiver.kernel.org>; Mon, 12 Oct 2026 06:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+UcS8DdSjOk8FBpL85zZqOzwaOXP+zI2mFu8qLHfSew=; b=FDvSZCpJC4o8SCJaON7PmPsK3b
	CaaOARo67Dpn6xVkirz81sNnDZ1Y2UQ/xp1zTZorKay7l4nvugUO5YlKTu8KdLsOGxlGzaKYSzYRi
	AJLpm1ksrEN3uMZUgFQQ7Qmr3OdkUN30bw0b33jSxOblcHPaGvHphJR4k8WHqFe42emsBN2jkTNhn
	mk6YSK88r2s0i34qxeNZpH4GnQar1LMlZCOMJy78ohOj7hRylMl6yakOUpwCaaf/CwDcl8CWhAr7h
	c/V37X4sO6tbr2SOPv04ePsG8qduxU6hWaY5mZ8BkYqyQ1PTYn7F+Ew8emTyZNu+hrbL0fRprBnNW
	DDonnnWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9kn-00000009lBV-449Q;
	Mon, 12 Oct 2026 06:43:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9km-00000009lAw-0wz6
	for ath12k@lists.infradead.org;
	Mon, 12 Oct 2026 06:43:21 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55hY62355038
	for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 06:43:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+UcS8DdSjOk8FBpL85zZqOzwaOXP+zI2mFu8qLHfSew=; b=ZZEsZ+4RcASTU7zJ
	JR5BjNX/RaPONI/1+vWFAdzS1CZXbuC4b4A7F64kk9wigiQ595s0+Md/U73FPeuu
	aYCOxQWFU1C47Mh+s34BawqciZlcf9jB1HETVYYNgtn4kjzHn6qq2L7OCksW9TgL
	ZbywMfk+8UP6S2guG25NArOiEkwxCFF8E8QEQV+pOIswXcghVMKMYTl0wFdeIL8g
	mGZ4S1QpnvihwVT/Bee5S18EfZacEi0mRLyuzMdTrsMnvwUksBAyfeM6qLv7FPtn
	f1qnMaDHTmna/9P4Bqi1qSB+yAvJIw9hYoTpGuDXE8YF0KBhfmzLiO+17z6UPyJf
	xZNtGw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7casdc0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 06:43:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e80ef3e0a3so25037395ad.3
        for <ath12k@lists.infradead.org>; Sun, 11 Oct 2026 23:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791787398; x=1792392198; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+UcS8DdSjOk8FBpL85zZqOzwaOXP+zI2mFu8qLHfSew=;
        b=ZhUhP6z8zV/l9jjY4f/vyPWAYvPgs4jGAqPDt2wDdV74OYcLPQLXf/jTz7JRkIeidK
         Kregy+jC9R/S3g4b0DfmWk+NtT4g8hp0zdZJqZcr44SYNrhK3IO7G2OzAgPtq3p713Tc
         Fnnkl5FDSAcAz4l4UQPwJr9zx2/luhSNCMtTuW4nSO1Zc9wBFYFns2nVxbz1bBKiW/U9
         V1/dE7Fs79gwO7vz5WKi3XJ+VJAZFupawGdf0ELjFqsyX6Uyj9mf3vVXNJtbtGT7ryjR
         QZfmSdu7DhkBf0jGP92KB5v+31vcRbb6WJfjeN5CyRrd/GFXhhul8ao7T5AE/gW2rKug
         /E8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791787398; x=1792392198;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+UcS8DdSjOk8FBpL85zZqOzwaOXP+zI2mFu8qLHfSew=;
        b=EAHSxJpdLSBGzk4ZBoM7tyJ8s1TV5x+feN01iXD4Y67PHSQveJ+NziVyDSo1tjEVty
         7CvFKXniQhP5B1gwM5esr+Dl+WIs6jiAarE0TOQrClK+hOsghUjcHJ3qE8j2exRsF/QY
         faWkiDkqHv0hYWe0SH4SjLqQ5mPOxKqPopCKzcYLfxVROBcefyh7JXQGQyq3m9wY4D+D
         nofogBJfBkXwvJHuGQQVYAzYs3Rm5cfxa37vJsu0D6gBesccJH9SHB663sREFnGRRY1l
         BwcNTrvcRdyFGbZyzV2gmtSVwhQtC8rw98KkIyWYapO9m5C5d+gqDeTrrt2WVQm9FGqZ
         HtTg==
X-Forwarded-Encrypted: i=1; AKwUvBzLNSM907lTIGj1QsmOxjOHeuyt9gsLi0dLtf4R5sySLU6BXUYeCmcgc7W2TUcWLQVV+XuwRuU=@lists.infradead.org
X-Gm-Message-State: AFq9FYLSgUv6wUrIrnxjUZtxCXVCS7n8i2OhAwIb9kXGPBqrZyrXecOZ
	GYVJVbUpPpeEBzyAKTVNBAoOaCfbQLGTOCsiCmAlVSvexONg1kBFaUTwqxAzF+lRT3uEzjVRlA+
	SB/P7g3c40WjPZOq5OHPx/qaDtgJ5c+M4e6W88Rgayylmtm27sSs/1FGr037TR1vk
X-Gm-Gg: AYBFou0CXo7cJJkI4V/R++0aYZfDVQV5jJS0ZpzfprgRn/hQm0GIo+i/aJEM48S6wrr
	NwiH6wfdoBqjLh0dICfjSJN1/UPN20bWcUZbcrMgZGyaDrrx0GmBAmtXffSnLtWsuomh14EgHDb
	KNMFdSqhJ6nuM6rz0gDd/anjXu9FluZbmjVCgXg5auTazU1DIKTuoTHr18N+oBMSgF3fgTx353V
	FJkYbbKZBmXtqET203YP3NLYXXEcT5HiGKoJRoIQxJNzkPui0XmrmdBMQXw1Hj3Iq9pvgjAwQFJ
	ml6si8/EJKirFFHN5AEQWwCdd9LdkYz9qlaNyxhqPRAz4xxMVqq85z3jKIcN1t+KDTP8HfyGR3z
	/GRQizP67CiP8uc/6VmGxHgl6NSSBe8z0pg==
X-Received: by 2002:a17:902:ccc2:b0:2d9:2149:57c0 with SMTP id d9443c01a7336-2e842aaeb61mr76706905ad.22.1791787398044;
        Sun, 11 Oct 2026 23:43:18 -0700 (PDT)
X-Received: by 2002:a17:902:ccc2:b0:2d9:2149:57c0 with SMTP id d9443c01a7336-2e842aaeb61mr76706715ad.22.1791787397479;
        Sun, 11 Oct 2026 23:43:17 -0700 (PDT)
Received: from [10.152.193.243] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b0aa4sm38539625ad.35.2026.10.11.23.43.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 23:43:16 -0700 (PDT)
Message-ID: <3fc7d852-b36b-4d89-9e9e-fd690d258587@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 12:13:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 01/17] dt-bindings: net: wireless: Add QCN6432
 device tree binding documentation
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ath12k@lists.infradead.org
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
 <20261008-mpp_bringup-v1-1-2c5797b5e4ac@oss.qualcomm.com>
 <20261009-brainy-alpaca-of-focus-31fbbd@quoll>
 <fb81a042-82b5-4565-9a5c-1a3c038a0d14@oss.qualcomm.com>
 <8befec82-035d-40b6-a3b0-f1ff2ec9e53e@kernel.org>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <8befec82-035d-40b6-a3b0-f1ff2ec9e53e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfX53cWag3s0eXD
 09uE3pZXg1V8roPbteV7DaHwZXfD4ibJc52n2Bnhrl7W3F3Q93v1odGn9ga8TbiKjOXGA9b5N/R
 jbW31ImH6zGgRvfv2QLmFcCUmqPWGgk=
X-Proofpoint-ORIG-GUID: eregkHaUY8vCwCjdbpUl4eA0wOxRjo_s
X-Proofpoint-GUID: eregkHaUY8vCwCjdbpUl4eA0wOxRjo_s
X-Authority-Analysis: v=2.4 cv=eMWGH3p1 c=1 sm=1 tr=0 ts=6acc8186 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=iJS4XZidABw9b6rZcNIA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfX1+g3niyX0wLO
 LT/O9pUJ2UzImWhQZ83Lk4msRyMMCcZsByWPLcFLDasB6n09/H533iUWg6yffTy7b9uiqIWKHzW
 fAtbc1LrPltV5+T7NTE9kcncoi6lzwvF4M2gRUMYK3QqNlf6ihBMrBTVRols3igyhQHaMmU+2Q1
 2D76VLN2p/v0n6VcxJ2Q96DAHU1Z/t3F+2yYrEq+cbBavxdTg9KEHTejTTWV9UF/QCGAaA7zy8R
 e1vRXvI7DX3J/zci/Vz2pJ+w4fpH+yTGnq+wUUmNbBssX4pfAXR/RKwOhrbZ5OAIoyrSbqQX6D3
 qn4rAJ9QMbSVqzKE/rCN1ooicfyy9BAB94SfJYklNHRz7bwCRgtTWiU9wNPk/6IhLKRgngRc8g9
 iR2s5MYzg4VSur0JbhDI2r5T8KVrSu54AuabvozOA9xF8eSTWwJ3wBvT1zeeBBk9Zh99UwRqJ/b
 hNQXKZlIHD0a7jd7xow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_234320_289283_759F9942 
X-CRM114-Status: GOOD (  12.96  )
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



On 10/12/2026 11:26 AM, Krzysztof Kozlowski wrote:
> On 12/10/2026 07:29, Aaradhana Sahu wrote:
>>>> +  Qualcomm Technologies QCN6432 is an IEEE 802.11be Wi-Fi device
>>>> +  associated with the WCSS Q6 subsystem. The device is represented
>>>> +  as a platform device and uses MSI interrupts for its Copy Engine
>>>> +  (CE) and Data Path (DP) rings.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - qcom,qcn6432-wifi
>>>
>>> Is there qcn6432-something-else as well? Neither commit msg nor
>>> description explain that.
>>>
>>> Best regards,
>>> Krzysztof
>>>
>>
>> QCN6432 is a Wi-Fi device supported by the ath12k driver, and there are no
>> other variants requiring a separate compatible string.
>> Hence, qcom,qcn6432-wifi is used to identify this device.
> 
> Then it is qcom,qcn6432.
> 
> 
> Best regards,
> Krzysztof

Thanks for the clarification. I'll update it to qcom,qcn6432 in the next version.

