Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E499D73099
	for <ath12k@archiver.kernel.org>; Fri,  3 Apr 2026 04:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tu61AyGnBgVejknoekX3DnvPA8bTJAUFSOc67PDNgPg=; b=plxrkYEiaqDmZF+WJsGmOqKZ42
	iZC/tqfqC+VidSEMpAdJ8AD9peB7eM5Xy1aI6uwEGmk4BrNxn87a4+prmvMzpruOkOtWtQ4LwwPxc
	xp8F+wt5yDvcgpjOmd956nE3eqSY6FELLnGD1+nhJ2GY+W+8KBreDrBFzwtKA0t6bv7bTiNOlHNC3
	yUv7tlKsSfx6gTefz3H+NrbpKTUt1RlbVVxKMtO0TO0xZqQMeGR2ucOocerQ6eK5SazIA3HTsBe0A
	MYeNlZ7Qba9hQmVZx1kPH906EZy1KHLlOXIeVTLZklnjMypbAgGI8URQVuCnIs3jbp9+5lua8zrg+
	M7M/2jEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8WVZ-00000001EGM-3gla;
	Fri, 03 Apr 2026 04:51:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8WVW-00000001EFj-2XIW
	for ath12k@lists.infradead.org;
	Fri, 03 Apr 2026 04:51:48 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63331AMd1562147
	for <ath12k@lists.infradead.org>; Fri, 3 Apr 2026 04:51:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tu61AyGnBgVejknoekX3DnvPA8bTJAUFSOc67PDNgPg=; b=JkKoAt4m4oyzZY/q
	Yl8dx5N8/FrAIBIZEVtwt7JLJpIN6C0YEXR/81VCPRt23Av6y+n2B1sXtNuJNayS
	bIGmeTpygv+XU4OrvPkwsUGUthsD6LYjvyyhcVvEV2cxch4uCm8v9mTb/cqLDszc
	4KULkGHbvDsRJw3AOMNNTHrK6FxDEAXTbchTBhp8EElESA2Wufo0hfYjroZs98e6
	0LvaghURFs4zwRi7NwQrn9PJnyuDnIyICmTQ05lelHNr6mR8e+eyA2n0X3P3EQCR
	5ZB2TG29QdK9rJO/W2gL4vK/vV4ycLkAq1Zgd/d3a9iOoLAjEVofPwcmLEFjMmH8
	SkdOWA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9um7239p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 03 Apr 2026 04:51:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35c1107da15so1523596a91.2
        for <ath12k@lists.infradead.org>; Thu, 02 Apr 2026 21:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775191905; x=1775796705; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tu61AyGnBgVejknoekX3DnvPA8bTJAUFSOc67PDNgPg=;
        b=KEI/WjPoJdHfo4w9poYSbfBVlKjL7iKcxpxpsB49QCIAO5YoRVjsFpEbDQueFcoAjM
         JwU+m3JJQXXaM/8CXTF+YvcOuR4CyGfIBhJIGTut2E+a/jAsxOjISU/B7Mc7649xm0Nk
         UPFz9p5eukmx+koHcig9Uy4EI6a3YL1/mWKXMULq985qPZP3azQT39exOfBXC3w4DS+Z
         80h0GmwtgFlvm1vF2OX5O6W1WQi6F8ux9M/laF35VEI9NW4KnfLFDtCK/EhdXZ43hIrV
         YdvHMva0fiF48lNCfOUOx8rK78ICUR4uLp3C4arhKYv1lXeUwvDu/ExqGODJrwgAElCU
         J82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775191905; x=1775796705;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tu61AyGnBgVejknoekX3DnvPA8bTJAUFSOc67PDNgPg=;
        b=PcZ20v4PhHPwP6Pv4cSgMrQStGmdR3kGnt1dfBELy+MEja7rgBXshrF6zWP6FGaKwx
         WFytg/TEpFH9WJUqCCIFNuDw0JunEyQSh/vjACVlsUtgvUlmwWGz+V7DuymIrohXyDq2
         RP3M3oGW8c8u3pT5zrfj1ShGrEi6ZlHl4wbEQ84ALjranN0zcaWD+YzLzpYMgxU9GKJR
         gFmM11tNZ4wh8bu/GmDUJmde/mbCoXudBOAK0RfBlFioghLKiXm1AdeYovheNXb1jgD8
         mGYdoH6jG3zJV04AKOfvB8qd74zBR1QxPw3dJTLORxBXy0JTrtnpsgjvW0x16Xr+9l4/
         HhmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDbVw/bGCTGVK6/wPTI5ZurMyHpLABwcip8Oo0vjZ8Bro2JvQKMwov/CatNXq24e8BuZZOYDY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwN5FgBtBLdUOOLEg8pNg7+YfMTiqmLmmbnJEb4pIrwe64TlxAy
	OmLSo6ww6HmS+f9kVQQyRxPtsAIqsX0XfEywG+8bXwP9sHkpMZ3p73a38rqKVNjahIl4F2JlwxV
	8fKLm3duXHuBjLmcuOVZCyOme1nO6DtvWN4rkk7Lxlwrbn204QwxJxXVsxWYutBqL
X-Gm-Gg: ATEYQzwBW1+C0Cxp5QfXcMbX78GqZUkqp6E3o6WAeVorOGCxmcmgCDKb1guiWx2q7dj
	T2afILWrhlFr6ZPFpXKWefhJjS2EMF7oNqZkU/tT+bfrHWP/tvGP23TLi8fMg491Evm9dg/GeLW
	L5UX78+UzyM0AzQpTNF1Sgg2rGpiq5Md2l6z5lRgZTp5ymoteIhux9rzblZcUu1+tDI3lTsxdzh
	0I+hpR2Qgc8yxf5lBjhsu+YmlSVUW7wbaPlYZQ+HZm71URsGoJa4GNn2n82ffWDBo1RB0lyDBIk
	Jw7qlENRjmZGL43jBVz+8XPDkpcEsQPvb/QZAX6EaTb3Kf4l3BZGWZPZehxMM/Dl9bUdBdazO6e
	3qcqwS60xXfRGlPtDezlw6chG9XrL7Lx6eY8jB5u5IcqegKFCP0xbBI0ljqrZAQ==
X-Received: by 2002:a05:6a20:7d8a:b0:398:9c94:2033 with SMTP id adf61e73a8af0-39f2ef837acmr1535110637.11.1775191904698;
        Thu, 02 Apr 2026 21:51:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:7d8a:b0:398:9c94:2033 with SMTP id adf61e73a8af0-39f2ef837acmr1535077637.11.1775191904138;
        Thu, 02 Apr 2026 21:51:44 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b6113dsm4258227b3a.23.2026.04.02.21.51.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 21:51:43 -0700 (PDT)
Message-ID: <8588fd02-55a2-482d-87f4-1db8e696bad0@oss.qualcomm.com>
Date: Fri, 3 Apr 2026 10:21:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Create symlink for each radio in a
 wiphy
To: Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Harshitha Prem <harshitha.prem@oss.qualcomm.com>
References: <20260402051402.3903795-1-roopni.devanathan@oss.qualcomm.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260402051402.3903795-1-roopni.devanathan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=U/WfzOru c=1 sm=1 tr=0 ts=69cf4761 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=lxJo2wgQVOyoRhA3UyYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: IhPjSWv9uDNourCIyxCJUW-Q0qx9_hcG
X-Proofpoint-ORIG-GUID: IhPjSWv9uDNourCIyxCJUW-Q0qx9_hcG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA0MCBTYWx0ZWRfX/kQH0crg4OUd
 7+ZDZNKglStcsjMkizFWNGZ3u2+OBYr4vZadSxCfwxQTsD5P55oOyqowcpw2McrZtqFzcHb5RIE
 QH3INiFAdUT/QJK1R0Uev09/zw7oov+hoIapui1t0c6xOyd06gizWmqBYp/SbCJDsOoHeJtcZWh
 FPnspITVuNRTFFWkI9947XWwmDFLFlyaCCBzM8paR96oaLaerdTFiVsz2TBiAiHLH6p6QDhDMuQ
 JmV0mdwzPnM0t3aRgYiFUT22lzceSk2Jcon3vCRlhdEwWxGIFOn+cbQThQagGd1rVDM1M4Sp6bq
 A2y1n46cEf+XZJibc0pfXe7dSMI/mYuqtURA3m9cYOIFgZRIsJDuvNp8l90y0svuFdj1uxeWgFd
 ClYxjXuI3aKwcEPtbDUW+wfRWnhC3GUlB+UeuFocRm7j02aX9OXGPS6XViQMgSjVrB5hxts49lG
 GlOM1BBSLsaFzwgpJjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_01,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_215146_658609_24376AB1 
X-CRM114-Status: GOOD (  30.84  )
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



On 4/2/2026 10:44 AM, Roopni Devanathan wrote:
> In single-wiphy design, when more than one radio is registered as a
> single-wiphy in the mac80211 layer, the following warnings are seen:
> 
> 1. debugfs: File 'ath12k' in directory 'phy0' already present!
> 2. debugfs: File 'simulate_fw_crash' in directory 'pci-0000:57:00.0' already present!
>     debugfs: File 'device_dp_stats' in directory 'pci-01777777777777777777777:57:00.0' already present!
> 
> When more than one radio is registered as a single-wiphy, symlinks for
> all the radios are created in the same debugfs directory:
> /sys/kernel/debug/ieee80211/phyX/ath12k, resulting in warning 1. When a
> symlink is created for the first radio, since the 'ath12k' directory is
> not present, it will be created and no warning will be thrown. But when
> symlink is created for more than one radio, since the 'ath12k'
> directory was already created for symlink for radio 1, a warning is
> thrown complaining that 'ath12k' directory is already present. To resolve
> warning 1, create symlink for each radio in separate debugfs directories.
> For the first radio, the symlink will always be the 'ath12k' directory.
> This ensures that the existing directory structure is retained for
> single-wiphy and multi-wiphy architectures. In single-wiphy architecture
> with multiple radios, create symlink in separate debugfs directories
> introduced by mac80211.
> 
> Existing debugfs directory in single-wiphy architecture:
> /sys/kernel/debug/ieee80211/phyX/ath12k is a symlink to
> /sys/kernel/debug/ath12k/pci-0001:01:00.0/macY
> 
> Proposed debugfs directory in single-wiphy architecture with one radio:
> /sys/kernel/debug/ieee80211/phyX/ath12k is a symlink to
> /sys/kernel/debug/ath12k/pci-0001:01:00.0/mac0
> 
> Proposed debugfs directory in single-wiphy architecture with more than
> one radio:
> /sys/kernel/debug/ieee80211/phyX/radio0/ath12k is a symlink to
> /sys/kernel/debug/ath12k/pci-0001:01:00.0/mac0 and
> /sys/kernel/debug/ieee80211/phyX/radioY/ath12k is a symlink to
> /sys/kernel/debug/ath12k/pci-0001:01:00.0/macY
> 
> Where X is phy index and Y is radio index, seen in
> 'iw phyX info | grep Idx'. Two symlinks for the first radio are to ensure
> compatibility with the existing design. Add radio_idx inside ar, to track
> the radio index in probing order.
> 
> API ath12k_debugfs_pdev_create() that creates SoC entries is called more
> than once when hardware group starts up, resulting in warning 2. To
> resolve this warning, remove all other calls to this API and add one
> inside the ath12k_core_pdev_create(). This API carries all pdev-specific
> initializations and can conveniently hold a call to
> ath12k_debugfs_pdev_create().
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Co-developed-by: Harshitha Prem <harshitha.prem@oss.qualcomm.com>
> Signed-off-by: Harshitha Prem <harshitha.prem@oss.qualcomm.com>
> Signed-off-by: Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/core.c    |  4 ++--
>   drivers/net/wireless/ath/ath12k/core.h    |  2 ++
>   drivers/net/wireless/ath/ath12k/debugfs.c | 29 +++++++++++++++++++----
>   drivers/net/wireless/ath/ath12k/mac.c     |  2 +-
>   4 files changed, 29 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index c31c47fb5a73..2519e2400d58 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -835,8 +835,6 @@ static int ath12k_core_soc_create(struct ath12k_base *ab)
>   		goto err_qmi_deinit;
>   	}
>   
> -	ath12k_debugfs_pdev_create(ab);
> -
>   	return 0;
>   
>   err_qmi_deinit:
> @@ -869,6 +867,8 @@ static int ath12k_core_pdev_create(struct ath12k_base *ab)
>   		goto err_dp_pdev_free;
>   	}
>   
> +	ath12k_debugfs_pdev_create(ab);
> +
>   	return 0;
>   
>   err_dp_pdev_free:
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index 59c193b24764..046249c8763e 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -588,6 +588,7 @@ struct ath12k_dbg_htt_stats {
>   struct ath12k_debug {
>   	struct dentry *debugfs_pdev;
>   	struct dentry *debugfs_pdev_symlink;
> +	struct dentry *debugfs_pdev_symlink_default;
>   	struct ath12k_dbg_htt_stats htt_stats;
>   	enum wmi_halphy_ctrl_path_stats_id tpc_stats_type;
>   	bool tpc_request;
> @@ -673,6 +674,7 @@ struct ath12k {
>   	u8 pdev_idx;
>   	u8 lmac_id;
>   	u8 hw_link_id;
> +	u8 radio_idx;
>   
>   	struct completion peer_assoc_done;
>   	struct completion peer_delete_done;
> diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
> index 358031fa14eb..8c81a1c22449 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs.c
> +++ b/drivers/net/wireless/ath/ath12k/debugfs.c
> @@ -1473,18 +1473,35 @@ void ath12k_debugfs_register(struct ath12k *ar)
>   {
>   	struct ath12k_base *ab = ar->ab;
>   	struct ieee80211_hw *hw = ar->ah->hw;
> -	char pdev_name[5];
> +	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
> +	struct dentry *ath12k_fs;
>   	char buf[100] = {};
> +	char pdev_name[5];
>   
>   	scnprintf(pdev_name, sizeof(pdev_name), "%s%d", "mac", ar->pdev_idx);
>   
>   	ar->debug.debugfs_pdev = debugfs_create_dir(pdev_name, ab->debugfs_soc);
>   
>   	/* Create a symlink under ieee80211/phy* */
> -	scnprintf(buf, sizeof(buf), "../../ath12k/%pd2", ar->debug.debugfs_pdev);
> -	ar->debug.debugfs_pdev_symlink = debugfs_create_symlink("ath12k",
> -								hw->wiphy->debugfsdir,
> -								buf);
> +	if (ar->radio_idx == 0) {
> +		scnprintf(buf, sizeof(buf), "../../ath12k/%pd2",
> +			  ar->debug.debugfs_pdev);
> +		ath12k_fs = hw->wiphy->debugfsdir;
> +
> +		/* symbolic link for compatibility */
> +		ar->debug.debugfs_pdev_symlink_default = debugfs_create_symlink("ath12k",
> +										ath12k_fs,
> +										buf);
> +	}
> +
> +	if (ah->num_radio > 1) {
> +		scnprintf(buf, sizeof(buf), "../../../ath12k/%pd2",
> +			  ar->debug.debugfs_pdev);
> +		ath12k_fs = hw->wiphy->radio_cfg[ar->radio_idx].radio_debugfsdir;
> +		ar->debug.debugfs_pdev_symlink = debugfs_create_symlink("ath12k",
> +									ath12k_fs,
> +									buf);
> +	}
>   
>   	if (ar->mac.sbands[NL80211_BAND_5GHZ].channels) {
>   		debugfs_create_file("dfs_simulate_radar", 0200,
> @@ -1513,7 +1530,9 @@ void ath12k_debugfs_unregister(struct ath12k *ar)
>   
>   	/* Remove symlink under ieee80211/phy* */
>   	debugfs_remove(ar->debug.debugfs_pdev_symlink);
> +	debugfs_remove(ar->debug.debugfs_pdev_symlink_default);
>   	debugfs_remove_recursive(ar->debug.debugfs_pdev);
>   	ar->debug.debugfs_pdev_symlink = NULL;
> +	ar->debug.debugfs_pdev_symlink_default = NULL;
>   	ar->debug.debugfs_pdev = NULL;
>   }
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 553ec28b6aaa..c2b747f1b9f5 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -15065,6 +15065,7 @@ static struct ath12k_hw *ath12k_mac_hw_allocate(struct ath12k_hw_group *ag,
>   		ar->hw_link_id = pdev->hw_link_id;
>   		ar->pdev = pdev;
>   		ar->pdev_idx = pdev_idx;
> +		ar->radio_idx = i;
>   		pdev->ar = ar;
>   
>   		ag->hw_links[ar->hw_link_id].device_id = ab->device_id;
> @@ -15132,7 +15133,6 @@ int ath12k_mac_allocate(struct ath12k_hw_group *ag)
>   		if (!ab)
>   			continue;
>   
> -		ath12k_debugfs_pdev_create(ab);
>   		ath12k_mac_set_device_defaults(ab);
>   		total_radio += ab->num_radios;
>   	}
> 
> base-commit: 15551ababf6d4e857f2101366a0c3eaa86dd822c


Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>


