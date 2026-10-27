Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9990A606A31D
	for <ath12k@archiver.kernel.org>; Tue, 27 Oct 2026 18:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E0pnOk3M;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pum+jOci;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gWoYBD7t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PqLkIufQPtFaogpRWn+QjK4zZ4JekDLRMB+hfurWJXI=; b=E0pnOk3M+6fpVe
	KK3NsVeUX+O1jXiHNJhvibCuv6hmiZfLHl0cGaDv4hRlGNaMUgWZkj6qCrc1BXC1OQlvCCPy89wbJ
	E8MRTnOVQvO4oSSbDYmbprCx1WAy0z3hg3/qq0UfMrD8XwMejDStoaWz4opiHz1cjbcPTzPUrUMXa
	Euw+CFAV6qDr7nNb96oe35TGqzJCWG3InjtNFqRvp3Xw9+crQjF35GUDve9Cr/uWehyR1LjZW8m7m
	7+NqKcmlSHVeqBXPtvbfQTdIBDQ40tJpAUSW8aC1RbLNLCwDDoxdel2Yu7+txrUOW+DnAUpEjWZ3h
	yBvdjW0y/bYNKWTjQatw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLlvR-00000005ZDO-2z6i;
	Tue, 27 Oct 2026 18:29:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLlvP-00000005ZCv-1D9t
	for ath12k@lists.infradead.org;
	Tue, 27 Oct 2026 18:29:32 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RIHZGf1917416
	for <ath12k@lists.infradead.org>; Tue, 27 Oct 2026 18:29:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PqLkIufQPtFaogpRWn+QjK4zZ4JekDLRMB+hfurWJXI=; b=Pum+jOciu3R7fVsS
	4TJb0W5bYs2wH/pLEU35a3fE+qbDbQA7SZl/Z994Vxl8D2bTWeBAp/asbvF0Banl
	PU7jj2rfOtXHTDanQSXPCS55pr4QpCPOz1LXiUNLB4H8sglmAL4UtawS9bxYdPpA
	Q/QOJQnDSMcQ4+MtWaFbtC70vPQgK+CmTUU9GneelIwWUFf3HGBKpXeBFoGgg8WF
	LTQs+0rILYZIWpvaqwNNzuUkie1zWJFVwkz9MJ6wGwdTKSDmUZC5Vd1ACAt34Nq5
	s0GLyBVJDgqkArrIe8ok4Cl4/63daDdiPSvfQLpyf0elRyqLVKziduVqMZdxHyKs
	Lejutw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjux99n23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 27 Oct 2026 18:29:30 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36998507c13so207923eec.0
        for <ath12k@lists.infradead.org>; Tue, 27 Oct 2026 11:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793125769; x=1793730569; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PqLkIufQPtFaogpRWn+QjK4zZ4JekDLRMB+hfurWJXI=;
        b=gWoYBD7tUzpSUNPYuAEFgXFbRet9rRWDIahPHbspqbb6FZXExhDs68mDB4vTA8AOJ4
         voJpDXHomRK6NipHw6AUF/D1CLYzKNL+4d7cYWmnwYbe6kXWKHRHI74DS0Lt8oEaMIYW
         FagI4efe3TuE3KxKC6oaj9V+5YhWKgNOfPdO5rXUJjjlGnaAUmc0o+s0w/ukCLdijoq6
         fCYM54E12eUeM5BlgQwdGko69ydlrlkEmmIWpbXI3sCIlMTif5sE0ChXm1V9bWoMnGMl
         kJbUUY5IsGXL/6dIeiTx+OlQSai2xxzhQ2nFHjt1xauNlCm9J3Gzqkfs9BldO0rJrtvU
         MsuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793125769; x=1793730569;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PqLkIufQPtFaogpRWn+QjK4zZ4JekDLRMB+hfurWJXI=;
        b=BRF1Xf8kLWm+oiAnZ86QYQD7rjwNBhpb8tJ4Rf02m+rW6uAX55WxvAUBKf9/uTeQNR
         QY+QogHwOF53yw3GJNjbC/8+uCNBvA2l2WbMBKk5gNT3gmdZM1G79rL7AJrhjICBY8Q1
         DmjPao4Sbv+luhewljE+q5JhKUcTaMUTbhl9K07ZlLU6xKUgrPJNXMsO2fa035JtBt1j
         2qjkYg/NvlWkyWDy9lIgWNLNUtEqBl88YiOR4mSj9vUokvt0tyAUXN4NoNyx5nZ3aggD
         2N+tDXjIbnncLAvZuDSVR+vBc6jFpoJZgMPsjs8ai17e2NSLA8VEChghQivzD0FU5zYx
         iqUg==
X-Forwarded-Encrypted: i=1; AKwUvBz1nWtqSru+zxMvlo2/Yt6p4CygLpE96QSTPD57x0QHFO92bW+MZ793KACr+oHvE0bUcYWfbXM=@lists.infradead.org
X-Gm-Message-State: AFq9FYJ4kTZhVTZvf1hfpCCztvgta/AH7mHgiUl6jJYw6szQ3WrLULic
	vl7gm5cCLIJ/ijto4XXL7bAEYlZrEbnwdmRpqkN8AC33oTX7QCgrx4kRzcBnx10bGfUWXXJ1WUI
	1a/pd4JEB/ne6gOvhxq4r/gpKZ9UkduRmO7JIJleD4mWzsOM+rmkS6XhJH5YrrZ36Cv0FOqP+
X-Gm-Gg: AYBFou0s+E02eKe1R1vPr5r6Q9syVzooYsXzvB+LOWaa12hUQ7zYoc0cAOj0C+eZAMV
	HMIT6cT6+0qYmCOsl3HALhBsOIm1vQIZrVUZNEAJqVYQETN/7ZJypUZdv85GbxQz4epuX7bCx0b
	0iXThYRyoLFVwcATMr2wXwsMppxosjb82Aa5b01q6VgEHCHCErqVEmiZzloEGAw+mWm3v5NRne3
	DTDZGlww4GhhYSBVn6ywq8A1Q3C7a3v1huTrN/VvCZu3iAnqbHrBB1zt4rmvWZlrVoF5+1AerQb
	XLeiW2NEpqexZbInxQcKFxaLfQ0l2Aa5lSwykpLviz8mq4PFn5giRfVGtFLL8pV8SvrAh4ivjlP
	9ZXFuUoxxLKWjHwBmDpl+HiFjTpzJ1HZMU6DG1b+3yYrj/Uze+LaZ07wj9A==
X-Received: by 2002:a05:7300:fb0e:b0:367:68c:860d with SMTP id 5a478bee46e88-36a203fda47mr326465eec.29.1793125768818;
        Tue, 27 Oct 2026 11:29:28 -0700 (PDT)
X-Received: by 2002:a05:7300:fb0e:b0:367:68c:860d with SMTP id 5a478bee46e88-36a203fda47mr326430eec.29.1793125768171;
        Tue, 27 Oct 2026 11:29:28 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d845ddsm35584312eec.11.2026.10.27.11.29.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 11:29:27 -0700 (PDT)
Message-ID: <d3f34291-bed2-4ddd-af2f-fd994a2d409f@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:29:26 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: fix IRQ disable imbalance in AHB
 ext interrupt handler
To: Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
        P Praneesh <praneesh.p@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20261015084445.3045925-1-praneesh.p@oss.qualcomm.com>
 <5e64ab52-c8b3-4b42-81b1-dea844bea6d9@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <5e64ab52-c8b3-4b42-81b1-dea844bea6d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GYyCDgXL c=1 sm=1 tr=0 ts=6ae0ed8a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=yjVnOKY9XYp-XMnnHIcA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: RldXsAzc-C66OGYxJ335DUqKaUIWO8uR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3MyBTYWx0ZWRfX7zQ/PgHLIV+3
 JNtlYTrSZk1atv9lvGCWxJ+Wb9FqxZsnOVLlc2dqUcG5svYqd3ScoXpCmhaTqJ/vj2Tb3CdqFp8
 Er19Nm4r4s2loIa1GibJMWzZa72GcO1fN5wwAD9AhhFGIrp96b/7tbp0Wuf4DleIra7Bmv7e+lH
 eQrkB8fpblOqdqr68O6Fi6tG+kcFipHSdHxvJHeENKgMgUBJ64w28Hs+rhuW+h4v2HqbJ0ZEsD3
 0fa8y/AkiYv4Lvk2ciEoY7sHkxTW8yUuYemFwb2zaJV1MgK4BB1KnlLqhlxZEYm+/5fpSbaZHzF
 AQhSBLYVrIHlba+ja25z/Qs9z9IawcnRpD20XgbdwuoK2MeamP43XKv8TaWmjJZZwndgBU6ABxE
 K5mii4v9z2I4derV7mKy14L5RPaHg6vbCA3BuNvair3gWZlljN6aKybrOLP/S0YfOC8anOsJqds
 LLnQE61WGwdGClakl8A==
X-Proofpoint-GUID: RldXsAzc-C66OGYxJ335DUqKaUIWO8uR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3MyBTYWx0ZWRfX6cPM9e6N3IST
 1ivLmlnEwvZ1U0lSTuyLyPxUoBDCNO4SHftCcdbhiImu2V/NjQpNqBkxHZJ5FIfkVoLaG6C5+6T
 eWIdp7/Hgztu5RCcfsizjrV0NafLK48=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_112931_474956_E13DF373 
X-CRM114-Status: GOOD (  22.10  )
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

On 10/20/2026 10:07 PM, Karthikeyan Periyasamy wrote:
> 
> 
> On 10/15/2026 2:14 PM, P Praneesh wrote:
>> On AHB platforms such as IPQ5332, IRQ group 3 maps multiple hardware
>> rings to a single NAPI instance. Each ring is assigned its own IRQ
>> line, but all IRQs in the group share one napi struct and one poll
>> function.
>>
>> When two IRQs from the same group fire simultaneously on different
>> CPUs, both handlers call ath12k_ahb_ext_grp_disable(), which invokes
>> disable_irq_nosync() for every IRQ in the group. This increments the
>> interrupt controller's disable reference count for each IRQ twice. The
>> single NAPI poll that runs calls ath12k_ahb_ext_grp_enable() once,
>> decrementing each count from 2 to 1. Because the count never reaches 0,
>> all IRQs in the group remain permanently masked by the interrupt
>> controller.
>>
>> With no further interrupts, TX completions stop being reaped from the
>> WBM release ring. The pending TX descriptor count grows until the WBM
>> idle link descriptor pool is exhausted. Once full, TX ring allocation
>> fails and no new packets including management frames can be enqueued.
>> This causes stations to disassociate with reason 34 (DISASSOC_LOW_ACK)
>> and ath12k_mac_flush() to time out:
>> "failed to flush transmit queue, data pkts req N pending N"
>> where N equals ATH12K_NUM_POOL_TX_DESC(ab).
>>
>> Fix this by using napi_schedule_prep() to atomically test-and-set
>> NAPI_STATE_SCHED before disabling IRQs. Only the first CPU to win the
>> atomic operation disables the group and calls __napi_schedule(). Any
>> concurrent handler that loses the race skips the disable entirely,
>> keeping the reference count balanced. Guard the enable_irq() call in
>> the poll routine with the return value of napi_complete_done() to
>> prevent an unbalanced enable if the NAPI instance was re-scheduled
>> before the poll completed.
>>
>> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.7-00587-QCAHKSWPL_SILICONZ-1
>>
>> Fixes: 6cee30f0da75 ("wifi: ath12k: add AHB driver support for IPQ5332")
>> Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/ahb.c | 11 ++++++-----
>>   1 file changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
>> index 2c55aae06dd0..e5bbfca2b2ac 100644
>> --- a/drivers/net/wireless/ath/ath12k/ahb.c
>> +++ b/drivers/net/wireless/ath/ath12k/ahb.c
>> @@ -602,8 +602,8 @@ static int ath12k_ahb_ext_grp_napi_poll(struct napi_struct *napi, int budget)
>>   
>>   	work_done = ath12k_dp_service_srng(dp, irq_grp, budget);
>>   	if (work_done < budget) {
>> -		napi_complete_done(napi, work_done);
>> -		ath12k_ahb_ext_grp_enable(irq_grp);
>> +		if (likely(napi_complete_done(napi, work_done)))
>> +			ath12k_ahb_ext_grp_enable(irq_grp);
>>   	}
>>   
>>   	if (work_done > budget)
>> @@ -619,9 +619,10 @@ static irqreturn_t ath12k_ahb_ext_interrupt_handler(int irq, void *arg)
>>   	/* last interrupt received for this group */
>>   	irq_grp->timestamp = jiffies;
>>   
>> -	ath12k_ahb_ext_grp_disable(irq_grp);
>> -
>> -	napi_schedule(&irq_grp->napi);
>> +	if (napi_schedule_prep(&irq_grp->napi)) {
>> +		ath12k_ahb_ext_grp_disable(irq_grp);
>> +		__napi_schedule(&irq_grp->napi);
>> +	}
>>   
>>   	return IRQ_HANDLED;
>>   }
>>
>> base-commit: cd026e68fdbf88b9cc522b76c7a9d92c9a41f709
> 
> Reviewed-by: Karthikeyan Periyasamy 
> <karthikeyan.periyasamy@oss.qualcomm.com>
> 
I think you meant...
Reviewed-by: Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>

by posting that my tooling will now pick it up.

/jeff



