Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38054606A319
	for <ath12k@archiver.kernel.org>; Wed, 21 Oct 2026 05:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Pt/Qc3pb;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C8mqyP3a;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g9MZYNqx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RR7noHyIfo5/8QXZlZ8gXcIfZnuMYnQ6Hpfmoc848ck=; b=Pt/Qc3pbmdO/uHQ9rvyazK01a/
	YoQSvM11wA4nBILFsraRidLQO640n5ZQmYXfU1/iVYVr2j5qWtniK+8PP5VNkkk6SUZJ4PT0euVcM
	5C+dNdJJ4jLBCTHZFIFpOWtn4fTZNjtUvYiKCkqXu0cJmOTBqiVIKNL7e98DR/t1MOrH8zisVG9jG
	WooX+cCv0cJwHolh0h8MvML2N9tihZ+xabXyjsKB67B1MnsCreVAWx+5fIezl0w2TihGj58BcwoHs
	U0AFOu/Nwf6nb/7l5Y2VMQTOkgEMNEHL0viL7kD4h8RPZMsVC7TEQlHje7I/vhml9jsJzUzFuIzpq
	QfyqGtEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJOY4-0000000B4Yv-3QCW;
	Wed, 21 Oct 2026 05:07:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJOY2-0000000B4YX-2MiU
	for ath12k@lists.infradead.org;
	Wed, 21 Oct 2026 05:07:35 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L48d0h041620
	for <ath12k@lists.infradead.org>; Wed, 21 Oct 2026 05:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RR7noHyIfo5/8QXZlZ8gXcIfZnuMYnQ6Hpfmoc848ck=; b=C8mqyP3aFOlSYaRw
	N4yN1D/ZXROODgGUWfRkLKq0KJKTmTdsq1d5LFyN1lW0dBUnhUm7b9iVApgkK1Nu
	NkC3qN21betDJ2Rrm8/0IFVdCTD2Smdv+VA3J7w/j6YiEY0FmB+QThzI05viiWvI
	51r8V4Gsi4tdq1M2pVHkg57ww25zyPLI8n6NtORNWJamZsBBuEeCTuu9s4+3zlUS
	yKrQwYu5YIyj5v+NhpiyH6cdNzDpTuk2hNP1v8nxIgZNicRXhweoZj7n9gc2yzxR
	KoksNPr4audnfogWcqNrsBXRDA+9X2Fk4qcgXlaq7sJ1RYjQRylelUFxV6fSHWoC
	ZcG35A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajj2v0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 21 Oct 2026 05:07:32 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso495933eec.1
        for <ath12k@lists.infradead.org>; Tue, 20 Oct 2026 22:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792559252; x=1793164052; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RR7noHyIfo5/8QXZlZ8gXcIfZnuMYnQ6Hpfmoc848ck=;
        b=g9MZYNqxVBTkQNg19Jstp3AzWUVIoiqNsKcOfsf7GYmjW8Aa8gcWfgAqU21a6DpGjC
         bpOUcsoktfuJgD0Olv4CQQhXVRyV9mYIM3If5pFeVUqRs07x2vUuM/C8QLAKVFzEf+v4
         iBA1mlUonW9eEnB/8ykbv58AchvsywgFGocp5W2HiiY9ZCaXzdt2wphvq0neMPHdQ/eL
         +hVXGs/im9kwWuxP/FLPhtZuRgIKLQax4iv/qc2cue2OwgpPOFNPaBmsjOL0C9iC1cZO
         7RebX/C3Q7ELGR3pOnOSXfdeIOqLva8si6mWmKvzM4tn9icArawf3rqh5jrC2hh1F+eg
         LSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792559252; x=1793164052;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RR7noHyIfo5/8QXZlZ8gXcIfZnuMYnQ6Hpfmoc848ck=;
        b=PrAwo3pMXoWgRIPg1qdrPmRaBgTAwfJTD/xWBh0T53dqD/LWjyDnHv818RPLh1vX8W
         Flz5hKV7fXXqoBl6ZaiowmI23wSwkBss9TKaWO1RxBz1U/eWYNXUWO3WXykotVtgZpex
         044OReLc+lPvbOqFLDrfuiT5zVfm+oB3JZ67Jpsp0HbrIxBeBm3+zShEhVqZwJ2jSjLP
         WF24y9lF7+UlIO5zPPbVKYjtfe8tH3W7n0dw5YbsQx4sQn5svJo9ljQR3om6huQ4fCFH
         CkQaqD7Sa7sjOPrEaCXFq8IyE9pEttfryM3bgdK8CG2D3bpLq5Dv5ieMC6cpp4aypt7x
         PwyA==
X-Forwarded-Encrypted: i=1; AKwUvBygAqAcQ1FsdrM3Aq+SMsUZQhZ4hMtBbSjqQMR1VNKIEd+x9sdOlOwcYyv+kaDEjnXidblZIto=@lists.infradead.org
X-Gm-Message-State: AFq9FYLc5wEHrK4sqGwF8PzSfjD7wpiQBY4Dk7rcQCfBh7iC1IzNjHNn
	q4CIFIr+JkqAd8nWwzfjD495UVsegLe8GRR838AhJTyYGUdXkHg1ctAaYn2Z5c1pfiYcWTZsc4f
	SFn86RiOX4qy9yUJXaODEKlfpDrVF7iRQdI8q/yUoCz/6q+nsa7sezEgcmbdTJpGtkELCpivq
X-Gm-Gg: AYBFou38XwjUJ9tKN1XWlocoarg6UMULhsmPDltsVmmUTU7/LKfBbLWXjQEKmivymq/
	ALEKK4qI5Fwg6XWTqWyMWXw5z8PZ/5qwHAuJpV5W6c1iQDfYpC6yRU7K/5ROYNwBT5cJK59yyih
	ORIaNWg4aTEaSCwv+t6sGNqlf8cnxKrM5Fj+EZB0ejhEuftJT39C53o8Yh/MU+WYFWpMDrb62bV
	rULvbJrBXuVM+YS+EbtkgIrp9z+YmotJ3c8cI2SA2WpGJYfDE8XqJND08L+5OX5s8WMk4inXha7
	S74ngFUVngF2c63Iyx28tILiz5jRnEuH+Z5CNTwHHoi0N5Kny3oVATaDL/zuk1kjIuXUFlohohV
	3bekPKLeB45XH/VU1u//ybgAIazGogr8xcyb6AnAKscYe
X-Received: by 2002:a05:693c:8105:b0:35e:f4ac:5f8e with SMTP id 5a478bee46e88-3674866f3bemr1899111eec.0.1792559251387;
        Tue, 20 Oct 2026 22:07:31 -0700 (PDT)
X-Received: by 2002:a05:693c:8105:b0:35e:f4ac:5f8e with SMTP id 5a478bee46e88-3674866f3bemr1899088eec.0.1792559250808;
        Tue, 20 Oct 2026 22:07:30 -0700 (PDT)
Received: from [10.152.204.133] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36741e71eaesm6905961eec.26.2026.10.20.22.07.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 22:07:30 -0700 (PDT)
Message-ID: <5e64ab52-c8b3-4b42-81b1-dea844bea6d9@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:37:26 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: karthikeyan.periyasamy@oss.qualcomm.com, linux-wireless@vger.kernel.org
Subject: Re: [PATCH ath-next] wifi: ath12k: fix IRQ disable imbalance in AHB
 ext interrupt handler
To: P Praneesh <praneesh.p@oss.qualcomm.com>, ath12k@lists.infradead.org
References: <20261015084445.3045925-1-praneesh.p@oss.qualcomm.com>
Content-Language: en-US
From: Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>
In-Reply-To: <20261015084445.3045925-1-praneesh.p@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyMCBTYWx0ZWRfX0GMfA7wPt/+2
 NFWTkw2XJzimClHRqEOBjhV+G/kzhhA1j+I6V/Pi52Bf4wA7dtcxyNYePjehnUxAMuYlnBAmJmB
 uuvj8COO/kPiBrtRUDJ1tGndsAbQE7PF5diqFbYQgM5oqs81mhrTzBIBwWLhXKA/KB6eIu5hpWd
 65its4AQMgkz0z8aF/Knl5fybWrwTc1qqvbzjpvcVIR10fQcAAkihXE+BYLY299zpPL9RP73vHh
 io0DCvBPXbmutr2rQSsfmlNjetky6JP50OIQqT0431i1Qt8/Ui0bRhW1cilnLAWE9POfmAouuee
 3o3djsAKOqAO8S1Vy8hFrs2bRs3AV0elJ3lcBiFV/8RVA6/7F2p7+VbV/sIX8QK4KQvwPeHl4Ps
 6tKVv8kPueWvXGyjAvsnP5KG4rkR3g/dHq6iDrPmnDWsSY16KCdjdq3g3+jG7VjeAu9D5c4QJFJ
 8c+hV7Ua32a1cyDgTlA==
X-Proofpoint-GUID: HyaH0RIFWIb0cfi6jJr0EEkIz0dEs4Tn
X-Proofpoint-ORIG-GUID: HyaH0RIFWIb0cfi6jJr0EEkIz0dEs4Tn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyMCBTYWx0ZWRfX/XtJP+wshFE+
 fdJALiFTqxQg2sQS07YlqAJbiRzCMJumFNCwomegY4KlqHThymXo+8yR+Zp4PpkywW/+4WEoIib
 8z3u1O+hmdDGg8EztAeV/ueQntYLkzc=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad84894 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=zjobiHJbO40lojGx9g4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_220734_745099_0A162058 
X-CRM114-Status: GOOD (  27.27  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/15/2026 2:14 PM, P Praneesh wrote:
> On AHB platforms such as IPQ5332, IRQ group 3 maps multiple hardware
> rings to a single NAPI instance. Each ring is assigned its own IRQ
> line, but all IRQs in the group share one napi struct and one poll
> function.
> 
> When two IRQs from the same group fire simultaneously on different
> CPUs, both handlers call ath12k_ahb_ext_grp_disable(), which invokes
> disable_irq_nosync() for every IRQ in the group. This increments the
> interrupt controller's disable reference count for each IRQ twice. The
> single NAPI poll that runs calls ath12k_ahb_ext_grp_enable() once,
> decrementing each count from 2 to 1. Because the count never reaches 0,
> all IRQs in the group remain permanently masked by the interrupt
> controller.
> 
> With no further interrupts, TX completions stop being reaped from the
> WBM release ring. The pending TX descriptor count grows until the WBM
> idle link descriptor pool is exhausted. Once full, TX ring allocation
> fails and no new packets including management frames can be enqueued.
> This causes stations to disassociate with reason 34 (DISASSOC_LOW_ACK)
> and ath12k_mac_flush() to time out:
> "failed to flush transmit queue, data pkts req N pending N"
> where N equals ATH12K_NUM_POOL_TX_DESC(ab).
> 
> Fix this by using napi_schedule_prep() to atomically test-and-set
> NAPI_STATE_SCHED before disabling IRQs. Only the first CPU to win the
> atomic operation disables the group and calls __napi_schedule(). Any
> concurrent handler that loses the race skips the disable entirely,
> keeping the reference count balanced. Guard the enable_irq() call in
> the poll routine with the return value of napi_complete_done() to
> prevent an unbalanced enable if the NAPI instance was re-scheduled
> before the poll completed.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.7-00587-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 6cee30f0da75 ("wifi: ath12k: add AHB driver support for IPQ5332")
> Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/ahb.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
> index 2c55aae06dd0..e5bbfca2b2ac 100644
> --- a/drivers/net/wireless/ath/ath12k/ahb.c
> +++ b/drivers/net/wireless/ath/ath12k/ahb.c
> @@ -602,8 +602,8 @@ static int ath12k_ahb_ext_grp_napi_poll(struct napi_struct *napi, int budget)
>   
>   	work_done = ath12k_dp_service_srng(dp, irq_grp, budget);
>   	if (work_done < budget) {
> -		napi_complete_done(napi, work_done);
> -		ath12k_ahb_ext_grp_enable(irq_grp);
> +		if (likely(napi_complete_done(napi, work_done)))
> +			ath12k_ahb_ext_grp_enable(irq_grp);
>   	}
>   
>   	if (work_done > budget)
> @@ -619,9 +619,10 @@ static irqreturn_t ath12k_ahb_ext_interrupt_handler(int irq, void *arg)
>   	/* last interrupt received for this group */
>   	irq_grp->timestamp = jiffies;
>   
> -	ath12k_ahb_ext_grp_disable(irq_grp);
> -
> -	napi_schedule(&irq_grp->napi);
> +	if (napi_schedule_prep(&irq_grp->napi)) {
> +		ath12k_ahb_ext_grp_disable(irq_grp);
> +		__napi_schedule(&irq_grp->napi);
> +	}
>   
>   	return IRQ_HANDLED;
>   }
> 
> base-commit: cd026e68fdbf88b9cc522b76c7a9d92c9a41f709

Reviewed-by: Karthikeyan Periyasamy 
<karthikeyan.periyasamy@oss.qualcomm.com>

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி


