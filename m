Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D754ECA5FFC
	for <ath12k@archiver.kernel.org>; Mon,  5 Oct 2026 14:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2eIAsOhaVPTC3xP3VsP6J8u+4Zt4CiPhaYh6vvOX53I=; b=muY9uJIWNGQEh0Ie2sfWn/N4L9
	isuttheLzSFXm8VmE3lQlU3y+aQDXSeV3wOWlEoHiGqgtMeET3GKz8W0wo6c3hfQbWWZSCS+szY9O
	rNfezEgE+lS47VGhvSkEdSJFIHMRDbYGCgVwftt1d5IFwrVb78Vnw39587+A7jejQ/zi2hji793VE
	hih+hOK5hJCEejvj58QQAAczN7kS1ibp+yzIHAZC6KazOYHobPFr99cZN5oCnvx16Lwj4XzdtUXG/
	7GR1t6Hb3w+orFABmnL6ttpKhnArRWK1ckf/8YNOetZtODaR5CMTW3E/mIVyZD0rhhymSuGXTkqOa
	QlVCRVVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDjpB-0000000GeoG-1qS7;
	Mon, 05 Oct 2026 14:37:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDjp9-0000000Gent-1tuk
	for ath12k@lists.infradead.org;
	Mon, 05 Oct 2026 14:37:52 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695EPwCM762341
	for <ath12k@lists.infradead.org>; Mon, 5 Oct 2026 14:37:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2eIAsOhaVPTC3xP3VsP6J8u+4Zt4CiPhaYh6vvOX53I=; b=JOW+uXb3RPBy2i2f
	k0Rq0bqa9hOX+IVfUvD9Hc15GGu/Shfe8BhdR12q0zA6YCSS3XOOc6qgbspcAAxX
	etRk7wp3EbCbLZm7VgWZNsoOQMND1Qz6cTqndtdcG8k6t4z6aMomDkQmcKbMiOgW
	aUjlNuZU6utIH9HRoTVqNxQPLhVE76omG/uGadDW6FW6XS+eCGsIiBALvxMnDChE
	36WlmRAX7Ru0QtqhJ7eDOBp2uCZtlOiE2SCO4BPgrWAPWoNNl6gpN2nGep1SwiOp
	LvcRlmt3FdYmy8DhzMsDw+muG5wiaZNbEhqLy/JX7RLBoMSQXLrAR998KYFW8ZPR
	i70CXg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4dncg1xr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 05 Oct 2026 14:37:50 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39b6416441eso2796226a91.1
        for <ath12k@lists.infradead.org>; Mon, 05 Oct 2026 07:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791211069; x=1791815869; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2eIAsOhaVPTC3xP3VsP6J8u+4Zt4CiPhaYh6vvOX53I=;
        b=eqKVos5HLqgqccdc03rOkowVmXp9GvVEnkdvduPtrBHkgPEWwPO0QInWQkLroubB89
         2a/6VASlHUIISF1O+W+cCbaPm8gp7X6pfj2Lg2zNmMkDIwKJ3Xo8xpIdcu53XYjnBSGg
         c0TEaZUoiNgjvHqUlLTrRnzOMBAmUJ2z7+sRh1PHvUvKLpTWD4v9LRQV3054+4O/vDhe
         Wt4ZDiCHnYOOe3MuSiEr+txMtwF6S7CRRV+e+nirrbQ1l31bjWiKcpQWuJeRBpcLdrSx
         nFzG+A9lnSFMx0l88YBbh53X879vrkwjs295ItZZlRLmV4R8zp1Yceq4hvbUaueTd3T2
         XfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791211069; x=1791815869;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2eIAsOhaVPTC3xP3VsP6J8u+4Zt4CiPhaYh6vvOX53I=;
        b=qkQkRB+WdGstHSC50NsptIGRjO3qnaHHZ8FAJbYVl7nIudIiwIl/rQ6zeyv8WcFOWq
         a/LzsgU2di0ZE24pDEu7sQWZ9gzjmtAAMWz49Yaic9qzUEx4KbyqujS1Y02iZcREBZrd
         WGwG07pBy2rBitKwKniMETGm7a5ciwIQGjFdD2WjU2X54uNWmgeAZ1aXXUsD83Za6r3C
         eaTCcDL31VASM2c+5i0n0SWqItVpJAz+7B1+MvezRJCdXoEPBr5BzIBfFBzhnyoSXvrb
         8OwM7tub9/wN56048JYheaSmZ96MjS4l+mFqH0q+qAf30qwQYbR3BJKFR1djVOuZvzIS
         4C7g==
X-Forwarded-Encrypted: i=1; AKwUvBwKuUd8WYqu5YnVUCD82slsv1h7ZJldc/26PMk8Tpf9P5VnbBCq9+z0NmF58WUD1jIA1tzop20=@lists.infradead.org
X-Gm-Message-State: AFq9FYLgQfsmvb0GVrC56Gpa5Zw1YTun134hCTuvxzkf2L1AsPTHa8YG
	ZpE2mwIr6w7jD4uNWX+X1d3L1qBrT6L042F92+HYzT/hXAsndrCQiqPPJM6ZcilHaCExT0hQ98e
	v1KlhaNiZ9fWGpPJB+dOFc+/iZmuZ8DXbDXL36cFOhM4OxUaCwaOPywDzNvlyO18G
X-Gm-Gg: AYBFou1LxaQTnSG7aCXzhC1h2MUyQ53t0Rd4q1pn9y53gFmr1/Kkga+JbwEKo7sleIT
	BlS25TSxWxlFE+9vEhvVMITqgYbdIjpzl7dYttIjbImYr5iYaH6mye1LoCug0nSZAg818vCVH0I
	Jm3Rm4Sr3T0COl1xUo1dI4tZQtCXYWBD2FHbhNvZJyuB8KCvr4qtsF+P1kYzpRaMMQRaBct8yQx
	Fgl7rqMEG8kDkFiaGD/0J7g4RDE1O789Yh6bmch8qALsyTZ9XTBYwy6dvd0sqIOUPSR7N/LFFvY
	vrBQheMqyJfvNl9MJWyDDlxbYHvzrJTyWNWsE/T8JjX2byY+TPEOd5pdJ5YN09f5h1YMzaeA8m8
	yfVto3aJ4rjcF8acOuM6U4Rh7wbkJ2zKqN0WFW/w0kKcVg1mqvQ0Ag5W0NQ==
X-Received: by 2002:a17:90a:e7ce:b0:3a7:8c68:6446 with SMTP id 98e67ed59e1d1-3a78c687f95mr6625961a91.63.1791211069303;
        Mon, 05 Oct 2026 07:37:49 -0700 (PDT)
X-Received: by 2002:a17:90a:e7ce:b0:3a7:8c68:6446 with SMTP id 98e67ed59e1d1-3a78c687f95mr6625943a91.63.1791211068860;
        Mon, 05 Oct 2026 07:37:48 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dcbdd97fsm7594125a91.0.2026.10.05.07.37.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 07:37:48 -0700 (PDT)
Message-ID: <d791e70f-9c3f-4916-94de-8d76517339bf@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 07:37:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: skip hardware rfkill setup on Microsoft
 Surface Pro 11
To: =?UTF-8?Q?Fran=C3=A7ois_Roux?= <franzelfranzel@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio
 <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Dale Whinham <daleyo@gmail.com>, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261004165132.4313-1-franzelfranzel@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261004165132.4313-1-franzelfranzel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA1NyBTYWx0ZWRfX8VUAdLACo0QP
 7tuKNez613ZOC5xTA+BCD66FeXUPaCeqQYu2aNUuH522KHYFdC2f1bjrFvnzQL29X+RgD67Dk6S
 zfeTTU9G2pvGBeavDyacQ4nQsPfZNpc=
X-Authority-Analysis: v=2.4 cv=Vdxir1p9 c=1 sm=1 tr=0 ts=6ac3b63e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=7PQHMOqyCB17KHk-lU0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: y7CPHsFCTlItr1xcVFnNcJsq3sZYaNRD
X-Proofpoint-ORIG-GUID: y7CPHsFCTlItr1xcVFnNcJsq3sZYaNRD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA1NyBTYWx0ZWRfXyTyw8eShahTP
 48AGr3zRcT9Wmkr0damjgt2zarKgm7O1Jmf1kAnxMqRkjGF37Y0JybcJOPtYUy2WnUwtDNil8YB
 UzfaKM8RCNypvNAP/mEmBR/f5+khHiJg7S9VFcl3wCS3MxLhqaUFJy8HK0Fo7F6w5jBweVKVYlo
 0H0jreTON2dqDIRuV8Up1CJ1hsjaZ0zW/neiqbrlPuPJS5WHFY0dy6C/LVWgHexjixxndQyZJHX
 YldXILYhw1z6duQfxa8qWhMs8JbV/brOm4AHgWxDVWjhqWx50s0BdLQJmxHmNMvW+3FbakVkyCc
 iN6xHVMtKOQyGePUq5E4GVLyfPTx5H7sHlmYHOhU6AwBvgnlyMvje/nbFwmRtomlMn5vlMqMdOy
 MI3OTw+74VLkYB0mmUFRuW0obQEbSaWVK3i1TOzZIsfRPYuQFhcVzzqnC/xr/nSHIxntvuIdtQZ
 NNGU3vcWZ2u/HwuSjYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_04,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_073751_509080_F104EA8B 
X-CRM114-Status: GOOD (  28.02  )
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

On 10/4/2026 9:51 AM, François Roux wrote:
> On the Microsoft Surface Pro 11 (X1E80100, "microsoft,denali"), the
> WCN7850 hardware rfkill input reads as "radio off" and the OS has no
> way to control it. ath12k enables hardware rfkill handling, so Wi-Fi
> stays hard-blocked:
> 
>   iwd: Error bringing interface 4 up: Operation not possible due to RF-kill
> 
> ACPI platforms can opt out through ath12k_acpi_get_disable_rfkill(),
> but DT platforms cannot. A DT property was proposed for this and
> rejected, because it describes what the OS should do rather than the
> hardware. The suggested alternative was to handle this machine in the
> driver, keyed on the board compatible and the device ID, until a
> connector binding can describe a broken rfkill line. Do that.
> 
> Tested on a Surface Pro 11 with next-20260929, booted with the
> unmodified mainline DTB: the interface is no longer blocked and
> connects.
> 
> Link: https://lore.kernel.org/all/2ixwny6hzumlqmok5cjwutvtk7nzmx4t3dhxc44ao4l2u755pj@n6m7jyxf2o62/
> Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
> Assisted-by: LLM
> Signed-off-by: François Roux <franzelfranzel@gmail.com>
> ---
> This replaces my RFC series "Allow DT boards to disable WCN7850 hardware
> rfkill", which duplicated the disable-rfkill DT property already proposed
> and rejected in the Surface Pro 11 series:
> 
> https://lore.kernel.org/all/20261003091509.4822-1-franzelfranzel@gmail.com/
> https://lore.kernel.org/all/20251220-surface-sp11-for-next-v5-2-16065bef8ef3@gmail.com/
> 
> The code is Manivannan's suggestion from that thread. Jérôme reported
> there that the Surface Laptop 7 (microsoft,romulus13/15) has the same
> problem. I left it out because I cannot test it.
> 
>  drivers/net/wireless/ath/ath12k/core.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index 0c72948f3..dc41a2a7d 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -83,6 +83,16 @@ static int ath12k_core_rfkill_config(struct ath12k_base *ab)
>  	if (ath12k_acpi_get_disable_rfkill(ab))
>  		return 0;
>  
> +	/*
> +	 * TODO: On the Microsoft Surface Pro 11, the OS cannot control the
> +	 * WCN7850 hardware rfkill input, which reads as "radio off". Keep
> +	 * hardware rfkill disabled there. Ideally this would come from the
> +	 * connector node of the board DT, but that binding does not exist
> +	 * yet, so handle it in the driver for now.
> +	 */
> +	if (of_machine_is_compatible("microsoft,denali") && ab->id.device == 0x1107)
> +		return 0;
> +

my preference would to to break this out into a separate table-driven function
so that if other devices have this issue they would just need to add to the table.

reference ath11k_core_get_usecase_firmware() as a table-driven solution for a
different device-specific problem (selects different firmware for specific
compatibles).


>  	for (i = 0; i < ab->num_radios; i++) {
>  		ar = ab->pdevs[i].ar;
>  
> 
> base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
> prerequisite-patch-id: aafe3fac38f4020441979665509928f8cc832095


