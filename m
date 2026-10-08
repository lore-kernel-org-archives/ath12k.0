Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FCECA6011
	for <ath12k@archiver.kernel.org>; Thu,  8 Oct 2026 17:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MYc0K7zn31TjZNQfuMEltaFhrqgcm0b0cHM1bc1hY94=; b=vOWtolQkJ3jWsd2VchIL/kIqd1
	uF0j02qD1eXR7AmBDSAQtjdniWojvF6CCFwA+4au15jqk86+YBtvcxp4CoDakPy1NfO7pE6ds77vi
	TACg/MIhx4d2HfH9RPw7KBN0v9miJuAtk63OgAIIBIuEVC7/+rvIANMCRpJHLvZ2VwqpWiPHyzXQQ
	Edj19giCBYw8wfNjM2QDPAj1BSCAEXj823Kn2rRtjta0Gg+HluASwr4NFu6zh8nLHoKjTC1Bkkpjx
	0BKgjkllSYKDaTk37DEUMsEEWcJYiqXO2OI37ZWZD2QL72Wv6N25wVlmY4mr+cX78Jj09wwknXeWp
	Ll/yHqNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xErjo-00000004laC-2Gom;
	Thu, 08 Oct 2026 17:17:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xErjm-00000004lZo-2nXK
	for ath12k@lists.infradead.org;
	Thu, 08 Oct 2026 17:16:59 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698EVGiE3145625
	for <ath12k@lists.infradead.org>; Thu, 8 Oct 2026 17:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MYc0K7zn31TjZNQfuMEltaFhrqgcm0b0cHM1bc1hY94=; b=bwyoza1NbOBHxpM6
	qSvLLRr8Yj+mTPa7WQ+snUF7GxMe3FaohVdletRvlA4M6iPRxtjUjbdkAFsRNI/V
	YqHG52WG5foijAtbOvbZbLk+yq/iLD/3R/aXRSe14PBuLrpZgYejX+1HH4vEk40A
	BJAN27yCE8XM06dtngMmZ/EUKG1hXQOd7QlBPcCPc4WPN0KPhFHh9idlEXN6lMmT
	87XERVecPYUcSmtHUN8brg7W/PQMM7/oQ3c8rqqMTW4xpTZ56Hb1b/0RYCKfmVsJ
	u1bJ3OJQ0OjD445KHsYN/jYJneTJQnw56PR2/iOrqwZ961WqJYlC+eFkZRC7lG7r
	CKHevw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6baj127p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 17:16:58 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ccca9481fb6so3673808a12.3
        for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 10:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791479817; x=1792084617; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MYc0K7zn31TjZNQfuMEltaFhrqgcm0b0cHM1bc1hY94=;
        b=HCVo8KoOAfOtMN18ufMVsqOaK9WdptxDJABZ/3LuMTjEvYplo2yWZJht+rhcjGr+Tp
         mlbL22Nbx1RXcUm1Ic2qjM6MvA9IIuMYI4DeBgTy2Q7ELh4D5EcUvlyLPT4ZLO0DtKXQ
         PTltrRTifhnjYV4Z2fVgoK16qkcTW78t1b1UOusrBhMkvDsnsa6OWHeGF+YgRAgvWjyR
         fgIzUFbFf5O28f5dwnP/KfnDQo4AZBT3KgM8VEvRKNYr6MCcnoEbFO3a3zrTula23z2A
         3KO+Gdmm2Hr+dcZolWeP9uj+roAHIQCCIklvFvz6oQKNhxc4LW4gX2YEeI5qaGivSaPZ
         jPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791479817; x=1792084617;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MYc0K7zn31TjZNQfuMEltaFhrqgcm0b0cHM1bc1hY94=;
        b=ktQfMkIIZG09Y0yPYtk80+fXUHlsAxgIE2OI7XrAh9WQEHLbmriYQkus7nybsJVECs
         VSgkBQSbm+iI5qKIwYRgHWt56/sYQZBGRlkBktTpgrkopvubX/TFR0el47GjO2EUwB53
         3tw62xy7JBZABkWd3WyiQdPhgA3oSEicsMMdyvzJ7NHWqrE0e4BRtjkoiJZ3lJpmYg/+
         GTbkzgc6f8eGyJ4Z4bUzik7A3CVXDGmJGJNKQLDaryCsyxZX/gQ1kT6zl5NFDP2dzP+O
         1tOoyiPiAO4hHlJrrmz7Iu4+6DG/y3Y2BtRaYkD0cjB1Q8rHxO95YO3NBfxchKt3O/w9
         s/bg==
X-Forwarded-Encrypted: i=1; AKwUvBzsFDCQrqAt0Z03PDtT32Xy2ujJ1+N00Pta5zkUyx7DgyfunonixUAoulJESM+x03cIfXgAayY=@lists.infradead.org
X-Gm-Message-State: AFuF++mIinw2hUF9CCmHjs4dxM9UvVu28mwIpnrn8uIxtXfYNALJdYr9
	bd4Iso/ky7YFNNX9vtoqVKRPe0IhTCx6ieGiSGUs1YZnx0Ev5QHsigIh9yL8XNaInWj5qBv1ism
	kHrxPfuSTbLHROC8QX/ryv/dKksbsZN7oRmeZhxXAhPYFD5ojtb1AgynAqPiOc81l
X-Gm-Gg: AYBFou2yyFSNt/sHbcHLP864XzRfTphDsy1AVZa/d+wGODMpRUPgRjDYjOyLAc/hxaj
	lp7WO86raUSSEIV9GYfyVntxyQGQvCmu8lCj9PbfWGmjiV5K6lNjCpIQVUulCCWSKn7bruZj69l
	SrHEieplxfoaoXp7h+N7N3f7RIMHDNyb86kdvQgUAPadn3VumF/TVxwbU/YV/PEz0zc2oIytvMi
	Yder+jCIxAyPhVhW3eWJ/ebmUKCcExVqDl0vmwXuaEodRYIVAAqNImuKxigFoS5nw4ZB1K3z42o
	so2gZqkFMFKK/T+vo3kv99z+rNdYmHvR4/s3RJ2Xd+nom08w55JZ1UPcm2krmpTMkJphJ3AtFBb
	eQTEOHwGy560pAUZMwFdwUn7QTtrOc+rJmFSz1oCntkQ=
X-Received: by 2002:a05:6a21:140a:b0:3de:5360:ebc6 with SMTP id adf61e73a8af0-3e164d03ebemr2746637.50.1791479817357;
        Thu, 08 Oct 2026 10:16:57 -0700 (PDT)
X-Received: by 2002:a05:6a21:140a:b0:3de:5360:ebc6 with SMTP id adf61e73a8af0-3e164d03ebemr2720637.50.1791479816816;
        Thu, 08 Oct 2026 10:16:56 -0700 (PDT)
Received: from [192.168.11.104] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3a782fd59sm118501a12.12.2026.10.08.10.16.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 10:16:56 -0700 (PDT)
Message-ID: <ad47c905-7865-4283-99ba-e246ae44d25b@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 22:46:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath12k: Fix NAPI resource leaks in AHB
 external IRQ paths
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        baochen.qiang@oss.qualcomm.com,
        vasanthakumar.thiagarajan@oss.qualcomm.com
References: <20261001045423.493121-1-aaradhana.sahu@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261001045423.493121-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA2OCBTYWx0ZWRfXyhML21zN8ADh
 sIy5+N0GlWTgTZnKNyw1XkWK66rq5H+oFVPwOoUE1gQQiNWcc3QhajMX3xxaW7FjCADVWuC6w6W
 JWXg9W/PKNctU+Iy74G4P6Xwwvr2euUtpGkCf0zS1T1dTx5j72PfXATB9rD/90lpCxprqTEXUeN
 Hxp8wt4NHAY/fkX5oULmHTTuXH1m//iv2k4VMG6U9AQ3P3xlefkQ7up1/kt1xvFnxB5zqry3ASc
 07BfC32NleMJKy3M0yM75e799TVpLy3vpDZartQnlIXMR7wM6M7y32pmAqMiQa1D8EfeGPwDoPm
 acqhcPXicF+bXL4TcAJNvwsP8tf9q4ah7DWaIXVjhAyNAtvypAZgBieT0KDKRa1lVum9aiIpYW8
 87aJiFeC0BXlbiM5MKqVGwJCTdgwL1tBGNK2tjEzZQogHmjKSbhOANswNtmsiFboiRde7ro3pTw
 VPxvW7ZJ9kDs/UHL7YQ==
X-Proofpoint-GUID: tEo28-IV9wIOpwWDmbkuuMZe7qYswt3R
X-Authority-Analysis: v=2.4 cv=H/dOUOYi c=1 sm=1 tr=0 ts=6ac7d00a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=35ZLj8hBI3EEynJP_B0A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: tEo28-IV9wIOpwWDmbkuuMZe7qYswt3R
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA2OCBTYWx0ZWRfXxUcak1UHOHT2
 ZdiAUGO/N5eFOSjYqf7sw8UOoNrnAPjSHEl/rv4Y7SCuWY3XrCRz30pUlDXWYTcATpOw+TG1BcY
 RAdG2INkMi2u0C1aen5VvNitB2tnUF0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_101658_782882_9FB89BC4 
X-CRM114-Status: GOOD (  24.63  )
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

On 10/1/2026 10:24 AM, Aaradhana Sahu wrote:
> Currently, NAPI instances and their associated netdevs allocated for AHB
> external IRQ groups are not released when external IRQ configuration
> fails. They are also not freed when arch_init() fails after
> ath12k_ahb_config_irq() succeeds during probe, or when the driver is
> unloaded.
> 
> Fix this by adding a common cleanup helper to release the NAPI instances
> and associated netdevs. Call it from the external IRQ configuration error
> path, probe error path, and driver cleanup path.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 6cee30f0da75 ("wifi: ath12k: add AHB driver support for IPQ5332")
> Fixes: 614c23e24ee8 ("wifi: ath12k: Support arch-specific DP device allocation")
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
> ---
> v2:
>    -Remove unnecessary irq_grp->napi_ndev NULL check.
> ---
>   drivers/net/wireless/ath/ath12k/ahb.c | 41 ++++++++++++++++++++++++---
>   1 file changed, 37 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
> index 85360365aa4b..9b77632bd1bf 100644
> --- a/drivers/net/wireless/ath/ath12k/ahb.c
> +++ b/drivers/net/wireless/ath/ath12k/ahb.c
> @@ -191,6 +191,26 @@ static void __ath12k_ahb_ext_irq_disable(struct ath12k_base *ab)
>   	}
>   }
>   
> +static void ath12k_ahb_free_napi_for_group(struct ath12k_ext_irq_grp *irq_grp)
> +{
> +	netif_napi_del(&irq_grp->napi);
> +	free_netdev(irq_grp->napi_ndev);
> +	irq_grp->napi_ndev = NULL;
> +}
> +
> +static void ath12k_ahb_free_napi(struct ath12k_base *ab, int num_ext_irq_grp)
> +{
> +	int i;
> +
> +	for (i = 0; i < num_ext_irq_grp; i++)
> +		ath12k_ahb_free_napi_for_group(&ab->ext_irq_grp[i]);
> +}
> +
> +static void ath12k_ahb_free_ext_napi(struct ath12k_base *ab)
> +{
> +	ath12k_ahb_free_napi(ab, ATH12K_EXT_IRQ_GRP_NUM_MAX);
> +}
> +
>   static void ath12k_ahb_ext_grp_enable(struct ath12k_ext_irq_grp *irq_grp)
>   {
>   	int i;
> @@ -622,8 +642,10 @@ static int ath12k_ahb_config_ext_irq(struct ath12k_base *ab)
>   		irq_grp->grp_id = i;
>   
>   		irq_grp->napi_ndev = alloc_netdev_dummy(0);
> -		if (!irq_grp->napi_ndev)
> -			return -ENOMEM;
> +		if (!irq_grp->napi_ndev) {
> +			ret = -ENOMEM;
> +			goto free_napi_ndev;
> +		}
>   
>   		netif_napi_add(irq_grp->napi_ndev, &irq_grp->napi,
>   			       ath12k_ahb_ext_grp_napi_poll);
> @@ -675,12 +697,19 @@ static int ath12k_ahb_config_ext_irq(struct ath12k_base *ab)


platform_get_irq_byname() can return a negative error code. Should we 
handle that explicitly before calling devm_request_irq()?

Something like:

  irq = platform_get_irq_byname(ab->pdev, irq_name[irq_idx]);
   if (irq < 0) {
	ath12k_warn(ab, "failed to retrieve irq number for %s\n", 
irq_name[irq_idx]);
         ret = irq;
         ath12k_ahb_free_napi_for_group(irq_grp);
         goto free_napi_ndev;
   }


>   					       ath12k_ahb_ext_interrupt_handler,
>   					       IRQF_TRIGGER_RISING,
>   					       irq_name[irq_idx], irq_grp);
> -			if (ret)
> +			if (ret) {
>   				ath12k_warn(ab, "failed request_irq for %d\n", irq);
> +				ath12k_ahb_free_napi_for_group(irq_grp);
> +				goto free_napi_ndev;
> +			}
>   		}
>   	}
>   
>   	return 0;
> +
> +free_napi_ndev:
> +	ath12k_ahb_free_napi(ab, i);
> +	return ret;
>   }
>   
>   static int ath12k_ahb_config_irq(struct ath12k_base *ab)
> @@ -1353,7 +1382,7 @@ static int ath12k_ahb_probe(struct platform_device *pdev)
>   	ret = ab_ahb->device_family_ops->arch_init(ab);
>   	if (ret) {
>   		ath12k_err(ab, "AHB arch_init failed %d\n", ret);
> -		goto err_rproc_deconfigure;
> +		goto err_free_irq;
>   	}
>   
>   	ret = ath12k_core_init(ab);
> @@ -1367,6 +1396,9 @@ static int ath12k_ahb_probe(struct platform_device *pdev)
>   err_deinit_arch:
>   	ab_ahb->device_family_ops->arch_deinit(ab);
>   
> +err_free_irq:
> +	ath12k_ahb_free_ext_napi(ab);
> +
>   err_rproc_deconfigure:
>   	mutex_lock(&ath12k_rproc_info_lock);
>   	ath12k_ahb_deconfigure_rproc(ab);
> @@ -1409,6 +1441,7 @@ static void ath12k_ahb_free_resources(struct ath12k_base *ab)
>   	struct platform_device *pdev = ab->pdev;
>   	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
>   
> +	ath12k_ahb_free_ext_napi(ab);
>   	ath12k_hal_srng_deinit(ab);
>   	ath12k_ce_free_pipes(ab);
>   	ath12k_ahb_resource_deinit(ab);
> 
> base-commit: b64812cb6cec118f6c59a4ec2bd4848db17f6bb2


-- 
Ramesh

