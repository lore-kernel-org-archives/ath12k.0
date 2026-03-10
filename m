Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24729FCC9A7
	for <ath12k@archiver.kernel.org>; Tue, 10 Mar 2026 02:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sjo55PMniYin80scVthrrQgh0/F0zOAgx7H2SP9TB3k=; b=epUE7eE5Kg1zTfAmbp1bEA6hxE
	iDNziS9puZgeah6/RW6aAqy1+mgpCZBiC5n2pkQK+q5HsK94eLgd6muUpseZ6aCj1Vnf5y+/73DFI
	tPweEh6iZyjuPuk+BbTa/8mmopSE5De6lf3xoG+PtfXSnUcrrbwMrJLHfy4gCKDT3Dk2eyCJAt9VL
	B6xblyeNGvUqnvc86dJ2bceomkh63KjN/cO8q016cvUqRGHdPxkeGD5yVKWPrwp315/ipstwZO2I5
	5ubp6oJ9e6C6LbD6fpMxn5gjAl6c0R09mgUpqEWsKbXUmePV8jAYU6helSiSVGjtLlK9LINVeBcAm
	+x/PjcaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzmTK-00000008YBf-3VTN;
	Tue, 10 Mar 2026 02:05:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzmTH-00000008YAq-2wCc
	for ath12k@lists.infradead.org;
	Tue, 10 Mar 2026 02:05:20 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBnKQ1920907
	for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 02:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sjo55PMniYin80scVthrrQgh0/F0zOAgx7H2SP9TB3k=; b=K2thYM93w3r+zvMs
	gRtTe/tsgudrsfuefPuXeXfsw6qQsn/zOreV3yuIbnn4zStQFZB7qQZMf2s52Y9+
	FuqYNn16F0pfKnezjYcq6DCsomeAE2Ru86T9ErPqzk3K6oYsiYLwFrppGDiY5rri
	9tle/tuVId/7quhHa9JsX1UzFhl8Ehslgd1fU6eEI0MzfKAZi+rHWI36BFwjyKPB
	WdnDxq3UK+96E5g+6hObemQqlgSMUn1rQu2E4e7LmZZA5jOyCF0qw1sCUnzSsV+f
	qtFTkA7EzLG4BGamO/8+9QlGPm6Xha3xBMhjVHFIbPkM2tYKm5lG1yRrlMeFt3Mk
	1nASZg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csxy82ap0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 02:05:18 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-829a9d3073bso1228799b3a.2
        for <ath12k@lists.infradead.org>; Mon, 09 Mar 2026 19:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773108318; x=1773713118; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sjo55PMniYin80scVthrrQgh0/F0zOAgx7H2SP9TB3k=;
        b=ag0RHwPWXJI0ZdVMZoUtyzP2RKXr4ruMK7u/d2M/noubv0RwedAixz7nO21JAQnsi4
         GaDDP6GCjeLLExImnLTP+aRlH9rJuUlZDl9SRSDa5fnhneNHTDsaOyVipZ5VdFqgyD//
         UpBdiUetkK8tFqP0bCtuvJcjxNA0+EutXy7Y9V5Jh/Ekde/sj2hPlEtc4CHGjp02E+Mn
         z/SbEA+a0e12kaqxxSXQ46rV6SUKsh/1oUMXhRXklzivfXM0R3VN1v0xVMFjv0qpACpS
         ZpGSSRCk3JOnhBJ4sGQtm1Zidn8yehgMDEc7Yh6ADwPxUkbPZYLiFT/2ojogSxzUioVB
         0+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773108318; x=1773713118;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sjo55PMniYin80scVthrrQgh0/F0zOAgx7H2SP9TB3k=;
        b=kgviqrXcnH22iw7wbySFofl+TBvNyeDSTdxPS0hTEJWphegWwvnVn89JqzY8LFYOyU
         /EiJh/7XX+Mok+Ef7NSG8jEilpV7AJ3dGWjX2f+6Vg8GGc2RZ3ziu3CWCWnK2mSutRcH
         WEQLTEQSvNJakeC+ef+zHERf19gq0TR2u/l/cDWlbBDwaKcoehwb4qA6oZX+dpZLvJWQ
         oroHIKaiKLU4DxmPn29InKBsMsBBFGANeHFQlkjKs0lmUzmhyTgEvEbWwfiLOJZoi0Qt
         iT01SsUXSaEAPszWygZf+YE+ckZ2AKC9LfnfMiBuudxJeeGryFDaIYCMet5y5oiVqeUE
         /feQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMy7Uof86vZA/59Uht7Z3pacYULp3ZwIgT9thkjRHU34K4mphcggBeZ9P+WavraOepwPCJ9EE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxb+sDlrcFeGHOpBnNP6JruRpX3tBY3VLmuENSYh/8uIFT+uXpw
	C3rAoedSEDiqn1mTzRxiOWYPQJC0lFuNKhLX+cV1reH7xDkMZWvKpJbFPpJ8WgwiXmyYu8e55Y0
	eJVX5FBiPHF/98QZAmFYRPiLE7k4a1N4Ak6Rpgew6fofOyjAfkLR2B6Q0oKJ1M+NH
X-Gm-Gg: ATEYQzyTmfIy70tDm3HC6l8ZHYcWyNnOd4ggjQb6k1vQhTE9yw7E7yL4ablGlqwGHMQ
	yLph4HayT/+PbfTcLR4k/7t6yMDtHNemAs6a0wXOPTcyA4TN5jEUmO+7aB20APxBsq5+niGn53W
	pZH8ovZfvRPbaReHRun0nOxTkbBLtVDlPP+cNBYFsjBGcCcMeWbUMMXrgeOAnFzBIl+Ilr4exru
	qdRtrbeOXVNOi/ZYKJJ+HI8O1UmaSxNrXYeWak++c8xtkGLsV8HYZfVwyezQpYkaFzgYTsRTecJ
	hXMmgnDVGG2PVFQ+2UCXNYUgvcMYWq15pD4GAbMfqAfrTx2nBtmhyDbCDBKYqgwwzI1+rzyjYUQ
	uC8tQcccuezsENs12eimQU++3AcEMX7fpK+3wmstsihMTt9qi2P1LywORGHBKAMZOqnP6kmoG/g
	LBJ1Ols0KKKq8VHLw4sg==
X-Received: by 2002:a05:6a00:1acd:b0:81c:c98c:aeb7 with SMTP id d2e1a72fcca58-829a2d92f11mr11007270b3a.7.1773108317635;
        Mon, 09 Mar 2026 19:05:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:1acd:b0:81c:c98c:aeb7 with SMTP id d2e1a72fcca58-829a2d92f11mr11007244b3a.7.1773108317087;
        Mon, 09 Mar 2026 19:05:17 -0700 (PDT)
Received: from [10.133.33.46] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a465b702sm11609577b3a.20.2026.03.09.19.05.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 19:05:16 -0700 (PDT)
Message-ID: <04d268a7-8f6e-4aa4-b366-0dc38c355de7@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 10:05:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: avoid dynamic alloc when parsing
 wmi tb
To: Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260309152050.191820-1-nico.escande@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260309152050.191820-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SvmdKfO0 c=1 sm=1 tr=0 ts=69af7c5e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=LKyZ4EzgJUtLA7xHa9UA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: RedZ5l1VsKusoFSXZHLbttDme5yiBJQy
X-Proofpoint-ORIG-GUID: RedZ5l1VsKusoFSXZHLbttDme5yiBJQy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDAxNCBTYWx0ZWRfXyg33zhSy3kC+
 gNg5pCT/bO593+nYRll9jNTVXW6Q9FsmUn1jtYpCUT6MDqN0J1Cj9ewpo2gbfa7yJO91wFmlcQS
 wkuZZCu/mL18ds/h1O+OezTghSYtQ1kajPkzm9E270kDMaiOsSBysatGnS1OzTkVcRNQg/KsOge
 p9/054YUztzIXAKwlzvoMx1qq9w4CMJLhnGUpbxF40upmKDWqo1FJNlzOE/NruWwnWUyO7+69wZ
 dOAWxGi/dDEqcHcUoKtDmhHs16BG3xh6lHbv7SpnE0O4NL22sVLnBrAGKthLsIj6olUQ99PW0z3
 Sb9KovgfFUz51hFQohp9enjwAkelosq/vYLwF9QdZVSk0SQbQf2/vMgXXuiDGuEPcerASMxPV0j
 Jq0Fr/gRmb/xCdKh6aau85C6Mdn8v9hnXXVp/K9hiB0go1n+XPGcGe9LLG9UnzmDkHEsmYoiN0u
 9x66Li9JtmGOrLy2KEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_190519_760630_CDA9CEDD 
X-CRM114-Status: GOOD (  25.12  )
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



On 3/9/2026 11:20 PM, Nicolas Escande wrote:
> On each WMI message received from the hardware, we alloc a temporary array
> of WMI_TAG_MAX entries of type void *. This array is then populated with
> pointers of parsed structs depending on the WMI type, and then freed. This
> alloc can fail when memory pressure in the system is high enough.
> 
> Given the fact that it is scheduled in softirq with the system_bh_wq, we
> should not be able to parse more than one WMI message per CPU at any time
> 
> So instead lets move to a per cpu allocated array, stored in the struct
> ath12k_base, that is reused accros calls. The ath12k_wmi_tlv_parse_alloc()
> is also renamed into / merged with ath12k_wmi_tlv_parse() as it no longer
> allocs memory but returns the existing per-cpu one.
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
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index c31c47fb5a73..c1de70b24828 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -2258,6 +2258,7 @@ void ath12k_core_free(struct ath12k_base *ab)
>  	timer_delete_sync(&ab->rx_replenish_retry);
>  	destroy_workqueue(ab->workqueue_aux);
>  	destroy_workqueue(ab->workqueue);
> +	free_percpu(ab->wmi_tb);
>  	kfree(ab);
>  }
>  
> @@ -2270,6 +2271,11 @@ struct ath12k_base *ath12k_core_alloc(struct device *dev, size_t priv_size,
>  	if (!ab)
>  		return NULL;
>  
> +	ab->wmi_tb = __alloc_percpu(WMI_TAG_MAX * sizeof(void *),
> +				    __alignof__(void *));
> +	if (!ab->wmi_tb)
> +		goto err_sc_free;
> +
>  	init_completion(&ab->driver_recovery);
>  
>  	ab->workqueue = create_singlethread_workqueue("ath12k_wq");
> @@ -2317,6 +2323,7 @@ struct ath12k_base *ath12k_core_alloc(struct device *dev, size_t priv_size,
>  err_free_wq:
>  	destroy_workqueue(ab->workqueue);
>  err_sc_free:
> +	free_percpu(ab->wmi_tb);
>  	kfree(ab);
>  	return NULL;
>  }
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index 59c193b24764..ebe7b94fd712 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -19,6 +19,7 @@
>  #include <linux/average.h>
>  #include <linux/of.h>
>  #include <linux/rhashtable.h>
> +#include <linux/percpu.h>
>  #include "qmi.h"
>  #include "htc.h"
>  #include "wmi.h"
> @@ -937,6 +938,7 @@ struct ath12k_base {
>  	struct device *dev;
>  	struct ath12k_qmi qmi;
>  	struct ath12k_wmi_base wmi_ab;
> +	void __percpu *wmi_tb;

any reason why my v1 suggestion is not considered?

instead of allocating it per device, how about making it global and define/allocate once
when loading driver. This way we may save some memory in case where more than one devices
get probed?

