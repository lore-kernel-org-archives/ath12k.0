Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA495E6748D
	for <ath12k@archiver.kernel.org>; Mon, 22 Dec 2025 10:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eLH0Cwx0fLQzNEAsVMMYq1in/gcvYRl8pE9l3eEnT3k=; b=lVbET6r+cXXE7B0akJQZh2QcHs
	a8cj3T5sellgRcYQ0OXGkLG2O/KISKcwr6nPKv2Gn1oRbGp4zhBk4xDrk8YmLbjqQi4xgpHuHvff9
	bMzLMEO9iknyHP2hMQBrbqduOuVZ63e3oXvxhiFQsiddf9rEonb9yzKpVTpY4cEIG1GksBMymoNeC
	ovhFKse5g/ruyWYrsUNhg+a7g6NXwc1rqWM7TFWntUeLRdH3nFQqAQCHbBwMnCLZNFTACygDxwUtM
	YLZN5+TTUhJle1mTKcDrVXFTBZUxNzBnI6ehK/WoyNzRoo5NLxdkGZqhBMmfArlkK6Q7URDUE8t8d
	mhwi4AKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXcog-0000000Db2e-1yn8;
	Mon, 22 Dec 2025 10:07:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXcod-0000000Db26-0KDI
	for ath12k@lists.infradead.org;
	Mon, 22 Dec 2025 10:07:00 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM7rsed3678875
	for <ath12k@lists.infradead.org>; Mon, 22 Dec 2025 10:06:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eLH0Cwx0fLQzNEAsVMMYq1in/gcvYRl8pE9l3eEnT3k=; b=nDAeELZt/Xho53gA
	oIpCz+T9h+MsDfXtR2O7C2UwnwBKegBOQRhvJ4aFlI3eAt4Q1cp5WjhVkAa4V1DB
	QFRETDtzI+hT2RHRMgQdzHvv4G+lV4qP3isBmC66w6xHjiKIZW+DA5YzdibERNdr
	18DPzHxLnZPWGHqw/KW7Sm8y12sY7Qqu+WZEbjJIwmz/hRPAgTV1zRky9dYHNjVn
	fs8ZW79ESAxWRzVxi9/ePjm/cBUQh3P7ZbML5KykucXwaWtcFLWk8GISlVc8BVvr
	nqHvitFh0XCS051cfEQpxH1JYqiV1PfzxC6bK2tqBbtBwwb1IAAAIDEak1i7THgJ
	VPnNxw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mrtcm7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 22 Dec 2025 10:06:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1e17aa706so20791791cf.2
        for <ath12k@lists.infradead.org>; Mon, 22 Dec 2025 02:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766398017; x=1767002817; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eLH0Cwx0fLQzNEAsVMMYq1in/gcvYRl8pE9l3eEnT3k=;
        b=AXxoLlzwKbw8Wl9duzDHxeBctuNf/PXeKOdVn9SYlXCYSx5TG/CBqMlttf0G7TXY/b
         7OWfAirwjFB30fm7I0eLmavieKo2ADmiGEoYQPXbD2W14BlGJ0BDVUfkNATOl2xkNj7q
         3kR6s5FboD+XhTvF/E1z43FIpdhpA8musxD919Xlv/oIXnBA6GM6kjVthPhvUU/ExDj0
         WnebPLgkoWqp9cyyuKi2LIWfl9d0/suZRgr1Ayx8LryH096ECSN2qnugHnvFjmAKTQX/
         Bxj2r2Odsg4lLC+6J9Q+CZFDEceivOWlQB5pZDj7mzSubgOibflSbS6yASKjthaN3+nt
         8dow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766398017; x=1767002817;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eLH0Cwx0fLQzNEAsVMMYq1in/gcvYRl8pE9l3eEnT3k=;
        b=lROh5W91FkwXwXCn2sq+doCm8xOPpoMQS3Mx6fylMeYvQj3/i1vAxxYiEgAKN2Qr/8
         zqAqF9/m+leF40wxa3yRlRV47NnHy9XQ586wlftP4RZeTb6fRXnE6DoKHFa3y2NhZry1
         u9MIbKjxYMrl+OL/zV0h/qa1V0xnvodJO4QLy2kB5sL5Dq8t76OsJRYvUokk4dANaXb0
         xvg3RfwvekTC4iXTQGvJbA+amzdTkbfqsUW1NvgknVMUKF2TzsrzKHdsgCDfDiBR8ann
         DLeVgjGC3YxEJdqJymaJ//ZK9K+eoIFUcglK8vbT2F21Yl3IPDz7CCQwro684Phxl0Vc
         0kcA==
X-Forwarded-Encrypted: i=1; AJvYcCWm2gO0jFRhTEeIfouBJPHvIEti2ciw9KiFjI0BwvTKdkA8gUQV1Sz8MsiBmUy2mX25EBTS7RQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxYwTlMac1XP6qL0gGUFM3sYWqBKypjgMcsNkAc7sJJe6KfZwKD
	2U5rXgOEWB5vLKgt6AiGB0RE5vOdQ24Pfv2DUr5AKdI6XNeASUjnhKW4haxHVNKJHOQCzOGhwqf
	GHnjWIUd5RS+/B8VTsyDocW2MpEeQpqlHWq/EcPkbY+snQJPRE5nEhhyuTjxBGwmNe2Nqhr7L
X-Gm-Gg: AY/fxX7vqtm7wDilOq4348JsNkSzoiFPrBLElg2SaUqDmpb1wckDgREAKAVSNiNMwPy
	bzgG0Akh2OV80gc3Wo3pXVwB6e2KCT0ysOw7L4sT35212rBoEaygROFYzYjUrvGYKSTx10rg2Az
	gfzALuKUfVNHvkoCwXIWhvXOAhKnitz9eqiW80k2CG4DGlCtAR7jNrDZKjlsKx3GagDEnx8T1j3
	8IP87WF9daW/f8ZtvATu93lbtV78cIrXKibVJ1UK21xpVACQTe6EEZ2HUQzqEI4L+EP+1HPcLk2
	+e2V9GQtZ5XbhiOCqfmpPC2yB0RU/MnL5giszHoNFU6FZBLvO+cS/ltHpSS0oJlpIsT5ttsPrRg
	5c5c4Muolx1zme6V4diER5C23NP95NEGG5Ci2KUbrpWDSvqdj6k/5IvFlimfXhp80OQ==
X-Received: by 2002:ac8:7c49:0:b0:4ed:b409:ca27 with SMTP id d75a77b69052e-4f4abde36bemr116063481cf.10.1766398017311;
        Mon, 22 Dec 2025 02:06:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFxyQvKYEBEol+TNPmvXLeYZ8IGLq/Sg/PaYqaFgenlhw+GvGDmoHr1J4MKdbJ/Lxw9/oImXw==
X-Received: by 2002:ac8:7c49:0:b0:4ed:b409:ca27 with SMTP id d75a77b69052e-4f4abde36bemr116063321cf.10.1766398016797;
        Mon, 22 Dec 2025 02:06:56 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ab7f7bsm1037902666b.18.2025.12.22.02.06.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 02:06:56 -0800 (PST)
Message-ID: <d67e806a-900a-492e-86e5-661223811e73@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 11:06:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/7] dt-bindings: wireless: ieee80211: Add
 disable-rfkill property
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>
Cc: Bryan O'Donoghue <bod.linux@nxsw.ie>, jerome.debretagne@gmail.com,
        Bjorn Andersson <andersson@kernel.org>,
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
        ath12k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Dale Whinham <daleyo@gmail.com>
References: <20251220-surface-sp11-for-next-v5-0-16065bef8ef3@gmail.com>
 <M7kfFb5fz-WB43U_xCUwgxpmBJ4TNdp4jE6yFu6HmemIcDx5tXO6H4xnW_pEQz6DMkKm-3POdB9hIdB092zhGQ==@protonmail.internalid>
 <20251220-surface-sp11-for-next-v5-2-16065bef8ef3@gmail.com>
 <e0e9e690-c56e-4b56-90f9-2af46a7feaf3@nxsw.ie>
 <20251220-fervent-mamba-of-sunshine-f680a8@quoll>
 <elgdbinyzunhgxaqy432qzxb65qb6yuheiimwutxdtf6q6jjpc@dgcnk3bgwqij>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <elgdbinyzunhgxaqy432qzxb65qb6yuheiimwutxdtf6q6jjpc@dgcnk3bgwqij>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: pFqFxfHnSJk67ApaPeMOrmTxuoPnVw4L
X-Proofpoint-GUID: pFqFxfHnSJk67ApaPeMOrmTxuoPnVw4L
X-Authority-Analysis: v=2.4 cv=CeEFJbrl c=1 sm=1 tr=0 ts=69491842 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=UdmcajEFbZfdtKJosXMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5MSBTYWx0ZWRfX6f8m8nZ2PeYv
 k6Yq0MhD5KM2yOdwLye/WIskp05V/5N/xchgSj4TI++1EjElpJ/mJALJroWsZv8PLCkGvAiQ25X
 DhvpvTZS41EtILUNF+ngo6+Vi24zqSbtuMECrKsdgx1zVp/rTY40/B1lCQ8V0eQH9tSkEAsXELP
 PraQPOMqvQzsnglVFA0JutoToRBaSqI1hbJm70cvF3v2KIyJid4ZDos+h8Aduamyq2rN/2sXmaM
 ljGLensoAf5cCi+e14EtuKB/ktx0XDeFop3lqwWp3b0HwaPipTzwahAWBzi11dXtX1pE1Z5YGao
 v4GVu/RItUlKYabx+EFHXoe7sFNCvPATZtUC16EUgZ2L7XGuE9QBW+/Wmc3c5EG0hGAitC7q5Vg
 nQzuTviGi6l+OXqHFDtdH0679KyWjbRgWw1V85clgZ+SO1Gn545piJTSsNEW64jK/D9rj8oGRaA
 h5M9vUkbOm0XJZsEl3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_020659_124444_B8800F97 
X-CRM114-Status: GOOD (  19.36  )
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

On 12/20/25 5:05 PM, Dmitry Baryshkov wrote:
> On Sat, Dec 20, 2025 at 10:12:14AM +0100, Krzysztof Kozlowski wrote:
>> On Sat, Dec 20, 2025 at 06:04:00AM +0000, Bryan O'Donoghue wrote:
>>> On 20/12/2025 00:21, Jérôme de Bretagne via B4 Relay wrote:
>>>> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
>>>>
>>>> For some devices, Wi-Fi is entirely hard blocked by default making
>>>> the Wi-Fi radio unusable, except if rfkill is disabled as expected
>>>> on those models.
>>>>
>>>> Commit c6a7c0b09d5f ("wifi: ath12k: Add Support for enabling or
>>>> disabling specific features based on ACPI bitflag") added a way to
>>>> support features set via ACPI, including the DISABLE_RFKILL bit.
>>>>
>>>> Add a disable-rfkill property to expose the DISABLE_RFKILL bit
>>>> equivalent for devices described by a Devicetree instead of ACPI.
>>>>
>>>> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
>>>> ---
>>>>   Documentation/devicetree/bindings/net/wireless/ieee80211.yaml | 6 ++++++
>>>>   1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml b/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml
>>>> index d89f7a3f88a71d45d6f4ab2ae909eae09cbcaf9a..c10a4675640be947cd0b5eaec2c7ff367fd93945 100644
>>>> --- a/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml
>>>> +++ b/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml
>>>> @@ -29,6 +29,12 @@ properties:
>>>>         different 5 GHz subbands. Using them incorrectly could not work or
>>>>         decrease performance noticeably
>>>>
>>>> +  disable-rfkill:
>>>> +    type: boolean
>>>> +    description:
>>>> +      Disable rfkill for some devices on which Wi-Fi would be entirely hard
>>>> +      blocked by default otherwise
>>>> +
>>>>   additionalProperties: true
>>>>
>>>>   examples:
>>>>
>>>> --
>>>> 2.47.3
>>>>
>>>>
>>>>
>>>
>>> Is this really a hardware description though ?
>>>
>>> Its really more of a logical/functional description. It tells the runtime
>>> what todo, not what the hardware is.
>>>
>>> You could also have a list of quirks in ath12k for this or have a user-space
>>> utility look for the appropriate platform device string name and disable
>>> rfkill.
>>>
>>> I think this logic belongs in drivers/net/wireless/ath/ath12k/ triggering on
>>> a compat string.
>>
>> This is good point. Either this could be deducible from the compatible
>> or this should actually describe the hardware and whatever is there
>> wired/configured, not what OS should do.
> 
> One of the examples _might_ be broken-rfkill, e.g. if the chip expects
> to have the actual rfkill control from the EC, but the board doesn't
> provide one.

Hm, I haven't thought about the EC being involved previously. Maybe
+Maximilian would have an idea whether this could be a factor that we
simply haven't implemented yet in the SAM driver..

Konrad

