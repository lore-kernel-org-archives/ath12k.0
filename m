Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A05C79FAD
	for <ath12k@archiver.kernel.org>; Tue,  8 Sep 2026 20:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hUD5wJmbUeVWlnxofgswz+6khrcWFjlSF1BO0IiRZYw=; b=ZtEF8TptA4+OCYnZrYwKO26EgK
	qXtsaCz9VIxsCMyv/v3LdF2/qjF2InkLgtp5wUnYk29JgwNx41wSg0Au6W9gm48SmtH5dQYj+NlR+
	6Dk/WkOYWc9vq3wBUNtt6HWc4SOp1FvYaz4KSOn9Iaiw1NfvuSQmCwh3C+cYeOyYMfEi/YzjfSdWY
	Cx53CXoMG0rzP9JaygKtjvgRKDobkvSrkKbMF46SASgscu8szGq8RQzXnHHr3wJ6968EN9TP4yDld
	2xlqYnwFNYcnbVTqpc+vX7bAwFYFQXlXloNAlffjLLL2T1Z1fNB9whblKvmMhakyPof/jrJv39KKW
	z9btQTTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x42rG-0000000AEkA-44TJ;
	Tue, 08 Sep 2026 20:55:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x42rE-0000000AEe7-1p4Z
	for ath12k@lists.infradead.org;
	Tue, 08 Sep 2026 20:55:57 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688GLnBj3502009
	for <ath12k@lists.infradead.org>; Tue, 8 Sep 2026 20:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hUD5wJmbUeVWlnxofgswz+6khrcWFjlSF1BO0IiRZYw=; b=JJ3YRMKo28ZtFcmU
	muwG8AHjvy4vTtS7IE/GkTdRSR+2Lwj3nX8fWMMWTT4Mdi5jtM/bMKthmt6V5dFs
	YSlP6BRt6bDhdm/guBcRlLSF3KxdSOaMOJBeUqBRAMrYmfMJ1DOWwvVL1bVF8Xif
	Xtjj8zcvi11ygQozsk02ZYGMvj+2Iq0jUsvGR7uTHmRnSnQN8BO6WvloeAmZAUUi
	CM227rggm/TshIqGppBqMeZoPNlSiCZNF18JwDe4TKrumAcqGgNPqOEkXP1g9xTo
	RV20pakGz6CTrc6U6KsaWWrH0KfQvKqXF0/RgGHeBds9HrnvEbNnSmWbsp/rm6Xv
	upol7A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjntph8j1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 08 Sep 2026 20:55:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3968dfff779so6935625a91.1
        for <ath12k@lists.infradead.org>; Tue, 08 Sep 2026 13:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788900939; x=1789505739; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hUD5wJmbUeVWlnxofgswz+6khrcWFjlSF1BO0IiRZYw=;
        b=Ie6zg09p3mA00iYYbmclWPj4eAYUL1GI1dODSBzeubh9H+/YYNK8Iw0fkGfWKQPfVn
         cOedS6Z7heJLrRPnWPBznH5U3ZnsF1EIZU8eUnycJ8aYoYIdg/fUv21/89ING4tSi9At
         a0FIX9lr/4S0XRzM6qfLu6Rk1fbnzAAf8Clh87TZNUV9awW4ssEGXI8f+3UfFMwXCNMK
         ZNhVp4hbt9N/bWWIX575wgi5WGHkhPgJ6/Ooe2atMshJPdyanX4PFP+yU+cA6OYcoE5a
         v104dgtjZqxRLEb13zYzibh0t1S7wCp//aq8a/xH9f1UG9ixUyEqezWPzUXwMgJq3W+/
         Q8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788900939; x=1789505739;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hUD5wJmbUeVWlnxofgswz+6khrcWFjlSF1BO0IiRZYw=;
        b=PtC9VEq6NiTi9ZDvT+OhZFFz8sF+OI3M56yWznthS8nun49V2cxidxva9cVuLbCzaj
         tx9fXN+CA2OVYmUXKNDxHNMGSdM36NMa46angRMyi6HhjTSMoD9OrcThljnOfceutsU5
         z+5/RtUqWuT8a+3wdwmqatumEgNLScOY1imnfvyGiUvzwQfHEuwT44HI5x4g33SuM+/B
         X2NIE/bVTwFf/6HHk7Tb7gtQPTFZs05wPhH4AFdfo/t4iuo+dVEPuzHklJnJGozb5mra
         PB1Y0glVrIe27m6XC4yKCAWnpp6tIWEH1XjKUsimyUeW8AjS5fLxecQ4moHNcVm92mlF
         +Cdw==
X-Forwarded-Encrypted: i=1; AKwUvBzV+3dD7JkrKwTw+P4xwyKqHSIAqTeAhJE8afPcBtmRYp+UyNmkHdTF5Vwy+aa/c3gh2uld7Wk=@lists.infradead.org
X-Gm-Message-State: AFuF++lheIY58avWO+sxoUxf1uczfCF6ZaEeMFUyTIUZh/7Cp0H0g3ua
	rRaNbNqXk6avbN0gx88bdwp/tzQ3oRB/GhP+TM16OvHSqo63gQEHNEimfJgE0V0Gsz6EQedPls+
	bLAY6h7Y/uuXGYxVICbUaKNfAmJQd6R0hLeaEpUxzdg4vRfWqBClebau70l4PX0So
X-Gm-Gg: AYBFou3MZzTqejMqcarW5HVTYEOQn9/bOsoRu7JQl+NPbiMTqoYLHiq300w0A7Ti3HC
	qz6dVWQaZ4xD8lkuXO+bKxmxrQQ3+VGhXBleTOLIN/1erSNklL/XgI0fESkBpmMouUffPrPNbRp
	S/ycpvPV/HtTcN82mqx3SPSN29Nc4c9Zce2qK06+qVhCS1HGINAL4HrbcLupHRJpUtoH+4YiMrR
	5NDgQf42djv/QSPta+VUBsVVwmlLQp5gbIc/KrqJJohws0BqOW6tD+nLRzuY6LtnHvkosNcmKqi
	yV6gtmw0041HTtW0TG7CMjQVmdYQDBSHLtj2dqSG2dpbT8Ssgphpnv6ZcQxZsZMNjNuR2R7kigD
	tTcEHJqoJ0+eOASH027rCEhISYXKRI5LZ4WmmqT4uP3r8eg4NNmh71MU=
X-Received: by 2002:a17:90b:4988:b0:398:ceed:b903 with SMTP id 98e67ed59e1d1-39b080364famr39979545a91.11.1788900938618;
        Tue, 08 Sep 2026 13:55:38 -0700 (PDT)
X-Received: by 2002:a17:90b:4988:b0:398:ceed:b903 with SMTP id 98e67ed59e1d1-39b080364famr39979514a91.11.1788900938138;
        Tue, 08 Sep 2026 13:55:38 -0700 (PDT)
Received: from [192.168.1.20] (163.sub-97-215-3.myvzw.com. [97.215.3.163])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33688cfc714sm20199915eec.20.2026.09.08.13.55.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 13:55:37 -0700 (PDT)
Message-ID: <4ed6651c-b1d2-458d-a210-5cc72954b48e@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 13:55:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: fix stale skb pointers after
 aligned TX payload shift
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20260818-ath12k-uaf-for-aligned-tx-v1-1-d6ae195b15e7@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20260818-ath12k-uaf-for-aligned-tx-v1-1-d6ae195b15e7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDIyOCBTYWx0ZWRfX3zQrsdsd1jEs
 wmqucYdzbgT3QnWD9BUHxBLuj/aLN0ort8KiY0Z0me20pXV/g84jUzGzAhfqbxYCKPrz/+dq5Tm
 W1U7RZRTm1ktPgt/Jyz7xaeLuDp9zxX5qyWRyeHZslpFbKE9BoKHO2Mvszgq+iVVLtYEZEf4Anc
 5arb9jVJTbNgyzAQwjeVTfitTu9YTeKvxpqLxAqq0Rs3lnXZH920YCw+lNpzD7uDcKhlyqcYCNZ
 Q3tgKqK90snWNlDXtXFEspmbpt2bwkJYVtQgBMiPc/Vgw2ho0qt7pj5h2G+gdt/6nhYOsNjD9hd
 Jxr2V69AI0IpEob3nQCZhWeLgWAb8oG4S2fwq2vGugYpEOWx7ccjqbxB/HR2wITy5Qs34r2dW8d
 sysXxYStn6ZuoX9a2jpNtUX/vrouJWv3PvZz8WeTW6eK0ETteRdtG6Ao8mDOzBqUpLYE/UVL03X
 wflR7KfPJDeOfgXD1sg==
X-Authority-Analysis: v=2.4 cv=N+AZ0W9B c=1 sm=1 tr=0 ts=6aa0764c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=7QqFuFOOHQR3GLhHC5mhXA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=BDGgVOeuysSBKt4bhqgA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 6KXNEt2M3ArPW7guw1QxtE1fErqXqGXv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDIyOCBTYWx0ZWRfX8V6nF2aiFVi7
 Z40X/t9pkRQkSZM56VKS63g7UMrO8gm2gILJ9xNPu/vi3djegxLQakYDkN7Ix0BZ5lVC+kCVPiK
 R1AegzQikuifUK06u46QAomtsZR1INg=
X-Proofpoint-GUID: 6KXNEt2M3ArPW7guw1QxtE1fErqXqGXv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080228
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_135556_597473_2BC8D022 
X-CRM114-Status: GOOD (  25.28  )
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

On 8/17/2026 6:44 PM, Baochen Qiang wrote:
> ath12k_wifi7_dp_tx() caches hdr, eth, and skb_cb from the skb before
> calling ath12k_dp_tx_align_payload(). That function may shift skb->data
> in place (when headroom or tailroom is sufficient) or reallocate the
> buffer entirely via skb_realloc_headroom(), freeing the original skb.
> In either case hdr, eth, and skb_cb are left pointing into stale memory.
> 
> After alignment, only hdr is refreshed, leaving eth and skb_cb stale.
> skb_cb is written immediately after (storing DMA addresses), and eth is
> re-read on every TCL ring retry via the tcl_ring_sel goto, so both
> accesses are use-after-free or stale-pointer bugs depending on which
> alignment path was taken.
> 
> Refresh eth (conditionally, to preserve the encap-mode distinction) and
> skb_cb alongside hdr after ath12k_dp_tx_align_payload() returns, so all
> three point into the live skb for all subsequent accesses.
> 
> Issue found during code review, compile tested only.
> 
> Fixes: 38055789d151 ("wifi: ath12k: use 128 bytes aligned iova in transmit path for WCN7850")
> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
> index d2749de44553..6b8430260238 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
> @@ -251,10 +251,15 @@ int ath12k_wifi7_dp_tx(struct ath12k_pdev_dp *dp_pdev, struct ath12k_link_vif *a
>  			goto map;
>  		}
>  
> -		/* hdr is pointing to a wrong place after alignment,
> -		 * so refresh it for later use.
> +		/*
> +		 * The payload may have been shifted or even the entire buffer may have
> +		 * been reallocated for alignment. In that case, hdr, eth and skb_cb
> +		 * are stale pointers. Refresh them now for later dereference.
>  		 */
>  		hdr = (void *)skb->data;
> +		if (eth)
> +			eth = (struct ethhdr *)skb->data;
> +		skb_cb = ATH12K_SKB_CB(skb);

My review agent notes there is an additional issue possible if alignment
causes a new skb to be allocated. If there are any error returns beyond this
point then the caller will double free the original skb instead of freeing the
new skb. this is because the caller doesn't know the original skb was replaced.

So I'm taking this patch as-is since it fixes issues when the buffer is
shifted, but we need an additional fix to correctly handle when the original
skb is freed and there is a subsequent error return.

>  	}
>  map:
>  	ti.paddr = dma_map_single(dp->dev, skb->data, skb->len, DMA_TO_DEVICE);
> 
> ---
> base-commit: 4fa10e991f77b4c929d1959900a6ed422b9e2ac5
> change-id: 20260811-ath12k-uaf-for-aligned-tx-a068d34b1548
> 
> Best regards,


