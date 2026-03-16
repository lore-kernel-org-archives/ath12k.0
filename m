Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19300F4644D
	for <ath12k@archiver.kernel.org>; Mon, 16 Mar 2026 10:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fFL00ILQpt8ZZD7ShfDXG3TNuwkrXjiEhVr5NIgrGpA=; b=GZtsnHW+8kLoPOA6TLF5Bsoa47
	r06WPHeAeOcULvH91Tc0D//QwunxA4Em/YuPPg2B0IkEGW/5lPlQtbf/TW1KXAIG+ioVOhXcPTSQ0
	47LKcGnqUAntwyOiug+yfrXk0wp/UCdqcmZZdI2Wbb3PX5UhLUwMEN2ut2lHo35uMfx1JeqHYUhyc
	fzrlnxZYAr0zpZrBrm5k/+J9fb5pGdPY3ykxZ2bMz3y5BTHi70tEVpAOFcH19x8IjwHfS5mU339jp
	SAxG/ftzWcKaE0oY92Lc9tWZG3NyNpAnwodOdXrWdPyo2VSCzGEnvbwVpZ2iWdbOiZiazueNNBh7D
	mJPuCYoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w25P3-00000003lUS-1gNr;
	Mon, 16 Mar 2026 10:42:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w25P0-00000003lU7-3urt
	for ath12k@lists.infradead.org;
	Mon, 16 Mar 2026 10:42:28 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64cUZ662943
	for <ath12k@lists.infradead.org>; Mon, 16 Mar 2026 10:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fFL00ILQpt8ZZD7ShfDXG3TNuwkrXjiEhVr5NIgrGpA=; b=BbIK3wyyHFM2F9uW
	OtGqhH7J1uE4QpXU67go78JdVhs1wNFEyReFiWYz8gs00DQdfsoP3Br/FDLDCvJJ
	CJVtWBNfyKoJ6i1jd0idbDKhh8CkPIJYzzyTaONRc9rp4G2yb5L9LtyDZRPFfMOM
	EXBucEA+B/xX0oQfI7YBRdF01roNS3UvsOkduPQOisqo5b8t8BqwSXZPzPKb9Qts
	PWYP4y1lMFvnzoNT04Z1Pz/LW5DqAt5Of7tJOMciuYsUKvdqldPzNdNBQGRe3ZoJ
	Ja4rjT2cK7lmSg/1pQX1zvTS6Qul6071WNA5Ns+FJIZXWc2un7WRn6pMdsKjs5VV
	NQE8Kw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw043n8p3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 16 Mar 2026 10:42:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b0601ff3d9so2633505ad.2
        for <ath12k@lists.infradead.org>; Mon, 16 Mar 2026 03:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773657745; x=1774262545; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fFL00ILQpt8ZZD7ShfDXG3TNuwkrXjiEhVr5NIgrGpA=;
        b=adiid7WBXJPHGzAvNhI9LUzXWDBHrx9gxaokeglb994PjEQes9Kreu8y0jN+8UYIqp
         lTP8GkMIUpFvyw5y4SCyDo53/qNmfuecRrTsFrcOOC4uSvhB4BlXZVEoJwnSzGdtA2rx
         TYUSE1ycicbN4mGOeMLQR0cGNUB7KeTKf3gYw6KoVwPjC3tJjYJtRCpbcLuH28tCFRrD
         A5LXvDh642wbnK9p85FfxJjDzlf4nHOzlS2aMwJ/RtuJyOx2qAXdB9flX6KONWeXRWUG
         JsvqxwLXZUaxAJptPCvflyIPXEg/zjNhJhrCDqOP2bJCIHJDHjIp2TA541AnopCJBrDo
         rriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773657745; x=1774262545;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fFL00ILQpt8ZZD7ShfDXG3TNuwkrXjiEhVr5NIgrGpA=;
        b=CpB+9KLdNxgP6nlxXXbicsLXYoLVN91M77vL0nVdPr+SNvnrtMoe+eVK/M4cKH1Y4O
         QRKKrTKeLv45ozvY49S2MhnAzXASofd5kobuIyzRASgJLiwwNltIDgPbFUAW3uDYJyz+
         O7iOpe3x596GcfYl8FAdpIzeq/4pyp3bjgFegTcPweYrAucSgVLW3c3oF8AMKUDHeNui
         BHDoUm9q2gzCOIhmLnmMXcwTKLpqVBDKxkqDWSiedp5YJX9JvH/2OoK3BuFSacUUFNY4
         15hXT9Osvt7ceuO4LSzUBT1nBiJWYDMTJDIPmh3QGJZfpQCjP5+bFU96meSGrclFzaDq
         D5BA==
X-Forwarded-Encrypted: i=1; AJvYcCXljHpaYFuSZ5hHUR7qhKAsl0xk9Hrs9qCXaTCsr9Os9oWGxvidiuBicOg8fsQGI54PM1o9+a8=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq7GRqGgAW7Cjgd/ztA+xly9dpTzaEuPWn86fRxHBk/Dji7Kwp
	JcB8Es2HvnLWZhLf8mCHfTQg5WhntTymTDkud0HhJVjKt1cA4JV4ZrWtx5i0q0JlYCGbYFABOyl
	RKAWl3Ozv1gtkJtdbqywkIxC1r/DyP8giuLWTAqUjR5d8+uhxkV5ZC8Gbcc4KTJreKESr4Fx0/z
	s=
X-Gm-Gg: ATEYQzx/Qnpaa9RnmbZil4l9yzoWO9a/XGe9WBCMBrTay8tCxUFrGykkCXVGHQH2dnk
	JbRk4yJg3+4MyPJRhr6/Yeiuu/T+/BTXtPCk7yvR4UyKRl0cVx+56A1VoWncZHv+eFo68kL4ggl
	yzAmNyT+82k2affHRmefTPvgfGN5jglJRMhtTlbcpyFNTvEVp23mJpAgcv/XTuAuekpt3V5o4TH
	Dd5VBG916jKd3vgR9Hofnakci+AuY/W99T4YHuSbDRW2SwzD1lU3XcnRwROZhXkt4vAlWlVotmS
	9WaDexiGuNFBQr13es/j10PSNCBJVKmEmRraZmW+6arXidSwwvbrLl3W9yE6Zn8MBz4VO+JezFk
	nwJ+r/hBdGd8IE80sOhD+Rml0asaFi9mUHTnKVRfudLbWa1vrjussZFOYZ/wcgcZqocAawoj6fQ
	HA8nZQ4INHwAwGF5ZBoGM=
X-Received: by 2002:a17:902:e888:b0:2ae:a9c2:6aa with SMTP id d9443c01a7336-2aecaaf6060mr131499025ad.32.1773657745077;
        Mon, 16 Mar 2026 03:42:25 -0700 (PDT)
X-Received: by 2002:a17:902:e888:b0:2ae:a9c2:6aa with SMTP id d9443c01a7336-2aecaaf6060mr131498755ad.32.1773657744548;
        Mon, 16 Mar 2026 03:42:24 -0700 (PDT)
Received: from [10.133.33.128] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b055cb5d60sm34445145ad.30.2026.03.16.03.42.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 03:42:24 -0700 (PDT)
Message-ID: <d38acb9f-60dc-4d37-a3b5-8cd09f76939e@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 18:42:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3] wifi: ath12k: avoid dynamic alloc when
 parsing wmi tb
To: Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260316103248.3042158-1-nico.escande@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260316103248.3042158-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA4MiBTYWx0ZWRfXxy4CR56bKEHn
 yHDp559cTQ4eBLZ1dFQym0+8yOj9KgM/os0hQngXkP9UeIwR21b0KXdaRsU53wlyC+Bgots/frQ
 NBZ7fL1dtFNH/SzSZ1nRQoaIash7VY+5jBq9m37m02/s2XYTP8ti1umwmGuVI0zhQeTnggjV9hX
 wz6TNgW8oyUM0yUHgao/BrSfnEBo7lAD5Vn8xOySBDeAFOzvQJ/fbT9aDHUzXmXM9aTsETlKbHw
 uAOt7gF/6L8kRtgnoOtquPxcB6L86yY19w+DcGSy6XH2mAqPGSIQbAru4uGFdNRZYkMlmxm72ui
 JoL0NSgXrmW1vtukEpXC8dtlf6aoA2aeK95e+YBjpDfVI4ZzM1MUj4pHuqmTNYkKox+Zfp1c9gT
 ba95gLHNfDmmNrTNPeOTk3TOYwmNNenvbGZ+yqNxE2QYUVb6n4mZWJYkMjivGtk/PVGQd6B6xwL
 s5FWz3M1aYo53rIZs1g==
X-Proofpoint-GUID: -bJok6lJOa7NOOoKBG5DCnppSPGCpl7r
X-Authority-Analysis: v=2.4 cv=fLs0HJae c=1 sm=1 tr=0 ts=69b7de92 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=0k2Bv0oT3BV_p61_ltkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: -bJok6lJOa7NOOoKBG5DCnppSPGCpl7r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_034227_031222_2BE39E0A 
X-CRM114-Status: GOOD (  26.76  )
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



On 3/16/2026 6:32 PM, Nicolas Escande wrote:
> On each WMI message received from the hardware, we alloc a temporary array
> of WMI_TAG_MAX entries of type void *. This array is then populated with
> pointers of parsed structs depending on the WMI type, and then freed. This
> alloc can fail when memory pressure in the system is high enough.
> 
> Given the fact that it is scheduled in softirq with the system_bh_wq, we
> should not be able to parse more than one WMI message per CPU at any time.
> 
> So instead lets move to a per cpu allocated array, that is reused across
> calls: ath12K_wmi_tb that lives in wmi.c of the ath12K module. To alloc &
> free we added two new module_init/exit functions for the module and two
> new wmi functions to alloc/free this memory.
> 
> ath12k_wmi_tlv_parse_alloc() and ath12k_wmi_tlv_parse() are merged
> together as it no longer allocs mem but returns the existing per-cpu one.
> 
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
> ---
> changes from v2:
>   - removed now superfluous return in ath12k_wmi_event_teardown_complete()
>   - moved ath12k_wmi_tb declaration to wmi.c & added two functions to
>     alloc / free it
>   - removed useless error message on memory allocation failure
> 
> changes from v1:
>   - rebased on ath-next 27401c9b1432
>   - changed wording according to Jeff's comment
>   - moved alloc/cleanup to new module_init/exit functions in the
>     ath12k module as per Baochen's comment
> 
> changes from RFC:
>   - rebased on ath-next 8e0ab5b9adb7
>   - converted missing call sites ath12k_wmi_obss_color_collision_event()
>     & ath12k_wmi_pdev_temperature_event()
>   - changed alloc order & cleanup path in ath12k_core_alloc() as it seems
>     it confused people
>   - used sizeof(*tb) in ath12k_wmi_tlv_parse()
> ---
>  drivers/net/wireless/ath/ath12k/core.c |  19 +++
>  drivers/net/wireless/ath/ath12k/core.h |   1 +
>  drivers/net/wireless/ath/ath12k/wmi.c  | 200 ++++++++-----------------
>  drivers/net/wireless/ath/ath12k/wmi.h  |   3 +
>  4 files changed, 84 insertions(+), 139 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index c31c47fb5a73..16815a27f8f2 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -2321,5 +2321,24 @@ struct ath12k_base *ath12k_core_alloc(struct device *dev, size_t priv_size,
>  	return NULL;
>  }
>  
> +static int ath12k_init(void)
> +{
> +	int ret;
> +
> +	ret = ath12k_wmi_alloc();
> +	if (ret)
> +		return ret;
> +
> +	return 0;

nit: you can simply

	return ath12k_wmi_alloc();

> +}
> +
> +static void ath12k_exit(void)
> +{
> +	ath12k_wmi_free();
> +}
> +
> +module_init(ath12k_init);
> +module_exit(ath12k_exit);
> +
>  MODULE_DESCRIPTION("Driver support for Qualcomm Technologies WLAN devices");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index 59c193b24764..02ee6c718621 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -19,6 +19,7 @@
>  #include <linux/average.h>
>  #include <linux/of.h>
>  #include <linux/rhashtable.h>
> +#include <linux/percpu.h>

does it make more sense to add this to wmi.c instead?


