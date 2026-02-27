Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E7EFFD9E31
	for <ath12k@archiver.kernel.org>; Fri, 27 Feb 2026 03:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=blqHq1CQFlYM6Jj1SsBmIo5RfljPoikBCGHCPsyG8pM=; b=WgbD1M6Kx5ZciUw1ci9LZNXyNi
	0UwmcuHrULJvh8P1WUBn2bz+9FfiW8p5HlVDo+vNOwOT8e78djHOIvf/KVGeJrPrYHb1BlAh8JdR+
	aMzzRGLbK2z3zVABV/L9FM9iB1qtPmofLM2rf1WI2fdaFoN6biTAedUUshIU63CMCRf/63dnjcNiu
	GyOPgVo2v/dXcG+1fj71usQasLEVfej20VPWN7KqhqxuCa02KqxwBCr+2LAVZf89cxoROrLYwWVUP
	J5RDYNzX18ktzZ+Znk3NmVJiux+Du6qyoJirQY7RSmRCrZ5ddUkhIdggBDVBTAdVXpAWOiLwf3VX9
	KdxL9Qqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvoN3-00000007Zre-0Hkv;
	Fri, 27 Feb 2026 03:18:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvoN0-00000007ZrF-05zP
	for ath12k@lists.infradead.org;
	Fri, 27 Feb 2026 03:18:27 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2KA0f2440121
	for <ath12k@lists.infradead.org>; Fri, 27 Feb 2026 03:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	blqHq1CQFlYM6Jj1SsBmIo5RfljPoikBCGHCPsyG8pM=; b=PT1gbNYd6Ey0+KIE
	mOJYUKv6UZPfHaQIwxLmD+HE83WNTcHJpj+/Cs4XsxuVojs0rJTEAhaLeNbTwpTU
	CEyjCDCHa1J4frKRgG8qZueRb6dOmDkILv2FiI8UEzSyG7allszgcJl0gqH1i19x
	JkjmXzywMc69yRjNT7Ya6mSd5BZCqnbcke4Tn6SgrO3HG4HkTjEV9LAFYSWX/N0q
	b0so05JfbekZG+ntGsENbvgE2OR16WNBRypc7RQFuF1YKf8SoViC3kiRKg8sfgr7
	ZeWTTQKxKWX3OXrEV/N/7RPLIYDSlWw9WegjhUwwohmAwIszGZeHDj2ARlWAgKxH
	d8z3fA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cju4r1nvj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 27 Feb 2026 03:18:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8230d6d54a5so2163748b3a.1
        for <ath12k@lists.infradead.org>; Thu, 26 Feb 2026 19:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772162303; x=1772767103; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=blqHq1CQFlYM6Jj1SsBmIo5RfljPoikBCGHCPsyG8pM=;
        b=CQjy5S8FtH7iGeiTikwBe4fPrVNIriPoHIIfM0G8kEt8djOBQIyoZem72AXiV/Teih
         33CeIKUp7aOer4PrEcVJnvTEka3+kZlY0nmZMY1gHy4rCLDmxjuZP0yc6PhyRUh5xMHc
         mQ2Jo/Gmzj914T9BnG4y/RfgAE65IH8OeLFscH2o85D1RnfpQhGPYs3U5fvieTmNcE5o
         0eCAOVbKCdvrRXUKxO2bu1ZXd7olHxd94V5uN9Sm4aTxZWv7Bs9ClvHQs7PgR/FkMQtA
         /FS+CrX462H+HKs73cVkkyU9m7JNNFgbe/Evh2xgubzoeP0SzxmBR6niIObuCbb0NZpt
         HNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772162303; x=1772767103;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=blqHq1CQFlYM6Jj1SsBmIo5RfljPoikBCGHCPsyG8pM=;
        b=MC8ijksA2gqzHulGPyqcrIrLW2nXVx+NxAatkq9V9QXrXx3n17c2E+gWrRKIKnNJHX
         mH0Z5ywaD/NcVNFvGkK2wIwHbJq9POpRmUc5TAUKf6bFRiQYpUjEmidgjvkzGb6Ruugh
         g31XrhCH03b6ap53axJIJiVXGj+cfQpCa9q+5cSyIQtVZbKuoTZCNJGQAOi6nDsOUegI
         fBIIy7scd5PK2LBtPEV9WxMFK6xTHqDhuRlzjJ60ycMmLhBPC27QLYSiPVxzJHs5cQKz
         bOk0Grp2nzi/TFQFOgGPx1DnRqh9eZTkVNcussKV9ZCYwl3fPP5suFfDZs0t9r83tfLu
         58xQ==
X-Forwarded-Encrypted: i=1; AJvYcCUK5zH91+4lOh4My5xaYajDGT6CkWleYMC9KHFl6qhiHVxEqL9aJEqfEqm0g4R1S7vud05ialo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yym/9qZVgP//sYjHzGvNQ4K+1MesiM1fe1bKjGr9jDr5wUOXf2N
	QMYGWs2eanrPrErOCx1WbKxkoW+5WY8uqxMyMkLYrekZEujqBVOOYtj9NZg+Ee6qrVgbak4lhU4
	bXg+0Hh/qy3/WdOn0hxOVSWwLiS9p590mgHa4bXnV3LItHMLo5XHiClFQ0eiTWz8e
X-Gm-Gg: ATEYQzzCAYRvBi6nOiO0q5+ZB6KBiG8/CcBHaahqT2AsU9GZGcaa0s239T2cVjmj15D
	4UOJtK/QwFQPg8eXIGCnkUCrmR+vsg8T6habsi5DgtyZCah1thg2wpMwU8cNw3NPrOVzU2Ev40g
	KZZDVSuo7rsnUN8xMiaPUG/pZ9235w5kSTETzjMV8To7AmWLT93CN37LSGSF4aEOYLuaDIPzh48
	Xu0heZM+ypQ6ey0yjDvZz2VLaAqbM5QMCKj5G4uZXpRql7wKvzSbdgCwrDcxVGC8wiMwX1uBbZz
	lPE0kQqZasEr0XIETi/3+VjiNVyK1AakWsxXavtNZH9A44f02ea88gT7zBeTEzjDN6MqF4bAfTz
	F/1LpOXZUqVbtY/jc7CmqLL02o5iwD0AlYXzNpdrA/Gf02X5A32WDnbuY+TbvYsGebQf9t/In29
	QV1rz70sXUrmnGC5kNGw==
X-Received: by 2002:a05:6a00:6c9a:b0:824:a466:7470 with SMTP id d2e1a72fcca58-8273980607amr4767383b3a.17.1772162303424;
        Thu, 26 Feb 2026 19:18:23 -0800 (PST)
X-Received: by 2002:a05:6a00:6c9a:b0:824:a466:7470 with SMTP id d2e1a72fcca58-8273980607amr4767360b3a.17.1772162302811;
        Thu, 26 Feb 2026 19:18:22 -0800 (PST)
Received: from [10.133.33.12] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739ff37f1sm3641964b3a.40.2026.02.26.19.18.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 19:18:22 -0800 (PST)
Message-ID: <34974936-e75c-42db-9516-496e685d3dad@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 11:18:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/1] wifi: ath12k: avoid dynamic alloc when parsing
 wmi tb
To: Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
References: <20260226165517.1899045-1-nico.escande@gmail.com>
 <20260226165517.1899045-2-nico.escande@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260226165517.1899045-2-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDAyMiBTYWx0ZWRfX3c3BSlitwUMs
 9SiTkU/BVi+YChPKUb2G2WByBgs692RqyuIBWFC9fcKSVHyAI2HpoppLTF2iPKEvaP5R/sQdZjO
 4QCXlknZNeH2HKDQnb+wJ8nnwRGQH4C17C4P9XP10V4jLyKIlI76v9pX68Y/SHIK+M3Hv+z+R1D
 6ZJsLLLebq1IRRKhuOeuuAW4I9NsCVNNgUMH3jlKIKmkQRNqU4PQZozZAGruACiQKn46JHMUvDy
 ixqVU49+JhpoC3U3EwUctkj19LpIlaQ62V0LlCV+TeYJc1riwcq+kLB13tbtYuekhpWY1Pn/0Am
 AE92qOrHNbcQ0rf7a8fr2WEeoUfjlXSjAk+mBaoULuXbsYTe6oeNZQEBd9eRK7eFZJNHDRVofn0
 ex7i0QtSW77vaUVJxc1dF5QDPCVZnZDh6Mdn0TK+PwXmnLKdJyZBm7PqpPl/AMUlhQvWwa+cU67
 6lvSUoV5b3qRmGlNNLQ==
X-Proofpoint-GUID: 9e2wxlwpwE1sTHQJkf0_z5FgtBpt_IrU
X-Authority-Analysis: v=2.4 cv=KZzfcAYD c=1 sm=1 tr=0 ts=69a10d00 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=e9o9dv4KSLfa78nlzrgA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 9e2wxlwpwE1sTHQJkf0_z5FgtBpt_IrU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_04,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_191826_082242_8B5B8254 
X-CRM114-Status: GOOD (  20.35  )
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



On 2/27/2026 12:55 AM, Nicolas Escande wrote:
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
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
> ---
>  drivers/net/wireless/ath/ath12k/core.c |   7 +
>  drivers/net/wireless/ath/ath12k/core.h |   2 +
>  drivers/net/wireless/ath/ath12k/wmi.c  | 170 ++++++-------------------
>  3 files changed, 49 insertions(+), 130 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index 9d6c50a94e64..961c9df69aa1 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -2237,6 +2237,7 @@ void ath12k_core_free(struct ath12k_base *ab)
>  	timer_delete_sync(&ab->rx_replenish_retry);
>  	destroy_workqueue(ab->workqueue_aux);
>  	destroy_workqueue(ab->workqueue);
> +	free_percpu(ab->wmi_tb);
>  	kfree(ab);
>  }
>  
> @@ -2249,6 +2250,11 @@ struct ath12k_base *ath12k_core_alloc(struct device *dev, size_t priv_size,
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
> @@ -2296,6 +2302,7 @@ struct ath12k_base *ath12k_core_alloc(struct device *dev, size_t priv_size,
>  err_free_wq:
>  	destroy_workqueue(ab->workqueue);
>  err_sc_free:
> +	free_percpu(ab->wmi_tb);
>  	kfree(ab);
>  	return NULL;
>  }
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index 990934ec92fc..378573a100e8 100644
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
> @@ -934,6 +935,7 @@ struct ath12k_base {
>  	struct device *dev;
>  	struct ath12k_qmi qmi;
>  	struct ath12k_wmi_base wmi_ab;
> +	void __percpu *wmi_tb;

instead of allocating it per device, how about making it global and allocating once when
loading driver. This way we may save some memory in case where more than one devices get
probed?

