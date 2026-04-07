Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528FFFB5190
	for <ath12k@archiver.kernel.org>; Tue,  7 Apr 2026 04:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1PBnRYiMHE9bP8gBrDCBrqQHKpcg5j89FyJ6YAHP68=; b=Nc4kwstcSH3ZH9MSa3m5yn+7jh
	Sw1FtX+gtZ9mewKgOE9yiGquqkCem4F3QS57aNMEHSfRe3oYoaIQE/WxEOawiskgtdoMOrPAxYDrX
	ET5hVQkovAtqyRW1DBuOP3fVkLQPF+edaNPCHvCJAiIswQTV7eaSxY4qNlEpmGKlj5pAkAxYNxPox
	KOkqIRrH4BfEZkU48O3djJm4dsDAkqb177rliKZ9/i5P52l3CA7zJXzUq09lhav3XVmlShUykci3e
	5G9W2qmji/0PeQih1Z6Xhen2+SLtTRYmsbJTwkHQ88imgHLnofvFTtjE2W7hcUeu65FKG2o9ODF8g
	wN5AR2Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9xl2-00000005ruu-2Y6G;
	Tue, 07 Apr 2026 04:09:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9xl0-00000005ruX-165D
	for ath12k@lists.infradead.org;
	Tue, 07 Apr 2026 04:09:43 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQU8l3537479
	for <ath12k@lists.infradead.org>; Tue, 7 Apr 2026 04:09:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U1PBnRYiMHE9bP8gBrDCBrqQHKpcg5j89FyJ6YAHP68=; b=DXodyB5GNWbqa7rI
	zquYJZH8hdIIYk2xGVEWCHzdnp04LITO+wtlwTFGUU8SAKoxHiHUMts6/E2pYd5p
	jswPG4d+duFtsrws98P7lr9w8xCpjqkXcyDkzZEhiHNyRFN0qRm7q/cAesOi9oU6
	DktKQJBSGGGQzaoWeiBPVV77/jLH9J/tkhCYNvZD4W9BXZXu1YszOj99rsBKfacy
	7Q7dS7t170TZOwTn07iyjfclkBvlmmrQjftPefcZeymxMPJhf/matEZ1mxpglF8Z
	shY64o+HgpPKPG0q+mGLwbIg6Jp8vd3ZW0p7IAy0svEJoA0c5O7gTsfVVeJsnoGK
	jiS/tg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmra0xxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 07 Apr 2026 04:09:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-358f058973fso5558500a91.1
        for <ath12k@lists.infradead.org>; Mon, 06 Apr 2026 21:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775534981; x=1776139781; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U1PBnRYiMHE9bP8gBrDCBrqQHKpcg5j89FyJ6YAHP68=;
        b=U4KYBj52DXSIcXzAl4B8GyfLsDN4t1WAU+Z38YnJxmzWUzo4eXwBTVCnSn+DDZUuQL
         17rw/8i2ogPGMvzzhFNsEvJCS3chC7YZ3uszz2eaKFZtIW9BNCeQZImgDglwKl/01vY/
         z/jw5yV/4Kw2838XGRRz7WPmPUR96Qtv63GVQDL9EyESSJnRo630Hee2GHESiAKK8yqx
         1Qse+ijdhwt/21EeCSgm0NVTSVxkAYWT6O5sboSsMU3yxoJOt4kuREdNlfjz63KBLNUV
         MpGtUzlorD1OlLF85e8nXnNbYAPqcJ2t7q5pdbchhnQqX1x8oGJDHMNQqXf7feNeq57T
         V/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775534981; x=1776139781;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U1PBnRYiMHE9bP8gBrDCBrqQHKpcg5j89FyJ6YAHP68=;
        b=ObiP9IOW/o0YHZYpebIaDZ64P1tO+376J6R/2kTyF7Rf7qilHxvy/2PJtm2A/rxKBu
         heEIZCaMc2hC4WVPbQR7WYLfBFnfCRCqqDTuSLN5syVFPNqVZv/RqXJj49IN2trRHmTf
         jQGXo4OZciPkk44iffowYqjQANQAfKBQtPnG2QPKvaAjf+0zFa2eXZQ3RKNpYRaj+izy
         T6onzp1Dh8HY1kAH0+qXZ4Dij3ewwZMzc3kimMP6qAYwGajdAhzCg8geC4hPnD67NW3h
         1DrollUcwaybSaC/mOHlm3pVT8eT0pwsAOTFCwb1bOUbjuJ56VfZK6IhP6jmhe79+RS/
         SuJg==
X-Forwarded-Encrypted: i=1; AJvYcCXvCALQFGN3dQHwvA0YWd63V3+urTPiDxZw+3qknomZxl6SjqNGDASwQ8SizZxaBBk4DEl7u+E=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8SRjFfltqTV2/VAnGP8eTHH9NxjhE3pXYDKrX/FnCpLmKuAAU
	f/D2+gDDhHQA12baO/LSOEHsfJHxGFw4Wq93hZlCNRqtQvRBxDwuDhcRw0tghvXoVm+5ucF5TQB
	y1DDH0csCUBAcPo6kjWcTk3m2TXa4+BMdVEYJ173qOG/H5Irp+YWUlXgvFX9N9UUe
X-Gm-Gg: AeBDies6xtw5OMd19AjZmfkkRKfxz++h2FEHwJIG8cGLoqLqlqae9EnKp89ij4TOPIY
	DGYeGrH8AUWBOBEeE4Lc7WERkWJiOaDmcPWzmtY4ezsMtSxN6RRbEuJiNiTl5kkJphE4XodnHbU
	po8XzmM551QR5AeXXhDoyG9N94NJ4+GeNlHQX5Qhyr/51Jir8NrknuWASdYzJR3VvGT60tb8lro
	knG7UeUSt6A1YOTdGLFWmLKB24JE6C+kgLjLBMjH3lZcXzPUHBbwuPdhZmSBE5t2J+Jttsmcrc7
	9Kb0ZRFAHBNDvJO8C+v2QF5nVJHDvHc5kWLT8BNY0UkPc0dTuJevdbdY/s7bsU34uWOHUEjxlKQ
	0KbFF/YNZa6LROS7wPGZKapMtuOyWBn5qwJVoRaCqgBAPlQd8Pw==
X-Received: by 2002:a05:6a20:9144:b0:39c:4af6:4309 with SMTP id adf61e73a8af0-39f2ee00378mr16706180637.12.1775534980705;
        Mon, 06 Apr 2026 21:09:40 -0700 (PDT)
X-Received: by 2002:a05:6a20:9144:b0:39c:4af6:4309 with SMTP id adf61e73a8af0-39f2ee00378mr16706057637.12.1775534978399;
        Mon, 06 Apr 2026 21:09:38 -0700 (PDT)
Received: from [10.152.196.198] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c659bedesm13411678a12.30.2026.04.06.21.09.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 21:09:38 -0700 (PDT)
Message-ID: <27cddc5f-888d-4f80-94dd-fb650f4985ea@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 09:39:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4 0/6] wifi: ath12k: Enable IPQ5424 AHB WiFi
 device
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>,
        Sowmiya Sree Elavalagan <sowmiya.elavalagan@oss.qualcomm.com>
References: <20260402-ath12k-ipq5424-v4-0-cd1e0f0a6c88@oss.qualcomm.com>
 <5a606f7d-6665-4b0c-bbbe-32538b2315b6@oss.qualcomm.com>
 <95face24-deaf-47c4-935d-0b48b5141371@kernel.org>
 <09fb6efd-646b-4d0d-a0f3-9f6ce4b38442@oss.qualcomm.com>
Content-Language: en-US
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
In-Reply-To: <09fb6efd-646b-4d0d-a0f3-9f6ce4b38442@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3ciBxtsCpgyReC7qv4OWPc-6Sa-O3qe_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDAzNiBTYWx0ZWRfX6Bb1KADTLCLs
 MH7MZlH3Rbu9gQkFXEFqpyRMIslFRnz7ANFQp1o3oPskGKlpZmpT044jBhjKeEZ2CSmp28HjPfN
 sXcu593oHK50AJzUIwGWfvSVuzBy9QbDwpgBNTfx7gL6zEfcyxXbnHdsPrkUB0e2lPPaKANxmfv
 OCi26mii5LBSKVE3XkhuenhUny89iYyJ4g5KsAnzqIZlV3E15/DzYx8RRWw1j8/DC8oKFOoF3Ev
 D5sPKSrI/c5rOLNziALcn5sJ1xKa+S2cIDHgoFGymUDZWVFEPd7cVjxi8ilkhFz/1VE+TmVRSiW
 k/ZkoVBCIk9eTLxifzYNQSHRg0RYeKPCC6GQXYgmVQrWgOLi8/2NNnmrwsKnwNC4WVUrG3+Axz/
 OM0DVt9jAyLokbDvxRWZe1vO4mcwHT7EnC9x/32ZYIKQQf1Yw1wRHnQTfMB1yMs26K5vpWizzrK
 a0EJD3aUKqSh1TVxo/w==
X-Authority-Analysis: v=2.4 cv=BKGDalQG c=1 sm=1 tr=0 ts=69d48385 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=1nfJcm5jcH8UclV2M8MA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 3ciBxtsCpgyReC7qv4OWPc-6Sa-O3qe_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_210942_325115_43F26054 
X-CRM114-Status: GOOD (  10.68  )
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

On 07-04-2026 07:53, Baochen Qiang wrote:
> 
> 
> On 4/4/2026 1:23 PM, Krzysztof Kozlowski wrote:
>> On 03/04/2026 11:13, Baochen Qiang wrote:
>>>>
>>>>   .../bindings/net/wireless/qcom,ipq5332-wifi.yaml   |  1 +
>>>>   drivers/net/wireless/ath/ath12k/ahb.c              | 36 +++++----
>>>>   drivers/net/wireless/ath/ath12k/ahb.h              |  1 +
>>>>   drivers/net/wireless/ath/ath12k/ce.h               | 13 ++-
>>>>   drivers/net/wireless/ath/ath12k/core.h             |  1 +
>>>>   drivers/net/wireless/ath/ath12k/wifi7/ahb.c        |  8 ++
>>>>   drivers/net/wireless/ath/ath12k/wifi7/hal.c        |  7 ++
>>>>   drivers/net/wireless/ath/ath12k/wifi7/hal.h        |  3 +
>>>>   .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    | 88 ++++++++++++++++++++
>>>>   .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |  1 +
>>>>   drivers/net/wireless/ath/ath12k/wifi7/hw.c         | 93 +++++++++++++++++++++-
>>>>   11 files changed, 231 insertions(+), 21 deletions(-)
>>>> ---
>>>> base-commit: 15551ababf6d4e857f2101366a0c3eaa86dd822c
>>>> change-id: 20260331-ath12k-ipq5424-cddb63a46a97
>>>>
>>>
>>> only nit in patch 2/6, so for patches 2-6/6:
>>>
>>> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
>>
>> It does not work like this. Replying to cover letter causes that all
>> patches will get it. Provide detailed review and response to each email
>> in such case.
> 
> Got it, thank you!

will address the nit in patch 2/6.
As intended in next version, will have your Reviewed-by tag for patches
2-6/6.

