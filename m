Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8E2F5A8D2
	for <ath12k@archiver.kernel.org>; Tue, 21 Apr 2026 05:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RVII9DN81leMzQYL9YT3QxHsgikUgGmZbz/C9ipZ/hQ=; b=OwYcvXD+zeCkZtNQ/rbzdFHEOy
	bFfhBwSYFZaeRi734vPssbKrWR+ARvcOWjx06vLrSrS743Zu69lp22fTa/Glxlay5bPa4g8ngkCA/
	gkIZ9/k2Fvxuwn9sZBioRbjiyZJ7R5V/1rQxBkOcA8qynZNY4dX5rmxR9l7URL64LQg3c9N9r4dhT
	NXtx2HeDXMdHXqxBkT4QIHR5opQIoqrNTvJAeS2W56w/Qt3V0S+cP1zyf/v999P0zh0UAetgxgD7I
	ky4NuyRepbFtIOOe2y8HsoS+b+5+si/hymem+2K+LHjsmzEtIYcxdfgEykvsqoxUe7+axeR6PRmqr
	UEY1hUhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF3gb-0000000837Y-2VsB;
	Tue, 21 Apr 2026 05:30:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF3gY-00000008378-3L9s
	for ath12k@lists.infradead.org;
	Tue, 21 Apr 2026 05:30:12 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L2MZ991600315
	for <ath12k@lists.infradead.org>; Tue, 21 Apr 2026 05:30:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RVII9DN81leMzQYL9YT3QxHsgikUgGmZbz/C9ipZ/hQ=; b=HdrcY/njjeBPOL/5
	Oadf5AI9pkDP9aWZ7luW6j5zkr8tNwBsMvbXDdQxQRzqdN4n7rrcvyIfEOfQHwjM
	3Qoehj0tebhEOioeN1PK7rBSAqQjEP0fGDK26FmG9zpKHYKoOO9YkC0ad6fIsU6w
	7QkD7BCG2uGRRXyqjX12EQrsRk7uTAtRh31vO2uRS1mGaboBiJ09jNINsHUsE9+m
	9nEAm4r5Carkt/qfp/3fvwgmOHO7gijPnVZIkAt3UoX+tqRit4fTWKk7yj1ZT6C3
	1ZMS9jtcj1lx+fu2x7qI3QYL/ooK20otEfJM/8QP64LzF3R7TaLM7WdXr4TGEkZN
	zb7NkA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh89bvdx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 21 Apr 2026 05:30:08 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35845fcf0f5so4095715a91.0
        for <ath12k@lists.infradead.org>; Mon, 20 Apr 2026 22:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776749407; x=1777354207; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RVII9DN81leMzQYL9YT3QxHsgikUgGmZbz/C9ipZ/hQ=;
        b=HzqM4sB98rq6BQkJpVdmJwTTkPOkATBtDB5GRe9E8IaC42tuSHZDI1bIwg0WdwF+cU
         GkHXbb4QkVnwI5pKy1MM1mfpECxjW5PcEH4fXpUvbpljBeEbckPSA5BohvhZjcFWZIQd
         z1yaVShR4c/H97JuCcy06XmK5JgFyb6UEk1EusJhrPsor9DTkk+JklUBNSjqhAU9TMBa
         8a7CmhTKKVrR3F2Rxw/SAdjilIQNkmD3slxSNfP2LLhBOY5vWrsJfBe2bTrrdVwshgDG
         CxhiBJOm7+Ge7B8HrwBOUwwJm1SCkCbHPEry//Vqr480mS/78vQ5nknkmgMF+qw+lLhR
         O3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776749407; x=1777354207;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RVII9DN81leMzQYL9YT3QxHsgikUgGmZbz/C9ipZ/hQ=;
        b=RP+4Nz3X4RT2aJjXXy5SboJls4RtidPN6vPDQHfyDbx0sBI6db8W9aSUW/PBamruJs
         XaEbJQ68i/QGyz9d6JGMmNHUmghdYf2bXgT6Xz+kUdLOXz6u8/k3/JWeHO6Y5QGLZe2P
         WBmqEgLa4ulFixf4NBdHtkHDLdyybTkBR7pq+DhJchcvVN2DIEfCDgu5iKip7PRQb4EM
         1BGvshiqykxBkM+4/FChwEmYWF+cHMktYtBPXnXm1Eauq8lSbrpyqPLQzYz5eQPo9nag
         t4paoyJesvUyXSD0NIfy6cJdZlwaYFneo+lBk62vUwJXrfwcUGvrys87vUYBO7/2XWsk
         l83Q==
X-Forwarded-Encrypted: i=1; AFNElJ+twn3JS+Racv9dbQKbwkHmkVA1geLPMo5TLmkAIv7aI2c7GJZgpJNdyxjO/amg1hA5Wt54L3c=@lists.infradead.org
X-Gm-Message-State: AOJu0YzzxWT7syzDAqaudJZbfWeYPY6k0set09bhlcygCTMXQ83bF2Jj
	MOKn5DRS72kR1SpXnekij3da2Fqmu12I5SvAoUm7kZ84/jOBQQ421h9s64QiFeS9U8lYKZtvZp8
	dcjUjV+QlUk1tye6/Xi9UMz75GIvW89sS2r1aDz9FuHplM8kbdnou5V6NKVvRtjMAWdT27pTf
X-Gm-Gg: AeBDiesqvfyugypPv06b9SpRTDe2ESebSoc7R3uvOh7oTv1ZojALKmKPFEpT7mDaA7C
	mLZh6KTkw5tFN4LszFayz77c/UOo80GDScY0FEYD0Md2eNTDxmkZhXOblBmeWqq6UR4tHcKl9gv
	NkLpoaSAsaovLaeYpMLmco/8jtAGRs9nYtNfRfRmkMFqVh1LQPW2JSd73pLJ770IAdv82s0FvJA
	HlQOzLM3N7hy12qzJvru8iBEw/RgOqn1oJ5iSHkgGokeFQ0Lq7Aa4xS3D/ifAZWFkZe5bMS8hbN
	RcdFcHe7Y2NECtWsx5InRze8Nz5bbKehp/4xhesAUpv2EKbYYWZ4EbgQnJsx6+YW1y0I6OZect4
	/4RG/oJKpLTJHgabYNFlq+IK5dbs9ibl0vqvF8S+/fTw2lW5piUTabpAbHC8W/bxQuTzt3/eg
X-Received: by 2002:a17:90b:3c52:b0:35f:c5b8:ef6d with SMTP id 98e67ed59e1d1-3613ffce905mr12961651a91.3.1776749406624;
        Mon, 20 Apr 2026 22:30:06 -0700 (PDT)
X-Received: by 2002:a17:90b:3c52:b0:35f:c5b8:ef6d with SMTP id 98e67ed59e1d1-3613ffce905mr12961616a91.3.1776749406107;
        Mon, 20 Apr 2026 22:30:06 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361410bafa9sm12235201a91.15.2026.04.20.22.30.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 22:30:05 -0700 (PDT)
Message-ID: <1ab8b8bf-054a-495a-9b64-e5dc870fc602@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 11:00:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: fix OF node refcount imbalance in
 WSI graph traversal
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260410071300.2323603-1-aaradhana.sahu@oss.qualcomm.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260410071300.2323603-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA1MSBTYWx0ZWRfX07CHj8eMxgCD
 lgx7cLU2ZCs+wdHvT/l3SLSRLV3kaso9N4hvQ878I//JvApPEhj89GqqlxmDFgeWJ/qUlpWMM/z
 5jzGbbfErvWSQBafI3HYJSrLYjP0bkwgNPghicWMrVavpUIMdSnGQb5DWhjBBVfYAIGReylWjD6
 Yfht6OhNutb0i7RIob59u5A0Cdydc59N2u+lVT8adfmZ5NO8THElM2Vn6c56YxII1AA6i+hIv9r
 BE698RHXMmLlV9Pmyqk12JSo9nGdi86QSN7YVJ8TQDR9kp0GXCZrtyTQYxJfq+KApltPpRv7wv6
 J5WN1edjTVYqOmkDrcH6ZEt0nuAhCdXvN/f4fhGXKT3mk8Yo65evRbEh/2RiLHoXWld6Cu3O/ha
 yweZfnnZ442c6wXhPJWICGpp+yXk2E1EeWoNAK9uyNUuhLXHzw/mQmGuNI7fCPRz+os9O1IBzfC
 EAJmEBhnIwPntZZTeXQ==
X-Authority-Analysis: v=2.4 cv=D6B37PRj c=1 sm=1 tr=0 ts=69e70b60 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=dnFkAXji-rmhat8NvRMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: eYYM7AUL3q6mAGJMKfJmcEptyhZsbMHW
X-Proofpoint-GUID: eYYM7AUL3q6mAGJMKfJmcEptyhZsbMHW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_223010_964977_C5C8F343 
X-CRM114-Status: GOOD (  12.46  )
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

On 4/10/2026 12:43 PM, Aaradhana Sahu wrote:
> ath12k_core_get_wsi_info() traverses the WSI (Wired Serial Interface)
> device graph starting from dev->of_node. The current code uses
> dev->of_node directly as the local traversal pointer and calls
> of_node_put() on error.
> 
> Since the driver does not own a reference to dev->of_node, dropping it
> during traversal results in the following OF refcount underflow:
> 
> OF: ERROR: of_node_release() detected bad of_node_put() on /soc@0/wifi@c000000
> CPU: 1 UID: 0 PID: 210 Comm: insmod Not tainted 6.19.0-rc4-next-20260109-00023-g797dd36dc178 #26 PREEMPT
> Hardware name: Qualcomm Technologies, Inc. IPQ5332 MI01.2 (DT)
> Call trace:
>   show_stack+0x18/0x24 (C)
>   dump_stack_lvl+0x60/0x80
>   dump_stack+0x18/0x24
>   of_node_release+0x164/0x1a0
>   kobject_put+0xb4/0x278
>   of_node_put+0x18/0x28
>   ath12k_core_init+0x29c/0x5d4 [ath12k]
>   ath12k_ahb_probe+0x950/0xc14 [ath12k]
>   platform_probe+0x5c/0xa4
>   really_probe+0xc0/0x3ec
>   __driver_probe_device+0x80/0x170
>   driver_probe_device+0x3c/0x120
>   __driver_attach+0xc4/0x218
> OF: ERROR: next of_node_put() on this node will result in a kobject warning 'refcount_t: underflow; use-after-free.'
> 
> Fix this by explicitly acquiring a reference to the starting node
> using of_node_get() and attaching automatic cleanup via
> __free(device_node).
> 
> Each discovered WSI node is stored in ag->wsi_node[] with its own
> of_node_get() reference. These references are later released in
> ath12k_core_free_wsi_info() during driver teardown.
> 
> Also remove unnecessary memset() of wsi_node array since cleanup now
> explicitly sets pointers to NULL.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 908c10c860e0 ("wifi: ath12k: parse multiple device information from Device Tree")
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

