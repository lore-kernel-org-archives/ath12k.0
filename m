Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3546C43458
	for <ath12k@archiver.kernel.org>; Mon, 29 Jun 2026 06:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/4OQ+SJ4jk9cqK1TR2V/N6JmxkBM8IdFKcr2Nwmir18=; b=LTkr8Cv8BOOe9T/pc6pQP7lfYH
	gFAbdvX5tHUZF5OixUfBR6KAmLHy/y4SPA+RnyWdOKaEU713KJn+YHW1D1bNPRwKuAa9uQ2wvSFud
	ZNzZwyKzyPP/olfqZaSB3WtEJ4ETJy6nBT/pdxwc24EGWS5Ps0BMDMR7wjgWMQ49b2NvYmySoi6Ch
	P0SeTbmeyShwnVr7badnesAlsrwbsn7NzCO0H+6DC7yfOfSTnBHm9FTd8eNbPHb5ZWeocKcIUFOui
	1GXrL76MTmRpWrh+d+C7zzbArngMvaBXCLQycocciJw3dnBQN0a2kCQu5rMqChj+oWo59O1gDw8t0
	r2BgICGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5tS-0000000Dofc-2JIf;
	Mon, 29 Jun 2026 06:54:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5tQ-0000000DofC-2xK5
	for ath12k@bombadil.infradead.org;
	Mon, 29 Jun 2026 06:54:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/4OQ+SJ4jk9cqK1TR2V/N6JmxkBM8IdFKcr2Nwmir18=; b=XC67t/f13zORwJcnfGx+8Nlli0
	fvId20Ye6/brLBULHaEeNUC2Jm67Sf9Q/7/YUrHgjmqKWX2JdMfvk2iXSsP6M5viNnbhf/YuNR64j
	Ych/Xw5APi0gdXemCj5FylMJWPkbKOs4HUHojKwo3xbHuUdWFXBiVjl9pe4gt/DPN2pQm2Vvwh2ET
	97XZdvYAqQ4PJzQNdNOJlA5u7Be6KKAte3Sof0Ivq48VajbzuqASYkoTrcxr6CmjuyoZXQqMcQsjm
	3AU07lwKHNip3akDtI3FkC3bmZHg6Me29xkAFQNj/zkSHqCLg0XiBIZeyf+yz94Xw6pfqBgV7dYSt
	z661Pjvg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1we5tE-00000000hgK-154O
	for ath12k@lists.infradead.org;
	Mon, 29 Jun 2026 06:54:54 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6r4kc2088790
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 06:54:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/4OQ+SJ4jk9cqK1TR2V/N6JmxkBM8IdFKcr2Nwmir18=; b=DpGk1AZcCsd/o4gA
	lQGxb64yxZxa4wDYrQE49HcM6afAkIqAW6GTqPEq3L33G1cSTygl1I6lbqx8qGs1
	SpRIo5QZDo/Bno1xJsLjVuIiGSPCm6wm+Vy7sr6oofICaTOz3cPcEl6fn6vxzaBH
	/SH88VFxm1lM4731q4DEN0efPrRpu+wCoRlz+mWyfk7sgFF4SjtVyzMpUZf3nJro
	PU1u+T49R3oJ+sAlTkX+xgR3H4CXzJJnyjL0YLx2rms1UL3Izh1OMQrQLc1ODcqr
	ako9yVSP44jYjqZlxuc+pnMQ3CvG7bJX01LVQjxphDGc+UbHv/0c0MP0pE0rr8iH
	xaC9ow==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3k7vgajv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 06:54:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c9960cf96cso18199695ad.3
        for <ath12k@lists.infradead.org>; Sun, 28 Jun 2026 23:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782716078; x=1783320878; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/4OQ+SJ4jk9cqK1TR2V/N6JmxkBM8IdFKcr2Nwmir18=;
        b=Io2qPkauRnZ/J3lbe+jD8wKMHst8colg1/EzW1wnyw4TyltOVQ9SqK6f7LozxurGPn
         d+z5XIBKnnvYAUah/UJrk+qq3DgJnSJigTOG6CV5+p0hQXoLI3Hn3Zky6YKnDd0ZEqC9
         5piGSXj1vIBhQbJq/rM2BQLt5TDkbl1m6iZuZLM1TbJpijM5Mo0UJAxhKuMCMjsnQ7AT
         D+nePDLO6GliFxFBPrLfZzH5cxZ7ENQcN3kJYrl0TLXb3AYrmIuud7Y2hEkBCBbOLhtY
         +aoJjE6XRIpRj5EDcyBh/B95zx2fg60ZMY4ybRD9z+y3Zjp0W6kTwai4dHHd/qb0bnQr
         6B8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782716078; x=1783320878;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/4OQ+SJ4jk9cqK1TR2V/N6JmxkBM8IdFKcr2Nwmir18=;
        b=tCuIp/bqN1GNmNCDGxzJ70KbgqJqeFHFDoLFDhDrQGuBVZTh2Ry/fao1h6B2HQ9lai
         w5G3OFLX25/X9RgMk4ArdHHLWA5uZhsG/JvPac5dkPkmEg07LcFlxHnDRRf3lxzJb0FJ
         /F3Cu2KzCmzVEfzSxA7I7h5QFqnSahLp0QnDUKjV9uO6+dcev+Ot8zbCQj4PbzUuVCrH
         KeB9pnAbD2GP7LVrWjQtkfmWvQq1eQRg66poWW3Xawgatr3ZYGxKlYLM/jh1g7jmmprC
         X/GKGjYjTneyOjyE0bSwoH5on4KNwnrFSBUuDhyVYvS2pcPfUAukjaqEbFOsyJGmvSrn
         iQ+A==
X-Forwarded-Encrypted: i=1; AHgh+RpmAzZ7rDlR52HujCd5wQ8JW/M4rwrwEJJQKVLeBlA6mFtF8CnW9gsIl/4xtW+3Hhwg4BN2lJs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yynd3Yfkg1dqj1KOOkQJThVu3UrgeF+0iMtgYmE/dfzJt4krWAs
	cQu7F7BWt6o7zAApvExGkQu1duhb0yfJIJbAvNfagxGLZ89b5QXIVUQ9TiyF2tpEcB9fbQM2uki
	F6Qb9G+iTS9kqud4kh40lItLD8bvDpwqkT/fUBaZ8IigTjcg1K/nBPO697IFLCApR
X-Gm-Gg: AfdE7cmDM93OY9JE8NufQbnvVFi3pHWRCJUu6ERI3UPay8LocBkNt8aGvE/aJHkP0TI
	ZM4GQGAiZxHy5SACB5LWEb2Q4XmGvsvQ2I1/I+zUOkQWWZoK1uA2eZrqLUdZWcUln0M3LJzOPwv
	ZnDe8T1+6+/Dfn8egLNY/g1SqCazXKgu6DtncqZIqo5uQ1R7LlSHMabo9jbfIlgQ/i9LZoogJO1
	ZiejDW5mAgpKG7WEctuofvGlwdRGa0ruYApEKQkH6hTegDxPlMUip99s9r6AGqBJJEAby7jp5aB
	tkVCj/BR7AR5Laia6wI9S+1jtqeqEpJiUXU4ySCHrTpLbXa2+UoPQ8QH2SzHqIc9+hNdFMxiQLS
	yGygTbsrKgqzo8IyfteMJtVm8h5dG/2NxB7knPRV0r4butlTX2DosRKJNyhGZDWNWFWHkkIWokg
	y2vi+ujg==
X-Received: by 2002:a17:903:440c:b0:2c9:992b:e88b with SMTP id d9443c01a7336-2c9992bea39mr66417655ad.20.1782716078294;
        Sun, 28 Jun 2026 23:54:38 -0700 (PDT)
X-Received: by 2002:a17:903:440c:b0:2c9:992b:e88b with SMTP id d9443c01a7336-2c9992bea39mr66417505ad.20.1782716077834;
        Sun, 28 Jun 2026 23:54:37 -0700 (PDT)
Received: from [10.133.33.8] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c9b72ab16esm36752075ad.19.2026.06.28.23.54.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 23:54:37 -0700 (PDT)
Message-ID: <9a4ce4fb-99eb-4eef-804a-52b28c93d409@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 14:54:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 2/2] wifi: ath12k: fix MLO peer delete race
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20260617-ath12k-mlo-peer-delete-race-v1-0-ab3c4f455dfb@oss.qualcomm.com>
 <20260617-ath12k-mlo-peer-delete-race-v1-2-ab3c4f455dfb@oss.qualcomm.com>
 <fa3d454e-e125-4aed-99a0-48bba9debe31@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <fa3d454e-e125-4aed-99a0-48bba9debe31@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: teZnKHDuaqo_UD41MReoz3BRYBlW1bh3
X-Authority-Analysis: v=2.4 cv=CqCPtH4D c=1 sm=1 tr=0 ts=6a4216af cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=_u5qJjOYxTI9eUKrpbMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA1NyBTYWx0ZWRfX1niQWL/GCJOh
 rtPICR0iKUDjhwJ9L3Z34azXkNocZn5ymfiLMAo7Psv7F5KKEeuNQGo7ZKLMI88+odmkc02dVEA
 Jd/pRG4y9Vz39UjbbeTaxgYPCk9UasQ=
X-Proofpoint-ORIG-GUID: teZnKHDuaqo_UD41MReoz3BRYBlW1bh3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA1NyBTYWx0ZWRfX7lbJYylvKBmK
 rb/i1avzrvRma0uGXVU3gd+wanUlnjOKtI9b2Kodhs1vyBa9yCaYg5+SEVT1ovXD6zHoCdCjWm9
 GSXcZg1+xZ+xe1pSdYuElFP3b3XfAc54+LA8IevkWGD/ZpnuLdRsYPHIqhQ/e18HIPr6e5+l8KN
 lRz6tkyzkG+mt58u5wUXaquTZ3ujkedF85ECaj7zQ5Ez9GMjDVhRrmFpr9jqLWmUFVoxvezhbCy
 QAD09lj07eoDFUN+PXTwGqslhndFNk5hK9cWpCIJ11ET8+KVkFOFpg7fGXwnhk26uhjMYh7SKpu
 xGFBhGOf3sgWRgQbZhxCD9Deg+rg6VOFDlqxNCI6xDaParIMw99x82CjDBtY9wZ10j6loMTd8WW
 oCnI9K8GB7yeT3S/OQVZyMhDpJvVxHj2ndl37xybeICtyd6WU2Iij5kf7cE3kSSs0MB8GZek5ra
 r8EjQ+ZwJkze8XKUzGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_075453_463847_83BFCFE4 
X-CRM114-Status: GOOD (  18.22  )
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



On 6/29/2026 1:34 PM, Rameshkumar Sundaram wrote:
> On 6/17/2026 2:58 PM, Baochen Qiang wrote:
>> ath12k_peer_mlo_link_peers_delete() sends WMI peer_delete for every
>> link before waiting for any peer_unmap / peer_delete_resp event. The
>> shared per-radio completion ar->peer_delete_done could not
>> disambiguate which peer a response was for: every call to
>> ath12k_peer_delete_send() did
>> reinit_completion(&ar->peer_delete_done), so when an event for the
>> first link arrived between two sends it raised the count to 1 and
>> the second send promptly cleared it; the wait for the second link
>> then timed out with
>>
>>      Timeout in receiving peer delete response
>>
>> Replace the shared completion with a per-radio waiter list, with
>> each pending ath12k_peer_delete() caller queueing an
>> ath12k_peer_delete_wait carrying its (vdev_id, addr) and a private
>> struct completion. ath12k_peer_delete_resp_event() matches the
>> response against the list under ar->data_lock and signals the
>> matching waiter.
>>
>> Also correct the endian conversion in ath12k_peer_delete_resp_event()
>> logging, and add the missing \n in some logging.
>>
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
>>
>> Fixes: 8e6f8bc28603 ("wifi: ath12k: Add MLO station state change handling")
>> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/core.c |   2 +-
>>   drivers/net/wireless/ath/ath12k/core.h |   5 +-
>>   drivers/net/wireless/ath/ath12k/mac.c  |   2 +-
>>   drivers/net/wireless/ath/ath12k/peer.c | 130 ++++++++++++++++++++++++++-------
>>   drivers/net/wireless/ath/ath12k/peer.h |  19 ++++-
>>   drivers/net/wireless/ath/ath12k/wmi.c  |  16 ++--
>>   6 files changed, 136 insertions(+), 38 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/
>> core.c
>> index 742d4fd1b598..f71650039292 100644
>> --- a/drivers/net/wireless/ath/ath12k/core.c
>> +++ b/drivers/net/wireless/ath/ath12k/core.c
> 
> { ... }
> 
>> diff --git a/drivers/net/wireless/ath/ath12k/peer.h b/drivers/net/wireless/ath/ath12k/
>> peer.h
>> index 49d89796bc46..3dc720a3dc12 100644
>> --- a/drivers/net/wireless/ath/ath12k/peer.h
>> +++ b/drivers/net/wireless/ath/ath12k/peer.h
>> @@ -9,13 +9,28 @@
>>     #include "dp_peer.h"
>>   +struct ath12k_peer_delete_wait {
>> +    struct list_head list;
>> +    u32 vdev_id;
>> +    u8 addr[ETH_ALEN];
>> +    struct completion done;
>> +};
>> +
>> +void ath12k_peer_delete_wait_register(struct ath12k *ar,
>> +                      struct ath12k_peer_delete_wait *wait,
>> +                      u32 vdev_id, const u8 *addr);
>> +void ath12k_peer_delete_wait_unregister(struct ath12k *ar,
>> +                    struct ath12k_peer_delete_wait *wait);
> 
> 
> The struct and functions appear to be used only within peer.c and are not referenced
> elsewhere. Could the function be made static in peer.c ?

Yeah, I can do that.

> 
>> +void ath12k_peer_delete_resp_signal(struct ath12k *ar, u32 vdev_id, const u8 *addr);
>> +void ath12k_peer_delete_wait_flush(struct ath12k *ar);
> 
> 
> -- 
> Ramesh


