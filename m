Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F41CA0EEB
	for <ath12k@archiver.kernel.org>; Tue, 19 Aug 2025 11:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KlJCbxiJKbGRGD1t4zE54FkwtVH9D8pRHGO5Xqy7uKM=; b=jLmw5OvtkwPOp/bI36w//EF6YJ
	aZXrD+wpdBZ6j0Y9KSyPSYpGsC0V50kuCr8jIOV7rakDOTF5SncJ7NxTfSOSh+TYtpjvH7c30ckBT
	tQxqAwf3RjREgtmq7MSeBMf8uE5i02D3ytUFGkghX1jLggp2umvDfw+BICSOPVy17tmn2PjqG2HZq
	b11rr3uzTF/F1nCN+zbzaGiiYjec86WFE9cNQ1TINoKf+mcGa06XNJ9h5/tf+BIT5mMYOAxI+vPWr
	nmd2jJWw0I1Rgdiunf2wGfd4sRsyUOiUSBJRee6/5sgW/Rlel1jRUGN9D4mdO8FxTTWmHOKIm2h1x
	Dyipgeew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoKAk-0000000ADpE-3YhL;
	Tue, 19 Aug 2025 11:06:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoIX1-00000009wIM-2Q2Q
	for ath12k@lists.infradead.org;
	Tue, 19 Aug 2025 09:21:28 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90Z14018032
	for <ath12k@lists.infradead.org>; Tue, 19 Aug 2025 09:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KlJCbxiJKbGRGD1t4zE54FkwtVH9D8pRHGO5Xqy7uKM=; b=msrFK4RoFCZod9t3
	7BGSr8S3M5EYZoy33HZijMuv3jk15iuK6j6J/tL9GqczAX+mrNMPU3HNjo82QkVA
	5kb5QEKBktH+MEhc/YO3x7olZsRLoXTKpn7GVeJjyU3GQgFtln0Zd/I87sEZaW+n
	PetaRMHpwiniWjZiqiz2VHKpx7y7mtbPnBOtjifrAZUdiS1JdoS/837hMtX/LL7t
	EBDYCHyGx3K9dSpESgUbZpZnMPVeMZ+CF9/VSk2v52Ti5Qm3eNCd0071ujoENKwv
	zgCzimPJVHQtqfrk1LQtNYZLPrPtX7nUiBDtpluZLPvHkQub1iPSrnnnkSF6+7rg
	+jMZMQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhagywb3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 19 Aug 2025 09:21:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24458067fdeso62044655ad.1
        for <ath12k@lists.infradead.org>; Tue, 19 Aug 2025 02:21:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755595285; x=1756200085;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KlJCbxiJKbGRGD1t4zE54FkwtVH9D8pRHGO5Xqy7uKM=;
        b=b/QzCPDtpx/M6MDfsqEGbu60oOlsdWZwt9igzl9vu/iY3C5ungprNEfWNdMubXhLXr
         zfkcOIOHbL0/LV4sTYPACY7W22ABxTtL4qQA6G4Ou0EzJNugt4+Q4vRIt1r718T/w+cE
         oJHofrt7+cZqNXg/PO8cApPvkfH7IYYySs73bCaOaq5cE5RghACSrPvtw4FI+tK2+/q9
         yB8pAXHBta65y+sgQxnEO49+TpFuiBe4KhqMrTN9A7u9njnuQhcOUAO2VAWp/a+Wpv/3
         KZJfO3wgcZwkbf09tihIol+Wi3VTV02jVjUJaWniH+rsFV6hhIQjJPdVJgUO4k1p9idg
         ml8w==
X-Forwarded-Encrypted: i=1; AJvYcCWvH1OrwouAaweZS1+037xy54aczmIHZ6yM7oB7NfkzGYMxcOIuVg7t65G/qfJcT8D/6eo4l5c=@lists.infradead.org
X-Gm-Message-State: AOJu0YzGuf0k0FdFM/CpyB0ZXriEXzOLTEI9ny4z1NDg5le62T6F9GKK
	JDRRgqcoXIQHI8wNaSzTfjYl1kjHMRXFR8Y9nzVCgtANSWKdzPi3jbrNNjO3FWt6Jo54Op1cMty
	/LfjopOiiiZLNuarurv9DnVTIbAj9Bnv4rLaC43EsY3KLVQekvStLZzDFE/6hAuPz
X-Gm-Gg: ASbGncsgsaMc3KjwD9KMJqpGCQaM2f2uHmEGyJe1agoOsPWdTdJwM4tGcTZsHqEV7hZ
	E31X/ThZ7fznX21veAX+fyvhtl0frKk3ekKUSYKnexo9Kq7Uim8yRnaxKzmFnimz0lujwZ/q4gO
	3LR+AZUScSjMHBsvFGRWubjqKs/BrvjKXKqPKDXxoG0zFL2qlToMBh54uPD4+L8y1VcwLyNp5Mv
	X7lwTb8uxqXoiU4Unzeq3unOqtIDbq6hw+XdoMu4NiWlK8xW0FiMAwzabnurlx/B3iNKLwtVN5i
	8f8JD8mV8ogE6pMgfDn2wtNiZe2fkPi5aO/RODsbxQJOxq2+mYNuaS9NZUopCJGen4Cx/+SXxwg
	xhV/MNWj61Vgu
X-Received: by 2002:a17:903:4b47:b0:243:3fe:4294 with SMTP id d9443c01a7336-245e02d5107mr24136895ad.12.1755595284570;
        Tue, 19 Aug 2025 02:21:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3mirU7iAl50GXTUGoqZomYHrb0Rj52+kFhbDwTJbx+QjqCieMTG//px0XqTrubDvgQSl5UQ==
X-Received: by 2002:a17:903:4b47:b0:243:3fe:4294 with SMTP id d9443c01a7336-245e02d5107mr24136525ad.12.1755595284039;
        Tue, 19 Aug 2025 02:21:24 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.241.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446cadf96fsm103719455ad.41.2025.08.19.02.21.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 02:21:22 -0700 (PDT)
Message-ID: <0bd40ba8-5082-68f5-f458-b1417e0498c5@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 14:51:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: ath12k: REO status on PPC does not work
Content-Language: en-US
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <aJ7sDOoWmf4jLpjo@FUE-ALEWI-WINX>
 <d6f0b64f-1764-41cd-a7c5-fb34d034ace2@oss.qualcomm.com>
 <aKQg5vLUplzMUMlU@FUE-ALEWI-WINX>
 <ff8287fc-7122-42e7-b6ab-550576b5d599@oss.qualcomm.com>
 <aKQxcfbDYOWTa36J@FUE-ALEWI-WINX>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <aKQxcfbDYOWTa36J@FUE-ALEWI-WINX>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=D9xHKuRj c=1 sm=1 tr=0 ts=68a44215 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Rf9vIqvc/XsATUXPJpzL2g==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=PnzfZYhc_8HIFXI2AzwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: jx-3M09427HmSxtenSf53piwpXZM7388
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyNCBTYWx0ZWRfX9oWTt3xJQLEv
 rdg8ITT5H1rKAap1PXH3tdOuocCNzb7fp++OFR5/26jamUiPhahgd2EWgLyCCFpYHg1kEEKLSCH
 iGJcVGf3VeLlA/FYWjNQPTPQRN2HpA7KKOiJxM74usSbXzG4GDRQuQm7Db+TJyzbYGYnRzpcCOc
 ZRKnwWbhGGpAGWf8qpXBO6JDYFm8fwLFGp0PQR4SJVBwyhgMPcL8KBV1urFWx/pwIHmBNUb+j4v
 VkDOlYhelFsl9ilHA0gHSCwXpLWhOIC5b6xxFX4rsa7aQkhZSF7HUy/cDIpHzFziOk/ByxgqCp1
 05kHTA0YCP3/u7uuD21ZTrVueqnLz37gRwgBwi7RA4H619oy72q9ySx+MWqsyeETMgR/4OVoS/M
 +g3w0rS6
X-Proofpoint-GUID: jx-3M09427HmSxtenSf53piwpXZM7388
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_022127_736276_ECB04D82 
X-CRM114-Status: GOOD (  28.57  )
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



On 8/19/2025 1:40 PM, Alexander Wilhelm wrote:
> Am Tue, Aug 19, 2025 at 03:26:34PM +0800 schrieb Baochen Qiang:
>>
>>
>> On 8/19/2025 2:59 PM, Alexander Wilhelm wrote:
>>> Am Tue, Aug 19, 2025 at 02:38:38PM +0800 schrieb Baochen Qiang:
>>>>
>>>>
>>>> On 8/15/2025 4:13 PM, Alexander Wilhelm wrote:
>>>>> Hello devs,
>>>>>
>>>>> I'm currently working on getting the 'ath12k' driver running on a big endian
>>>>> PowerPC platform and have encountered the following issue.
>>>>>
>>>>> In the function 'ath12k_dp_rx_process_reo_status', the REO status is determined
>>>>> by inspecting memory that the hardware has previously written via DMA.
>>>>> Specifically, during the call to 'ath12k_hal_srng_access_begin', the driver
>>>>> reads the value of 'hp_addr' for the destination ring (in my case, always with
>>>>> ID 21). On the big endian platform, this value is consistently 0, which prevents
>>>>> the REO status from being updated.
>>>>
>>>> This does not seem an endian issue to me, because either of them we should get a value
>>>> other than 0.
>>>
>>> Really? I always assumed the value remains 0 until the firmware writes something
>>> to memory and moves the head pointer of the SRNG ring buffer. By the way, I've
>>
>> correct!
>>
>>> already implemented the missing endianness conversions for reading from and
>>> writing to ring buffer pointers like this one:
>>>
>>>      hp = le32_to_cpu(*srng->u.dst_ring.hp_addr);
>>
>> I was actually meaning that, when hp get updated by firmware, either with or without
>> le32_to_cpu conversion, we should get a value other than 0.
>>
>> So in your cause I am suspecting that hardware/firmware has never sent any REO status to
>> host.
> 
> Yes, I see it the same way.
> 
>>>>> Interestingly, DMA read/write accesses work fine for other rings, just not for
>>>>> this one. What makes the REO status ring so special? I couldn’t find anything in
>>>>> the initialization routine that would explain the difference.
>>>>>
>>>>> Could anyone give me a hint on what I should be looking for?
>>>>>
>>>>>
>>>> What hardware are you using? WCN7850 or QCN9274?
>>>
>>> I'm using QCN9274-based dualmac modules.
>>
>> sure
>>
>>>>
>>> Best regards
>>> Alexander Wilhelm
>>
>> so did you see any obvious issue?
> 
> For example, in the function 'ath12k_dp_rx_peer_tid_delete', the function
> 'ath12k_dp_reo_cmd_send' is called, which in turn registers the function
> 'ath12k_dp_rx_tid_del_func' as a callback. On PowerPC, this callback function is
> never invoked, which eventually leads to the following error:
> 
>      ath12k_pci 0002:01:00.0: failed to send HAL_REO_CMD_UPDATE_RX_QUEUE cmd, tid 15 (-105)
>      ath12k_pci 0002:01:00.0: failed to update rx tid queue, tid 0 (-105)
>      ath12k_pci 0002:01:00.0: failed to update reo for rx tid 0
>      ath12k_pci 0002:01:00.0: failed to setup rx tid -105
>      ath12k_pci 0002:01:00.0: pdev idx 0 unable to perform ampdu action 0 ret -105
> 
> My investigations have shown that a cache flush is supposed to happen at some
> point, e.g. after a timeout or when a threshold of 64 is reached. Since this
> does not happen, I encounter errors after the 127th 'cmd_num'. This callback
> function should actually be called from the 'reo_cmd_list' within the function
> 'ath12k_dp_rx_process_reo_status'. However, this does not happen because the
> pointer is always 0.
> 
> I hope I was able to explain clearly what I was able to trace. Please correct me
> if any of my assumptions are wrong.

Your understanding is mostly correct. it is also possible that there may be something
missing in REO_CMD ring (setup and cmd_send) which shows symptom like this in
REO_STATUS ring processing. If other src and dst rings are working fine,
REO_CMD/STATUS rings also are expected to work. Pls check src and dst ring
setup path once again.

Vasanth

