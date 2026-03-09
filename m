Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0840EFCA180
	for <ath12k@archiver.kernel.org>; Mon,  9 Mar 2026 20:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1W/57dKEbvgDKZIHUNPuGulUAs5FFvgypvGnAL2PC1A=; b=opk1l/04NjyBgtBWIJkGiij5zI
	bIrakp5YaBJUL03f9z9EAnq+tQT3L8w0le5DD0Djoafhm2ZgOWjFjttJNdSHCWwotzKLYw6bN3bEE
	MTMiDr/7MwYexMt0ATJ8AqvBuQTpDd1rv/IbSLwXDFpYvJVqByGb1CWhGs8Bp7V9yM/6GrCnkxsl0
	rwOF8Y3iUbC6+6bJrh4LUAqRyZ/ttLxj5jkxviBgvmpVsEhXBnWBNdnU3CYfazNgPp/C8Cxf6LBbl
	tNSLpccOsI93y3PwKDXDgwRfVzCy6QIPrMOm6qLI2RHirE3t03La4Uiom59ixWBv1O4bGN4YNN2w1
	Z7Ym6pOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzh1d-000000087B1-2Tcv;
	Mon, 09 Mar 2026 20:16:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzh1a-000000087AF-2lrV
	for ath12k@lists.infradead.org;
	Mon, 09 Mar 2026 20:16:23 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBxKU744350
	for <ath12k@lists.infradead.org>; Mon, 9 Mar 2026 20:16:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1W/57dKEbvgDKZIHUNPuGulUAs5FFvgypvGnAL2PC1A=; b=FO7NFjXvhIMGPNky
	Ww8/Y4kO7OhHvQ/q8aojfSNGaPq9hqZyVU6Ao1OcLETWDEK98oLH67QrEb+NJX1Z
	98et+HuSOPXaLObcZil6/dLZnpO0zTmJhjxvkzV0zbcJG7h8GVlxJRT8JthSfmbw
	qtMCgeHglUS0RXjm7GE9aUuYEzwXvDMtbCrWd5TlA2w0Oz5ZcSuuTN91AmppK52i
	BEbicUTY7Mv6PoLzzDKgu/BXDRGx7Uzlws9lJZsAtoGa8IacA6N1uQAZHmztvFCz
	c+QobiZm4+/tbBSaIU5aJY7lFmPVzHzWyVtjiTBVdyi2XZnk5Nvu7AdYAdpi0N+K
	LFf5gw==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsaabr5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 09 Mar 2026 20:16:21 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-67bacf5797aso27689163eaf.2
        for <ath12k@lists.infradead.org>; Mon, 09 Mar 2026 13:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773087381; x=1773692181; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1W/57dKEbvgDKZIHUNPuGulUAs5FFvgypvGnAL2PC1A=;
        b=d2aFlzw6sQW/hszQ/26bPnSP8VpVl2MsgqMfmKHr/c06TjSqLfBmOhpT9LHpMztgFg
         oAkRv7i7KyKv9Nu3xfc8uMCf3z4lYABPbCD9KkDnXlH4fiIYA8bZr6JjVfjEQNpR3h3K
         0l/ZxNLFJwAFz4cFDmNWK93HwFys1l3HKI5KOBvUFGEFifj8n9GBZFO7XllRXr1GnFLE
         lVPTwZd+ZpnlX6ZLSODd9ltMHugyVRw9wWo7CIjsnyIIYFbJlpLa/XAlzKcC+VhS6+j7
         ixmZ1rn5zLBV/05LH83ycm0XtgN3B6sd2RhrtTOMz97I5v/C2bJtVhZr/6VHRJGmJolk
         wiJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773087381; x=1773692181;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1W/57dKEbvgDKZIHUNPuGulUAs5FFvgypvGnAL2PC1A=;
        b=cRaNfq7MmFHzfBdTGOwud3PE/JUu6G0wsNz8285X+hNb/frcvT8dVj5Uy1Iv3suEYi
         LZmY4mTU56eC0zNR79SwHhvXvXieP+JgTOBnzz2g7mjjA3MzRe9dGDRb+3f1AsdCeScq
         xaxtGlkvSCAmeIWCAaXx6iE8yCfuqLy0ltyb8mtJ1pDwKERwRAh5pr223DgFnEBbMzqr
         JhoJ4sEWyEPNcrJjDpjpGtd7oZhulYBx53cmHFJilN1YlZ7ad+Sj7yiG4fyalr5Akzt/
         qA8CMgNv7W0CW923kLMBh6nhC8JdCjEN1KxF37eAlLeE1oMqRt48ad8hdzSdzkpKDtCJ
         5oRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTqq0kWOpMgXW7miKSCq17/LPE8zNom6nc+YeSEPWj8qjvT6pZdU/JKAai5/7ndZ44TeCxIXQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwIuMV0ay32Ax10Gko5oFN2lbnCUeLi6IzxZ6AJZUVYVj8pDBxk
	5Uo0cOFP5Zzc1UGoB2CzWtq9Ef3v5IuN1uYBFArtAAhLlIYSIwoGrbs28Jd0rohXdoSAtcxBUgd
	7f2lM0EE9SrQLYc2ZlNvWfz7CupIZcgYYRArY7OHYoeQqAJ7rBteM9Q7wNXfZz7BU
X-Gm-Gg: ATEYQzwaeQgiFkp0AFcJoSoCiYXrsFLEM1e56Vdnu8OTp2cxEfe06PVEgvQRXBwzCpR
	64jv2ihDUql73i1GRg6Wa/ziu7hxz06yVAg2pYfnJ3Y4YmCF90ZBtjJUjP2alfyhBYQwGs52jdz
	RnBXhPNp8Jl9VLAcsh5mEIK5jdPzuKpw8KcdE1P1llIYpwqnxM2lSovQ1q2vjkaAoMcSt4UGW72
	o2Yf2K8we8IlWuI9bJ07RXLjIjk1GufKB/+vJ3jki+4CZawAJxu29BSHfPSGrUWV9Zjpw+Dqy+6
	O1DR+3QdSgHDScKGvQo0h9nfw9jtW95HcI3XS4dKp8vpeTx0D4Y84+Cm65PsXtM8nGy+tuN52Ej
	dSOmjpvp2RCg10ktysyOBpxeSgHwF1NhNYarg6ug48o37tFqdNCVLLwR7L/lPu5ss/nAs5rm0uR
	3KgOHM4XcnKee8CQ==
X-Received: by 2002:a4a:e909:0:b0:67b:bb4e:4a16 with SMTP id 006d021491bc7-67bbb4e5f8amr990090eaf.37.1773087380943;
        Mon, 09 Mar 2026 13:16:20 -0700 (PDT)
X-Received: by 2002:a4a:e909:0:b0:67b:bb4e:4a16 with SMTP id 006d021491bc7-67bbb4e5f8amr990063eaf.37.1773087380461;
        Mon, 09 Mar 2026 13:16:20 -0700 (PDT)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67bb0085724sm3554991eaf.3.2026.03.09.13.16.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 13:16:19 -0700 (PDT)
Message-ID: <621ab5fd-206d-4cf9-b30d-cb9d6bc0459b@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 13:16:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: avoid dynamic alloc when parsing
 wmi tb
To: Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260309152050.191820-1-nico.escande@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260309152050.191820-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BBnBHP42Kwl2QuyIaxkALJGp_4frdxrD
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69af2a95 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=uZB4Gw5mc7jQY1ITqb4A:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE4MCBTYWx0ZWRfXw4rAgXlJz6OH
 dpSDxQNJNPGggzx59uwW6kWwlixtHHKLlucjBBHCz6VFR6yyRy3CVT8iKq0SUNp3GTRAdZ2QFyH
 wKhCO/F111GGHXDDvT0cslliEmahNFYrbWPqY9g5I3WoRld0y82udt/ZfQwQx1TdWomd2eFju4d
 B56C5boJcCPzZe2SP4Mu54x888tE8bbPoFkoEndGmxyQH0W18MtiInkvDUaqUWCzqhKXJJxGZkx
 6JtD6irAuA2SjIugwFGTW7qpdx421REnNr8SNdpwSm/RP9ez0rOhIK/Rv/wpG8cxyNNYyuDdcKc
 LrVqG32vxST6q/PcEFj4RmBHhaU6aL8J9nHyy+BE7Wv1gJAX8RZ6RowRAiE2tgVsdpSm/FjGYGu
 cLV2f+kxbfbR0S/yo30h6jjYBuqWLDLXRmxv8v7Aj1rzSH0qkCWoBA1ie4oiUFQm8iMarPGmRc+
 YMK+JJa+sqOt1MhNluw==
X-Proofpoint-ORIG-GUID: BBnBHP42Kwl2QuyIaxkALJGp_4frdxrD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_131622_826748_9BD5846F 
X-CRM114-Status: GOOD (  22.07  )
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

On 3/9/2026 8:20 AM, Nicolas Escande wrote:

I have some nit comments...

> On each WMI message received from the hardware, we alloc a temporary array

note that not every WMI message handler uses this pattern.

> of WMI_TAG_MAX entries of type void *. This array is then populated with
> pointers of parsed structs depending on the WMI type, and then freed. This
> alloc can fail when memory pressure in the system is high enough.
> 
> Given the fact that it is scheduled in softirq with the system_bh_wq, we
> should not be able to parse more than one WMI message per CPU at any time

add hard stop .

> 
> So instead lets move to a per cpu allocated array, stored in the struct
> ath12k_base, that is reused accros calls. The ath12k_wmi_tlv_parse_alloc()

s/accros/across/

> is also renamed into / merged with ath12k_wmi_tlv_parse() as it no longer
> allocs memory but returns the existing per-cpu one.

note that imperative voice is preferred.

> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00218-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
> ---
> changes from RFC:
>   - rebased on ath-next 8e0ab5b9adb7
>   - converted missing call sites ath12k_wmi_obss_color_collision_event()
>     & ath12k_wmi_pdev_temperature_event()
>   - changed alloc order & cleanup path in ath12k_core_alloc() as it seems
>     it confused people
>   - used sizeof(*tb) in ath12k_wmi_tlv_parse()
> 
> Note I did try to move to a DEFINE_PER_CPU() allocated array but the module
> loader complained about the array size. So I stuck to the per ab alloc. 
> ---
>  drivers/net/wireless/ath/ath12k/core.c |   7 +
>  drivers/net/wireless/ath/ath12k/core.h |   2 +
>  drivers/net/wireless/ath/ath12k/wmi.c  | 178 ++++++-------------------
>  3 files changed, 51 insertions(+), 136 deletions(-)
...
> @@ -3913,7 +3903,7 @@ ath12k_wmi_obss_color_collision_event(struct ath12k_base *ab, struct sk_buff *sk
>  	u32 vdev_id, evt_type;
>  	u64 bitmap;
>  
> -	const void **tb __free(kfree) = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
> +	const void **tb = ath12k_wmi_tlv_parse(ab, skb);

checkpatch complains:
Missing a blank line after declarations

Note that when __free() is used that this rule is not enforced since __free()
declarations should appear at first use

So I'd separate the declaration of tb from the assignment to be aligned with
all the other WMI functions

>  	if (IS_ERR(tb)) {
>  		ath12k_warn(ab, "failed to parse OBSS color collision tlv %ld\n",
>  			    PTR_ERR(tb));

that's it for the nits. the development is stress testing the functionality.

/jeff

