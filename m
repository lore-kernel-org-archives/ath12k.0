Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013D1F30299
	for <ath12k@archiver.kernel.org>; Mon, 16 Mar 2026 02:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aYdfsIEUjKYKUFr0R8Fwpax3o7fUn8pvEl2MBl7vK/0=; b=iWIxc5PBFh8fMSFTucK5ZzHLBI
	k1vKDF9n8Ziu2szNhgZM91Ip6akrb7tnM3cr7+YU+JWEp7KvCCxKwlQX3u8BGiRCEWG7K7OjS5hFn
	OqRbqI+LTZzdPM1cCKhZtV5GwdVTPWqYZEzdCFSALiGKRb+jVWyi6PqvOCK3UivQ865X4vOpvhsYR
	+ozNdjgDqqlEgrm30hBVGwT7x3dJinYjgJk78f4YOv6sQ+1oBYDTEfbyFcfni72Xt90E35Cn7j03K
	KgvEOKsW1ax/IVC5nZqK4tPnzWsaABwmIAmyMnIkwjx3B9qZtiM9qy0JbMxj6Z2EOj5LwbuzLvSsi
	hzpcpfgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1xgd-00000003DX3-2Wyf;
	Mon, 16 Mar 2026 02:28:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1xgb-00000003DWZ-0GAA
	for ath12k@lists.infradead.org;
	Mon, 16 Mar 2026 02:28:06 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62F6Thmj2577674
	for <ath12k@lists.infradead.org>; Mon, 16 Mar 2026 02:28:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aYdfsIEUjKYKUFr0R8Fwpax3o7fUn8pvEl2MBl7vK/0=; b=Mrov2drxy/mSkYWa
	1XwzX4eTE6R80UWhInSIYyBsv8P7kx/QhowVkYDVhYAz8N9efeLerYild1s3EbPT
	z5e2DFzQFQVTd1ymQH9k6/TUo3z8VKnt07dkhAvUl8L5jbgXUQLw1EIigvbJfUT7
	JIUBdQruAOxXw2mhS7y/qlHKwcufM9aXGUx8VsPeb3sJCI3SXVdfq7zhlZuhZoSd
	TRSI4xjy1ILp4R3tMMIcMtPrPZ8gPx8WZdHSJG2NXySY4VB24P0DKuO0lnT+hJ+L
	SBNkiz3wMpY/tqJKHc2ZenNmNr5W9AckRCiqMMAEJ1Sp6CD2cLCHKMZ3GZkKIhXV
	C4guog==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyyc3qah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 16 Mar 2026 02:28:04 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aeaabedbc3so324394665ad.3
        for <ath12k@lists.infradead.org>; Sun, 15 Mar 2026 19:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773628084; x=1774232884; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aYdfsIEUjKYKUFr0R8Fwpax3o7fUn8pvEl2MBl7vK/0=;
        b=fzJ3iTnQHKMN3+ZMax55kUMGBzuGi61gCVOYzemAX+Dm/ocX4ZShbxy95RdF5rSCLn
         llDEE/9AVn7VNFRIX31kOKC2mnJaK3V4uJ5hM7JthoaZDp+lkj5ancL+UcuAo4pQmf40
         rklYdfZgwxebLRBmkfWONeIxbfDk5qGdFd/kBpku4FMjixRsnhVN/aPnqO7Geu5lQYXw
         SN5ZnCIrxCI7sW4UY3kmmcbwJzzVKMfhZZKTIHmxeVWwNNi/pPydmulM/FstourK9lMn
         3paj3kVAt1oObQ5x1Jat6eSu6aI2i2laggV8mTyBWC87Zj/x/fYi621XMKIGVgKeKYwv
         QRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773628084; x=1774232884;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aYdfsIEUjKYKUFr0R8Fwpax3o7fUn8pvEl2MBl7vK/0=;
        b=nb/Q19+2NMaLV3mUsCAbsNgheZg5AzA00TGvyc2y5Hy9kxnTmdMtynzxtysnjpwBPo
         GdQ1ePV5/IH8j3EIfN+MW7LyEx2JSpL2Wl9dK52FTM+F0+DTw07wLKGZs/J5TibPIUuW
         WfFGvroPAOEXxb2LTNQOm4miHgsTUgby8d7L9YKjE8rqsjqMNeijCCmrUSBesCV5BeIa
         dWq5tKWEu7mbYkfsYVmV9BIvfSZX3+3XiVxqmJoHR9zE108JDPwQ/3oDDNXX78sh29lB
         xWd08zvZLTGx8RJXiSbuQ22i7G/EDBaiN4J1Ss6kpm1DcNUTGkH6CLXzQX6Nr39BBHVR
         mCaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXL3RdbF9+98BSnP73JZ56+m+9sSfIymZK5Vc0dWM9R2i1KEHQuFjEz9m6Yp00PtIn8rhiHnpI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyiBBYxNE35o+spvwWMkQJPMzrJiOItacLw5mSCsMqwSUagCUYh
	KrQWFi0lECzVvps8ScRv4+1wshVg9p/YrUiB5LVNNh2mWRDgeZUADTtXAXDvRyNh8IHIf7aUAl2
	/kZSu6lXK6V8GxKWSPvAoHtGngX/Dbvtxm00jUAqkI7CqDNKHFrDWh+HyoQ7ATjpR
X-Gm-Gg: ATEYQzy8rR1iDl4LVAAUTrszUWGFXrAzDVKOzOSdzlaWCWqL6kjKbXqzKY8JuWQUP45
	1fKMG5MuO9RkDU5J2i1obD6XUxtKMc7NwNNB/ZCCcuxOWuU0Qz4VipoX0AlsYS6fV5tpuabtV4m
	uVnIRL7Sa8hYQ9/VGil4caYELHwBhobyCQbEGs2vabHHgSb0+2P7PxcR4gJXjdHmNprDz9Yy6Nt
	m4E5dEJmXqzGR+HTAiRs5o7xerqmHEtqtlebzgWPwvAi3KdIKQz4Kd6k4KW/5hyco2Dg9bYJxXC
	dSkpBYAdguyiXzleh1HopPUs5NmxcpvKwrF88COl+CE95+0ZM79gIaOTzIT0boT6uwTdycVzPjG
	oSdz1mcPlbaJ9zVL4QbLn0ZTZ5pOfdUDYiv+Qop9nRhiiBjwAo7Qycbz17y/QFsBf1VgK8t+dfK
	Yzs+mTfCumcD+bQjy2LLk=
X-Received: by 2002:a17:903:3b8e:b0:2ae:6205:2345 with SMTP id d9443c01a7336-2aecaabcf9cmr104368455ad.35.1773628083746;
        Sun, 15 Mar 2026 19:28:03 -0700 (PDT)
X-Received: by 2002:a17:903:3b8e:b0:2ae:6205:2345 with SMTP id d9443c01a7336-2aecaabcf9cmr104368275ad.35.1773628083277;
        Sun, 15 Mar 2026 19:28:03 -0700 (PDT)
Received: from [10.133.33.128] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece63133fsm87549275ad.41.2026.03.15.19.28.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 19:28:02 -0700 (PDT)
Message-ID: <55358f82-f0ba-4671-90ed-8061f6ffbabf@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:27:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath12k: avoid dynamic alloc when
 parsing wmi tb
To: Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260313113831.3053586-1-nico.escande@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260313113831.3053586-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=euXSD4pX c=1 sm=1 tr=0 ts=69b76ab4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=B37bNE8LRjw87ndVZx8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 9bOJrKSz4dLMX9UpnPz8iaB8GryQS6ff
X-Proofpoint-ORIG-GUID: 9bOJrKSz4dLMX9UpnPz8iaB8GryQS6ff
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDAxOCBTYWx0ZWRfX6VwPjYxJpXyF
 UA/TtnEidQVG6VzB6YCXxTARBsKomjJtTSuH5T99ZnszW7+5XgQguWlD05Cyso2pjzYMwMJOmfW
 0+6BqgrU3qygs5oqKepFgSOojM+7gpDBhIFgF3gEaTS0TJlZxQw1gVu+bgBIqZcFgebLfZNMuK7
 dMNUEDgaSvCX8LapL9KmHNrjSFABfSKyxhxaqcoNwhFoLTzuVYQ9a2kkS9eBWVh6qnqk76qXHbm
 a3EvaT9PcrFJqz/ZNlNc1zj2k272fnYIxUlkM+fEKeNp1DRkoGfTXKxyYOOJZmfIcVwdks2Gsjv
 v0jppv4Hlg7sazauAp5MvX4XwnMVQwqSACiqBtxbcyqeu9bzgICGlLzYIdse0U1mDX3tttPNama
 1VG3w24g5g6XkTgMfJc028xkOFx5s3qoZmMuwH8B5FrsfXwDCmVfy+RHJmzcYAL8GgsX2+lSJ9Y
 hwte4tzF73uHFedqDLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_01,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_192805_159010_325DE12A 
X-CRM114-Status: GOOD (  32.74  )
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



On 3/13/2026 7:38 PM, Nicolas Escande wrote:
> On each WMI message received from the hardware, we alloc a temporary array
> of WMI_TAG_MAX entries of type void *. This array is then populated with
> pointers of parsed structs depending on the WMI type, and then freed. This
> alloc can fail when memory pressure in the system is high enough.
> 
> Given the fact that it is scheduled in softirq with the system_bh_wq, we
> should not be able to parse more than one WMI message per CPU at any time.
> 
> So instead lets move to a per cpu allocated array, that is reused across
> calls: ath12K_wmi_tb that is global to the ath12K module. To alloc & free
> we added two new module_init/exit functions for this module.
> 
> ath12k_wmi_tlv_parse_alloc() and ath12k_wmi_tlv_parse() are merged
> together as it no longer allocs mem but returns the existing per-cpu one.
> 
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
> ---
> Small note on the new ath12k_wmi_tb variable. It is located in core.c and
> I did not exported it in core.h (nor is it exported with EXPORT_SYMBOL())
> as it is only used in wmi.c and should not be used by sub modules like
> ath12k_wifi7.

agree

or alternately you can define ath12k_wmi_tb in wmi.c and add alloc/free functions in
wmi.c, then call them in core.c. this helps modularity IMO?

either way works for me!

> 
> changes from v1:
>   - rebased on ath-next 27401c9b1432
>   - changed wording according to Jeff's comment
>   - moved alloc/cleanup to new module_init/exit functions in the
>     ath12k module as per Baochen's comment
> 
> changes from RFC:
>   - rebased on ath-next 8e0ab5b9adb7
>   - converted missing call sites ath12k_wmi_obss_color_collision_event()
>     & ath12k_wmi_pdev_temperature_event()
>   - changed alloc order & cleanup path in ath12k_core_alloc() as it seems
>     it confused people
>   - used sizeof(*tb) in ath12k_wmi_tlv_parse()
> ---
>  drivers/net/wireless/ath/ath12k/core.c |  22 +++
>  drivers/net/wireless/ath/ath12k/core.h |   1 +
>  drivers/net/wireless/ath/ath12k/wmi.c  | 181 ++++++-------------------
>  3 files changed, 68 insertions(+), 136 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index c31c47fb5a73..c9a5baf41845 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -34,6 +34,8 @@ module_param_named(ftm_mode, ath12k_ftm_mode, bool, 0444);
>  MODULE_PARM_DESC(ftm_mode, "Boots up in factory test mode");
>  EXPORT_SYMBOL(ath12k_ftm_mode);
>  
> +void __percpu * ath12k_wmi_tb;
> +
>  /* protected with ath12k_hw_group_mutex */
>  static struct list_head ath12k_hw_group_list = LIST_HEAD_INIT(ath12k_hw_group_list);
>  
> @@ -2321,5 +2323,25 @@ struct ath12k_base *ath12k_core_alloc(struct device *dev, size_t priv_size,
>  	return NULL;
>  }
>  
> +static int ath12k_init(void)
> +{
> +	ath12k_wmi_tb = __alloc_percpu(WMI_TAG_MAX * sizeof(void *),
> +				       __alignof__(void *));
> +	if (!ath12k_wmi_tb) {
> +		pr_warn("Failed to alloc ath12k WMI tb\n");

generally we don't log memory allocation failure

> +		return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +static void ath12k_exit(void)
> +{
> +	free_percpu(ath12k_wmi_tb);
> +}
> +
> +module_init(ath12k_init);
> +module_exit(ath12k_exit);
> +
>  MODULE_DESCRIPTION("Driver support for Qualcomm Technologies WLAN devices");
>  MODULE_LICENSE("Dual BSD/GPL");


[...]

> @@ -9205,7 +9117,7 @@ static void ath12k_wmi_event_teardown_complete(struct ath12k_base *ab,
>  	const void **tb;
>  	int ret;
>  
> -	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
> +	tb = ath12k_wmi_tlv_parse(ab, skb);
>  	if (IS_ERR(tb)) {
>  		ret = PTR_ERR(tb);
>  		ath12k_warn(ab, "failed to parse teardown complete event tlv: %d\n", ret);
> @@ -9215,11 +9127,8 @@ static void ath12k_wmi_event_teardown_complete(struct ath12k_base *ab,
>  	ev = tb[WMI_TAG_MLO_TEARDOWN_COMPLETE];
>  	if (!ev) {
>  		ath12k_warn(ab, "failed to fetch teardown complete event\n");
> -		kfree(tb);
>  		return;

nit: better to remove return as well

>  	}
> -
> -	kfree(tb);
>  }
>  
>  #ifdef CONFIG_ATH12K_DEBUGFS


