Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE9510A88E5
	for <ath12k@archiver.kernel.org>; Thu, 26 Mar 2026 16:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ivRwSoYNsF3FOsOUvHG4NMGM1jycxkCZy1o6iP0ba/8=; b=lSUfIvLiXxIc2lLsAepTQwjiCk
	AA5nBCd6Y0Yo6Ca9fQKIFyYZmzGUbfkjhhPOhy7a0iPZ25PYw3rj2N2czXOujDcd5DfPovr2s29zt
	KzCK8tlbSAIHm+McH7rmq9AJlmSr5sLcHLjsi67IXdRermweLAyLyKY8nMy9bLAQrlw2D0BcB5f9S
	aRv6gtHOT0vH73ARHJCeGmVa8olI/xBKcxEtD7g7HPk6BbENyvp8NvN4+xyTlJDYb15BEXKMBM61N
	CwEYgWIoIYPBugX7jhCjM3FjZjzV4c5jNGNPhiMAWlAi3Yxn3eh+UvIMnvQsq1CEOJLJ/cxD9Fczt
	hawUbSLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5nar-00000005rcQ-2HFl;
	Thu, 26 Mar 2026 16:30:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5nap-00000005rbm-2PD9
	for ath12k@lists.infradead.org;
	Thu, 26 Mar 2026 16:30:00 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QF9vF71088787
	for <ath12k@lists.infradead.org>; Thu, 26 Mar 2026 16:29:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ivRwSoYNsF3FOsOUvHG4NMGM1jycxkCZy1o6iP0ba/8=; b=MGfYBEHAf4todcyZ
	WzR2Cb2Mn9b8ichcoYEy6thoXQ2nvRDeH57/oWi3RoFp92lJc9zxHChZuPe4m+GG
	/l8nJFL1peXnu6+thRctV29R8bPUrzXxR3wmQsfd6ycKRiYmZwX+NWx0Uq51XDPn
	fzXHHGQ3Vpu8fuPrcmGXcOGOS3qqfMdK98sHcK4jnQr55ypQnVdvkaroxFV1XnDE
	L0lKBDOaMVcvN/roiVoQEXFPeX+EsgsRHOvmAEFEdQZ6c30cjTjHpBKQxhVxUiL+
	3mUvJqv5U5tggWk7l78Bu7yKHy0N4qX7HZQSGOzgkoUvaKK6IJMmtmf9/paWgWNN
	wWHh8w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4rcn3dqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Mar 2026 16:29:57 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c0bddb9196so748572eec.1
        for <ath12k@lists.infradead.org>; Thu, 26 Mar 2026 09:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774542597; x=1775147397; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ivRwSoYNsF3FOsOUvHG4NMGM1jycxkCZy1o6iP0ba/8=;
        b=VzwvGH0G91TgYGJX9A1dAcVcBU1TdvNLzMGsGMapXfWklN9ZPfLS2D0Q78SPYQgRX2
         E/UYhM55W0DHDWBZRGMEUUiUpVkvxrlSBgpIviXknX2TdRwzlXyT8sxbvzsFHRpc/Jdw
         oSZXM4XO0/9Qi8EEpp0KlA0UrnJxwlIeSeNFJq205CFnl7ITPZbEFVptF0ItFXxB2Ghc
         UicmuFMTFNTDM8zEgP1iK906zbjwJinDdxW0e/2ktennC+5HuLiPUX97Ud/9xn18ZRDf
         u9VwlQrvxiAhl/ToGra1Su31GYC3aVCfhCuJJAvHqPdYGO+3a5/fK4oTFowABRGYqht6
         +SFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774542597; x=1775147397;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ivRwSoYNsF3FOsOUvHG4NMGM1jycxkCZy1o6iP0ba/8=;
        b=AapMOdZ8jO7iDpyyZoCwZn0mfrcvm2AV8GKJyXFTHgNJdBO9rqiFyf/RKs8rm6+lL/
         /Jkbi++9znGWB7PoUTidV0yOzAR9hYfOG8vMds9tSpGJ2lYE5qC06LU9oBKfSMzev0Aq
         4QEebVfEyuFDVnObbcN42Ri8XBAii+QMibYsNZPPEFQPXLPyqlXnRswopRAlg8aIpbqZ
         ZRBL2a3bnaCzRFMFyyAgdMCOjsjDIHFZYiB/dz5LYQT1tl/9OplYLxpG4V+WfUg7kIlq
         7psumGh5N+na66nN0e2HhfvWfoiX7mf1MvihxFIein7hmeDBOhCgmmqHHEmon0/juE2T
         V/KQ==
X-Forwarded-Encrypted: i=1; AJvYcCUh0w0Nkbzmw2DKMLFVDIbOsyic9yukeydKQrLp2aGLkecXT5+Y6+X8///wLlGM+mlBhev2c74=@lists.infradead.org
X-Gm-Message-State: AOJu0YxF0q2M1mROj0yb569z2bWI4kQYbqBa0EvIfMNQI4+3pputaAiO
	Vt06HO06zx2whhANyIxKu9+/RGhtK5Vt6UDWo8D1bZcjjvYirVxHuSeN+YwSaBTLzcdS4yyma84
	4Ye/5zXR2z7R85TQ56RMGGlcjk+fslMAwfZzpWdXAvg87nbabV87A/hfhcotWgNLS
X-Gm-Gg: ATEYQzxtZtzXQGVQTneh0LK2049WOrRtCJ2CGF40DArS6ilhWkb3VXWVMddxznY9+p/
	SUmgVoGUCoJ+mC4GwHIw6jX8BpjoXpZFOBaQPWnF3yli0gZs7Q+bHx80FS8JDnWDNLvhQbQ9qyI
	XADzA21/DlXIrUJOIO/sre5cdriNgv5vHPUkXp8fL2rJ707fLcc3+ykXw09oHZQVLovP6A2NDzL
	3xWh0DloYDpfMEdZnaQZB43k1LcXpH//xkWt/wlsiau1fF/MkgzZ6u5tApm7yCggaJaUt0lHJNV
	ktO0hD7qtiSW1nS6ttWlsLLG4XH0gb5a2ctLsPKxpKN2gMVUhASshP0O+/JkwLHE8ZJ0uvHvs2Z
	3xz9/yMxIDjS/PRKUdaOkYSaqln5fLZlaKUhRr7jUwFu1RfBBXyuUX8kJZoeoA54Ln3U5ZoQRBJ
	Md5sIi8dAI+Ec5hQ==
X-Received: by 2002:a05:7301:d87:b0:2ba:85d6:e777 with SMTP id 5a478bee46e88-2c15d28a868mr4148429eec.2.1774542596663;
        Thu, 26 Mar 2026 09:29:56 -0700 (PDT)
X-Received: by 2002:a05:7301:d87:b0:2ba:85d6:e777 with SMTP id 5a478bee46e88-2c15d28a868mr4148413eec.2.1774542596116;
        Thu, 26 Mar 2026 09:29:56 -0700 (PDT)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ee01373sm2698500eec.26.2026.03.26.09.29.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 09:29:55 -0700 (PDT)
Message-ID: <9657272f-3a61-4880-91e4-e4ab5972896b@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 09:29:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4] wifi: ath12k: avoid dynamic alloc when
 parsing wmi tb
To: Nicolas Escande <nico.escande@gmail.com>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260317084740.3756880-1-nico.escande@gmail.com>
 <36c1cae8-d6c0-4432-bc8e-57216c5ea3fd@oss.qualcomm.com>
 <DH6U1JMUQXVM.287BFERLLK9KK@gmail.com>
 <40756be1-6a9a-4821-8c90-34f37db01e8b@oss.qualcomm.com>
 <ec266bec-c371-4ec8-a60f-21ebb810d38e@oss.qualcomm.com>
 <edf86c6a-fb09-4524-9b47-3061c3d6e68f@oss.qualcomm.com>
 <DHCKSTJAAL99.V5V5D17RLHD@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <DHCKSTJAAL99.V5V5D17RLHD@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vdr6/Vp9 c=1 sm=1 tr=0 ts=69c55f06 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=_jHX9szh96HkLwC8_6MA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: 2oYdoAP6j2dnnCR-nspUjs0eU_BOBO3t
X-Proofpoint-GUID: 2oYdoAP6j2dnnCR-nspUjs0eU_BOBO3t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDExNyBTYWx0ZWRfXxZP6DyM1eN+g
 gKdmsbsZ+KYk9Pb1oPxAxGJn+GiWxPCFvG03QFMf9sflGYDYmZb1ByD/9P4JWxkzUh25eyIR8o7
 gHYAGWJhA0EP77WL1It+ujy42khQfstMYn3TQRW8I3ZLfB/18MvcPerMcnmiCs/tDTzzWchYVgR
 +4qAakTC45xUboDW15/roLTGARqKFpiIn/zBAkytqvVCamzzCnf3OD7NsctOvvpqY89+SzsclKS
 +L8F8dYI7EQFAd9+eDuctEcruGPHtv7ywZcuOumfVnp+ZqdgSHsDfU+NX6daEfd1clj02wFU/1K
 O+MFchzWkG9vSUcGB22htSC1m4fJfBkw1a1q5JDgZWrQP9SEwBYxrscGra7/ZzK/oHk6pLTR0mU
 /xSzlAwkK4P/DTXrEA00NU99K1+xaIRizZxD5tqeymPrRem5agPz53lxI4OfL8ZUcnrRxGzFc1/
 sWRy19hvDktFrhVYXcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_092959_740166_E2CE8A2C 
X-CRM114-Status: GOOD (  22.24  )
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

On 3/26/2026 1:37 AM, Nicolas Escande wrote:
> On Tue Mar 24, 2026 at 5:55 PM CET, Jeff Johnson wrote:
>> On 3/23/2026 5:40 AM, Rameshkumar Sundaram wrote:
>>> On 3/19/2026 9:29 PM, Jeff Johnson wrote:
>>>> On 3/19/2026 7:35 AM, Nicolas Escande wrote:
>>>>> On Thu Mar 19, 2026 at 12:08 PM CET, Rameshkumar Sundaram wrote:
>>>>>> Or may be have this allocated on first device probe and free it on last
>>>>>> device deinit ?
>>>>>
>>>>> That seems even more involved. It would be easier to go back to the previous
>>>>> version and simply, alloc it once per ath12k_base
>>>>>
>>>>> What do you guys think ?
>>>>>
>>>>
>>>> Going back to that may be the better solution. It isn't nice that this current
>>>> solution may allocate memory when the driver isn't actually used. But I'll let
>>>> others on the team weigh in as well.
>>>>
>>>
>>> Yeah, allocating once per ath12k_base is definitely the simpler 
>>> ownership model.
>>> I was only wondering whether sharing it across devices might be worth a 
>>> look, since this is per-CPU scratch space and the table itself is fairly 
>>> large.
>>
>> The other alternative is to still have a single global allocation, but also
>> keep a reference count that starts at 0. when each ar starts it calls a single
>> api to alloc the memory and when it stops it calls another api to dealloc the
>> memory
>>
>> when the first ar starts and calls the alloc api, the refcount will be 0 so it
>> will allocate the memory and increment the refcount to 1. when any subsequent
>> ars start and call the alloc api, it will just increment the ref count. on
>> deinit each ar will call the dealloc api. this api will just decrement the
>> refcount until it reaches 0 at which time the memory is freed.
> 
> We can do that, but we'll need a lock to protect this shared ressource:
> 
>   - The clean way would mean adding yet another lock to protect this, but it
>     feels like there are already enough locks in ath12k.
>   - The other way would be to piggy back another existing one.
>      ath12k_hw_group_mutex would be a good candidate to be honest
> 
> What do you prefer ?

i prefer a separate lock for this use case.

leveraging one thing for a completely different use case leads to confusion.

/jeff

