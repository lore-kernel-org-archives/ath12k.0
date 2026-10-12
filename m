Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40598CA9ED0
	for <ath12k@archiver.kernel.org>; Mon, 12 Oct 2026 09:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MSynGqQTU/luENBZy9D+KhOkObSWqGqhy0Au8QslHf4=; b=p2eQH2JFMZnVPexI9FXPkmPgDu
	YRjCZZ5tub973WI1d5tnHc7V0+vjihnCbVV9UGlnmYyufUORAVZJaRxL0cvJufjHkw5VMWiiVfO6w
	wh0wjQTyYPGvg4U0Eqt3FSZtYhf+v9eCqAFJBKx9m+nbhFugtzBQvByXlfhumKXImHL9nVn3hYNl7
	ezam0M54B0nzW2/Szo9BPaqKUSPqbakVlr/+MC79Bvf23PWUlpJagIjDjv7jlbq6eUmdqFzmw0h0S
	5uFQg1nwSvU7RZOhBW/Y4LS2Ow0TV7HgW/nM+Lu+gqIVXsEvl22Mf2ZnIBIpoBFwl453wzsFh/4/4
	/V5Rft+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCBo-0000000A2QY-3siP;
	Mon, 12 Oct 2026 09:19:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCBm-0000000A2Pc-2icZ
	for ath12k@lists.infradead.org;
	Mon, 12 Oct 2026 09:19:23 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8KFxU1779391
	for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 09:19:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MSynGqQTU/luENBZy9D+KhOkObSWqGqhy0Au8QslHf4=; b=FDF8cyaL9gi0JgXW
	Fqm3EJd1ooGWC2vkCABgBM2h5pvPRzaTMIlBff+aUAihrmfd0Z7KpfMJelvom3qx
	MEWZptF0ogtNSfsDUHc/hVHEyBZL2OJT2JsKTaQmRGWeDWKb/Z1Oq+uY7ug1m/uV
	R0gkgw4kaw34sR7LrZbrm56u6nSrSFT2j6+UcsqgO4DYlcRSmWHeObkOl+r4xzAl
	d8WZ3lLvTJe0Av+e+q/f4Rbqdp0Sf1vjEmhwpuxPSo6MvX01Vrc6lNPl4G4lqDjX
	rK9J2wcBD+4yt0I7skg2S/fWZe9bcDIST35gmfXu/P8UiybZgmUWivQmN6vaPqwp
	BDLbrw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8udq0d7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 09:19:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab27eb38d6so1660239a91.2
        for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 02:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791796761; x=1792401561; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MSynGqQTU/luENBZy9D+KhOkObSWqGqhy0Au8QslHf4=;
        b=KxklXwcaNSLLaV2AOEe8VyHfECT/YDiihXZgStO1uIV+ofGctv8DuiQ1PlGtzh4q0a
         ZsPmuJF7IqLB1ZJiYNOn1BFFvVPA2HC5ket0nCk02JEIPblZu7zJ/yB4NiemqE02+bLA
         pmpCoteIXyMMI+eVipt4Cl2lHQNdKHPX1x5NuW9qnXBxPXV9zUpXjGsx+1crrWM4KuAA
         hjElSwMJZbMjIekNqfjQEZf4dtq5jNq50sQGEjC6Hen6t2hkI/T0yyLSaIemHjE1Mp3R
         CAROfGJFKSQR/n2DNltzt2tXA+Ixu+WfvUPwfiUIv4/s0Dt5whp9DeO/iTgCRmb55VJU
         XAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796761; x=1792401561;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MSynGqQTU/luENBZy9D+KhOkObSWqGqhy0Au8QslHf4=;
        b=yr2tD6f68vnIvLrpiP0ycDMabr+FXCtEj2hhkoK59P+M3pbfPjUH3A89NRVpQ2iDv2
         /MOvaV5fMWFTNl5a+WVY7vezh1/TCW+zemk71/44PbQN3149xVeIZzD9mJ/U0Ywm1549
         Hu/IIlbMPYT1W7m1LlRNplHcmkclWQAcxS6e65kqMFX2IPv6ojy+uQEMfHg1dzJufolx
         CdkWi6wKyMwWup6wTNZPU+GD7KRyVOC7/8GT/yIHx/iGD8+1NlxcXsJkRB+a+n8gfiRD
         t8IH7LSDugKFBzJYYTQXiUaz6V6QTvsG4hUDJ40/wc4PD2mC/wB4+sKAQfZt8CG5UH0I
         5OVg==
X-Forwarded-Encrypted: i=1; AKwUvBwYtkkbdlSUnik2keI26QKqFrReks2l4ugparfXFf2mzfElFEFiog/RzHRMEwc4xsDH0/Exg1Q=@lists.infradead.org
X-Gm-Message-State: AFq9FYJgJ4uxcHCIMSCrkweT4uDVoRnwGjjbe9Y1mMnCaRjYrC5rSgb2
	CwJMcRL0P1EYpOJncOmbi0zRZYHo/wHmhbBksKPIGV4NcHr2VD5GxcRmQWk2d/ntHceqjdwzuwp
	We11n7n8wXltovQPIYSKX4QqL6QD0lGa2f+GMxm46V2ARWbWR6rr6qnM+VkE5U7KL
X-Gm-Gg: AYBFou1fT8tT8+M4eNl9o5EnTzDekTg7JlGbvy01PrV0rB0WCDsz90DbcsbSstu43qi
	lQbiP8D8UTPe60UPD6EjKQcOhlWq6uwCPVFIjp7Mp0SxGcapmSaRQ2CJkKUPndtMQdZhRBcdlQB
	zJ7Axs28/UHTKGb+xoeRyzck+IPieYu9kD3jf5Lz8Dz8/mnLDaIuyDVbOG2Kf7VuuJnF0JRUNFd
	42nwHvM6NStw9xKPYDwGgXiwT5jwfrou8xGAea3QrT7qJf7eTD0ghw4vU0B0IWx7gtTjm3QrSfg
	VpOaOAoi4hgLUuHEWH57oChXPBiP6vHhIe2or5MBbCwhPVYopRh/2PxyvUMWj3ZeZO5nxz+vvZT
	QC+4XKzSHm7fzcummDENjDyT1e6/nZjHAsA==
X-Received: by 2002:a17:90b:2681:b0:3ab:189b:6981 with SMTP id 98e67ed59e1d1-3ab3a92f9f3mr6893543a91.48.1791796760925;
        Mon, 12 Oct 2026 02:19:20 -0700 (PDT)
X-Received: by 2002:a17:90b:2681:b0:3ab:189b:6981 with SMTP id 98e67ed59e1d1-3ab3a92f9f3mr6893528a91.48.1791796760309;
        Mon, 12 Oct 2026 02:19:20 -0700 (PDT)
Received: from [10.152.193.243] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38b9633fsm19721794a91.6.2026.10.12.02.19.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 02:19:19 -0700 (PDT)
Message-ID: <154151a7-f999-4ab7-b1b2-628f56ac3fff@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 14:49:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath12k: Fix NAPI resource leaks in AHB
 external IRQ paths
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        baochen.qiang@oss.qualcomm.com,
        vasanthakumar.thiagarajan@oss.qualcomm.com
References: <20261001045423.493121-1-aaradhana.sahu@oss.qualcomm.com>
 <ad47c905-7865-4283-99ba-e246ae44d25b@oss.qualcomm.com>
 <2d52c324-59e3-411a-8012-e530426eed3a@oss.qualcomm.com>
 <a3b513c2-24e1-4f4f-bf40-6494ebf2bb99@oss.qualcomm.com>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <a3b513c2-24e1-4f4f-bf40-6494ebf2bb99@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=evJKXYpX c=1 sm=1 tr=0 ts=6acca619 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=qnt-ocGMDwAMB1C66_4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzNiBTYWx0ZWRfX6vAoncLDaBPA
 5xXiMHVjfIlQTpQ5yhaBZPOf2On2CRvdOtaDz5CGwa8Lb19Ay6mJNAEBeDMJ47de2yHaZZ8k03I
 cG4cNKvR72rJxF2QUzYzDkWN57nRRBw=
X-Proofpoint-GUID: bMF-dfSJeWQ3AcAvp1Yj7rmidd8c2A1e
X-Proofpoint-ORIG-GUID: bMF-dfSJeWQ3AcAvp1Yj7rmidd8c2A1e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzNiBTYWx0ZWRfX0q8VdAwmWhNM
 udXLHdpOnEjU1d7RWG0QsVhSOwR2UWzOzt+WdiENbPWeENEYkRHEhehbEmEP+pRjxfn14xujemW
 OOecFAQGWx32i+i2eb1D6eKH4k+gO/C9Tn3hxz+FOW65KeHFYiw0G0saZK1EKfY8jl2BWuG3mEW
 vBSGd/sQr03hqXg1BVFgekMTAXnciEaat33Q9CPgtpsVkArgRKuer8DwBpnrydJe721sD1dAtpd
 ULn7YnRcb7eZU7a9faqavsH7jEme/vjQYxuV2LdXqtzg4xES7hylNtygnyX3RJ9hmaLNDvO/m3O
 bgrrRyDxrS1huIxwDbZRO3M/XgAtissi/AvXHRXEIp60CHgRSGYKd3c8wOqIavK377F9z/6Yd9Q
 wnSAsyw919/HozTS4TpQBvy911OCZDDTii6xzAjLhSMfWgepoth7d/vlSn25GAurfgxFdz5bUAk
 L8bBC9z0TmGx7o2VmfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_021922_700578_9C13B3EB 
X-CRM114-Status: GOOD (  22.86  )
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



On 10/10/2026 2:11 AM, Jeff Johnson wrote:
> On 10/8/2026 8:38 PM, Aaradhana Sahu wrote:
>> On 10/8/2026 10:46 PM, Rameshkumar Sundaram wrote:
>>> On 10/1/2026 10:24 AM, Aaradhana Sahu wrote:
> 
>>>> @@ -622,8 +642,10 @@ static int ath12k_ahb_config_ext_irq(struct ath12k_base *ab)
>>>>           irq_grp->grp_id = i;
>>>>             irq_grp->napi_ndev = alloc_netdev_dummy(0);
>>>> -        if (!irq_grp->napi_ndev)
>>>> -            return -ENOMEM;
>>>> +        if (!irq_grp->napi_ndev) {
>>>> +            ret = -ENOMEM;
>>>> +            goto free_napi_ndev;
>>>> +        }
>>>>             netif_napi_add(irq_grp->napi_ndev, &irq_grp->napi,
>>>>                      ath12k_ahb_ext_grp_napi_poll);
>>>> @@ -675,12 +697,19 @@ static int ath12k_ahb_config_ext_irq(struct ath12k_base *ab)
>>>
>>>
>>> platform_get_irq_byname() can return a negative error code. Should we handle that explicitly before calling devm_request_irq()?
>>>
>>> Something like:
>>>
>>>  irq = platform_get_irq_byname(ab->pdev, irq_name[irq_idx]);
>>>   if (irq < 0) {
>>>     ath12k_warn(ab, "failed to retrieve irq number for %s\n", irq_name[irq_idx]);
>>>         ret = irq;
>>>         ath12k_ahb_free_napi_for_group(irq_grp);
>>>         goto free_napi_ndev;
>>>   }
>>>
>>
>> You're right, thanks for pointing this out. This patch focuses on fixing the NAPI resource leaks.
>> Since handling the IRQ retrieval error is an existing issue, would it be okay to address it in a
>> separate patch?
> 
> Yes, please handle as a separate patch.
> 
> My review agent notes:
> 
> There are three platform_get_irq_byname() call sites in ahb.c:
> 
>   ┌──────┬────────────────────────────────┬─────────────────────────────────┐
>   │ Line │            Location            │      Checks return value?       │
>   ├──────┼────────────────────────────────┼─────────────────────────────────┤
>   │ 692  │ ext IRQ loop                   │ No                              │
>   │      │ (ath12k_ahb_config_ext_irq)    │                                 │
>   ├──────┼────────────────────────────────┼─────────────────────────────────┤
>   │ 730  │ CE IRQ loop                    │ No                              │
>   │      │ (ath12k_ahb_config_irq)        │                                 │
>   ├──────┼────────────────────────────────┼─────────────────────────────────┤
>   │      │                                │ Yes — if                        │
>   │ 819  │ userpd IRQ                     │ (ab_ahb->userpd_irq_num[i] < 0) │
>   │      │                                │  return ...                     │
>   └──────┴────────────────────────────────┴─────────────────────────────────┘
> 
> So the driver is already inconsistent: userpd checks, CE and ext don't.
> 
> That said, the ext and CE sites aren't silently broken — devm_request_irq()
> with a negative IRQ number hits irq_to_desc(), gets NULL, and returns -EINVAL,
> which the existing if (ret) check catches. The practical impact is a
> confusing error message ("failed request_irq") when the real failure was
> platform_get_irq_byname() itself.
> 
> And further suggest it should be a separate patch. The reasons:
> 
> 1. This bug is pre-existing at both line 692 and line 730 — it wasn't
> introduced by the NAPI leak patch. Adding the check to only line 692 (as the
> reviewer suggests) leaves line 730 unfixed and makes the code more
> inconsistent than before.
> 2. A correct fix needs to cover both sites together, with a consistent error
> message and error-path handling.
> 3. This patch already has a well-defined scope (NAPI cleanup). Adding
> unrelated error-handling hygiene muddies the Fixes: attribution and makes it
> harder to backport.

Thanks for the clarification. I'll address the IRQ retrieval error handling in a
separate patch.
>>
>>>
>>>>                              ath12k_ahb_ext_interrupt_handler,
>>>>                              IRQF_TRIGGER_RISING,
>>>>                              irq_name[irq_idx], irq_grp);
>>>> -            if (ret)
>>>> +            if (ret) {
>>>>                   ath12k_warn(ab, "failed request_irq for %d\n", irq);
>>>> +                ath12k_ahb_free_napi_for_group(irq_grp);
>>>> +                goto free_napi_ndev;
>>>> +            }
>>>>           }
>>>>       }
>>>>         return 0;
>>>> +
>>>> +free_napi_ndev:
>>>> +    ath12k_ahb_free_napi(ab, i);
>>>> +    return ret;
>>>>   }
>>>>     static int ath12k_ahb_config_irq(struct ath12k_base *ab)


