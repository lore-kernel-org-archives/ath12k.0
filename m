Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C724F5A8D9
	for <ath12k@archiver.kernel.org>; Tue, 21 Apr 2026 02:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sEHBkFzrKWkCCiqEO5KBaKRSVTv6hNVHQcN9eRtDTRg=; b=04JRhTzk7opBt88eKkwOCzdBYC
	VPW11q6HD3m4qbcArmPSmnY6PQvlY+hM7vLNk9uaJMAQY8VEVMPqabvVXmoG7SvyTs5JAOSUoT5lk
	LiEUNq19O/DwV1iA2VMV0MRTq9mV4mAQcf6LLbDQ+HDW+9wGZcVk3jUlEkD5e5qDnuufcs3Wp3H1Q
	XxQvgLHzRoPiSvRJCRIyPjVdi/sP3wBeyE5t1wOWh4eMlnXlostG5s+AOOFqO+Dsg7nPosKSv7ut3
	Y0q7TKS4m+PSwTnouCkd4GrYsQ/6HIEcbwA+lwPpU8a2lqOXf0b+XXA2ikxq4skvM+PdjIeIv+4/m
	ohIVuT8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF1Hh-00000007xxB-0TaC;
	Tue, 21 Apr 2026 02:56:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF1He-00000007xwg-1aGI
	for ath12k@lists.infradead.org;
	Tue, 21 Apr 2026 02:56:19 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KJOciW1014344
	for <ath12k@lists.infradead.org>; Tue, 21 Apr 2026 02:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sEHBkFzrKWkCCiqEO5KBaKRSVTv6hNVHQcN9eRtDTRg=; b=o9TE/HKOuFtD+5zv
	lx5uzoPoborH9eDlwu84CEJVAabpdR7CqrZ10Fiv3/a2gRxhz53IR1tta0UundZ+
	ofy4CGt++wO7Ca+GA3SqqcY0yRhXQpkFGXLZg5BFkwSXTp3eRQN3wRcpvcg8rYkr
	Ja6MBHHzTVKXMJeZr1fE/r25FTonZ21EpzNdONBvqqtJDBdjnio+5ikgSWdQ0w02
	MAfXRUmR1UaJ0QnCfc3/kbxtCu6Uv0gZVIiJQpvFLUtHCIp678MXuPyoEkQs5xoB
	HeaUNQjxZoUPn/hPcslU+9M5N8knJjeGb/j/3f0+rS0pLgY5Y9wqJ8HoTe4NGYc1
	siR6MQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnt9014en-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 21 Apr 2026 02:56:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b249975139so69946355ad.0
        for <ath12k@lists.infradead.org>; Mon, 20 Apr 2026 19:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776740177; x=1777344977; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sEHBkFzrKWkCCiqEO5KBaKRSVTv6hNVHQcN9eRtDTRg=;
        b=Sbu1ZCq6TZDjD0Di82PuXVjGKW9tVOtikYNwPF5F4oXbMYXzQW/4gI8BtToiwR4UJK
         pDfIoswQiuTjIE0vySms0Ue5/AhVxUq7fQ4if9xvr55TI76oe+9XitKqfLpUzxWjX3HQ
         TM6p26VB/cJEfuxWMX1ggAHbv5VJ1KXJiX7GdB1tYUGcCYvrMCM8WpOYoSQBZBONIWku
         KTlOu0t1DrQOfqKo2JAuzAXp4Rzlrzqj7gn+eOzx2/8hllyTsO16kYh59f/0J6rSY9P3
         1Fu+X9ltwwTivJVA8CrV1vmA7+Zc9dyVNpm1AsA6jUdeCFl0+D0D0sT9szLXgriq92Rh
         rObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776740177; x=1777344977;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sEHBkFzrKWkCCiqEO5KBaKRSVTv6hNVHQcN9eRtDTRg=;
        b=VEu09cO1ng0UShDmmVPTld7fZsCW+qM5jK4Kl2K9IoKC6rUSPHhip53LvBkk6lIeYI
         +0l6xKQ92ZkFTp2jLBad+RxhyoGcXuy71m5hfxzARLB7frT9MYi/64p+c6yvuhOThie0
         +qXAylRH9wZYQNneqnNgU/xKh9o86d66s8hllGU1AKdhc3is2cyq+aQaVv/e3sDUxcvY
         7vVe5Un58hu9ptYRfUmsS2718zNZcP2Cd4fskdyenEVRYcppvFDvOQnTeaRNj6t76oG6
         M/MTUe82GFQ83T+i0k7ApfCMbBkAR/fSnQM9+s9ibeezqX1/2RRpPH4usLnbQ+A/ATcE
         J/dQ==
X-Forwarded-Encrypted: i=1; AFNElJ/8jAiLqHM81lRgXAxRE1nu4dkfbuwNlu52e2NiWl0PZSgKgqxF5jOQk3rUUVPehMGeppCy5Y8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzAQH5RGxJr9j3yV7gc/ARZuIGEykni1dpiiacvQl+0xnPoTSFL
	XIvjGFJ/RY3dINQXvOrGx9tyXSPT4iu52EChn4c6s1cAStZ0gX4CF+PsOupH1hTH+HBz2cNMTFz
	97BYPnqDm/i1C8mCSICJB3P5XjJOd8JlywYRztopuScm0o6hMU2/DiQL+m4GYuFZP
X-Gm-Gg: AeBDiet2izaPP4rDRhjbLT34nuuDLRm49jWL9UY2jwFAlT31peasE0eaXG6J41Hx/Og
	X/naDBmNeE+mRS4ixn9YDenJ2TGbis53Bz+13FDJk95FxAZCJb0RaS6VjZr68WmL/ZQaqCg7yfV
	OwcvgB/IiWnjxt1L7Qblpu67bixG7xFyzWHl/eSnGb1ZasSfj9pWdGERfP5JsWOkckcjW22rPXp
	Tc7W1w0SNEnFi8VI5JrTYE5P4tJdxcGNSEYq/sVRU8DR0T0te8LhAQpFEN1w+o4QcihmkeqVaxS
	plYBB1D7fJZwHfOxv6qW9nQtE5FK15XTtRqD+vodgCWXUgUfQHj1+Pt2tFIQa6KQSgZAzKJ5WPB
	gDkjpzX1l7/sw+hDNUXBJz7jTCRTnc03kBoIRRPh5djmTUFOqfwBLq/ZyjVryaVXScEDeWu9R7u
	ad8EP7PDnGzZnsbAqK6dXgPNjyDMEb3w==
X-Received: by 2002:a17:903:1a88:b0:2b2:4c92:c389 with SMTP id d9443c01a7336-2b5f9fe62femr175063525ad.34.1776740176953;
        Mon, 20 Apr 2026 19:56:16 -0700 (PDT)
X-Received: by 2002:a17:903:1a88:b0:2b2:4c92:c389 with SMTP id d9443c01a7336-2b5f9fe62femr175063095ad.34.1776740176332;
        Mon, 20 Apr 2026 19:56:16 -0700 (PDT)
Received: from [10.133.33.231] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0dafcsm121756405ad.52.2026.04.20.19.56.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 19:56:15 -0700 (PDT)
Message-ID: <f77c1e60-d0c4-4220-ba13-fd649a2edbef@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 10:56:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: fix OF node refcount imbalance in
 WSI graph traversal
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260410071300.2323603-1-aaradhana.sahu@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260410071300.2323603-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KfbidwYD c=1 sm=1 tr=0 ts=69e6e751 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=UU95pK5i7bRfzSGnuscA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 9VwADCT6hoogZjALRao3rDFVfgmL_j12
X-Proofpoint-GUID: 9VwADCT6hoogZjALRao3rDFVfgmL_j12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDAyNyBTYWx0ZWRfX29WXvWgU5THB
 bdUaSmgoZRrJzGdyurHXyy2fzFFIhpoJnOnYitqEpMHtgarPQ0H3I3uXUDGFcktWvnpDLwJlHc2
 eBV7geRM98MZdJdbM0ZVZ8CvhOccVWDWq1xiCsySULcZ5jJl9QhlOmLj04+ypCMoLVnAkDm30Rq
 MtRsDDrjcChT6F5mUAqGizAbLSarCrPUeOL4TbkPMPk/RDyXeYQKmE18f0oTvARz5V58Tc8i8WY
 wZuQsnjlmtbg/v8NIaTVQ0mzDv/QZYRNFH24GAmuIEys1I8YG3udH9f09swWxMf3rBay38M4/vt
 PiCARsGvqGxTbhNzJpM0VpsfOOOP2+72/n03hI8IOjTL4Oj585FAZRKv8az2TpkjMbMSVfhOLEa
 yvxNHg7Rzlo/cA4v5vs1ah5eNNR52zoE1wQKSHuLmvLkad4YUwoE9bLh4iz2eo4kafsVhvWiEvp
 UnnMalxZB0w7kN9EN4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_05,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_195618_443114_A64C6CFB 
X-CRM114-Status: GOOD (  26.31  )
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



On 4/10/2026 3:13 PM, Aaradhana Sahu wrote:
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
>  show_stack+0x18/0x24 (C)
>  dump_stack_lvl+0x60/0x80
>  dump_stack+0x18/0x24
>  of_node_release+0x164/0x1a0
>  kobject_put+0xb4/0x278
>  of_node_put+0x18/0x28
>  ath12k_core_init+0x29c/0x5d4 [ath12k]
>  ath12k_ahb_probe+0x950/0xc14 [ath12k]
>  platform_probe+0x5c/0xa4
>  really_probe+0xc0/0x3ec
>  __driver_probe_device+0x80/0x170
>  driver_probe_device+0x3c/0x120
>  __driver_attach+0xc4/0x218
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
> ---
>  drivers/net/wireless/ath/ath12k/core.c | 77 ++++++++++++++++----------
>  1 file changed, 48 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index 2519e2400d58..980a12fb2c6e 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -1838,10 +1838,22 @@ static struct ath12k_hw_group *ath12k_core_hw_group_alloc(struct ath12k_base *ab
>  	return ag;
>  }
>  
> +static void ath12k_core_free_wsi_info(struct ath12k_hw_group *ag)
> +{
> +	int i;
> +
> +	for (i = 0; i < ag->num_devices; i++) {
> +		of_node_put(ag->wsi_node[i]);
> +		ag->wsi_node[i] = NULL;
> +	}
> +	ag->num_devices = 0;
> +}
> +
>  static void ath12k_core_hw_group_free(struct ath12k_hw_group *ag)
>  {
>  	mutex_lock(&ath12k_hw_group_mutex);
>  
> +	ath12k_core_free_wsi_info(ag);
>  	list_del(&ag->list);
>  	kfree(ag);
>  
> @@ -1867,52 +1879,59 @@ static struct ath12k_hw_group *ath12k_core_hw_group_find_by_dt(struct ath12k_bas
>  static int ath12k_core_get_wsi_info(struct ath12k_hw_group *ag,
>  				    struct ath12k_base *ab)
>  {
> -	struct device_node *wsi_dev = ab->dev->of_node, *next_wsi_dev;
> -	struct device_node *tx_endpoint, *next_rx_endpoint;
> -	int device_count = 0;
> -
> -	next_wsi_dev = wsi_dev;
> +	struct device_node *next_wsi_dev;
> +	int device_count = 0, ret = 0;
> +	struct device_node *wsi_dev;
>  
> -	if (!next_wsi_dev)
> +	wsi_dev = of_node_get(ab->dev->of_node);
> +	if (!wsi_dev)
>  		return -ENODEV;
>  
>  	do {
> -		ag->wsi_node[device_count] = next_wsi_dev;
> +		if (device_count >= ATH12K_MAX_DEVICES) {
> +			ath12k_warn(ab, "device count in DT %d is more than limit %d\n",
> +				    device_count, ATH12K_MAX_DEVICES);
> +			ret = -EINVAL;
> +			break;
> +		}
> +
> +		ag->wsi_node[device_count++] = of_node_get(wsi_dev);
>  
> -		tx_endpoint = of_graph_get_endpoint_by_regs(next_wsi_dev, 0, -1);
> +		struct device_node *tx_endpoint __free(device_node) =
> +					of_graph_get_endpoint_by_regs(wsi_dev, 0, -1);
>  		if (!tx_endpoint) {
> -			of_node_put(next_wsi_dev);
> -			return -ENODEV;
> +			ret = -ENODEV;
> +			break;
>  		}
>  
> -		next_rx_endpoint = of_graph_get_remote_endpoint(tx_endpoint);
> +		struct device_node *next_rx_endpoint __free(device_node) =
> +					of_graph_get_remote_endpoint(tx_endpoint);
>  		if (!next_rx_endpoint) {
> -			of_node_put(next_wsi_dev);
> -			of_node_put(tx_endpoint);
> -			return -ENODEV;
> +			ret = -ENODEV;
> +			break;
>  		}
>  
> -		of_node_put(tx_endpoint);
> -		of_node_put(next_wsi_dev);
> -
>  		next_wsi_dev = of_graph_get_port_parent(next_rx_endpoint);
>  		if (!next_wsi_dev) {
> -			of_node_put(next_rx_endpoint);
> -			return -ENODEV;
> +			ret = -ENODEV;
> +			break;
>  		}
>  
> -		of_node_put(next_rx_endpoint);
> +		of_node_put(wsi_dev);
> +		wsi_dev = next_wsi_dev;
> +	} while (ab->dev->of_node != wsi_dev);
>  
> -		device_count++;
> -		if (device_count > ATH12K_MAX_DEVICES) {
> -			ath12k_warn(ab, "device count in DT %d is more than limit %d\n",
> -				    device_count, ATH12K_MAX_DEVICES);
> -			of_node_put(next_wsi_dev);
> -			return -EINVAL;
> +	if (ret) {
> +		while (--device_count >= 0) {
> +			of_node_put(ag->wsi_node[device_count]);
> +			ag->wsi_node[device_count] = NULL;
>  		}
> -	} while (wsi_dev != next_wsi_dev);
>  
> -	of_node_put(next_wsi_dev);
> +		of_node_put(wsi_dev);
> +		return ret;
> +	}
> +
> +	of_node_put(wsi_dev);
>  	ag->num_devices = device_count;
>  
>  	return 0;
> @@ -1983,9 +2002,9 @@ static struct ath12k_hw_group *ath12k_core_hw_group_assign(struct ath12k_base *a
>  		    ath12k_core_get_wsi_index(ag, ab)) {
>  			ath12k_dbg(ab, ATH12K_DBG_BOOT,
>  				   "unable to get wsi info from dt, grouping single device");
> +			ath12k_core_free_wsi_info(ag);
>  			ag->id = ATH12K_INVALID_GROUP_ID;
>  			ag->num_devices = 1;
> -			memset(ag->wsi_node, 0, sizeof(ag->wsi_node));
>  			wsi->index = 0;
>  		}
>  
> 
> base-commit: ae530e0b135102c5fc08e64c39e7a18564a52b3e

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

