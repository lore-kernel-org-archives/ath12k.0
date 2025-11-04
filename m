Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD21CCFA00
	for <ath12k@archiver.kernel.org>; Tue,  4 Nov 2025 10:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dnsHg7l7z3axrmeIt2jE59/8P+zW2SMfuQqPkc0ikz0=; b=yW8Mzn4m9mq3uXZApNVHaghDai
	Sx79RdLK4oIKvW4E7CJpO0q7ojfDTJQL1ZWqjQwVExCXw5gjWYC3kDTyj0jBAbDbETazp1vfcGgcb
	nNfcweeJo3EK+Rfmq/K2OwvYSSsuJK0DIG7wr1NmFOXbEFrYQCFAVhVlRB6vnCm5WUS+3MyWAs5XL
	AvRzFfGv/Kf+zcOzqyyqeL+prsO8dBPVkzHRB+e1FFcCQSi0NWw8FJql1It2yIn514SOBvLe4lC7A
	x+Yf3ZXQZTcuypzEzMqoJAh8TlCtLweDjsGpL6+rBZ7ZlgqUkm6qPdYyTiWyYtmy/AFaZtP0gsjZe
	IZ3x+nRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGDt4-0000000Ba1W-1LTo;
	Tue, 04 Nov 2025 10:03:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGDt1-0000000Ba0t-3udN
	for ath12k@lists.infradead.org;
	Tue, 04 Nov 2025 10:03:37 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A48gTwv1419463
	for <ath12k@lists.infradead.org>; Tue, 4 Nov 2025 10:03:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dnsHg7l7z3axrmeIt2jE59/8P+zW2SMfuQqPkc0ikz0=; b=LeGqwCZZ5ShC0529
	UiQg1OSdrOZHRMQUPWGQO+xi77gI31pWMJXAHeLI+TXLDM7mlOl/U01JgSTm9b9v
	6i7sWuv1/8ZGk7N6g4weCKuQQcEdJg9aa7FWZPsN3q5QYCXvv+K4/HrYKhiwNX1A
	O10EMUERs9JWIqV3DNlWAzXneEFzlin0Lx9w0uBeSE/LD49fYYTybq4jXok149iU
	NyZynKXBVH0z0l2mnMoA7GstrDzywy/P8Ti9f+7bpKD3Q3yD75piOYt88Dnwok6X
	ThWVFUnzULWRRY+Xb2AfT+ehWQYsLXMUJAdTP/YjtZDBMYOmDJhMTHI4ZiiVKP+q
	2qlv/w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70fhthje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Nov 2025 10:03:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3408686190eso9467285a91.3
        for <ath12k@lists.infradead.org>; Tue, 04 Nov 2025 02:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762250614; x=1762855414; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dnsHg7l7z3axrmeIt2jE59/8P+zW2SMfuQqPkc0ikz0=;
        b=V3kHAmEuLXihco3Cy5fZD5EaguIF3qC+9O9HdkcyyX1LdZSueh9Qhohfr7zmvQHv3A
         bLRFiL4SejWxs3rJbI8vSG1RuhYBBM+a0hf/0kKHUhznGfn4zxR3wKFKqLpvt3iMuaGW
         cJqwyMP8XIaLIYCj7TwTB29C4sLGEIQOIU6KMNqfyQmppk8RduY/dDUXJ4wIpg1Vhgye
         7t6jAyBp/MtrabJoU4MD31q0TI48XlUFzn04WZe5wg9ibdTb4H9KsurapgnMO8awjHN/
         5AZhkvb/C3TI+kFk2qnlU6DiTO+qQwtNqTm3XBKG45GYaSJsiH2mljiBVMPOGwQqNhaq
         Mlng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762250614; x=1762855414;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dnsHg7l7z3axrmeIt2jE59/8P+zW2SMfuQqPkc0ikz0=;
        b=JSLBb2C2RpTA6kwP+W1aJm8ghbpr+5GyKTjnyIp+ow6CjO7g8QYnINGqFBGfU4RhYV
         orwBCt/VCn292cHS5YDw3QIdClLBVK6li0H5AY8J3UZeDMAkVPA0o5bjh+U+oTEdXeSu
         0UMCAdoXN4fcPvmhZsLMqfYAK8z9Lq1vbLg5ZocXdaztRBsJlQQYa61dH5w5OIxfN1ar
         hcG2gkyqHrJyda+H8lW97ZgfdHJSvqCVCFTJ+e/7/rTRCX51dTRH04NKvt6+i7/4PMa6
         X+YCPKGt34NmU4oKATeYPSbtU1nQekWtmJ2yeuHDlEtjuXAoos9swtZfnKgWAF6aqRPH
         g7/Q==
X-Gm-Message-State: AOJu0Yzul83xqZTuvZbFly/EDpSTVwrDP4eNp1/nNh3x48ct70VoMfhg
	MSeS0NSEcgDFJbpCDVmvjbB1t+guJnYwzXdOHOaCk14Hfd6RMgQqQrLHNecmtIuKAmdEwlytiZL
	jDC09wRF+CmUSiqVkFs82t2LorJwOwsIfdJi3XMo/1GSoJfw7x/cvkK3e4ZSLNe9I
X-Gm-Gg: ASbGnct4xeurVzkDNLkeD5QL5SzheH7pvss7NNBDIKgdK6I/jMlTgt7kZuuc2e36I6N
	yF2Y5IK8SMmYN7bQNX4iStxCnDwESNj62swJISGyznyKaDJJKiFWZrZLbwZpNYel5w5m1HLJZqB
	1ce0amA+TPUYfzRUC3ugiAQtw5QifFwfxu6qiPMVixKTJfdd0zvV7tyCGjX1tp9uTswCZfRgXzE
	FmiwzCb/gGMM/lWJBiQGUOiki3HbEJhsI6UhnmRtAywwCHpExnQo8h11TTpJxmXFvIsKesgsclG
	kGKo2KPQErEVgW7ElEQcmtRX6bN9uHjCHuF1fdlfBkKHEoM4e+MzbwkYm1/CzFSN69jmheABdyM
	DKAGuyYUb8LfzQaAIygn9Qq18QEBgt4gS28RmWLHf
X-Received: by 2002:a17:90b:3504:b0:340:776d:f4ca with SMTP id 98e67ed59e1d1-3408308a99dmr21489973a91.26.1762250613900;
        Tue, 04 Nov 2025 02:03:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLU1b7XFdcUkAzLleqDxUjw0hBMJVxE2i1zl9Cml7kjB9Lu0pjsUx79FubwDh0FGlml25IvQ==
X-Received: by 2002:a17:90b:3504:b0:340:776d:f4ca with SMTP id 98e67ed59e1d1-3408308a99dmr21489943a91.26.1762250613364;
        Tue, 04 Nov 2025 02:03:33 -0800 (PST)
Received: from [10.152.203.89] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3415994181esm4052328a91.5.2025.11.04.02.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 02:03:32 -0800 (PST)
Message-ID: <14787410-a5ed-4370-9b04-7d57d322e27e@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 15:33:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [DESIGN RFC] Critical Update handling in the kernel
Content-Language: en-US
To: Ping-Ke Shih <pkshih@realtek.com>,
        Nicolas Escande <nico.escande@gmail.com>,
        "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>
Cc: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Ryder Lee <ryder.lee@mediatek.com>
References: <20250717045540.27208-1-aditya.kumar.singh@oss.qualcomm.com>
 <1a77ca6a35ad03f839b7c997de3977b521d88edc.camel@sipsolutions.net>
 <fce447412112421887a1a81f5ada850e@realtek.com>
 <e79d3239-d536-45c9-b081-09ea7ba5bb00@oss.qualcomm.com>
 <DD5A1KBRHCWZ.RXDUFTTTZU4J@gmail.com>
 <5f5e23e38544400895ed888ea824cdea@realtek.com>
From: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
In-Reply-To: <5f5e23e38544400895ed888ea824cdea@realtek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA4MiBTYWx0ZWRfX4GeV2yhM6+Ha
 5fnRdRMDCe87u0DSqt0CkKyqwyxtIK3JAOFX3XaZTRy8WBjHV3LpG3f+jmVDuUS8DPpdMxAu8tp
 KgNoCfe/3kSJR484p19JAgJ67roAG3Esc3cgW8Cje9Pa3ubAPvSujvEC8is/45TbE60HX44FvEk
 TFIFrpAEp/tHg6HvPHNyOTwGN2qtk+z1OKhnbrEXY9+va3NyXSzpbns88bvyodn5ah8xULSURLo
 2mx7vhzjq1032y7fEsi25zJWHZnBbmGllgdOLhnN/SL90ph+deVNRgdI5t8NVDpD/F+XlSNBFiF
 5MwXLk7aWFyEtagHe7aXukeZJ/f8h8NCnJsbMBW+/P/rbQHFcIpcFXHWUGZ8lBbv7CSRh2thDOq
 Bzbt6mY95u+Ryn6jNEbaqxu6Pib8Jg==
X-Proofpoint-ORIG-GUID: 4rqT8EORG5YHTMzcf6X5gHBMKHFYKqAf
X-Authority-Analysis: v=2.4 cv=CbsFJbrl c=1 sm=1 tr=0 ts=6909cf76 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=stkexhm8AAAA:8
 a=PUqyzkP4zcmw8mfgwKMA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=pIW3pCRaVxJDc-hWtpF8:22
X-Proofpoint-GUID: 4rqT8EORG5YHTMzcf6X5gHBMKHFYKqAf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_020336_014519_57502CF3 
X-CRM114-Status: GOOD (  21.40  )
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



On 10/3/2025 8:58 AM, Ping-Ke Shih wrote:
> Nicolas Escande <nico.escande@gmail.com> wrote:
>> On Thu Sep 4, 2025 at 4:24 PM CEST, Jeff Johnson wrote:
>>> On 7/24/2025 1:48 AM, Ping-Ke Shih wrote:
>>>> Johannes Berg <johannes@sipsolutions.net> wrote:
>>>>>> Before we move forward with implementation, we'd like to confirm whether
>>>>>> the proposed design looks sound. Are there any concerns or potential issues
>>>>>> we should be aware of?
>>>>>>
>>>>>> Out of curiosity, we're also interested in understanding how other vendors
>>>>>> are currently handling this feature in their downstream drivers. Is it
>>>>>> typically offloaded to firmware, or is the logic implemented in the kernel?
>>>>>> Just want to confirm whether all this will be used only by mac80211_hwsim
>>>>>> or will there be any actual users?
>>>>>
>>>>> I think Ping-Ke previously indicated that they were planning to do
>>>>> things host side? I'm not super familiar with the timing constraints
>>>>> though, so I'm not sure what that might imply.
>>>>
>>>> Yes, Realtek vendor driver handles the feature in host driver. Having not
>>>> tested CSA and ML procedure mentioned in this discussion thread, we
>>>> are also not sure how timing constraint to evaluate if we have to implement
>>>> the feature in firmware.
>>>
>>> Ping-Ke (and Johannes),
>>> Have you had a chance to review Aditya's August 21 follow-up?
>>>
>>> We'd like to move forward with our firmware-based approach (since that logic
>>> is already shipping in our OpenWrt-based systems). Perhaps Realtek can propose
>>> alternative host-based logic, and there can be a flag to select either
>>> host-based or firmware-based Critical Update handling?
>>>
>>> Thanks,
>>> /jeff
>>
>> Hey guys, any news on this one ? Seeing the ieee802.11 bn preliminary work done
>> by Johannes, reminded me that there are still some usefull parts of 802.11 be
>> that are not completely finished yet ...
>>
>> Thanks,
> 
> Sorry for the late. I checked with Realtek vendor driver, a cfg80211-based
> driver, which prepares CSA IE across links by driver, and send firmware
> beacon content with offset of countdown of CSA IE. Then firmware will countdown
> and inform driver when countdown becomes zero.
> 
> This info is still not very useful to decide where it should be implemented though.
> 
> 

Thanks all for your inputs and suggestions. After internal discussions, 
we have decided to proceed with the hostapd-based approach for updating 
beacons in the non-offloaded model. Once we have a basic working 
implementation of this design, we will share it for review.

Regards
Manish Dharanenthiran

