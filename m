Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23CAFC5AC67
	for <ath12k@archiver.kernel.org>; Tue, 11 Aug 2026 09:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LjUuYXbdt0kh11on79yWHneJJYx9txmfhYypn2EGBjQ=; b=aFFMOxQFp5Uu8dzGeHYlV3R/no
	nch4TA2tF5iE2PogCQoMzXExpv0lbrPfBls3360WsM51uu0L4lNV5BzvBDCDGqpnMFfOdQkHsEuJg
	nCemsKJ+4yau6eOi+o+W0q+H5L2Z/INxxmITNa2XxtN+eVMbBbPjpSjJfiYBsTqjT6AWlOq3uGrpS
	VGIdb71UFcnS1JwLtIh8oGcmUEzoluEGm25dBIcTOsf5QHxBrerOk8+gS/97+X4KmA7T59qhM6tDM
	GxM8DxKly+HH036qFpCBS/HwC/xglAzrdAFs3L/eTv4hgZ89xHvKdCuyefgZdQOBh14rjSY9HWBXH
	Dr3HLNZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtiTO-0000000Dh4Y-2Tyy;
	Tue, 11 Aug 2026 09:08:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtiTL-0000000Dh4B-2ZA6
	for ath12k@lists.infradead.org;
	Tue, 11 Aug 2026 09:08:36 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B7FxPS2937092
	for <ath12k@lists.infradead.org>; Tue, 11 Aug 2026 09:08:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LjUuYXbdt0kh11on79yWHneJJYx9txmfhYypn2EGBjQ=; b=OORMp2yKH/WfTg6A
	rGNXjxzrLHDLY3+uI6ea1nqX7qpH7qBSjq+GcgIpN+MigoVhsf6on7sKH7asMj0c
	NvFApJqu/nrpa4SQTckv5X/S5iaebjO/FxfpxX36QMlSNAoKeuxCYJDNcm9SGocf
	PbjlQkKbc9F6m5flBgc5xGGYT78F5A0QhkOg67jX0DNGcrYGEFpFWMxDgEWX8h4x
	MU+X57poVt0rVky2P6Cog/llWLzJojqaoCWC7xuw5FYzS1qIMC6WUsiiyfvFMGKb
	pmo/k33Do3mu3pQcEaaj7aw+LGKPiiYr/1eTTi7ogXfMsHbkrSVxeFjZXt31xJRH
	JrLfQw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjjv3a8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 11 Aug 2026 09:08:34 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8484f26852dso3114838b3a.1
        for <ath12k@lists.infradead.org>; Tue, 11 Aug 2026 02:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786439313; x=1787044113; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LjUuYXbdt0kh11on79yWHneJJYx9txmfhYypn2EGBjQ=;
        b=coPeSgOVg9RBsrjWc3yCOWbKEL+Io/XjaUdbIjwUVtlmThAcHpaNqG/Xjc70t2Gn2k
         II2xaiV1az+JRyEniautFZra1tzfKFCjK2VUI0PJ7PhARIvVAmh8TlWg3OIGMD2tECTm
         ER/zWZS+okSbNY/2J42xyMUAvfewjQwxjA4QuxpyNbjxXZMYVIx6VmiVhhSvt4ENnV4d
         /YoD+gkSgM+NnGnpICCGhPfeJPACeLru2Tm/ppTxKH3U/RokAXjss5VAjaUyqV+SslkA
         idNsftuhvIursekBhYQeWa8uZvIOv6Z2Bkg0yRH2UvLELfV0xMQPO1j+wKISEq7O0Eo+
         ovcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786439313; x=1787044113;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LjUuYXbdt0kh11on79yWHneJJYx9txmfhYypn2EGBjQ=;
        b=W9Kd1wQjWLsf8XwGWmXxgSSx/emUgzDgRk4I5gnn/4M2xiYGZqHUHAju8mxERW0slt
         1N7Kj3KkvvxPNIyPZwXhWi5TSUuUHvL/k7Gcd7SHimUFsJTCGciXylXmnYOFpp6FBSkt
         /ZA5nFEDR2qUgUbN8isYHsB1H2jIX+Jthp7f9Zo75ZgJS9QxIRpLK9lgzsUFeiqZHKUj
         GQEKrSl1JYSvH0uT09PYdZnRaG62GlCxd69hGgPB22vmslui2w0DwhvmmkGIZ+LTarEW
         M3uB0tjnDXjAIVZxTveDjrEEjiPaGvCzJTButBNiKGzd7/CKgZzWFdFt+LAb9yRIvMio
         a5Ag==
X-Forwarded-Encrypted: i=1; AHgh+RpW2jFhuiFxlPdpAnEdvG28VASEki4Um9/eYU1kngtmVM8Q44ie/G1JmFaSQ3U+gCjNQCJbK7I=@lists.infradead.org
X-Gm-Message-State: AOJu0YyyZahCqBHs0vRc35L5f/1wkNRZONBiR+MHNgWXBs276YsaVX83
	6lhti9PhnN5FAtUC29bqXhlMPhRogAD3OBqeZWThIG89r8V8LK2GrecTod8e7TdGhSm3x1pgB73
	tOAVGhv4+8UxV/7ZOjVoohIJulkuf+UvHLYcyPeuWMGNLOb2eom5zy2VrYgnBGRXt
X-Gm-Gg: AR+sD12xV2ztyIt7EYbxJ51DrNW26c3TfFKic39FWnuXQwAnqBlGkdTESIozf+jifv4
	X9USoTBXK1daWm1lolkbEzOZybCNR0O0gmzZ7JVTGC34a/RcSHQ3BF2c97WBahSdKs1G+Saqb6j
	xfnvSs09k2vyGbvzwAvqpkXZIA6Y+B/LKUQFsD//2Kz2Afk2Z+VwKG/AC6LAo0rl6bTqJcM8NBq
	HwGuOzNkdsHTVO9UtMSLp91O+zcZGQgwPvA9SZybKerik23tatZSaUg+9MIRdKCLo+UTLNaFG9e
	4Gd//fYEOUjckdaSzwGXkiLohxL5JXymkzLH7vd8a0MtO7c9pkLPLEZ1aA0AOybrj14sxgwJqqt
	JMo/x5DZesBweZVKjnzrjNVwZ/5GUUW0M9wasyinAMIrV21w=
X-Received: by 2002:a05:6a00:4c98:b0:84c:1cd2:142e with SMTP id d2e1a72fcca58-84fa8877ed2mr1890570b3a.23.1786439313077;
        Tue, 11 Aug 2026 02:08:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c98:b0:84c:1cd2:142e with SMTP id d2e1a72fcca58-84fa8877ed2mr1890513b3a.23.1786439312577;
        Tue, 11 Aug 2026 02:08:32 -0700 (PDT)
Received: from [10.152.206.38] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbed881a102sm565034a12.0.2026.08.11.02.08.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 02:08:32 -0700 (PDT)
Message-ID: <c66e03b5-4f49-45e6-ad18-96bb8370cead@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 14:38:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: add support to load shared
 firmware on multiPD
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        quic_kiranv@quicinc.com, baochen.qiang@oss.qualcomm.com
References: <20260811054316.518494-1-aaradhana.sahu@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260811054316.518494-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA3NSBTYWx0ZWRfX7BsGZqTWhVfs
 kaylA1UaXAEiVkua46xfBG4srLLhD9nxVC/77Fxm6+/jSCLbGL0miWqPWV09d+fTsjm8VRxLNDt
 3dZ/Hvvr7GeYJakLXfanUfnu63yYbvJWrx2wj9ODK7V4nC9/9dJwXxL102SXr83I6rREvNICnUq
 x7hBZ2mhw7E3DOh2yIdQsw02nf69tZmvGw/DiVqZwAD769GS9JVQmncS1g18Vm7GSIalovJD0Fx
 gz9JVxQrP8wmv7PwTInJKHBkzn3kRVmoBRkbc1UuGoPDev78gvl9c1QIFg3p1/rF0wmB00BWeH3
 raFdTvGVFGBNH6ABO3OT+DXVBdWhKsmUu1E15Zmal7So3U93rMZJekV3bVD5uvOszNungj7bTur
 bMezXnjHgIZzAy6M51IOLwh7ZAW3PQp9m/Fe3eOunRYJoT/vqlpzcABOh0Dt4y/L+WdJZWCoLPj
 tZo+iIvj2kJnuAWs+0A==
X-Proofpoint-ORIG-GUID: PNo2n0BnSSqKTfWrW4AoMg5KF--KnjD_
X-Authority-Analysis: v=2.4 cv=KLtqylFo c=1 sm=1 tr=0 ts=6a7ae692 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=dUED-PE9xrSGjoPRRc8A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: PNo2n0BnSSqKTfWrW4AoMg5KF--KnjD_
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA3NSBTYWx0ZWRfX+4NEiUWOMpt0
 TveuP6sOwnxE/m46klpthIYFxSTkpHEc+2LQNC3Q0G1fl2cKgh2xyKJ4lZhguCez2Ae5dPnz6ux
 cez44Q+ZF76RWZWi80FiQmbB6PIQQEg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_020835_799499_337B36EB 
X-CRM114-Status: GOOD (  30.20  )
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



On 8/11/2026 11:13 AM, Aaradhana Sahu wrote:
> IPQ5332 platform uses a MultiPD architecture where multiple firmware
> instances share common read-only code segments. The driver currently
> loads only the per-UserPD firmware, which leaves the shared read-only
> firmware unloaded.
> 
> Add support for loading the shared read-only firmware once before the
> UserPDs are powered up. The shared segment contains common code that is
> identical across all UserPDs and reduces the total firmware memory
> requirement.
> 
> Store the reserved memory mapping in struct ath12k_ahb_rproc_info so it can
> be shared by all UserPDs and mapped only once. Keep the mapping valid
> across UserPD power cycles, and unmap it when the last UserPD is removed.
> 
> Shut down the shared firmware from the rproc deconfiguration path when the
> last UserPD is removed.
> 
> Also, pass NULL for the reloc_base parameter because the driver uses fixed
> memory regions configured through device tree and does not need the
> adjusted physical address after relocation.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/ahb.c       | 166 +++++++++++++++++---
>   drivers/net/wireless/ath/ath12k/ahb.h       |   9 ++
>   drivers/net/wireless/ath/ath12k/wifi7/ahb.c |   3 +
>   3 files changed, 157 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
> index 0fc55c9169e1..3985f4e1c067 100644
> --- a/drivers/net/wireless/ath/ath12k/ahb.c
> +++ b/drivers/net/wireless/ath/ath12k/ahb.c
> @@ -347,35 +347,60 @@ static void ath12k_ahb_stop(struct ath12k_base *ab)
>   	ath12k_ce_cleanup_pipes(ab);
>   }
>   
> +static int ath12k_ahb_get_fw_load_region(struct ath12k_base *ab)
> +{
> +	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
> +	struct ath12k_ahb_rproc_info *rproc_info = ab_ahb->rproc_info;
> +	struct device *dev = ab->dev;
> +	struct resource res;
> +	int ret;
> +
> +	if (rproc_info->mem_region)
> +		return 0;
> +
> +	ret = of_reserved_mem_region_to_resource_byname(dev->of_node, "q6-region", &res);
> +	if (ret)
> +		return ret;
> +
> +	rproc_info->mem_phys = res.start;
> +	rproc_info->mem_size = resource_size(&res);
> +	rproc_info->mem_region = memremap(rproc_info->mem_phys, rproc_info->mem_size,
> +					  MEMREMAP_WC);
> +	if (!rproc_info->mem_region) {
> +		ath12k_err(ab, "unable to map memory region: %pa+%zx\n",
> +			   &res.start, rproc_info->mem_size);
> +		rproc_info->mem_phys = 0;
> +		rproc_info->mem_size = 0;
> +		return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +static void ath12k_ahb_put_fw_load_region(struct ath12k_ahb_rproc_info *rproc_info)
> +{
> +	memunmap(rproc_info->mem_region);
> +	rproc_info->mem_region = NULL;
> +	rproc_info->mem_phys = 0;
> +	rproc_info->mem_size = 0;
> +}
> +
>   static int ath12k_ahb_power_up(struct ath12k_base *ab)
>   {
>   	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
> +	struct ath12k_ahb_rproc_info *rproc_info = ab_ahb->rproc_info;
>   	char fw_name[ATH12K_USERPD_FW_NAME_LEN];
>   	char fw2_name[ATH12K_USERPD_FW_NAME_LEN];
>   	struct device *dev = ab->dev;
>   	const struct firmware *fw, *fw2;
>   	unsigned long time_left;
> -	phys_addr_t mem_phys;
> -	struct resource res;
> -	void *mem_region;
> -	size_t mem_size;
>   	u32 pasid;
>   	int ret;
>   
> -	ret = of_reserved_mem_region_to_resource_byname(dev->of_node, "q6-region",
> -							&res);
> +	ret = ath12k_ahb_get_fw_load_region(ab);
>   	if (ret)
>   		return ret;
>   
> -	mem_phys = res.start;
> -	mem_size = resource_size(&res);
> -	mem_region = devm_memremap(dev, mem_phys, mem_size, MEMREMAP_WC);
> -	if (IS_ERR(mem_region)) {
> -		ath12k_err(ab, "unable to map memory region: %pa+%zx\n",
> -			   &res.start, mem_size);
> -		return PTR_ERR(mem_region);
> -	}
> -
>   	snprintf(fw_name, sizeof(fw_name), "%s/%s/%s%d%s", ATH12K_FW_DIR,
>   		 ab->hw_params->fw.dir, ATH12K_AHB_FW_PREFIX, ab_ahb->userpd_id,
>   		 ATH12K_AHB_FW_SUFFIX);
> @@ -400,11 +425,13 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
>   
>   	/* Load FW image to a reserved memory location */
>   	if (ab_ahb->scm_auth_enabled)
> -		ret = qcom_mdt_load(dev, fw, fw_name, pasid, mem_region,
> -				    mem_phys, mem_size, &mem_phys);
> +		ret = qcom_mdt_load(dev, fw, fw_name, pasid, rproc_info->mem_region,
> +				    rproc_info->mem_phys, rproc_info->mem_size,
> +				    NULL);
>   	else
> -		ret = qcom_mdt_load_no_init(dev, fw, fw_name, mem_region,
> -					    mem_phys, mem_size, &mem_phys);
> +		ret = qcom_mdt_load_no_init(dev, fw, fw_name, rproc_info->mem_region,
> +					    rproc_info->mem_phys, rproc_info->mem_size,
> +					    NULL);
>   	if (ret) {
>   		ath12k_err(ab, "Failed to load MDT segments: %d\n", ret);
>   		goto err_fw;
> @@ -428,8 +455,9 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
>   		goto err_fw2;
>   	}
>   
> -	ret = qcom_mdt_load_no_init(dev, fw2, fw2_name, mem_region, mem_phys,
> -				    mem_size, &mem_phys);
> +	ret = qcom_mdt_load_no_init(dev, fw2, fw2_name, rproc_info->mem_region,
> +				    rproc_info->mem_phys, rproc_info->mem_size,
> +				    NULL);
>   	if (ret) {
>   		ath12k_err(ab, "Failed to load MDT segments: %d\n", ret);
>   		goto err_fw2;
> @@ -877,6 +905,7 @@ static struct ath12k_ahb_rproc_info *ath12k_ahb_rproc_info_alloc(struct ath12k_b
>   	rproc_info->rootpd_booted_by_driver = false;
>   	rproc_info->userpd[ab_ahb->userpd_id - 1] = ab_ahb;
>   	rproc_info->num_userpd = 1;
> +	rproc_info->shared_fw_loaded = false;
>   	init_completion(&rproc_info->rootpd_ready);
>   	ab_ahb->rproc_info = rproc_info;
>   
> @@ -961,6 +990,76 @@ static int ath12k_ahb_boot_root_pd(struct ath12k_base *ab)
>   	return 0;
>   }
>   
> +static int ath12k_ahb_load_auth_shared_fw(struct ath12k_base *ab,
> +					  struct ath12k_ahb_rproc_info *rproc_info,
> +					  const char *fw_name, u32 pasid)
> +{
> +	int ret;
> +

nit: move this empty line below after the declaration part.

> +	const struct firmware *fw __free(firmware) = NULL;


With that nit addressed

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

