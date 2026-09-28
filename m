Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 874D2CA5FA5
	for <ath12k@archiver.kernel.org>; Mon, 28 Sep 2026 15:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m8I30bmzEkxiQOSTZb9FMgwhTXv2mfHqXd7wNca/new=; b=iZ8XdM1PabSLQdkZ3Kfh8otfaL
	kgoMLSEAMCaU+Fduq4PlxlLzj3TMKeObLYxt3vzkR2sJJrppJcSmjbF+22RbjrkaUg76aShfB5/Cq
	sOEChJSr6glk9tYz67FQwaeiJ6yZuAegmm/uF6O1PXAiReIw7SYDOCfh9xL1IVi2Jnf4ISNBkV7ev
	N6yECfH8+gyjFhrpiwZsKXY78VZIRBcjd5kBELJFcDajgQ9WKX6Ac1CwXG0MgeCDrOUEbU3XdSLLK
	YZrD88Cdvrht+7YTQAAaAl5qItpOLY2DZ5B8Dm2FGwbDLD8mzp4jw+WtInVwOtma8BbOQTXdX3Z2O
	oul9OvYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDFm-00000000u3r-0sj2;
	Mon, 28 Sep 2026 15:26:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDFj-00000000u26-3mjK
	for ath12k@lists.infradead.org;
	Mon, 28 Sep 2026 15:26:53 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEdv1J2755811
	for <ath12k@lists.infradead.org>; Mon, 28 Sep 2026 15:26:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m8I30bmzEkxiQOSTZb9FMgwhTXv2mfHqXd7wNca/new=; b=TZk2SS0kMHDhtF02
	OPKyXa+8okiuK2ku1qWwqBsXl0AdMf8weR0x1G+vghoQU656fkU7lOqVVniW2mLP
	y9yb4kv8vws+RjZsMGrw7XDEzeXfJM+Kmy+vpj2ET96R5m1m7fXRAwyuRkbIR/zG
	7T/9b5GHV8tJJMZOsaqrvkY0+Uu1pIKofpaWpWwVhxeWaB0enRK4f4Dmx1yaUVyF
	z3LkHrbjcQfmOmK/uWSXBull1HOGP9nxEsww8JMAs6padNyFMmkMa6M2RIG6xCOm
	Wm49G6JzrOw5dYkeVbzcKIysm92XuQ4z1B7auX5VbY5C+ZQqZnOHsYdsrIL7mHJQ
	ixkxeA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyhubj8s4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 28 Sep 2026 15:26:51 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3282d5302ffso5429790eec.1
        for <ath12k@lists.infradead.org>; Mon, 28 Sep 2026 08:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790609211; x=1791214011; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m8I30bmzEkxiQOSTZb9FMgwhTXv2mfHqXd7wNca/new=;
        b=SF4hfvoe8tvToKdImMMEfTIziVpKGF75Ev24keyxChU0tDMWdQV/h7TlwhpgKGZRAS
         DYPil2vlsjbbfwz/R2TLiWsiegD5RS8S91Zl3iEa2Ssm/dDws9qXIuKWCOwSK+w7ipsI
         iZHdZouY2mYGZbqrVpubx1+AN06k2OPNIN4uJYlby6pLg0O2CocdPa56qWER8Dl8IyJ9
         hrR1MZBA5daGxRu/2QoIGUla/+qATVyTMctjmHaYqqnElAuGWRnSt+7aBtifr/AJ6rAm
         TtavvGkuZMJaPCD+XuSOm2biYS91YgIGSsERHnS7vy+UwR4Z790mkQXVwmRh/GeBv9OS
         og5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790609211; x=1791214011;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m8I30bmzEkxiQOSTZb9FMgwhTXv2mfHqXd7wNca/new=;
        b=pn+QZylNVAa00vn0zxiVmuZyLqrMCiPEExvQ3jLDxotocrgKo/pTNWtVvJ6v2EfAnC
         HueJc7+I16654f7M3ATB1qRk2JcWXSRH1n53apJYjfFR4o8LNQdKqpnaYTfcP2mRUSeA
         NcGilIq8YInPpcvbap/tgSBo1T+bd8vXaZ4SkzvL+KrdQyqHMbh6Ra5bb2pLe74QK6qu
         BvmvAS820a8U8NI8brMgiE2dgsyKr6+n+XyBkbmPowdvgN4EkusqJpYUTrQbCnrT7y1n
         ct8Ouf9GsEdGVXc3CfmsRez6EYG8kOAb8V/Hlt+pxsU8MNYqFcgSW+wudsFE6AsBUm+V
         GIXw==
X-Forwarded-Encrypted: i=1; AKwUvBzNOCxR25jhpt8eA1THeLAKOL3BAJOq512hlo8y12ExyHiJw7Jntl4o08ss1A+bKjCiehSvm5s=@lists.infradead.org
X-Gm-Message-State: AFq9FYI0wnCKROM2beC7UUY2hK6EbBgBo2o01N3uA0mehaK0qGpvrHoC
	zXDsAVD+dSzHd7Da8OSgJdHxor5gpxmXMjpAP20pMEB/qlWO+VBL2qHKmkihriOJBQw1LGaUSIc
	/QBtS8vXpxfwFvpD+3tjHZO7LgzeVxIhxibQ2XDsGiphdkX5a4D+4FQqwoHr9o4IIaUcllL9b
X-Gm-Gg: AYBFou0NapY3+ne6ASVnJa1qxCvOL2gv2oELahWjYbQWRbXj/AW35GBFCBIaS4hUkuE
	XjDDdTBwc/omlSsvcTO5rDQc4UxQfUvPUOMcP6DopEyhh81tKazLRuqaVy7n27F2n3s/ISCIldY
	r9cGFmIGmCwHoojC//BwWPtM3s1ZC5y1t6J5a6Ux00JZG6Q2HUKN8lkoADfVDr/Nb1yu99VyZgC
	7WE3KFbSXYNU22NDMwdpYgyRTTDOtg16gSjKOyVuWpLYW/bDhf6fTNR7H6cRANHzYztSaZVLR4C
	IaIVN+Ew6vds9YxBrBikv/ekKGZiH6mWm9TpYIIRL43vGtS09ZoSsLnxusWf+cNaeYpGIxprSHS
	KnprdpsdiwZWNgeRFD0PdvMRSnF4AEROtKCViFw5e2P4=
X-Received: by 2002:a05:693c:87c9:20b0:347:a3d9:dfa3 with SMTP id 5a478bee46e88-347a3e9232dmr2971511eec.7.1790609207808;
        Mon, 28 Sep 2026 08:26:47 -0700 (PDT)
X-Received: by 2002:a05:693c:87c9:20b0:347:a3d9:dfa3 with SMTP id 5a478bee46e88-347a3e9232dmr2971437eec.7.1790609206721;
        Mon, 28 Sep 2026 08:26:46 -0700 (PDT)
Received: from [192.168.11.104] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144173a2asm31407404eec.6.2026.09.28.08.26.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 08:26:46 -0700 (PDT)
Message-ID: <3cd93e83-6103-457a-8879-bef8521bef9e@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 20:56:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: Re: [PATCH] wifi: ath12k: order hw group devices by WSI index
To: Benoit Masson <benoitm@perenite.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        stable@vger.kernel.org,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
References: <20260927012314.34857-1-yahoo@perenite.com>
Content-Language: en-US
In-Reply-To: <20260927012314.34857-1-yahoo@perenite.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: abxetbWFtXqtOuK4pSpSO7DfcJN4G4D0
X-Authority-Analysis: v=2.4 cv=C7F8WgP+ c=1 sm=1 tr=0 ts=6aba873b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=LV5C8B2hAAAA:8 a=VlrtaSc80NQl5BrU7SEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=uiVh3g-rw18WZz7NjXbe:22
X-Proofpoint-ORIG-GUID: abxetbWFtXqtOuK4pSpSO7DfcJN4G4D0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2MSBTYWx0ZWRfXxTtxPzDbdLVx
 c0QVOYmH35ITQfRtaleMUT2IeUUSzWghVi+27TbmSv29bzxYA3xJoe/BGnOxhcgeRFdO1gQ4FlA
 zytvgP+xMlGBuesetq3YJc1OWRchg65fhj0vF8/jIfPaA5q3FJ4mu741FoNxUXjarpDoBvwZ/JN
 VRszZwCfQ1N9Wyb1OoObJTW9rVy0UbG+qtdpW890xpjgqqwAw3x66/X6Glwei1fiJZ+4iVtfEzb
 xqPKeuZSPocJxgK20f7XkuJ2p70XxzDlo/zgp9LB/IlpRTcnQTgKxZ8bAqI0cnvs3cjntqNxUhI
 PbTKOa8jTtVJsrfA7O+sdev8j7ecPBbHLHc0wnyok0vDPuNr/LC7ptnuwpTE/e2wjaBWOkqjzfg
 4MN4CcBkKYNzyRTnVfAX1MujKzM5deSdeAYEMugdVrF/IAUaEK3VGQAjupG44mi85WO/bAgqrdi
 sceqckTqoreq0dORCpw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2MSBTYWx0ZWRfX7KrkuJqzrV4q
 MX3pPpEPL106vOSVvTHqqO5R6v5cy5neQj7pxrm4zTr9ayfde12wv7ilJL56+D7zyLswl2oVn32
 ZUPfia0qAQ+MWpqzPhtL583dUFZudco=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_082651_963084_0CDC376C 
X-CRM114-Status: GOOD (  32.08  )
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

On 9/27/2026 6:53 AM, Benoit Masson wrote:
> On multi-chip (WSI/MLO) platforms the devices of a hardware group are
> added to ag->ab[] in PCI probe completion order (ab->device_id =
> ag->num_probed++). PCI probe is asynchronous, so the order in which the
> chips complete firmware bring-up is not stable across boots.
> 
> ath12k_mac_allocate() builds the wiphy radio array directly from
> ag->ab[], and takes the wiphy device from the first entry. As a result
> both the wiphy sysfs path and the mapping of radio indices to bands
> change from boot to boot on boards such as the TP-Link Archer BE800,
> which has three single-band QCN9274/QCN9224 radios in one group. A
> persisted hostapd configuration that pins radio0 to a band then attaches
> to a random band.
> 
> Order the devices used to build pdev_map[] by ab->wsi_info.index, which
> is derived deterministically from the device tree WSI ring and the
> qcom,wsi-controller node. ath12k already uses wsi_info.index as the
> canonical per-device index for the firmware link IDs in
> ath12k_host_cap_hw_link_id_init().
> 
> Note that ag->ab[] itself is left untouched: the unassign path indexes it
> by ab->device_id, which is the probe-order id.
> 
> Fixes: 6f245ea0ec6c ("wifi: ath12k: introduce device group abstraction")
> Cc: stable@vger.kernel.org # 6.14+
> Signed-off-by: Benoit Masson <yahoo@perenite.com>
> ---
>   drivers/net/wireless/ath/ath12k/mac.c | 20 ++++++++++++++++++--
>   1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 99bf5cf..6505255 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -15444,6 +15444,7 @@ static void ath12k_mac_set_device_defaults(struct ath12k_base *ab)
>   int ath12k_mac_allocate(struct ath12k_hw_group *ag)
>   {
>   	struct ath12k_pdev_map pdev_map[ATH12K_GROUP_MAX_RADIO];
> +	struct ath12k_base *ab_order[ATH12K_MAX_DEVICES] = {};
>   	int mac_id, device_id, total_radio, num_hw;
>   	struct ath12k_base *ab;
>   	struct ath12k_hw *ah;
> @@ -15467,6 +15468,21 @@ int ath12k_mac_allocate(struct ath12k_hw_group *ag)
>   	if (WARN_ON(total_radio > ATH12K_GROUP_MAX_RADIO))
>   		return -ENOSPC;
>   
> +	/*
> +	 * Order the devices deterministically by WSI index instead of PCI
> +	 * probe completion order, so that the wiphy and the radio index to
> +	 * band mapping do not change from boot to boot.
> +	 */
> +	for (i = 0; i < ag->num_devices; i++) {
> +		ab = ag->ab[i];
> +		if (!ab)
> +			continue;
> +		if (WARN_ON(ab->wsi_info.index >= ATH12K_MAX_DEVICES))
> +			return -EINVAL;
> +
> +		ab_order[ab->wsi_info.index] = ab;


Maintaining the ab/ar ordering in ah based on the WSI index feels like 
the wrong layer. The WSI index is a property of a device's position in 
the group (ag) based on DT.

Did we consider placing ab into ag->ab[] deterministically based on 
wsi_info.index? Do you foresee any issues with that?

something like below in ath12k_core_hw_group_assign(),

-       ab->device_id = ag->num_probed++;
+       ag->num_probed++;
+       ab->device_id = wsi->index;
         ag->ab[ab->device_id] = ab;

If that works, ath12k_mac_allocate() wouldn't need the new ab_order[] 
array at all. It could simply iterate over ag->ab[i] directly.


> +	}
> +
>   	/* All pdev get combined and register as single wiphy based on
>   	 * hardware group which participate in multi-link operation else
>   	 * each pdev get register separately.
> @@ -15483,12 +15499,12 @@ int ath12k_mac_allocate(struct ath12k_hw_group *ag)
>   	mac_id = 0;
>   	for (i = 0; i < num_hw; i++) {
>   		for (j = 0; j < radio_per_hw; j++) {
> -			if (device_id >= ag->num_devices || !ag->ab[device_id]) {
> +			if (device_id >= ag->num_devices || !ab_order[device_id]) {
>   				ret = -ENOSPC;
>   				goto err;
>   			}
>   
> -			ab = ag->ab[device_id];
> +			ab = ab_order[device_id];
>   
>   			/*
>   			 * the assumption is all devices within an ah


-- 
Ramesh

