Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8025CC02198
	for <ath12k@archiver.kernel.org>; Wed,  5 Feb 2025 17:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HRC1vhtVhyB3PMgCoDL5JiSYTfGPZzjBdDKpqY5lzFs=; b=XTROngpT9Ml2rphjNpSBxFRyky
	wrfcsXV/tGH0PQ5UsIUsW6k3iK5PRvUZj/lW6x4jAIrosDQNnKfaY1oagZlwbDwVscrRX8lgTwulr
	uJYfUma3WN/EFpDyvi/SoiEn+qDdVPUyE/M4SHab7My63L276beHFBQcZXrc3pHCGQuGJXOiuQFwX
	i8DHnorW7j6wAISun3KXiDKOJxmZxOwqUGQwB2hqyt81nOqWLNdZ6a4UD6/kdep0OMCuJAhLBdbCZ
	NRi1HsXo6Tgf1Asjj1ul2fnuHG40HCJN7+8jO5IJTBTMm2rkxG7j4vzomgfruxpp2zAq3hEm6KdtX
	L/V2NN/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjZl-00000004AZR-19cN
	for ath12k@archiver.kernel.org;
	Wed, 05 Feb 2025 17:52:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjZi-00000004AY5-2zg1
	for ath12k@lists.infradead.org;
	Wed, 05 Feb 2025 17:52:36 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 515Ah8iB025274
	for <ath12k@lists.infradead.org>; Wed, 5 Feb 2025 17:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HRC1vhtVhyB3PMgCoDL5JiSYTfGPZzjBdDKpqY5lzFs=; b=afgJxHA/MGvf6vzi
	nl7/ptqLv35/AoB63bSDtJUIDwAy+SXXB2/pQAPXDvEL9NHyhknnIKBMCs2cb/NO
	9lghlxD+E1YdHDdlDT0KCbZcsEZACpTASbZN9wGI5mnAwsN/r3jjFVS0GSaLxOr/
	D2W2T9oBEVvuoRjGvwsOgwDjZxB6SKUldMpy1ZvlC1urLEoPhk5vcCJrwFz2cAEs
	jEN0vN8h5RNhgK8DtSMGdVC+j3kUDyKOpwGZBNto4LrNdAOSLGrYeDyfnm96n23g
	0PVg5c8/JEovTlEjhJKWrky9tfNcc51OYL2UMf++yjxUuot0XZDCnAjkX7nI0DUY
	gQEv5w==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44m6fqs2p3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 05 Feb 2025 17:52:32 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-6f987726f8bso521587b3.2
        for <ath12k@lists.infradead.org>; Wed, 05 Feb 2025 09:52:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738777952; x=1739382752;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HRC1vhtVhyB3PMgCoDL5JiSYTfGPZzjBdDKpqY5lzFs=;
        b=ri6ym4/E1+/VlX6j1HQ44la3264vyf154mHXglAZPDvXu4fiX8y9/zDp/NmUDCh9Ma
         jnw+0gL2K6eel4Jf9jvOebzZh8TY6Cp2/LbyxNsZtwXjnkakOYMmpNyAug/cxkrX0JD2
         WysmF7GUkKkom0s8iRyA2pqmX2f3Hg6DcDBt+MpIZzWggOUPNUZc58TO6DUXO1ajRzqt
         ufMoY7/JDdjMQSWhOo8iToxJAx4sYbh1ZMFNRKn4hFXoc1syIXtEL0fVW7OIow+1seNZ
         YBlLAXHT2qQ38zj/9rEtYMk6lVT5xzFu0cV/9NIZdPKqkipYg8WD1vXKDXhGmcJ7ii9g
         GWzg==
X-Forwarded-Encrypted: i=1; AJvYcCVwicG9xq6qCfovG9yOQJMxjc6KAwmTPBCjCvzbnjkQhDcoz3EqnQ0n2rSkxPUVBHbVPJr/4mA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy407rQ0BRV84uJhq78koD9x9CG3JbnvXSUpC2QBXnLg6ryg+uA
	j9hO4M7DZHJCagpvxsts8BjUT6RgqCx95XpbZFEIKZuHIXhX1HOswEail37/4RtdvlSj6ANGBfw
	bucNqtohl8Jhl28TbYnjaAUOxEAC1AZpZbj35eLzc7e+JkNnLwiFSxzlnhfdc
X-Gm-Gg: ASbGncvBBkvmFu5/ld5irEWEsVB3qnqd5FG/52/gBmKntlYMfiPXWLDMXqJbE8M83fv
	nBgLDQmud+rhLAhX24+CTxbSOHYsFsG37zrUBRQLIy0wwLOPpEPoST5gBGtN/6YRMbwdl1xgvC1
	NHUI3luCz5xbqPwcM1+SkGr2AnLqAbEQXaXN4yEtFGBLD6iKIQF/hw8GY2NjtEFpuuDnrlEtViK
	XzMyFBbWCmdl2ZsDwFeSE+8y13Yh4hn6NHrQ02eJSdipWe7+l+5eMyOR7tT1fFTMxXN44lBkahf
	7kpnKaij8JfA+DFcKvzvu/qMTfmMDJzgK7EgUBT7E7cN0EsDLTZhA5IjBdXUkx9veSA8oA==
X-Received: by 2002:a05:690c:6a03:b0:6ef:8c41:dee0 with SMTP id 00721157ae682-6f989ef9080mr39021457b3.20.1738777952242;
        Wed, 05 Feb 2025 09:52:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKD06DARGKWXQmYUVGJll8I/Kn+glXt6liGCBOXu1uORDrUPjFkQIate0mlx6BdjwIMWaojA==
X-Received: by 2002:a05:690c:6a03:b0:6ef:8c41:dee0 with SMTP id 00721157ae682-6f989ef9080mr39021227b3.20.1738777951821;
        Wed, 05 Feb 2025 09:52:31 -0800 (PST)
Received: from [192.168.69.158] (c-98-35-147-9.hsd1.ca.comcast.net. [98.35.147.9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f979b7f38esm8049107b3.42.2025.02.05.09.52.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 09:52:31 -0800 (PST)
Message-ID: <009d0777-8da1-4211-a510-a65e4274861f@oss.qualcomm.com>
Date: Wed, 5 Feb 2025 09:52:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] wifi: ath11k: pass tx arvif for MBSSID and EMA
 beacon generation
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
References: <20250203214448.1978156-1-aloka.dixit@oss.qualcomm.com>
 <20250203214448.1978156-3-aloka.dixit@oss.qualcomm.com>
 <db16febb-a58e-4a60-ab1a-212c30fb5313@oss.qualcomm.com>
 <a4809256-5806-4e1c-a12c-d5d2a6c0be44@oss.qualcomm.com>
 <15632e7a-fd47-4940-91d7-1b75d51ae43e@oss.qualcomm.com>
Content-Language: en-US
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
In-Reply-To: <15632e7a-fd47-4940-91d7-1b75d51ae43e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VyHMxXIyPWbY9IpTdWGPcVUSF10SjiXa
X-Proofpoint-ORIG-GUID: VyHMxXIyPWbY9IpTdWGPcVUSF10SjiXa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_06,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=725 lowpriorityscore=0
 adultscore=0 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502050137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_095234_876364_C34A9EAD 
X-CRM114-Status: GOOD (  13.02  )
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

On 2/4/2025 7:58 PM, Aditya Kumar Singh wrote:
> On 2/4/25 23:58, Aloka Dixit wrote:
>> On 2/3/2025 8:41 PM, Aditya Kumar Singh wrote:
>>> On 2/4/25 03:14, Aloka Dixit wrote:
>>>> Function ath11k_mac_setup_bcn_tmpl() retrieves tx_arvif only for
>>>> a sanity check and then calls ath11k_mac_setup_bcn_tmpl_mbssid()
>>>> or ath11k_mac_setup_bcn_tmpl_ema() both of which again retrieve
>>>> the same pointer. Instead store the pointer and pass it to the
>>>> latter two functions.
>>>>
>>>
>>> Same, Is this tested? Perhaps you forgot to add "Tested-on:" tag?
>>>
>>>> Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
>>>> ---
>>>
>>>
>>
>> No, only ath12k patches are tested hence no tag here for ath11k.
>> This patch doesn't change handling functionally and I confirmed that 
>> all places using 'tx_arvif' first do NULL check because the refactored 
>> function can return NULL. Functions ath11k_mac_setup_bcn_tmpl_mbssid() 
>> and ath11k_mac_setup_bcn_tmpl_ema() always receive a non-NULL value 
>> now because the caller ath11k_mac_setup_bcn_tmpl() sets 'tx_arvif = 
>> arvif' whenever applicable.
> 
> Okay so in that case "No functionality change. Compile tested only." 
> line should be there in commit text?
> 


Sure, let me know any other comments, will send all together in a new 
version.

