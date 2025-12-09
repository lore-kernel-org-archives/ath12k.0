Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354E8D3B7EA
	for <ath12k@archiver.kernel.org>; Tue,  9 Dec 2025 15:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NDHkj3CwoCQL6wJWOKPjGCsfcQFkvee6eMCgSP3pCQc=; b=Kt9/LvoZJGXinWeCg98simd2F5
	9NpBfNhRnNRGKlL3tVgmCtBcMURZ1MHXi5gFEfcZ8ZYlnf8mxWq05Or3xs3cy77WkeKN5xIFUFXTy
	8Ss6BAZ37InkHTkHI1NQDS2YnTjunJblFOun6dXAOEHhsBZU4pPJ1tjC4v0/cm1DTLjcLAjQhS/kO
	s3841ntuZmnQ7xX+zSqtqzWbrNIz4SNglII8ftMUlmhuLrxwjbUGegaLXrQcLB7kkFPxP0qn0xVFt
	YE73BEaTuS54Aru5cE1Sa8eO5j0OFtBKIucBqH47ZohDiaTVPVqLx60Ex1ShfqPTxcAUX0BRqnzZq
	LobDsUiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSzvz-0000000ETI0-413Z;
	Tue, 09 Dec 2025 15:47:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSzvx-0000000ETHg-29W9
	for ath12k@lists.infradead.org;
	Tue, 09 Dec 2025 15:47:26 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9Fhi5u128165
	for <ath12k@lists.infradead.org>; Tue, 9 Dec 2025 15:47:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NDHkj3CwoCQL6wJWOKPjGCsfcQFkvee6eMCgSP3pCQc=; b=WXhioQasmjcCm9iz
	Sn7wLcl6RiRm/Dl6N9GIRF4mHJckZqbq7ig8uw5nxiZ2bfKo+07RigJmnXisssN/
	yaDAYxYFgmM0D2IvV8blD3Tk/V3yV9y8isrbcb6agxemT29NmtnnGj8Df/eBawAO
	81ZZWW+F1Aiin5NNGNXy1YSqOmHQaTmlvw678LlMoWoTlxrgL42lfXT7o0dzwbWm
	ctbEAZsqCJ771ItbEzF0dAgfLjZRo5nBDUmw4n26XGNGp909Uu/oz+NUAIfKIjyJ
	g20Yo4XNXGD/+xBiTa9BgvD8rphHenvFUC29iDZ8y4FARv3uHg4KDPfJHRDQ09Eb
	qntGeQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axp5p04ju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 09 Dec 2025 15:47:23 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b471737e673so7064169a12.1
        for <ath12k@lists.infradead.org>; Tue, 09 Dec 2025 07:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765295242; x=1765900042; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NDHkj3CwoCQL6wJWOKPjGCsfcQFkvee6eMCgSP3pCQc=;
        b=dQ7cTWHGcKkLLpesPdNrGNKfYkAjXEWvdUOKnicYB2LmOgSmpBCifDJCfA03mC819P
         uQ7sM3sl/Z2UBOlzFrqp250bDsW5f9VhGXxG0ogWV0M5TQKJ25Y61fb80PRdwBfkHtqu
         /b2DWqH1jZ8w8GM2WQ2r2m6Nz/ED/ZqmKJ6OWbfRuX5IBU0WGX6KuQN84dC1D1mNP5SC
         vOz24J8WsZYcUcanINN5DswZeUtuad0LLa/illGS3jc1wfus3uzqAtd84YZOaHR57HZf
         E8Y3dOj+Z05vg4XyOxieGk6jqsreLgdw+2i6DyOWKY28wCMUIHHwtp3zsV7hLeWNmb5V
         h06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765295242; x=1765900042;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NDHkj3CwoCQL6wJWOKPjGCsfcQFkvee6eMCgSP3pCQc=;
        b=SGOr2JbJsk7Y7jIdS7FfbB6zTeh1hG4i98tddke66Bgv1WHmwYPtYY5xnKijob7SBk
         8KLlpqZ+6TSJY6/fVXrI9v/Aen7Ou6FvoIY/812W4A+GhHw1OTZE7iVNfj/tpqHWzsHn
         VeJCkaDSsX78pbDgJHzzIfgNt7NLpMpUettV7ZZGt7uSoTZJoQg5KGF7P6rKmpFNXNuK
         kKzDghoKCHqpwTmkq2ZuDF08HYbB9XrnIXwsFJueNQluiv7+VAWAVIyB1f++yO19lBvs
         UaqtmqyYGPcRhAWIc9RjPLEyP8ndQSA4TueSaCD1/P3NpVPeYJAM5bMuwrr5cpkWH/Eb
         wUqA==
X-Forwarded-Encrypted: i=1; AJvYcCVLE23NunxcTpUBVjDvGlBDLyeVa42KZPddi0URuxAXK1//7MmAYq8Ei/AEJmOw9EP2IIKAxCQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxRrla/q65WwOLq+fh7a+8xZ/gdiya3yQKQS6cF5ty/YbUCKBYU
	bf8WGGcjmz6At9ftOmuJvRHEk2+cc06bYOuZWkdtzHLGQj77kwGL5O3mKf/IM9OK9mRXZiQoqER
	K4o3m4BAGK61y1UjACG+8J7K7wJccPjkVxMZa69Cm84TF14hTdKwbak+CTJsoEwMAfTnB3cDH
X-Gm-Gg: AY/fxX4540Tt3Og9YhhcnVHpQ31Jl6jS7Af5DzX8Z7vZ76lZhbdpTt1evL7HBjL5KaS
	8xvewcg6sjLOBnHUsN4Fexm+mM7W9nRpcDTZwrQQLin0pwPFxETYvAFBeHtT2G/eJdk6dNDEOl6
	qUVRP19I21zqThysvBskCtKjKZNU6YcGMUuZIij15rdw1U3BGCn3UJqTUP9usV2a6Xyk6fEFt77
	/a6Gv/Zn7lXodad77+YKfFk/akaIWpx1U9lgLKt6OvV+wl68x1de/KVyaMDdjk4fds2j98P40HV
	qsD23eJvOO+01HW6HaKTlADvyHZ344S0+gt+0TwXu+jVe19R++eLUhgJRp2GWjzsPQfanIPeNMH
	T3Yq51ab1l9fn+o0cD1jMQwTB0Wmfsj/dgIWgdNx6h+c7+2TdI0lfQVZgYpWfL1EyCgw0JQ==
X-Received: by 2002:a05:7301:1906:b0:2a4:3593:c7c6 with SMTP id 5a478bee46e88-2abc70fa21emr8054974eec.6.1765295242104;
        Tue, 09 Dec 2025 07:47:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhrMcLrAfPV8e9p+ctKvu2z65Q8ub97vqIxMWVyLeOFWssQ0s0J2qpalQgDpvc7C9ctW7Uww==
X-Received: by 2002:a05:7301:1906:b0:2a4:3593:c7c6 with SMTP id 5a478bee46e88-2abc70fa21emr8054946eec.6.1765295241549;
        Tue, 09 Dec 2025 07:47:21 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba87aa5fcsm44776850eec.3.2025.12.09.07.47.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 07:47:21 -0800 (PST)
Message-ID: <cb81444a-2dea-47f1-985d-ad406633804b@oss.qualcomm.com>
Date: Tue, 9 Dec 2025 07:47:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "wifi: ath12k: Enable REO queue lookup table
 feature on QCN9274 hw2.0"
To: Oliver Sedlbauer <os@dev.tdt.de>, stable@vger.kernel.org
Cc: quic_rajkbhag@quicinc.com, Jeff Johnson <jjohnson@kernel.org>,
        Sasha Levin <sashal@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20251208103152.236840-1-os@dev.tdt.de>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251208103152.236840-1-os@dev.tdt.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: CvtW0_prqKSI7ol0CsgzicRcr_T2H5xH
X-Authority-Analysis: v=2.4 cv=ZZYQ98VA c=1 sm=1 tr=0 ts=6938448b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=yIxbBWfxqtjDTp5mS7gA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDExNyBTYWx0ZWRfX2BGNgsi8tj1o
 I8tTEjwSvaCjhCRrhIIO/hxha4SNY6VeJYukTsGgAjnXrLA3qV7lCYU+MJ/cz4Sm1fo6eiEQlHw
 k6ywSYg9mMgiUT8hN4treb9tvU2aGLk2JxrvTc3HQd1j7E/VPocWBtK0W6PLDMdbXV4d/vt51fN
 ObIko635rKWI5Iu5FpCPvW84qrwsLA2gs9udn+/by6ukHxzBmah+1dQ+B/aTFIiHH/wIK9lmiqe
 F7TqV5IP568VPHzL3i0PlEtb8D0vq4Y+My14P78+5ntcoPam8f86UGerrDRFJg/sw7vcdENvEbD
 NXhRGQ4Bk6VBrXWU/SW1lkoNgjSoo47iVmrkvKfDcnqXI8p2GoY+aRVVbUebwoT9vqHZnLeKbd2
 ZV5uRT0TuZPDI5KrD07NX34jRJkTSQ==
X-Proofpoint-GUID: CvtW0_prqKSI7ol0CsgzicRcr_T2H5xH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_074725_672526_D95D3C92 
X-CRM114-Status: GOOD (  19.79  )
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

On 12/8/2025 2:31 AM, Oliver Sedlbauer wrote:
> This reverts commit 3b5e5185881edf4ee5a1af575e3aedac4a38a764.
> 
> The REO queue lookup table feature was enabled in 6.12.y due to an
> upstream backport, but it causes severe RX performance degradation on
> QCN9274 hw2.0 devices.
> 
> With this feature enabled, the vast majority of received packets are
> dropped, reducing throughput drastically and making the device nearly
> unusable.
> 
> Reverting this change restores full RX performance.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 3b5e5185881e ("wifi: ath12k: Enable REO queue lookup table feature on QCN9274 hw2.0")
> Signed-off-by: Oliver Sedlbauer <os@dev.tdt.de>
> ---
> Note:
> This commit reverts a backport that was not a fix. The backported change
> breaks previously working behavior on QCN9274 hw2.0 devices and should
> not have been applied to the 6.12.y stable kernel.
> 
>  drivers/net/wireless/ath/ath12k/hw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c
> index 057ef2d282b2..e3eb22bb9e1c 100644
> --- a/drivers/net/wireless/ath/ath12k/hw.c
> +++ b/drivers/net/wireless/ath/ath12k/hw.c
> @@ -1084,7 +1084,7 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
>  		.download_calib = true,
>  		.supports_suspend = false,
>  		.tcl_ring_retry = true,
> -		.reoq_lut_support = true,
> +		.reoq_lut_support = false,
>  		.supports_shadow_regs = false,
>  
>  		.num_tcl_banks = 48,

Stable team:

The issue with enabling this feature has been fixed in the mainline with:
afcefc58fdfd ("wifi: ath12k: Fix packets received in WBM error ring with REO
LUT enabled")

Hence this patch should not be reverted in the mainline.

But it is difficult to backport that patch, so the original patch should be
reverted in all of the stable trees where it was backported:
6.6, 6.12, 6.15, 6.16

/jeff

