Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23FAEC0480
	for <ath12k@archiver.kernel.org>; Tue,  3 Mar 2026 09:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KxOgyaMghsriEWrvsa0wIkvt92DbcaG4hloSYsoTz3s=; b=IjBwIkRvZV9Ooszgtpc7ipGzbc
	9GMx0I1UYlNiIn+Khmj92sZ8OnzgwKrZtxgqxhbA5Ra7jZxnDO87s8v+svODiCcPq6gv9NSct9pvT
	cCILwlIaqhF1/r5YJruCPb/Olv402UjwM7iDUQ6BE7JvwFb8PlIvyVAkOf611lQ8FzaVXKDf0BuQ5
	0x/Y20eA7+9nQi++QGhCyqsZZopbu/zkhBUXGrRD1hai3TbJavODevMY+vqnpzrTUcLdqQY+V+uDy
	ZJ9/jmm41/aIwLjo6zmemh5NBxqZ9jIFAOAW23MJUGiBUeR02g86S70YDk5Xc7iH0BvsA628adKaK
	nhMuqV8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxMRd-0000000EufX-1l7i;
	Tue, 03 Mar 2026 09:53:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxMRb-0000000Euf9-0rkO
	for ath12k@lists.infradead.org;
	Tue, 03 Mar 2026 09:53:36 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239mtsN2773527
	for <ath12k@lists.infradead.org>; Tue, 3 Mar 2026 09:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KxOgyaMghsriEWrvsa0wIkvt92DbcaG4hloSYsoTz3s=; b=O87ehLtx8JAxG/T3
	hxqQqtmIdgbPvMrpcx/kph3wM7FEO63cnJFYCAnXq8CbwjRvIJGGgTV8EfQJ1ozB
	/tfMH3kcUxDS3x63FuvcpGBcvxH1lRWwz8NcsccwEkw27HsYNoDSa1i1gc/3Sh64
	Q07WBN/WHMvRQNVQq5SZNvmwJpE0StIysGdtiEViKFUN8VOOlw0drIbInHDNNWzR
	dxiJqt0j46Ir/eSDO8kOb0mnBI0sGqB/LSXpXVH0lKf+1qmfdYGtZM2mrIjOeJE8
	mrKJ+WzD5Uif2SqkexjTJtTpchyPKcXB6HQwi++CvPC4rM1znZA0q0TFQrYIlN+h
	CiDohw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnsjm0x7g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 03 Mar 2026 09:53:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2adb1bdf778so55638115ad.3
        for <ath12k@lists.infradead.org>; Tue, 03 Mar 2026 01:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772531613; x=1773136413; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KxOgyaMghsriEWrvsa0wIkvt92DbcaG4hloSYsoTz3s=;
        b=gqDe2KFtTyDicq8jOwrdncfPvJWn0r+i4SSM1xKRanpzGur9/gwZ6dnO66cAN//Qvc
         litrQrm5422jURatdeH0JjcQ1BaYEbZPIQF6odhSERohOqBpRF0lYsV03coYufp5a+1U
         yGbV9s5AUUvq+J6If20mWcO9nhxGsHifAVsXtYq86u4L73iv02Gbwp3qqp/6TBkvcs+y
         jQkdd6FlLpBM9MnkPvMmGu9wHJ2R2BOCGgzczgBDcQLHt9VNL2MOL8hrT/b0lcJtzD2z
         0UgkoIg1rSsJ6wmMZZG5DMhPPmRcCZQCEE0CkyuR4XnZmTCZJbagseo6/LgVm9vPGv9B
         Oa6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772531613; x=1773136413;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KxOgyaMghsriEWrvsa0wIkvt92DbcaG4hloSYsoTz3s=;
        b=mGagVCGuDaclBK+pm/pT0S/2LTHpnSluk50lPvVAwvLbe8DV2Q/W3XMKBVy5rpuq/Y
         RRkHewW4eUFBIEPfcLnYr0kiwCHlCgSPYM+v3I/uF+7A8hwr1eAe/MjOpFHNftCvtkYH
         /pB4U1lWwh5xPDb9kUwpnPedqADWHRnSKBu1EKfydv64iaRZKIUpe9+1aa6eG4/iIGBX
         CcGwUY0vs+pkzKanggZhR26zfju44ViXxNx7udxTQJAjeiZk7brHHsvgWCXlapzTizNn
         GSW/x5sRYsj28ASc1HSvzF0cvGy/ok0Ke/k+j9cgVwtLQ1sN6pMourDxsV64aGlvuvCM
         Qp8g==
X-Forwarded-Encrypted: i=1; AJvYcCX0HAMvKHmsoGMQrr7mm8D66UI7F57bMEH8FJVwWw6hMdOJU2cv2zPT0uhrc098KcoplEOBr94=@lists.infradead.org
X-Gm-Message-State: AOJu0YwcIxsOtedQa65YUz2on6DHePNYVUiDCY8gzkJmd4G5KUBKaisE
	WLX1fMqwGKE1XOeIYVzrDknCDD3SYOD1b+6Dz4Fk29LxFZI5c9TnNGP2jHGriZlfn52UepES+HL
	Cw6AXThvMJocrEGjkXBUlVcOSk07aKpD6otCmgyFa+GmlhDXSQesLl2S8Bibi/ADUGpmd5jvQ
X-Gm-Gg: ATEYQzyHSxFVwPA+Zhl0Oy/6DALMLHSO4Dr1cun+XKaQf483vTelTARG50tcHniTyCS
	yfuAOZSRc+TcrjxFcH8q6ylWF8msJ+1qqkLQR1LdXlKluEsu8EOWZn8HNht8NLH1PQYK/Pj72ba
	urDkDHw4FVALKc7ZPbItyVSRx5Ofb5FAmGTBBzsXZBj6qsV++3S0jpuzl0o6sj29C/Tl+uJadHf
	iL7iboq7BccjcA1DhzNIKu/fq2XrjR7S2JYgn4AXf4+UCjguqZ668Y8k97TyHp5LspjHLBK+etz
	OSav7X9AVxiHsNxRe6MadSZJE28BQgIkEyTsH0naOd4z8l0d88qRbLAHl8d+umAthGujJP5Nemk
	Bk8Q6UOGdjYzGUXU7NUxjFXLXUYX/D3ErOwXwcoPA+mH0CFIgoEgbcWXRPaoksA==
X-Received: by 2002:a17:903:1c3:b0:2ae:4f90:3245 with SMTP id d9443c01a7336-2ae4f9033f1mr81102835ad.15.1772531613310;
        Tue, 03 Mar 2026 01:53:33 -0800 (PST)
X-Received: by 2002:a17:903:1c3:b0:2ae:4f90:3245 with SMTP id d9443c01a7336-2ae4f9033f1mr81102605ad.15.1772531612700;
        Tue, 03 Mar 2026 01:53:32 -0800 (PST)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae54e394aasm66577135ad.77.2026.03.03.01.53.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 01:53:32 -0800 (PST)
Message-ID: <38281321-2d91-4dc0-a3c2-1f48d87fb0e2@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 15:23:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: Re: [RFC PATCH 1/1] wifi: ath12k: avoid dynamic alloc when parsing
 wmi tb
To: Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
References: <20260226165517.1899045-1-nico.escande@gmail.com>
 <20260226165517.1899045-2-nico.escande@gmail.com>
Content-Language: en-US
In-Reply-To: <20260226165517.1899045-2-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kUKrZN7nYIjxtX2ebWBObqMPVb6MgZ3x
X-Authority-Analysis: v=2.4 cv=GIUF0+NK c=1 sm=1 tr=0 ts=69a6af9e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=9VtqI1d5MRHreyY9jgQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: kUKrZN7nYIjxtX2ebWBObqMPVb6MgZ3x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA3MyBTYWx0ZWRfX3NadPEHPI5Rd
 VJ5fExo5lOAivyEsqzZL9QRX2MUWcRBp3M4iRmKd2FCfylCUSJPI3P5F9tcActXxowA5PJgQMUy
 07VSjimrIUfKb/6knVQvHR2oGRsDJGoNAOlwZXDqNVcAtDZWlbE4UIcGhoHa7fDiAABmqrjrdwf
 IkQ8w99dWsJrDJ3jUFG5/iSm6Wgw86PLYIxHS3/Z8iBI3ETwy5q+vuwXPfgIp8Dgn5h9ex00z5e
 12pDkl6+ifgxX1i10/5lJGMhLDGlcMt+68Br4vURk3fSSLitIfF7eAD4B4TDK/MNqGv8j5mImss
 QYPs6EjRm6o4RBJpXviSlKOgjH86RtNcV64n1/K5RusUPQuFtC7xYeW1Cn2EffdaCphNGL2UTsr
 ytDDfy0cCWbhjRoaNh0csbOs+VUOtHHsqZc3LxmpQK5LekUL/yxHl9QhbeX17cGUTg8MlMpnXEm
 YYiVSYaz0gsifmrrCIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_015335_250711_06A1D042 
X-CRM114-Status: GOOD (  25.13  )
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



On 2/26/2026 10:25 PM, Nicolas Escande wrote:
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
>   drivers/net/wireless/ath/ath12k/core.c |   7 +
>   drivers/net/wireless/ath/ath12k/core.h |   2 +
>   drivers/net/wireless/ath/ath12k/wmi.c  | 170 ++++++-------------------
>   3 files changed, 49 insertions(+), 130 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index 9d6c50a94e64..961c9df69aa1 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -2237,6 +2237,7 @@ void ath12k_core_free(struct ath12k_base *ab)
>   	timer_delete_sync(&ab->rx_replenish_retry);
>   	destroy_workqueue(ab->workqueue_aux);
>   	destroy_workqueue(ab->workqueue);
> +	free_percpu(ab->wmi_tb);
>   	kfree(ab);
>   }
>   
> @@ -2249,6 +2250,11 @@ struct ath12k_base *ath12k_core_alloc(struct device *dev, size_t priv_size,
>   	if (!ab)
>   		return NULL;
>   
> +	ab->wmi_tb = __alloc_percpu(WMI_TAG_MAX * sizeof(void *),
> +				    __alignof__(void *));
> +	if (!ab->wmi_tb)
> +		goto err_sc_free;
> +


we could move this allocation after workqueue_aux alloc and avoid 
free_percpu(ab->wmi_tb); in the label

>   	init_completion(&ab->driver_recovery);
>   
>   	ab->workqueue = create_singlethread_workqueue("ath12k_wq");
> @@ -2296,6 +2302,7 @@ struct ath12k_base *ath12k_core_alloc(struct device *dev, size_t priv_size,
>   err_free_wq:
>   	destroy_workqueue(ab->workqueue);
>   err_sc_free:
> +	free_percpu(ab->wmi_tb);
>   	kfree(ab);
>   	return NULL;
>   }
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index 990934ec92fc..378573a100e8 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -19,6 +19,7 @@
>   #include <linux/average.h>
>   #include <linux/of.h>
>   #include <linux/rhashtable.h>
> +#include <linux/percpu.h>
>   #include "qmi.h"
>   #include "htc.h"
>   #include "wmi.h"
> @@ -934,6 +935,7 @@ struct ath12k_base {
>   	struct device *dev;
>   	struct ath12k_qmi qmi;
>   	struct ath12k_wmi_base wmi_ab;
> +	void __percpu *wmi_tb;
>   	struct completion fw_ready;
>   	u8 device_id;
>   	int num_radios;
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index 404f031a3c87..9ccc10c07c21 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -289,29 +289,19 @@ static int ath12k_wmi_tlv_iter_parse(struct ath12k_base *ab, u16 tag, u16 len,
>   	return 0;
>   }
>   
> -static int ath12k_wmi_tlv_parse(struct ath12k_base *ar, const void **tb,
> -				const void *ptr, size_t len)
> -{
> -	return ath12k_wmi_tlv_iter(ar, ptr, len, ath12k_wmi_tlv_iter_parse,
> -				   (void *)tb);
> -}
> -
>   static const void **
> -ath12k_wmi_tlv_parse_alloc(struct ath12k_base *ab,
> -			   struct sk_buff *skb, gfp_t gfp)
> +ath12k_wmi_tlv_parse(struct ath12k_base *ab, struct sk_buff *skb)
>   {
>   	const void **tb;
>   	int ret;
>   
> -	tb = kcalloc(WMI_TAG_MAX, sizeof(*tb), gfp);
> -	if (!tb)
> -		return ERR_PTR(-ENOMEM);
> +	tb = this_cpu_ptr(ab->wmi_tb);
> +	memset(tb, 0, WMI_TAG_MAX * sizeof(void *));

prefer sizeof(*tb) over sizeof(void *)

>   
> -	ret = ath12k_wmi_tlv_parse(ab, tb, skb->data, skb->len);
> -	if (ret) {
> -		kfree(tb);
> +	ret = ath12k_wmi_tlv_iter(ab, skb->data, skb->len,
> +				  ath12k_wmi_tlv_iter_parse, (void *)tb);
> +	if (ret)
>   		return ERR_PTR(ret);
> -	}
>   
>   	return tb;
>   }
> @@ -5714,7 +5704,7 @@ static int ath12k_pull_vdev_start_resp_tlv(struct ath12k_base *ab, struct sk_buf
>   	const struct wmi_vdev_start_resp_event *ev;
>   	int ret;
>   
> -	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
> +	tb = ath12k_wmi_tlv_parse(ab, skb);
>   	if (IS_ERR(tb)) {
>   		ret = PTR_ERR(tb);
>   		ath12k_warn(ab, "failed to parse tlv: %d\n", ret);
> @@ -5724,13 +5714,11 @@ static int ath12k_pull_vdev_start_resp_tlv(struct ath12k_base *ab, struct sk_buf
>   	ev = tb[WMI_TAG_VDEV_START_RESPONSE_EVENT];
>   	if (!ev) {
>   		ath12k_warn(ab, "failed to fetch vdev start resp ev");
> -		kfree(tb);
>   		return -EPROTO;
>   	}
>   
>   	*vdev_rsp = *ev;
>   
> -	kfree(tb);
>   	return 0;
>   }
>   
> @@ -5809,7 +5797,7 @@ static int ath12k_pull_reg_chan_list_ext_update_ev(struct ath12k_base *ab,
>   
>   	ath12k_dbg(ab, ATH12K_DBG_WMI, "processing regulatory ext channel list\n");
>   
> -	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
> +	tb = ath12k_wmi_tlv_parse(ab, skb);
>   	if (IS_ERR(tb)) {
>   		ret = PTR_ERR(tb);
>   		ath12k_warn(ab, "failed to parse tlv: %d\n", ret);
> @@ -5819,7 +5807,6 @@ static int ath12k_pull_reg_chan_list_ext_update_ev(struct ath12k_base *ab,
>   	ev = tb[WMI_TAG_REG_CHAN_LIST_CC_EXT_EVENT];
>   	if (!ev) {
>   		ath12k_warn(ab, "failed to fetch reg chan list ext update ev\n");
> -		kfree(tb);
>   		return -EPROTO;
>   	}
>   
> @@ -5849,7 +5836,6 @@ static int ath12k_pull_reg_chan_list_ext_update_ev(struct ath12k_base *ab,
>   	if (num_2g_reg_rules > MAX_REG_RULES || num_5g_reg_rules > MAX_REG_RULES) {
>   		ath12k_warn(ab, "Num reg rules for 2G/5G exceeds max limit (num_2g_reg_rules: %d num_5g_reg_rules: %d max_rules: %d)\n",
>   			    num_2g_reg_rules, num_5g_reg_rules, MAX_REG_RULES);
> -		kfree(tb);
>   		return -EINVAL;
>   	}
>   
> @@ -5859,7 +5845,6 @@ static int ath12k_pull_reg_chan_list_ext_update_ev(struct ath12k_base *ab,
>   		if (num_6g_reg_rules_ap[i] > MAX_6GHZ_REG_RULES) {
>   			ath12k_warn(ab, "Num 6G reg rules for AP mode(%d) exceeds max limit (num_6g_reg_rules_ap: %d, max_rules: %d)\n",
>   				    i, num_6g_reg_rules_ap[i], MAX_6GHZ_REG_RULES);
> -			kfree(tb);
>   			return -EINVAL;
>   		}
>   
> @@ -5884,14 +5869,12 @@ static int ath12k_pull_reg_chan_list_ext_update_ev(struct ath12k_base *ab,
>   		    num_6g_reg_rules_cl[WMI_REG_VLP_AP][i] >  MAX_6GHZ_REG_RULES) {
>   			ath12k_warn(ab, "Num 6g client reg rules exceeds max limit, for client(type: %d)\n",
>   				    i);
> -			kfree(tb);
>   			return -EINVAL;
>   		}
>   	}
>   
>   	if (!total_reg_rules) {
>   		ath12k_warn(ab, "No reg rules available\n");
> -		kfree(tb);
>   		return -EINVAL;
>   	}
>   
> @@ -5993,7 +5976,6 @@ static int ath12k_pull_reg_chan_list_ext_update_ev(struct ath12k_base *ab,
>   						      ext_wmi_reg_rule);
>   
>   		if (!reg_info->reg_rules_2g_ptr) {
> -			kfree(tb);
>   			ath12k_warn(ab, "Unable to Allocate memory for 2g rules\n");
>   			return -ENOMEM;
>   		}
> @@ -6027,7 +6009,6 @@ static int ath12k_pull_reg_chan_list_ext_update_ev(struct ath12k_base *ab,
>   						      ext_wmi_reg_rule);
>   
>   		if (!reg_info->reg_rules_5g_ptr) {
> -			kfree(tb);
>   			ath12k_warn(ab, "Unable to Allocate memory for 5g rules\n");
>   			return -ENOMEM;
>   		}
> @@ -6046,7 +6027,6 @@ static int ath12k_pull_reg_chan_list_ext_update_ev(struct ath12k_base *ab,
>   						      ext_wmi_reg_rule);
>   
>   		if (!reg_info->reg_rules_6g_ap_ptr[i]) {
> -			kfree(tb);
>   			ath12k_warn(ab, "Unable to Allocate memory for 6g ap rules\n");
>   			return -ENOMEM;
>   		}
> @@ -6061,7 +6041,6 @@ static int ath12k_pull_reg_chan_list_ext_update_ev(struct ath12k_base *ab,
>   							      ext_wmi_reg_rule);
>   
>   			if (!reg_info->reg_rules_6g_client_ptr[j][i]) {
> -				kfree(tb);
>   				ath12k_warn(ab, "Unable to Allocate memory for 6g client rules\n");
>   				return -ENOMEM;
>   			}
> @@ -6096,7 +6075,6 @@ static int ath12k_pull_reg_chan_list_ext_update_ev(struct ath12k_base *ab,
>   
>   	ath12k_dbg(ab, ATH12K_DBG_WMI, "processed regulatory ext channel list\n");
>   
> -	kfree(tb);
>   	return 0;
>   }
>   
> @@ -6107,7 +6085,7 @@ static int ath12k_pull_peer_del_resp_ev(struct ath12k_base *ab, struct sk_buff *
>   	const struct wmi_peer_delete_resp_event *ev;
>   	int ret;
>   
> -	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
> +	tb = ath12k_wmi_tlv_parse(ab, skb);
>   	if (IS_ERR(tb)) {
>   		ret = PTR_ERR(tb);
>   		ath12k_warn(ab, "failed to parse tlv: %d\n", ret);
> @@ -6117,7 +6095,6 @@ static int ath12k_pull_peer_del_resp_ev(struct ath12k_base *ab, struct sk_buff *
>   	ev = tb[WMI_TAG_PEER_DELETE_RESP_EVENT];
>   	if (!ev) {
>   		ath12k_warn(ab, "failed to fetch peer delete resp ev");
> -		kfree(tb);
>   		return -EPROTO;
>   	}
>   
> @@ -6127,7 +6104,6 @@ static int ath12k_pull_peer_del_resp_ev(struct ath12k_base *ab, struct sk_buff *
>   	ether_addr_copy(peer_del_resp->peer_macaddr.addr,
>   			ev->peer_macaddr.addr);
>   
> -	kfree(tb);
>   	return 0;
>   }
>   
> @@ -6139,7 +6115,7 @@ static int ath12k_pull_vdev_del_resp_ev(struct ath12k_base *ab,
>   	const struct wmi_vdev_delete_resp_event *ev;
>   	int ret;
>   
> -	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
> +	tb = ath12k_wmi_tlv_parse(ab, skb);
>   	if (IS_ERR(tb)) {
>   		ret = PTR_ERR(tb);
>   		ath12k_warn(ab, "failed to parse tlv: %d\n", ret);
> @@ -6149,13 +6125,11 @@ static int ath12k_pull_vdev_del_resp_ev(struct ath12k_base *ab,
>   	ev = tb[WMI_TAG_VDEV_DELETE_RESP_EVENT];
>   	if (!ev) {
>   		ath12k_warn(ab, "failed to fetch vdev delete resp ev");
> -		kfree(tb);
>   		return -EPROTO;
>   	}
>   
>   	*vdev_id = le32_to_cpu(ev->vdev_id);
>   
> -	kfree(tb);
>   	return 0;
>   }
>   


and one more case to be handled,
ath12k_wmi_obss_color_collision_event()
	const void **tb __free(kfree) = ath12k_wmi_tlv_parse_alloc(ab, skb, 
GFP_ATOMIC);


Apart from this, the approach looks like a reasonable fix for the issue.

Another possible direction could be to define WMI event‑specific 
structures (or possibly a union of structs) and then leverage 
ath12k_wmi_tlv_parse() to extract only the required tags in a typed manner.

That said, such an approach would require a fair amount of refactoring, 
so sticking with the per‑CPU scratch buffer for now seems pragmatic.
Moving towards a typed‑parse model incrementally could be something we 
consider over time.


--
Ramesh


