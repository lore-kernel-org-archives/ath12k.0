Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2C3E88D94
	for <ath12k@archiver.kernel.org>; Sat,  4 Apr 2026 09:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jtDNNuSKOZBB5V6+bQrzq6rkDFhJJoX5xUxFSKV4Tok=; b=MG0vJO+ZDcmTI6/zHBPL+psoBv
	ZT1WXrVefLMAN9DkkEqeEFQ7XzLa4lx2/nr3K+DgBeIaSaTIbecLQUjfmnM0uNzscurQJ0Fs0tikb
	kFnkAivK+wUSmph5u7Y+QQN2xuOWVOKVoH+58NM79UVJSu9b9A7SMid/pPbyZlA2rka9VZ36FerLp
	ya92DEjceYxyVftR/mzqxmA2rzBboJbaCb5Hw44JDHibqAK4EK6bKTrIjO2QpMsSfi1+AR+iNoiSb
	nBh2YuDoOhmYzc1MlnXcerhgDFl2bT0FwhwjNA7croXMJTcRjdOG4sjHhzLKVxvbQRzUSU6E1a07v
	wvYsFUtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8xcN-00000003LTU-0Ux7;
	Sat, 04 Apr 2026 09:48:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8xcK-00000003LT9-1apV
	for ath12k@lists.infradead.org;
	Sat, 04 Apr 2026 09:48:37 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6344mFjV920366
	for <ath12k@lists.infradead.org>; Sat, 4 Apr 2026 09:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jtDNNuSKOZBB5V6+bQrzq6rkDFhJJoX5xUxFSKV4Tok=; b=ZZ3WIDfImTHZqpmQ
	nqL5w5toRynr2znEPI7Pfv3BNI+8QQspQL824SSttwQgqVZ41EX3sVYiDGj0OJrC
	rgagX1LoiamF+A0BGVK19M9Q/Aoe9gAcD9lUB3fpUod4NqN+nGDc52ByeGlyTcVl
	/FubH2UWLOhGzTSDN9FQbQySm+oQNklAr1Fm8e7S1r5/OlvzKJxQADEGtvz0FWDV
	Q9Dv2blVqBxQmTpwEzwKDLuZ6IwvganWKO/U6fsChmp1sqwa9efG45WFY7tdfYJV
	VEz3VDreI80E4JFG85TjY2syoYFlJOrZ/tcfdzGNWsNOqH0bhkWiXhvGR0eV2xpd
	77xBmA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daux88fjg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 04 Apr 2026 09:48:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35da86144daso2287896a91.3
        for <ath12k@lists.infradead.org>; Sat, 04 Apr 2026 02:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775296114; x=1775900914; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jtDNNuSKOZBB5V6+bQrzq6rkDFhJJoX5xUxFSKV4Tok=;
        b=N+FQMANrcdt3QYLgDOdkxkJgM1urb8BnglY5UcFTShzUjwpusXOdv1RQb6ceZ6mCKf
         7v2LMGCdqHCcBsVvF5C4sLsget0j/Y4X6B18kdWwya+rX1IfhWr3WK0ihGMuQzXQ/57F
         ZqkyOo7EXw6Sxv/mKEuXcPp7GalOvVWM2vIWGcotg7B0ulldwQwZD6y2zArBRxDXB/xu
         kL4F8gj7jn/qOmsZ/8gf7jRyR1WJe0K5lnp07VlvQkB+oqOoO3mmWsWpfGiHwyibCMtC
         8/aUeEW8aY17KejiHR8gVrBH38kAV0WBLuWf6XX+9eLFgeAJMwgroMZhuaIqfHysuIKC
         RlVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775296114; x=1775900914;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jtDNNuSKOZBB5V6+bQrzq6rkDFhJJoX5xUxFSKV4Tok=;
        b=m6a9bhWm2Lznixk6PHChah1U7Q7wQHnj7kkWK1BUbzAjqjjJrx2d2fV0fMi6K6/D1i
         b2B3omfJMg3z373BuhWcgi1keqScx11Gpq6+S0PXz7+1xAUKGFrbVfx+tUAgtL4XSkIR
         7/a8esGiXtDYql6T9EVHchLygOzGomTjDykse1boy4BbzFbM/YFWN6HvKzLzQ0bMK/k+
         bSkqS0Jdwp/ZJlfRMiomRlaq/qYMCYZKmr2dQwI5xMbxm8frjIo5YEsN1kMAJjKtvWQd
         HAqbgJiMRHPt59npefMRk+pu7l2twDA5b8MNWVEcUWOD0EUZoxRaWAEpCi8F5C94RTpx
         Rp1A==
X-Forwarded-Encrypted: i=1; AJvYcCUPzZDvEuk7+CgmpbxiBaG9n+/4JY0dL1EWuw+5kNbnHvOJ/bDGLgH3s10qTtNKHfKqnfDafe4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwjVeMnxhm+EKGIiCvRSwHB4QwDNH4Nt9mNkdVSkp/gBQfM1W9Y
	n0vT4k5Uc+00xNhUQElrWkYYMDQz0CLWQoO9649Izi607K55EleWXAAeAXk7o4C+0zY7B8QR6eu
	g6XnYREt8wfRTFGQanxibK3qR9zSH8YmEC0Nx8nk/Bn+0w1/KcKiMuzci9MKGUi8lwLuINzXW
X-Gm-Gg: AeBDies74mUAAiEt/LRBaaExXFeFJPFPwgMWD0ieMgqDPMpErlNbJbT+1r5KKNw1VFn
	karN+TPiEjegWAoHs8qQZhs1GSe79dJxRRT5Ep+YKGFp9ooQHbjwYSKR2aAlzg4s6Iu9SYOIabC
	4WydWFBXVG4uhZq+w3AzJAh4AshmxnD/Q00gE6OrcCtUP7NAoXzeNpMSA1Md8YSNrViFfWDEKKh
	axiURlxC0+4FYdJo1RajhJ2+TTTtJlR6QnKx6RdaemV56B9BJ8ovRiCpZEr5/8qPLxDnjli/HVk
	9+OtS31RCCZbEis8LbIlfEnBYt9U1umIDtdA0rgzMjNQjjx08/N+8h0Ze6eBz9j+Jy6xMj1+YVj
	2ZcLgpBK4TJO8hAPv35S29fSs8epRz6c4N0vBVIf6CkXZId6noRiazC2tQGGL6Ye7PQ==
X-Received: by 2002:a17:90b:3f4d:b0:35d:9482:2233 with SMTP id 98e67ed59e1d1-35de69a66e1mr5802235a91.24.1775296114307;
        Sat, 04 Apr 2026 02:48:34 -0700 (PDT)
X-Received: by 2002:a17:90b:3f4d:b0:35d:9482:2233 with SMTP id 98e67ed59e1d1-35de69a66e1mr5802222a91.24.1775296113829;
        Sat, 04 Apr 2026 02:48:33 -0700 (PDT)
Received: from [192.168.11.104] ([124.123.81.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd35e34f9sm7809468a91.1.2026.04.04.02.48.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Apr 2026 02:48:33 -0700 (PDT)
Message-ID: <54887455-3ae5-4dc9-a0cf-80726a1d8465@oss.qualcomm.com>
Date: Sat, 4 Apr 2026 15:18:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v6] wifi: ath12k: avoid dynamic alloc when
 parsing wmi tb
To: Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260403142841.1105780-1-nico.escande@gmail.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260403142841.1105780-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wM1IEUag7OCe5GT2mUqM6j0xNyQ0GNhS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDA4OCBTYWx0ZWRfX+KHm0tgqHRFx
 OyBn5s6pfPP59lA24bXjT7RfDBvLHb9KkVlZSDmqOeVzlf/VkCz0XEY1t0h/7uv2FrmWaRIBeF8
 aKRoGLzexEv97AmDz1By1S7clucR+1g3Z96fzoL1bGVxo3AWI+rAdxQGz2xsnF6OaEPqHmtOsk7
 IwWGDBcg5pCE2IBkXYO2AU0f+sSJpfS3EibcSVZCGPK2vVLa1Rca+UsQVA6EceT6ONgbimiC/Yl
 2tGQtJRC7ugqvQ5aGcr7i1wmopxmrQtZz/ueU9gJ2/7nC1ZSvLZRSpz55We3P1PP12Kvue7m3OY
 BPnz1yJeKvEr7ofSLpex6RmXCNipVhVGxHQY/jpBz7gbao2AtG9EGLyAXWuMXASdNdD6UtBmper
 KvI/TGdmZ88f/fJA9uCVcyVjYiBNI/Nwoe5gojF6Axz0YsNepPWrRZYCIUZRY4mDaNWcXBEUvZE
 4kw+SPpQ2t+gvWnnaWA==
X-Proofpoint-GUID: wM1IEUag7OCe5GT2mUqM6j0xNyQ0GNhS
X-Authority-Analysis: v=2.4 cv=AuzjHe9P c=1 sm=1 tr=0 ts=69d0de73 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=R7zuFBDiW8lgADV909h7jA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=J1t7JbMFkQZTC4NLg28A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_07,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604040088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_024836_442705_06DCE969 
X-CRM114-Status: GOOD (  31.96  )
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



On 4/3/2026 7:58 PM, Nicolas Escande wrote:
> On each WMI message received from the hardware, we alloc a temporary array
> of WMI_TAG_MAX entries of type void *. This array is then populated with
> pointers of parsed structs depending on the WMI type, and then freed. This
> alloc can fail when memory pressure in the system is high enough.
> 
> Given the fact that it is scheduled in softirq with the system_bh_wq, we
> should not be able to parse more than one WMI message per CPU at any time.
> 
> So instead lets move to a per cpu allocated array, that is reused across
> calls. This memory is allocated as needed and refcounted to exist only
> as long as one struct ath12k_base lives.
> 
> ath12k_wmi_tlv_parse_alloc() and ath12k_wmi_tlv_parse() are merged
> together as it no longer allocs mem but returns the existing per-cpu one.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00218-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
> ---
> changes from v4:
>    - moved to a single instance, refcounted per cpu memory alloc
>    
> changes from v3:
>    - simplified ath12k_core_init() with a single statement
>    - move perpcu.h include directly to wmi.c
> 
> changes from v2:
>    - removed now superfluous return in ath12k_wmi_event_teardown_complete()
>    - moved ath12k_wmi_tb declaration to wmi.c & added two functions to
>      alloc / free it
>    - removed useless error message on memory allocation failure
> 
> changes from v1:
>    - rebased on ath-next 27401c9b1432
>    - changed wording according to Jeff's comment
>    - moved alloc/cleanup to new module_init/exit functions in the
>      ath12k module as per Baochen's comment
> 
> changes from RFC:
>    - rebased on ath-next 8e0ab5b9adb7
>    - converted missing call sites ath12k_wmi_obss_color_collision_event()
>      & ath12k_wmi_pdev_temperature_event()
>    - changed alloc order & cleanup path in ath12k_core_alloc() as it seems
>      it confused people
>    - used sizeof(*tb) in ath12k_wmi_tlv_parse()
> ---
>   drivers/net/wireless/ath/ath12k/core.c |   6 +
>   drivers/net/wireless/ath/ath12k/wmi.c  | 214 +++++++++----------------
>   drivers/net/wireless/ath/ath12k/wmi.h  |   3 +
>   3 files changed, 84 insertions(+), 139 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index c31c47fb5a73..6f0f4bfbf699 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -2256,6 +2256,7 @@ void ath12k_core_deinit(struct ath12k_base *ab)
>   void ath12k_core_free(struct ath12k_base *ab)
>   {
>   	timer_delete_sync(&ab->rx_replenish_retry);
> +	ath12k_wmi_free();
>   	destroy_workqueue(ab->workqueue_aux);
>   	destroy_workqueue(ab->workqueue);
>   	kfree(ab);
> @@ -2280,6 +2281,9 @@ struct ath12k_base *ath12k_core_alloc(struct device *dev, size_t priv_size,
>   	if (!ab->workqueue_aux)
>   		goto err_free_wq;
>   
> +	if (ath12k_wmi_alloc() < 0)
> +		goto err_free_wq_aux;
> +
>   	mutex_init(&ab->core_lock);
>   	spin_lock_init(&ab->base_lock);
>   	init_completion(&ab->reset_complete);
> @@ -2314,6 +2318,8 @@ struct ath12k_base *ath12k_core_alloc(struct device *dev, size_t priv_size,
>   
>   	return ab;
>   
> +err_free_wq_aux:
> +	destroy_workqueue(ab->workqueue_aux);
>   err_free_wq:
>   	destroy_workqueue(ab->workqueue);
>   err_sc_free:
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index 65a05a9520ff..2641a76e9543 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -15,6 +15,8 @@
>   #include <linux/time.h>
>   #include <linux/of.h>
>   #include <linux/cleanup.h>
> +#include <linux/percpu.h>
> +#include <linux/refcount.h>
>   #include "core.h"
>   #include "debugfs.h"
>   #include "debug.h"
> @@ -134,6 +136,10 @@ struct wmi_pdev_set_obss_bitmap_arg {
>   	const char *label;
>   };
>   
> +static DEFINE_MUTEX(ath12k_wmi_mutex);
> +static refcount_t ath12k_wmi_refcount = REFCOUNT_INIT(0);
> +static void __percpu *ath12k_wmi_tb = NULL;

Checkpatch complains:
drivers/net/wireless/ath/ath12k/wmi.c:141: do not initialise statics to NULL

> +
>   static const struct ath12k_wmi_tlv_policy ath12k_wmi_tlv_policies[] = {
>   	[WMI_TAG_ARRAY_BYTE] = { .min_len = 0 },
>   	[WMI_TAG_ARRAY_UINT32] = { .min_len = 0 },
> @@ -289,29 +295,19 @@ static int ath12k_wmi_tlv_iter_parse(struct ath12k_base *ab, u16 tag, u16 len,
>   	return 0;
>   }
>   

{...}

>   #ifdef CONFIG_ATH12K_DEBUGFS
> @@ -11239,3 +11150,28 @@ int ath12k_wmi_send_mlo_link_set_active_cmd(struct ath12k_base *ab,
>   	dev_kfree_skb(skb);
>   	return ret;
>   }
> +
> +int ath12k_wmi_alloc(void)
> +{
> +	guard(mutex)(&ath12k_wmi_mutex);
> +
> +	if (!ath12k_wmi_tb) {
> +		ath12k_wmi_tb = __alloc_percpu(WMI_TAG_MAX * sizeof(void *),
> +					       __alignof__(void *));
> +		if (!ath12k_wmi_tb)
> +			return -ENOMEM;
> +	}
> +
> +	refcount_inc(&ath12k_wmi_refcount);

With ath12k_wmi_refcount initialized to zero, this will trigger addition 
on 0 - use-after-free warning in refcount.

We may have to do refcount_set(&ath12k_wmi_refcount, 1); on tb alloc.


> +	return 0;
> +}
> +
> +void ath12k_wmi_free(void)
> +{
> +	guard(mutex)(&ath12k_wmi_mutex);
> +
> +	if (refcount_dec_and_test(&ath12k_wmi_refcount)) {
> +		free_percpu(ath12k_wmi_tb);
> +		ath12k_wmi_tb = NULL;
> +	}
> +}
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
> index 5ba9b7d3a888..4a34b2ca99ea 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.h
> +++ b/drivers/net/wireless/ath/ath12k/wmi.h
> @@ -6576,4 +6576,7 @@ int ath12k_wmi_send_vdev_set_tpc_power(struct ath12k *ar,
>   				       struct ath12k_reg_tpc_power_info *param);
>   int ath12k_wmi_send_mlo_link_set_active_cmd(struct ath12k_base *ab,
>   					    struct wmi_mlo_link_set_active_arg *param);
> +int ath12k_wmi_alloc(void);
> +void ath12k_wmi_free(void);
> +
>   #endif


--
Ramesh


