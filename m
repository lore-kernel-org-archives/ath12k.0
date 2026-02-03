Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51201E83043
	for <ath12k@archiver.kernel.org>; Tue,  3 Feb 2026 02:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9zRpTKaQE4Hsgsve7rWWRdaOLoxINXvg2jaj1Jl+N9w=; b=ouf+hnMlPbWHWn7ZSJo5XQAsXm
	BIVyf3iI2Viu580WkE+eSgSYKvPmMeSTatlK37RSTePn1Qn1rcWKOr0YM76ExEueIjNA93bPq5Oe5
	JyTJpXXAjUTrowhG+ERWfO/HXlvfS/yhfc1erOlLjPvMxBy+KMtsfjKZgZ+l8P+iFbm6OFzlWKADE
	+ZL142eCt6qOW+MnhLcQps9CpkopKqq7LILRz8LGdolTscOcmQYIpj8/cjMskESHNHN+GeXMd0P1B
	YvuHagyjndVoo5H3OJR/PXel8/QlvFerWFNERb5tucG4DEtqnddAhH4DY6U1jh5c7bNt+U68yKm58
	gTpgDrlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn6VY-00000005xO6-3hOy;
	Tue, 03 Feb 2026 02:51:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn6VW-00000005xNM-43N0
	for ath12k@lists.infradead.org;
	Tue, 03 Feb 2026 02:51:16 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612J3cCU2899836
	for <ath12k@lists.infradead.org>; Tue, 3 Feb 2026 02:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9zRpTKaQE4Hsgsve7rWWRdaOLoxINXvg2jaj1Jl+N9w=; b=CDWNTqpU8jZQt7TC
	29C0WswuRMp0sVkGD5QqOiAStR97M6EfZNmnBxfwJHeHM7DuzWuuBbsDjDpC5MHQ
	eevv2auRdRoaoibk/kjvfHUN9jJmPYkbyO0dIUqkQy3UT4CkOHQLqttjhwP/ozt8
	bFPqc5WmZh1Yc5i+9UbHKwYXx48kku19kQrPi22nzysAD573hrsTYONDHIIANdCF
	NBphsLxxwhJ9q26CqyLUTDi+7yPTxM/5eeXFJFvTK0Cx7Dx8ycwlkWUfcm4nYSAM
	V/fzqFky9kMRugeZkf7Ktz50ySIDFlJEKVrIU3QuU46/DQUKsEht4QrEROLyH3Ad
	O4IVgg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tp0tk4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 03 Feb 2026 02:51:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a7d7b87977so48420515ad.0
        for <ath12k@lists.infradead.org>; Mon, 02 Feb 2026 18:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770087072; x=1770691872; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9zRpTKaQE4Hsgsve7rWWRdaOLoxINXvg2jaj1Jl+N9w=;
        b=ZImA+HpUvelVMUED3r3mdrTrygMMzvSlHIJZL41Gk4pOpR6ChkrUfNRQctvIoxW1Db
         9jB6PA211p8XGVUsOpu3UzMXENjmcu8qxZSJZ9RywBtFvQ7cBbjJtyO3djT3qS8eCuHo
         HPhBrGIh1PMDqmIpefMFow2/oWzz6deFKydhz+bg67KV5l/N+0uA0QUEUd36QbD0FaJX
         tNQYKVm5cLhuBAto3/0gqqA/rZHtUjA80QfcNCUXIhK0KXs3GU8Fqld/qJBD9aE8qq5H
         94fH0eGiPC8qwDhobjz3NVkT7gNshI95yCNOP6jTAJIjWJ5MO3OeFEXrUgj78WxMsBlO
         iMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770087072; x=1770691872;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9zRpTKaQE4Hsgsve7rWWRdaOLoxINXvg2jaj1Jl+N9w=;
        b=SDuDQNi4Lruy4mwz9WoUYEwxKSP8j6RTMB7tdwO1rPKu4YVzD3/pU4+F4ZMnNGe5b5
         WsKUJp3OZFudgWTJ3EMxalVp+1LFtSBqjjptYG2N/ZMl/UpgNe296AOBzs2zfN8rb2Xu
         63OKsrUFDZXDNr5mZxG5ZfWSukCQfsYy9QTjepMTu2eljpnnKAHOoWwM21/81L8rbsZK
         kvenQyd4vA42V7s7ffE0kZQEosgjGOIMkD0oeJ19Un4GMqYdruDYl8OlDhNkymT91pHC
         LFHLCCLsICOCjs4AV3y4UgdgzfB3Fse/ryvWZN6DOWDzq1KCbxD0fr2DZu77kmDb3B3+
         fCEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwzUEbAlhUB7JL9/gd059inMh8HnJhNaXsTiHG67s2guTMpeTOWvggJ+pKw1JbKmC/ah7uTzw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxWSyJPH/uOVZzG5/hao3KL3C5Zky7eWZGxMGrRFwPFVztOIZe5
	ZNkM1yOQDhv//25PV1FJExroAXOKlXAI2QAKvjZsJp4OwX3hdon6IeumolZ3GX6kd00APSlUFE6
	5UeMDxIjOvk3yGgiCLQXi7hU941UcHk2NrjL+ELT83JxxBKIVarSmQf5Pa+aRUeR15D8xqUuR
X-Gm-Gg: AZuq6aKZxf/OIajl4zITcaCIX4+rpPokQYoyKmV5Pv/sHOwk1Y8DzsFQ1fyjLFqONtL
	rBUijT1GFJzz7MgK756wwlMv3crXcNDiQ3rM5Htq0b1EedkifmrwubafuOnnUQ33YKLu3bNs6iG
	rAjqT00Fzb63coTLuyRO5FSDa3wm/zbZFnaiB4a2byOTIgy0M8/+XJo9I5r0CylQrnX+7vyQQXe
	NVRQVmtQ6AI3vUczoaIzNj2zucaGLdNuFw2Bfs+zWpi/c3+tUxB2ULF+VHlFwHp0QjYFUfgbL/G
	DT+vbCnjUWh4wTuKVB3w+p7ZfT2ehVH1PEcA1f61WbV845VXzEdE12E9A9a18OFY6sxT4FDeOnE
	kymo07e8VFsXDPSAe/tVG3lErb28+0pvDJ/TLY/ex3Ti5ezW5VO+huarhJ/B5P3j/NaG1HgC+tq
	plPJsLWQ==
X-Received: by 2002:a17:903:b4e:b0:295:24ab:fb06 with SMTP id d9443c01a7336-2a8d7ee71e8mr129794975ad.22.1770087072352;
        Mon, 02 Feb 2026 18:51:12 -0800 (PST)
X-Received: by 2002:a17:903:b4e:b0:295:24ab:fb06 with SMTP id d9443c01a7336-2a8d7ee71e8mr129794715ad.22.1770087071876;
        Mon, 02 Feb 2026 18:51:11 -0800 (PST)
Received: from [10.133.33.50] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b3eec76sm161929225ad.19.2026.02.02.18.51.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 18:51:11 -0800 (PST)
Message-ID: <125f0ecb-79a5-4806-aa93-aecaf937885e@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 10:51:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix CMA error and MHI state mismatch during
 resume
To: Saikiran <bjsaikiran@gmail.com>, jjohnson@kernel.org, kvalo@kernel.org
Cc: quic_bqiang@quicinc.com, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260202151720.49904-1-bjsaikiran@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260202151720.49904-1-bjsaikiran@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vTcKwLIrawpUjpojvZQoTV0utNdJ_Wr2
X-Authority-Analysis: v=2.4 cv=VJ/QXtPX c=1 sm=1 tr=0 ts=698162a1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=RdEeBsXcWOgqNyDsrIIA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDAyMSBTYWx0ZWRfX+0PdySkVwiac
 RLHTTboYhKp515oOxDu5TUXVGRHBgVNyOjpikGx+8gN5BCKGL4RwigPMdK9P01Zg9P74xvvWFk6
 MRPjRuKfVv3zEO0NxiZAFngRw57JIuoBu9Sp6gDJlGI8uCV1UHGo/7K1UZIBxgp30WcVbyfGg/q
 GdIZGfUwOGEQmCRQJM+TwrFsYipjh4KQwTygGoWEfrTteJ6Id3zpRUMBc+SFYXRt38+erq9ZMOL
 RyhDoYeiBr16M7TdNhkQ5m8B4hKmzsbwfQfukiLrQxyAiMxQ2BAPdkXS9E76r+1giweJaJaR1d2
 iUZkb2t2F9a7kMRF/eVUlwS/hRS9aJvpVNZwy3/tzfbWboIIZqkFJaTgFMiFO/OhYUARqJpW8Qd
 NCjv6BdmR8autH4y8JyA9nEmVyghj8GRuFq8ki5LKti06f5Kku//UPeIqOanGbBfKzYl11eJa2u
 5cA6CgVWhHQ6Xzkg8Tw==
X-Proofpoint-GUID: vTcKwLIrawpUjpojvZQoTV0utNdJ_Wr2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_01,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_185115_132369_AE80C4D0 
X-CRM114-Status: GOOD (  25.45  )
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



On 2/2/2026 11:17 PM, Saikiran wrote:
> Commit 8d5f4da8d70b ("wifi: ath12k: support suspend/resume") introduced
> system suspend/resume support but caused a critical regression where
> CMA pages are corrupted during resume.
> 
> 1. CMA page corruption:
>    Calling mhi_unprepare_after_power_down() during suspend (via
>    ATH12K_MHI_DEINIT) prematurely frees the fbc_image and rddm_image
>    DMA buffers. When these pages are accessed during resume, the kernel
>    detects corruption (Bad page state).

How, FBC image and RDDM image get re-allocated at resume, no?

> 
> To fix this corruption, the driver must skip ATH12K_MHI_DEINIT during
> suspend, preserving the DMA buffers. However, implementing this fix
> exposes a second issue in the state machine:
> 
> 2. Resume failure due to MHI state mismatch:
>    When DEINIT is skipped during suspend to protect the memory, the
>    ATH12K_MHI_INIT bit remains set. On resume, ath12k_mhi_start()
>    blindly attempts to set INIT again, but the state machine rejects
>    the transition:
> 
>    ath12k_wifi7_pci ...: failed to set mhi state INIT(0) in current
>    mhi state (0x1)
> 
> Fix the corruption and enable the correct suspend flow by:
> 
> 1. In ath12k_mhi_stop(), skipping ATH12K_MHI_DEINIT if suspending.
>    This prevents the memory corruption by keeping the device context
>    valid (MHI_POWER_OFF_KEEP_DEV).
> 
> 2. In ath12k_mhi_start(), checking if MHI_INIT is already set.
>    This accommodates the new suspend flow where the device remains
>    initialized, allowing the driver to proceed directly to POWER_ON.
> 
> Tested with suspend/resume cycles on Qualcomm Snapdragon X Elite
> (SC8380XP) with WCN7850 WiFi. No CMA corruption observed, WiFi resumes
> successfully, and deep sleep works correctly.
> 
> Fixes: 8d5f4da8d70b ("wifi: ath12k: support suspend/resume")
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302 (Lenovo Yoga Slim 7x)
> Signed-off-by: Saikiran <bjsaikiran@gmail.com>
> ---
>  drivers/net/wireless/ath/ath12k/mhi.c | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
> index 45c0f66dcc5e..1a0b3bcc6bbf 100644
> --- a/drivers/net/wireless/ath/ath12k/mhi.c
> +++ b/drivers/net/wireless/ath/ath12k/mhi.c
> @@ -485,9 +485,14 @@ int ath12k_mhi_start(struct ath12k_pci *ab_pci)
>  
>  	ab_pci->mhi_ctrl->timeout_ms = MHI_TIMEOUT_DEFAULT_MS;
>  
> -	ret = ath12k_mhi_set_state(ab_pci, ATH12K_MHI_INIT);
> -	if (ret)
> -		goto out;
> +	/* In case of suspend/resume, MHI INIT is already done.
> +	 * So check if MHI INIT is set or not.
> +	 */
> +	if (!test_bit(ATH12K_MHI_INIT, &ab_pci->mhi_state)) {
> +		ret = ath12k_mhi_set_state(ab_pci, ATH12K_MHI_INIT);
> +		if (ret)
> +			goto out;
> +	}
>  
>  	ret = ath12k_mhi_set_state(ab_pci, ATH12K_MHI_POWER_ON);
>  	if (ret)
> @@ -501,16 +506,21 @@ int ath12k_mhi_start(struct ath12k_pci *ab_pci)
>  
>  void ath12k_mhi_stop(struct ath12k_pci *ab_pci, bool is_suspend)
>  {
> -	/* During suspend we need to use mhi_power_down_keep_dev()
> -	 * workaround, otherwise ath12k_core_resume() will timeout
> -	 * during resume.
> +	/* During suspend, we need to use mhi_power_down_keep_dev()
> +	 * and avoid calling MHI_DEINIT. The deinit frees BHIE tables
> +	 * which causes memory corruption when those pages are
> +	 * accessed/freed again during resume. We want to keep the
> +	 * device prepared for resume, otherwise ath12k_core_resume()
> +	 * will timeout.
>  	 */
>  	if (is_suspend)
>  		ath12k_mhi_set_state(ab_pci, ATH12K_MHI_POWER_OFF_KEEP_DEV);
>  	else
>  		ath12k_mhi_set_state(ab_pci, ATH12K_MHI_POWER_OFF);
>  
> -	ath12k_mhi_set_state(ab_pci, ATH12K_MHI_DEINIT);
> +	/* Only deinit when doing full power down, not during suspend */
> +	if (!is_suspend)
> +		ath12k_mhi_set_state(ab_pci, ATH12K_MHI_DEINIT);
>  }
>  
>  void ath12k_mhi_suspend(struct ath12k_pci *ab_pci)


