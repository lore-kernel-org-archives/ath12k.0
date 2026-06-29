Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6922DC43458
	for <ath12k@archiver.kernel.org>; Mon, 29 Jun 2026 05:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CKTWLeN3e3A/Ktk3uDpD+5joHuoTDHafQ8MpylGrLvo=; b=N9GmNUhQZo4zxvYPklMmZulkL/
	/0/71rDhh+Vc5tYPDev9fI0oJ58fq9meuISU0ekKok2Y+5MRpgjg6adWDDVKgsVEZMWqFyykoCicF
	v6SUcUcHEi4Jf7+aizgvKlthKo6A22gYLSTpjLhyZwcu8o7BXNWrfVcW0p4CV+ny92CHIs/ETuUzG
	mAzhqiZP3IM6uxuLGkajREonBA7UBbdNSMl+ZVKbokpwx1hNxaQxlH63y+3O+k/zn6V930Qouyi8/
	Lt4x9gH7ZI6aFLbojvMC1M/tGLiZ6bKDNJtTKbzBmqSjCAtLwXVA+riZXbkU+8Ln0UN3XwP6RJu30
	t4I13lqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we4ds-0000000DiDz-0Zvn;
	Mon, 29 Jun 2026 05:34:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we4dq-0000000DiDc-1abD
	for ath12k@lists.infradead.org;
	Mon, 29 Jun 2026 05:34:47 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NNJP1766933
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 05:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CKTWLeN3e3A/Ktk3uDpD+5joHuoTDHafQ8MpylGrLvo=; b=bzOQbjMUYQa2PjoL
	DPZ2RdYeqpAEKF66HZ6Z9OLlLP0iViaLzzq9EygXzJyansqdp6DwtA/llO1rwFGB
	dabCQ0bINdbdYa5A3PH9lUQ3HDMhdATW5+iTcV3hg8uLMZV9gJABfV1oMTYu0KGJ
	IP5Fq6FCH9PxNZDNHlsC/SCFkyESDHA+zJ+YPQHh8z9bynaODhiCXdvAVVLxhLpH
	f3vlcM0fsIQsTveovK8DC/jSPy6MGGZq50ec34ibVTctDcD//9quq8jPWyHwdNWW
	4bQ+nYefXC5il0MULp9pYDBb5ZxK+VJaH/H4UID8g4dZbra3rjlzbdcKKa8+cwQ8
	o+xNgA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f270a4q8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 05:34:45 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-137f3465368so3068129c88.1
        for <ath12k@lists.infradead.org>; Sun, 28 Jun 2026 22:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782711285; x=1783316085; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CKTWLeN3e3A/Ktk3uDpD+5joHuoTDHafQ8MpylGrLvo=;
        b=jYARVFi7rAaexoCI5UrQ4agPEAcKCQGKLfVTNHI1sP60apc7QH+ovqj3KPg+fDkTRM
         IzBUi1US48Y5oXYljUqqjC856z5p6tAAO9QUK405/Vd6qAgFtidXP/UYOUbW6lSU+ZSl
         k7jICeXA9VWHjU0IAm6S8S8sXQArO4SicUuy0CPumTksETXl0eO41q44qeH4yRPY0S8+
         vMEG3E+IaN8WiUh01foLaFpH3lXNEhW9HUbQa6MpzY5zK4MV94j41jb8RNKCDCzpRSC6
         sRadaRkE3rfoUHOWPGrpvHp9DYhhHsEn8osaMxDuLQjB8/HDR7yS9CpvZZ4/cDVr009E
         11xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782711285; x=1783316085;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CKTWLeN3e3A/Ktk3uDpD+5joHuoTDHafQ8MpylGrLvo=;
        b=MYCINKZ1ApbzRB5sR/VKxEWrnNhgyJ6k0PLS60iTl9UUwOcb3zGnC/7EmTbQY5JNTw
         FwXKEjWSTnGORg95GLqNcoYpXFSiJLLK/QRgtKGjyqy4+hieA+Rwo+4LV8+NMhwomogX
         ibONqzaF5EnXHEqQYHT4cML+Pe5w5FFAOYijt13uiun9M2scNyUfaeU0PvZbQFzAta9x
         hMr2+g23VLSBZJSZ24mmq7+YfRnWaLVwoBLmxCJ27nWFkMzEM0FW2EKyu4pPYJZrizZb
         f9H1uWIYx0+E3VtIkcK8veA71yqEq5oUShnsa7/WGJ3EN3Obcx99JQAbPGvJfIp/RbRo
         FrJQ==
X-Forwarded-Encrypted: i=1; AFNElJ8K+KHTdWnxp8fLyuV+BhR2UhinRw6tqOSjxJeO6fD37f0KC7bEcEhOdbB6AkY/aXCZKgL0U88=@lists.infradead.org
X-Gm-Message-State: AOJu0YwJx8mkTMiT4jvXCsiXmxPiUa+zzxtEx+ro//98nFDbYMoHzUpa
	lEkY5GwVLxvZjHzx3k/Il6TGPveeaxE0pLrdGF5sjIb24PMnmCRLrcbVNgFtKLxP+6sx+Pk5NcQ
	ZpgKIwPxUykNQFE4feDtXRuCBw2iQuzC1UrgyM3qhJGBX9NQew99HbzTc7BHC2ZuH
X-Gm-Gg: AfdE7cnWtfetCy/PbtP+v0YFangAcS47Gvw2BjaiVc0Q2ldN7zPV8Pt9X5gCPWIiljC
	NITu1QKKkNFFOht1FfRgpmK5MeNwOj8QuG0GQmEysykKHFOLOy31ZxgaunHrJENVlPqKglIr3j+
	4eJpyWuz+69vDu5hfwpcBZiF4U1qjpPuHq3t/3VQ7APkpeyb55jesPb8aLg9v73PJqXVjZtYyjV
	oCzr7MppAIpn6ix+N71jaq0nDLvxCHbWGp/r8p30iSJN4eI1Fnw5nbeB7+5QljgVJfhAGxjCqu3
	5yB32Enc/V+F0QV3FkiK5P88s1aFwyFaJ2PHBs6tmNjvpQL4ixRQh2WrcLGs7hxUTH2ZtqEtvb7
	9K8q3Z2EDegpMcL3UdHjg8+nf7uxL2bBLIWm6YzSu5Tqfl1bzZcM=
X-Received: by 2002:a05:701b:291c:b0:139:f2c6:519e with SMTP id a92af1059eb24-139f2c65646mr2828392c88.30.1782711285126;
        Sun, 28 Jun 2026 22:34:45 -0700 (PDT)
X-Received: by 2002:a05:701b:291c:b0:139:f2c6:519e with SMTP id a92af1059eb24-139f2c65646mr2828381c88.30.1782711284572;
        Sun, 28 Jun 2026 22:34:44 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d912197bsm70060396c88.15.2026.06.28.22.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:34:44 -0700 (PDT)
Message-ID: <fa3d454e-e125-4aed-99a0-48bba9debe31@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:04:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 2/2] wifi: ath12k: fix MLO peer delete race
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20260617-ath12k-mlo-peer-delete-race-v1-0-ab3c4f455dfb@oss.qualcomm.com>
 <20260617-ath12k-mlo-peer-delete-race-v1-2-ab3c4f455dfb@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260617-ath12k-mlo-peer-delete-race-v1-2-ab3c4f455dfb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0NSBTYWx0ZWRfX++5FC7Fb6z53
 UolURGZA7BGXxIukJLePi0GQah4nFp1TmmQfme/3TusLvh+DAAq3PA3huXCHPOtGpPxUA8qeaPz
 qI7mk6xmTyclKLNJ7sNFJ6KHkgBpybXqxGlqJ8Cvg2Tlc9yIgIzCuns3D6cbhNhmhOSHj5mWeFU
 aAopIg4JjVCuFnn6pb7U+RXjfNIQaspYN+Dd6Qt1jJv+wICS9Z6SFMGhzKaz8XWHdZt2bNUZLr0
 hhChEfMMBLS80mJhZ35ckgBxsH4Cc/VS5hOoaiGQaxoiwPw0NlnKt0VmKUI00QvNNqxQSMlFbZU
 JyDrqMuePf7SsC8+hVVObhtnZ0NsTahcBHkYToYJgr/ESIEUOPaPCCCA2gVZvKplOgMf9h2YOkM
 AO4RmYiaBxPghiuYzx6LURfU2ziEMbF6tirDLI86ct1I0LNE7jaJLZ6ppmt1K4nhaV4m+C1NRGN
 WYMy57oNNzZWZAhaqTA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0NSBTYWx0ZWRfX/QAv2iROt4ni
 e5grtBC6n/YFj0OG5xM6xAj0StN0R8tQuMBwYn1zhgVt1xipsrK0dSBrioAvaXuOtjbAVbelDeU
 XVcaV9mx9Jj4/obdaSr/Q/tkkP3Kh70=
X-Proofpoint-GUID: U_zhfWZRA6Wuo3lx0UZbsDIC7q4g7cra
X-Proofpoint-ORIG-GUID: U_zhfWZRA6Wuo3lx0UZbsDIC7q4g7cra
X-Authority-Analysis: v=2.4 cv=Fe4HAp+6 c=1 sm=1 tr=0 ts=6a4203f5 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=aX2ajguDe-_I9IQFk3cA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_223446_426132_70CA34BB 
X-CRM114-Status: GOOD (  20.14  )
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

On 6/17/2026 2:58 PM, Baochen Qiang wrote:
> ath12k_peer_mlo_link_peers_delete() sends WMI peer_delete for every
> link before waiting for any peer_unmap / peer_delete_resp event. The
> shared per-radio completion ar->peer_delete_done could not
> disambiguate which peer a response was for: every call to
> ath12k_peer_delete_send() did
> reinit_completion(&ar->peer_delete_done), so when an event for the
> first link arrived between two sends it raised the count to 1 and
> the second send promptly cleared it; the wait for the second link
> then timed out with
> 
>      Timeout in receiving peer delete response
> 
> Replace the shared completion with a per-radio waiter list, with
> each pending ath12k_peer_delete() caller queueing an
> ath12k_peer_delete_wait carrying its (vdev_id, addr) and a private
> struct completion. ath12k_peer_delete_resp_event() matches the
> response against the list under ar->data_lock and signals the
> matching waiter.
> 
> Also correct the endian conversion in ath12k_peer_delete_resp_event()
> logging, and add the missing \n in some logging.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Fixes: 8e6f8bc28603 ("wifi: ath12k: Add MLO station state change handling")
> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/core.c |   2 +-
>   drivers/net/wireless/ath/ath12k/core.h |   5 +-
>   drivers/net/wireless/ath/ath12k/mac.c  |   2 +-
>   drivers/net/wireless/ath/ath12k/peer.c | 130 ++++++++++++++++++++++++++-------
>   drivers/net/wireless/ath/ath12k/peer.h |  19 ++++-
>   drivers/net/wireless/ath/ath12k/wmi.c  |  16 ++--
>   6 files changed, 136 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index 742d4fd1b598..f71650039292 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c

{ ... }

> diff --git a/drivers/net/wireless/ath/ath12k/peer.h b/drivers/net/wireless/ath/ath12k/peer.h
> index 49d89796bc46..3dc720a3dc12 100644
> --- a/drivers/net/wireless/ath/ath12k/peer.h
> +++ b/drivers/net/wireless/ath/ath12k/peer.h
> @@ -9,13 +9,28 @@
>   
>   #include "dp_peer.h"
>   
> +struct ath12k_peer_delete_wait {
> +	struct list_head list;
> +	u32 vdev_id;
> +	u8 addr[ETH_ALEN];
> +	struct completion done;
> +};
> +
> +void ath12k_peer_delete_wait_register(struct ath12k *ar,
> +				      struct ath12k_peer_delete_wait *wait,
> +				      u32 vdev_id, const u8 *addr);
> +void ath12k_peer_delete_wait_unregister(struct ath12k *ar,
> +					struct ath12k_peer_delete_wait *wait);


The struct and functions appear to be used only within peer.c and are 
not referenced elsewhere. Could the function be made static in peer.c ?

> +void ath12k_peer_delete_resp_signal(struct ath12k *ar, u32 vdev_id, const u8 *addr);
> +void ath12k_peer_delete_wait_flush(struct ath12k *ar);


--
Ramesh

