Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE912C531CC
	for <ath12k@archiver.kernel.org>; Fri, 24 Jul 2026 00:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m7QsKN0giofAKW5YvchjOEMo+riIGTGsBgW/mogRrEo=; b=mkJ5oacuNgbUs2PVoXWBf/aBNH
	VkIG41GIiXvEPaGOmHTGYRu3CX+j9FVlzndyITxh5QSFxbJshbGNzoTBaNY4hjzW65F4mwY5Vh8b5
	KVP6It8IUwnGD0fqSzXaCoYQy3VvrrxAm06wsrG1Aj5NWL9wgdpkvm+q36ZhcBFBJPDQx/fCy7GjE
	abGVMylY6owe5YAuo8vCqFV6NS6n2hwk2N2hqtRE5UrONu7DsmphhZ1oOujRB8dkHHI7AUAoOj/Yx
	Zk+UJPiUshiJ2C2l6WlwXW4xE00jcnf627XKqO6ZA1zG8ALMqMUIWUP2w2Yh7KBc9H7AgaTcrvhxP
	kLmZdx/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn3ZV-0000000FI09-3Cnl;
	Fri, 24 Jul 2026 00:15:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn3ZS-0000000FHzU-3izP
	for ath12k@lists.infradead.org;
	Fri, 24 Jul 2026 00:15:24 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NLe38r2216879
	for <ath12k@lists.infradead.org>; Fri, 24 Jul 2026 00:15:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m7QsKN0giofAKW5YvchjOEMo+riIGTGsBgW/mogRrEo=; b=b0LSwza2Xm8RiLdm
	WAm0BZ0jQifYvOUe+VZMmpR7PxI1CoDakaacB9B3T+Q4Rd/R+1e8Ob9oSsuxdt84
	VfGoHGuTOo2sLBX8fHb8TPlxVLC4yf1nIR2ONY2xS6RuZ9dR9LEiy4tWMgDoZsvw
	AynLB1xF9OX7bl7ssNKSat86cDpZNwGjYaeFhtUSkfcruqZJ1bpWR3rJm0b6AiNa
	QA0F5SFRcCh3Rvv0X1htxcOT0cX3RsAFfWcFzrGrdkkzM49mIjBflTCgFMNMDrsx
	GNUf+nd9NErmpWaHlmd+IXDNb6bpXvVOUmL5sI07wNI5yIKfl07UNCO8gikuoDF0
	dnMXMA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkn9a224q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 24 Jul 2026 00:15:22 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb835525b10so1549189a12.2
        for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 17:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784852121; x=1785456921; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m7QsKN0giofAKW5YvchjOEMo+riIGTGsBgW/mogRrEo=;
        b=jn97ybZDKCXpDGoyWn6hP4W/2CLtQqheZhSoKgrNMzBFNCr+Ko9wr5adNLfFD327du
         Ms6IHK5OytMKz2FRbzNWxUwYeB8yoZaUiPef4hu0NyUKivjbaXyyQZWmY9ZIyFVXhEEs
         ljRpZ5MYAe0ixSJsGl1SCf/9B9UpJ/R9P16XTVWjm38p4aK5HwuMeZSzAH/OM3zkg89j
         wSxtIeZi5xckuuSFGnUAi7Q34YsqDf/wEwOxr+q/oc7sB5nGtRzXCPxL8FjlWc6Gk7x4
         bLCnANTvKZV1r5sZxs9593m24QgHSg4VgiTxSUxGox/wQfdR17ZdSEYAKG6zAI49LyiN
         owHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784852121; x=1785456921;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m7QsKN0giofAKW5YvchjOEMo+riIGTGsBgW/mogRrEo=;
        b=BeXUEy3klD7KBAEFsAE1cMNxVy+QoE66oENiKGZu+Y8x7/2exls/nes9xD/yAlcygE
         8yJOQ9oooVvOrRoQZKdnBQCFpPUL7aEuOeMbO5hHWWUIY8Sdr89FHnr/Ja3Yr6ItXMBU
         x+luiujF2uXWvytjhsJqy/vn56848k20jZoKm5mSri+urKYLLhZFpUzNT5lsOMxZytmb
         i4BWIZ55IVLIs29TNDtmbookLka/0FKl2UrQHqZ7QgTPchTdbFMRQYKg1bQ2tyMdEwHa
         aAXvYTiJc6aUAGXLc2hK+cK9jhuhiN7YmJsj0FZ9TS6Xvz5DIUM3dIQCgqy731SwQmbI
         /ocg==
X-Forwarded-Encrypted: i=1; AHgh+RobyyttUWv1eO+DO4a15b8X3nTmYSELE1qNuLE/ZPNpQhYwKeQyJZAtVugKBlhXqd3S15WxVII=@lists.infradead.org
X-Gm-Message-State: AOJu0YyweWm6uxaXHpQJF4F9G9BuBlhNlXngTJa6immnMvKF/rtObZ1n
	of7LXIZthr01V3eNT9CYdlzQSNrIRIFrRNoF2SKNsZqB/Q80mYkTbi2EQ/TK7e6vz6/iAl/90+t
	EjAyawNCHDnFJAqFSlGGqdrFK4KH1s074LpC1PPsp2/ltxbRbNB+DJkKhtUI+HF+r
X-Gm-Gg: AR+sD10B32oFcSSPuXbuAKZRfAwYh32ib8eiY/wqrfXhW7HtSOocrIRtS2NV2NzVcBy
	LXjuTH5e/Hy7G0zw/L2pPo+ZIlYUQJIrKy/J1xYeCSZYAf0bLdSE6CcoRk/MguLL+wakqpmuXBU
	dOSPy+U2ZJqg9T0l+EMeccfbyljSUW81swlaGK+BARad0HxiyU6U3Ae9KdNwqOAZkWElcG2knDj
	RnIPJbVTH1NZK2gAS/t4veLSVe1AOxv2FbefH+FOVHUXJZSZxRAyYdU0fxi5Sz+NXXKVI8vFIfN
	X1TwgJSuWSeEKBr+3iuY2bo1fF5QjZVmm2QUVpGqzyJ+RjISC2EyswgLdEyUGmh4PNOAKwm4KfZ
	tdVijcN6+GUHuKOK2TzWvm7C0BNBiwMNsQS1RTkjZgdteecYkvHFelG0sJQ==
X-Received: by 2002:a05:6a21:a8b:b0:3c3:e411:418a with SMTP id adf61e73a8af0-3c44b28858bmr5934671637.70.1784852121515;
        Thu, 23 Jul 2026 17:15:21 -0700 (PDT)
X-Received: by 2002:a05:6a21:a8b:b0:3c3:e411:418a with SMTP id adf61e73a8af0-3c44b28858bmr5934638637.70.1784852121103;
        Thu, 23 Jul 2026 17:15:21 -0700 (PDT)
Received: from [192.168.1.11] (15.sub-75-218-246.myvzw.com. [75.218.246.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130cc5ebsm25688668c88.12.2026.07.23.17.15.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 17:15:20 -0700 (PDT)
Message-ID: <bacea060-bae5-4136-841c-49db5b561b51@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 17:15:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: restore country code during resume
To: Stian Knudsen <stian@pokerfj.es>, Jeff Johnson <jjohnson@kernel.org>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
References: <df37460e-f8ba-4e11-b412-4aa8b17cd32e@oss.qualcomm.com>
 <20260720120913.100604-1-stian@pokerfj.es>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260720120913.100604-1-stian@pokerfj.es>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDAwMCBTYWx0ZWRfXxbYQy5HOvTYE
 l3VCxd+fqjn4ztii7IAjLVX5xSinsj8DDLmL+9Wx4f6fJfYN4N6NQACdvlBJc8x9atmEEvsOPgl
 Fm4ge2Sz5E4OyQHLnDXW5P/2m0a2Vdze1V2qCBSE2YtgyooO/RqQS+5l32ygSZE3sXBKBlx5FJt
 x40Llfk26zwbCewTAvnjKPFCssNUdVNm0UtaIW0DlaLrcqJiDQo14PNspUcks/Xj6ltXVTHrHE2
 CjDIcoFcOm1eEeoRywpGsoTqSO+0Xk4l6ZsGk477/jI7eJq0XDQ8hNTbGNHDySe3TTBUmFO8yMB
 TkgRVAZDl84HYzhl/lgDgh11UOolEmQVh2jYadU/EFxoppuMsc89aQUl4OSgU3h8SS59/O23+C1
 A4YvUI0LBohMTpR2fYf3I9WJY0couvbzkD8xJOXnWWacT4Kjwyzohu5g6Yr3PRc4lMs8bvVnUdU
 9FZ7RwUveOoBllTn+OQ==
X-Proofpoint-ORIG-GUID: QOczrZXQrmdFZ2pZ3BiJTcHkOlW59FU1
X-Proofpoint-GUID: QOczrZXQrmdFZ2pZ3BiJTcHkOlW59FU1
X-Authority-Analysis: v=2.4 cv=WOdPmHsR c=1 sm=1 tr=0 ts=6a62ae9a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=6VQYfvmiyQ8t40WkS/mQdw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-SOlkNUPErW3LcS7OYoA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDAwMCBTYWx0ZWRfX57XJ2LPHurNT
 n5fasL2Dx73DGREXiCxfZzD++GcPCJIzxpKAJpO3Mt4pVok4xaTs9G6sdZZ/8rKAl807gmNLc0M
 rcpI0utz+n+O0hsu+3+cZ8xDdnStAFc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_07,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_171522_947853_04E0DE6D 
X-CRM114-Status: GOOD (  27.24  )
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

On 7/20/2026 5:09 AM, Stian Knudsen wrote:
> The country code configured before suspend is lost after resume:
> the device is powered down in suspend_late and powered back up in
> resume_early, so firmware reboots with its default regulatory
> settings and the previously set country code is no longer applied.
> 
> On WCN7850 the firmware comes back in the world regulatory domain
> (country 00) and takes ~7 seconds to rediscover the country code
> from AP beacons, part of a ~16 second total delay before wifi
> reconnects after resume.
> 
> Restore it by resending WMI_SET_CURRENT_COUNTRY_CMDID during resume
> if a country code was set before suspend, i.e. when ar->alpha2 is
> valid. This follows the same approach as ath11k commit 7f0343b7b871
> ("wifi: ath11k: restore country code during resume").
> 
> Note that only single_pdev_only devices support suspend/resume (see
> ath12k_core_continue_suspend_resume()), so handling the first and
> only pdev is sufficient.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Fixes: 8d5f4da8d70b ("wifi: ath12k: support suspend/resume")
> Suggested-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> Link: https://lore.kernel.org/r/-_iDJ_M5RrqACWB0qmtleg@pokerfj.es
> Signed-off-by: Stian Knudsen <stian@pokerfj.es>
> ---
> v2:
> - Add Fixes tag, per Baochen's review comment.
> - Link to v1: https://lore.kernel.org/r/20260717130254.36732-1-stian@pokerfj.es
> ---
>  drivers/net/wireless/ath/ath12k/core.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -197,6 +197,7 @@ EXPORT_SYMBOL(ath12k_core_resume_early);
> 
>  int ath12k_core_resume(struct ath12k_base *ab)
>  {
> +	struct ath12k *ar;
>  	long time_left;
>  	int ret;
> 
> @@ -211,6 +212,26 @@ int ath12k_core_resume(struct ath12k_base *ab)
>  		return -ETIMEDOUT;
>  	}
> 
> +	/* So far only single_pdev_only devices can reach here,
> +	 * so it is valid to handle the first, and the only, pdev.
> +	 */
> +	ar = ab->pdevs[0].ar;
> +	if (ab->hw_params->current_cc_support &&
> +	    ar->alpha2[0] != 0 && ar->alpha2[1] != 0) {
> +		struct wmi_set_current_country_arg arg = {};
> +
> +		memcpy(&arg.alpha2, ar->alpha2, 2);
> +
> +		reinit_completion(&ar->regd_update_completed);
> +
> +		ret = ath12k_wmi_send_set_current_country_cmd(ar, &arg);
> +		if (ret) {
> +			ath12k_warn(ab, "failed to set country code during resume: %d\n",
> +				    ret);
> +			return ret;
> +		}

Baochen, can you remind me why we don't need to wait for completion here?
(the ath11k change doesn't wait)

If that is legit, perhaps we should document it with a comment since
reinit_completion() without waiting for it seems strange

> +	}
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL(ath12k_core_resume);
> --
> 2.50.0


