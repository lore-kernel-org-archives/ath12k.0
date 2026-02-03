Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20F9E83054
	for <ath12k@archiver.kernel.org>; Tue,  3 Feb 2026 05:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OvIfb3KtMhaK0URlCrLVgD5/o1KlZJAtMpEOkCsCeL8=; b=I7y2jXf9HUSurEb0LXc42bg/QJ
	HGT6ycgS077KBEeIR0HfS/KxdadrkjYsDhkYqLghKNyRSCxU9u46M3dJrTZi53gsj7hA8OIZA6ybG
	61bZNUP6LboxRAYp1jafNI5Aa8aV6/vz8iyocy6hug8ma+Syfa0MgjwFeFBJlgO8e7AScTKJ5YG22
	LvWmapiZ0R3BgHVlX3PCTa+zfaKFx7I7VQd8Y+A/mm3+yIK+7rEz8e4i/UxgQCKIAliUOdRvf3gSy
	s2fuT0dsk+yOBqEIt8fHZ2QANcUtyQOV2tw7qTNCCgS2fYGd3yLnvUA+7cTof3U5L6Xzn36sjlUXh
	gvk0wF2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn90L-000000066oj-2UC2;
	Tue, 03 Feb 2026 05:31:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn908-000000066hT-3ltg
	for ath12k@lists.infradead.org;
	Tue, 03 Feb 2026 05:31:08 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6134XYvk572589
	for <ath12k@lists.infradead.org>; Tue, 3 Feb 2026 05:30:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OvIfb3KtMhaK0URlCrLVgD5/o1KlZJAtMpEOkCsCeL8=; b=gcXOEEuSPOsR3bNq
	cMqdP+eTO8I9yJIFHlLF3sTCWYBfBLB4KEOu1boqT7y7Rt5SoDt5KbpvpKtIOsHX
	q3NeIEPLlhC9jU1ho3Pd5++rGjBDr4tlZHmjCxrOjxDAFnRW4Bnw9eJbizURFh4W
	ZOQTOh+VfYETHMDzo62wnQTJyOcdWapvISagRHYdy/zN0xFR4a2AElOtHxqc9tlk
	1itFqYzS4wlS7UoYHjWpblxWu8nNrSKRaFtXagxdvTi8kw6fsQ6JoBqH4PZ78d0g
	NzpPu8biVcRnLSmVXvfI93yiASNpCMr9iXHuvsZIOTiyhPi8qSGD810+A/Fhx+Gg
	gMD0aw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tkmk1b6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 03 Feb 2026 05:30:59 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-81ea3358dd3so4433790b3a.3
        for <ath12k@lists.infradead.org>; Mon, 02 Feb 2026 21:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770096658; x=1770701458; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OvIfb3KtMhaK0URlCrLVgD5/o1KlZJAtMpEOkCsCeL8=;
        b=MNbi6OE1OFqs53uPDtJtymQNSAzFSzg8d0jHu/Nkyx5tmFjAICwzyZpj75Vay/P+Mb
         0f1uDJ5CCXm+aMfUprxpGAOcg1GMQ2NNx4YThTNMYEINPKiFJxwCsgMl9AcPBx1ilkPp
         OB8cppOTeyb/yN1WeRezlKJcXNJoYQUorPEP72Q1cTGH1kBx5x9xURlzT6S9y0Wkeugu
         uQeYasIg0EOD113TZPYxt9sjRMc2aI8JZc3y+uApYTeFnEH3Dysw+zlGeFAxaU6iyrM+
         QJmncDlTqlPxrtuYAserlpFt1cDpIT0ULAK6qp+iXOOU8OeO/+HmHIbCPEa5cyHMtZvP
         aDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770096658; x=1770701458;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OvIfb3KtMhaK0URlCrLVgD5/o1KlZJAtMpEOkCsCeL8=;
        b=mO5tZouOkBJ00i2xIwIj4jwmwHOSbQQgMGpWX9MZ0NN2rvmEc0B7Vy0VLEWs3m3MT8
         eSLCOsQnZ/szzt7LfxxhZW+B19OPxYxCmYKuJa0sfQPKbU0mNvkmEN/2rFJjJgKiGMAH
         /btZPRKvCPL0v9j5jNOaW5y47D5bXhfQAnHB/8+0nY9uBjBiE/4sXpm/x0q5OOQIx6WG
         kr4g86RCFupfSWjk1uAscSEG005Rc0YSrSH6fRcajb0QyG19h+NDgMhbcAFVVOrRPpZr
         asSKyDw5bImbnDbKa94vH9ADD4zCMwMEVR0Ifzq9X4AliNbxjtqB5stV5AdvJibJgNQA
         9VyA==
X-Forwarded-Encrypted: i=1; AJvYcCV7Bc9Q6ihegvp/Cv2bf9Th09efiqsS/l0xVLPk/uAKjQGbQjginfzyzewnJuot2WV15OvUeZI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz446zmfK5QED2qhqpQOQm1zgAzTXvVrXQiljGpHxEx9jJYjYkz
	IYEkQ6Mk5lS2BH5ddePZVRgIOZJJGc2XYyxJqXFee4DK9EbBdlmw53N3QdPEt/x1sjFuI8FrcwM
	u1JWGx2ML3ppEn6fLigJHhBAT2tSwZ4HInPulkDPLAJTSyM33i8BqHzk9PJO0Do5Zn2c66Kuo
X-Gm-Gg: AZuq6aKuQG3KrhLJqtwcD2zmLdb4fswK1GPzNCGTdPGVSlISeN/bPsMD8XSAodpZbOJ
	Ob5qixAU1pjBziT5lXDNnNZuDRCsa5Tb3P5n6Pk5PHE+/xkqw81y8QVufx+yIEpXL+bHxEguzU7
	r21CVP8B/phyf6P4xJEPEXPMMYfrXTM7MOdwsvM603osAIM1n5lTL3VwIhCh26C3EM/Q4vhVECO
	ekTibS3FBXlQ/VdY28W9yASKAPKlVUn57dlAFzK7KRvDLYRowIKxdWLb4I4ody+WR+L9DbSfWGm
	xP5t92JdlUTnQwrbw3eXBJgrLbnne2WEQ4q8oEmn9BiggwaQIqSj4WRiUa9c85J6UuXun4rUbhm
	iO9GqZ7A6+vdViYeZj+Ns+8ITlpqLHTP2oSrNWAXz3Xtds2RTNhUtbXskJf73gQ+Zft6cTeTKTn
	Vvp6ZIJw==
X-Received: by 2002:a05:6a00:3cd4:b0:81f:99cd:faf8 with SMTP id d2e1a72fcca58-823ab643e3emr14879804b3a.8.1770096658163;
        Mon, 02 Feb 2026 21:30:58 -0800 (PST)
X-Received: by 2002:a05:6a00:3cd4:b0:81f:99cd:faf8 with SMTP id d2e1a72fcca58-823ab643e3emr14879784b3a.8.1770096657696;
        Mon, 02 Feb 2026 21:30:57 -0800 (PST)
Received: from [10.133.33.50] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379bff93esm20880164b3a.41.2026.02.02.21.30.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 21:30:57 -0800 (PST)
Message-ID: <eda602b5-6d6c-4ef1-b07a-53af4b226549@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 13:30:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix CMA error and MHI state mismatch during
 resume
To: Jayasaikiran Banigallapati <bjsaikiran@gmail.com>, jjohnson@kernel.org,
        kvalo@kernel.org
Cc: quic_bqiang@quicinc.com, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260202151720.49904-1-bjsaikiran@gmail.com>
 <125f0ecb-79a5-4806-aa93-aecaf937885e@oss.qualcomm.com>
 <399d4ea0-5f70-4678-b0d6-9a80c3399ceb@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <399d4ea0-5f70-4678-b0d6-9a80c3399ceb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TaebdBQh c=1 sm=1 tr=0 ts=69818813 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VjulNiziwJIgjV26a9wA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: yVtMjgq4sHZKg2sJvLFp5FyVPGsu_RDH
X-Proofpoint-ORIG-GUID: yVtMjgq4sHZKg2sJvLFp5FyVPGsu_RDH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA0MiBTYWx0ZWRfX2ufcja2LqU4Z
 lPB83dWnfsbwMtPgH9IeYEr0wPLkW1UuF6p5AAJeH9b6EJLDUMwN2OAaa5kXDGZAyN9qxbjok0v
 cF27FJjgLMUCvWZ2eZGcL6fZjuBrvFr8DTSp4jVEbRWPEYhdlwJjUoJ1F0Zr+O2jsuw9Z61I622
 xCQpZ3qvnYrlJLsB6xzWkCTpIIzZQMp5xXUqd8PJdUItt8xfKbQdh+Cg7gf7HRPJC9kVhtkiDub
 dK88KOJZik7K0CKNZ7MmEtZCWSnpRxK/5y93gClKUs/aPLo/kce7qxv9zIXDiLO7M3yN/SKw//S
 DN0LXk14KtjLqxYgaw4YAcO0qspsECPp9P/4ROo+ow9sG8JCeryVM8Ymt6oAH1SchqT4SV5dfs6
 2fUpOs1JwWT++67gAP2zh11eGk1fmBuygMJngruGFILfeI12ub6zOBy/8v3TD+z20bf6hfdm0GM
 n+zg53IXdVuf7+ScRyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_01,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_213106_907494_58081BC0 
X-CRM114-Status: GOOD (  15.19  )
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



On 2/3/2026 1:02 PM, Jayasaikiran Banigallapati wrote:
> 
> On 2/3/26 08:21, Baochen Qiang wrote:
>>
>> On 2/2/2026 11:17 PM, Saikiran wrote:
>>> Commit 8d5f4da8d70b ("wifi: ath12k: support suspend/resume") introduced
>>> system suspend/resume support but caused a critical regression where
>>> CMA pages are corrupted during resume.
>>>
>>> 1. CMA page corruption:
>>>     Calling mhi_unprepare_after_power_down() during suspend (via
>>>     ATH12K_MHI_DEINIT) prematurely frees the fbc_image and rddm_image
>>>     DMA buffers. When these pages are accessed during resume, the kernel
>>>     detects corruption (Bad page state).
>> How, FBC image and RDDM image get re-allocated at resume, no?
>>
>> To clarify, the BUG: Bad page state crash actually occurs during the suspend phase,
>> specifically when ath12k_mhi_stop() calls mhi_unprepare_after_power_down().
>>
>> The stack trace shows the panic happens inside mhi_free_bhie_table() while trying to
>> free the pages:
>>
>>  mhi_free_bhie_table+0x50/0xa0 [mhi]
>>  mhi_unprepare_after_power_down+0x30/0x70 [mhi]
>>  ath12k_mhi_stop+0xf8/0x210 [ath12k]
>>  ath12k_core_suspend_late+0x94/0xc0 [ath12k]
>>
>> The kernel reports nonzero _refcount when attempting to free the CMA pages (fbc_image/
>> rddm_image). This suggests that something is still holding a reference to these pages
>> when DEINIT attempts to free them, causing the kernel to panic before we reach the
>> resume stage.

this seems like a bug either in MHI stack or in kernel DMA/MM subsystems, rather than in
ath12k

>>
>> Since the pages cannot be safely freed during suspend, skipping DEINIT (and using
>> MHI_POWER_OFF_KEEP_DEV) avoids this invalid free operation. This also aligns with the
>> existing comment in ath12k_mhi_stop which suggests using mhi_power_down_keep_dev() for
>> suspend.

first of all, this is a workaround rather than fix. Ideally we should try to root cause
the issue and fix it in the right way.

Secondly the workaround here seems problematic: you skip INIT druing resume. However note
several hardware registers need to be re-programmed during this stage, how could the
target work if its power is cutoff during suspend and the register context is not restored
during resume?

>>
>> Thanks & Regards,
>> Saikiran


