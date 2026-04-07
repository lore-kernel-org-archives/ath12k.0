Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F621FB5189
	for <ath12k@archiver.kernel.org>; Tue,  7 Apr 2026 03:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GWc+ASGX1YQZtVUl1/Lf//+V2S8wnblPcebhCa58dII=; b=xMgGN5+jdW7sui86z87UbESC2v
	hXk2LQn9zJl3Aw91J1VSLZdjmy3sr0LbC3Fk82S2drMIDGrAKQfPuIzMDzaDqOMT9R8qQviiOeD0d
	4ceWrEykzvU5yZI59ODdDUx94ITHZ6cXHPqF5PAXAc67T6e0UGuMYOQJbf8vg52QACekX5ezg7Zvt
	TAP+oOq+IdIyvE2eDT5DVJKsWGXdoMnZqwaUTwnf3atLQKctuPEjwKpNCEfm30vf2hR+ZuL8fxJy+
	yit0ChrXjAVjHjE/OVajbZ687dRg265ZTef39viSpL79K9ph82elH2KX9LXd31UDgdSfT7FhraZGM
	G4sLf6QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9x8W-00000005pV7-0SuU;
	Tue, 07 Apr 2026 03:29:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9x8U-00000005pUx-0xP7
	for ath12k@bombadil.infradead.org;
	Tue, 07 Apr 2026 03:29:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=GWc+ASGX1YQZtVUl1/Lf//+V2S8wnblPcebhCa58dII=; b=HlonX3TmmPeBL9cn4BSKDpLMfM
	eaH2HXp5SIUgq4jbg8xxtwy+ndN38boLWutqU6mmvbnE5IBxVHjs7fFvZmd1qSzXFipPigppJ6+MF
	gfl99oz1r3kWqZYAos8k8BB3E1Zn8UW9iErg2tGq+zNLEjXLH9MDtuoMK+Yrq6RiCQKgwPD2zJzMD
	EFl7+mvomp7n5Fl5mFdRMfKkkzQpXNUBd5+LV5Cts/1QlFr+f2C9t1Kz1+s1ul+UzGHyV5QrLuTQJ
	+ZZUz4LEqGovX+LBe29u1GuAMD2KiLJkfgm4evuRjHWV1D/DYDZienKRhzBBGMXO+0iE6r1/xwRtq
	XpiX5AwA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9x8Q-00000007YC9-1PDr
	for ath12k@lists.infradead.org;
	Tue, 07 Apr 2026 03:29:53 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQ0Xq1403547
	for <ath12k@lists.infradead.org>; Tue, 7 Apr 2026 03:29:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GWc+ASGX1YQZtVUl1/Lf//+V2S8wnblPcebhCa58dII=; b=S08pbD0TsQjGPDhF
	jl6qh+4x6WVhciY0ch7fk9irrzlG2vvw3K7q4jhPCWEJlpFYdbdPrdxxjnNFWAtB
	QKBr5FCfCP9VUTvZ10XRKU02tPT+oBpBtRg+3s1m3jorl4lsNUBVyvcxO1lGJRgI
	JRwgYiN+cujwIrs85kDZj6F/aernrGUxMoMYGYsZdKVonAZ4uR7T28p+nMlb70Sl
	6vL63Do07xPC0FNxrm5+csq2/x35aZg+pB/Shqijtr/5UkYu4hkdrstabrvCoLyE
	1JLFw08fueBkIxIVnVYPxmPlcCrHjX4T7aRVYw6LaiqzwEe/ZZnDAPkY0J33bw2S
	O/6pMw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr88tea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 07 Apr 2026 03:29:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3568090851aso11307562a91.1
        for <ath12k@lists.infradead.org>; Mon, 06 Apr 2026 20:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775532585; x=1776137385; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GWc+ASGX1YQZtVUl1/Lf//+V2S8wnblPcebhCa58dII=;
        b=CkYTJU4cZt3ZKyGMu7yVpKtlLjs9lSabO3Sbynl/8y36CiKYc4tD5HDJlyAJbSDrIC
         sFOQcFO415zSBNtFcbhy36nom1tNrhC0h70wkJZzJpQeuULp7PCBtEafqGfI//en/MlX
         rwaup0Wf1vP4djEVTmOhmCjsHwX0yirN6KZHf/fFOwHskTcgbbwq12hFq5GY8e6IRAf9
         V8VrrUEW4kdVCEH61VfGPCaARqocSpgGsfjFWYDTOBcSjPsqb6Bck9rmX9fZf7ME/Cjq
         a0gArGCwj4dy9LLWZ85uvMKW9SysPd0bzRLi2iBKjl2cT+ddbSkbcZEgFpbDwmui0nOR
         QLWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775532585; x=1776137385;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GWc+ASGX1YQZtVUl1/Lf//+V2S8wnblPcebhCa58dII=;
        b=Kp4agAx/syEHuAaT+FIwb6cgl48mZV+2xqBP9RWXUyqL0O8epx57NnRvSlWVsm/sqF
         DWZl7HqSQ4AVnC9kkvuQBAUq73YAxaaVH4JrtqOsBdQC+8+z7e7SKWyfpEZWBmjABeCM
         GgqARS5FwWfjzTyIc6HytqJg6h8jeLXC5qaCBnEi+8tUbKtUE09AeBDqDIV/U9TbL0/3
         tLrfRnl2OuCTHnjI4h+3qtFEfKe2H1dGw2Q/Vh10i34N8ajFvnZM9ZJY6ZmBPTzgwekp
         SLW7jFrxM4U3Tiy3C/nYz099HbMwqih/r6AiVh+E7GzisTT4xpDP0misObaTqCiinXbS
         q+VQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUPUPnQyklHmmR6AIOVB5gBFy1ruAVUeZoxc/kRoNvtJt3mW3OSftaYASM/EziK9kn/Ve83IU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxOkLeG8Kgm6hMBV0tlcrBP3covI9ZYh9iQVhktri1jWBza+K2v
	tvru69rgz4zD0A3qtiLTcI454CF9uFT6yc3/LR+NEjXdQFmDvPYY8/wu9bUGX6IRB/vTPD1DRSs
	KlObYNYHwAqpbPV1Jc5bx8l2tCe2+hrxHD9XAnNvYbh+JxJkg4rBOZ7rtl7em+dH6
X-Gm-Gg: AeBDiet5W0Cj0pxkA7WqI3OT51lIDE41IhfmaYhHDU4v9e8QXHHM9gAI+VIaok+HTjz
	KZYkKXWj9RFqYH4YMPRs0CCbEyTcVFcYv7VO9swwGU25MiauEN1/Z7Gy13/BK+0jGy0x57IYPp7
	qiLaDhjvv/3GFrp46y7ongIOpjlXo83tNXVkmmFIzM0/5B+KIKqs8GUYLTjTUhsiiT8hbISVy1Y
	UhRjXlQgZbz+j+qZonVBGXRTFMvifnhWHxmIOcdnWNdWOWCO1xTHmnuTJdnPlJEMdXK8IQUrXYT
	H2kS68Z3Ri9SzqlShYlQZX8nLedBK1dt59Opvr8RFmku3UDOnL+JhA5nLxr28QirVdHuH8FtIFj
	in3/COa0aBhKGrm0eqRLF3p8OWERg3DCeNyqy+NA8l71QzSfzGMTHNha/FFruXfGJalXhHSZr7W
	uY+B/cDTzWz4dgZOgkuAk=
X-Received: by 2002:a17:90b:1d08:b0:35d:93ff:2856 with SMTP id 98e67ed59e1d1-35de6816850mr14346186a91.10.1775532584670;
        Mon, 06 Apr 2026 20:29:44 -0700 (PDT)
X-Received: by 2002:a17:90b:1d08:b0:35d:93ff:2856 with SMTP id 98e67ed59e1d1-35de6816850mr14346162a91.10.1775532584129;
        Mon, 06 Apr 2026 20:29:44 -0700 (PDT)
Received: from [10.133.33.204] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c6476a81sm13764608a12.7.2026.04.06.20.29.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 20:29:43 -0700 (PDT)
Message-ID: <03c3da0d-4bea-49be-b0b3-4be6f408daaf@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 11:29:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Create symlink for each radio in a
 wiphy
To: Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Harshitha Prem <harshitha.prem@oss.qualcomm.com>
References: <20260402051402.3903795-1-roopni.devanathan@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260402051402.3903795-1-roopni.devanathan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sqYJd6OrFjl4RDYhhZreaMOty83xZXQi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDAyOSBTYWx0ZWRfX5unRQ5Yn40YN
 TdvcqryVlZN+5WN2ZhGgB+rcHXwTQ3hhmhOJBBiUWmoCdtuVAHOUz+a5yYQzF43FTd4rfRKn8OG
 nn2wEx+EwOZ7hoSXn0Skp/LUnP1IY4oxXGSu4Zt1VIP2lDZwIXrbfbzoYrynH/+n1gXre902Jef
 haFpGA52ow6KwitWT1DBmgRqdaWF8pbSa8wNXor+bW/aEBX2rFQcB6IAOpQwsw/wIRwr7yVm+la
 5di7il49g+tvQQfhFnF8HhrMSEzIPFF4x2+pLxasF/D4L4b/8hTa+Ga2N56m/5QGK5LjQHgejWS
 fB2Lt2QPaTL1A3nVEUyHWQJ+k64i6YH5jNOoo1tAebiujqjP5PaUP6JFIya6ImyACOmzz04b0g9
 lOO/ij8jTUdDL8nClg2HJvSppdEwmeH8wRUgQU1oC+76Ch8/WrThf0+YH8lyzF4KJAfy7G3uQjn
 aNIeUV/xIwt6DO6qqnQ==
X-Proofpoint-GUID: sqYJd6OrFjl4RDYhhZreaMOty83xZXQi
X-Authority-Analysis: v=2.4 cv=A/hc+aWG c=1 sm=1 tr=0 ts=69d47a29 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=lxJo2wgQVOyoRhA3UyYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_042951_083846_A86E5129 
X-CRM114-Status: GOOD (  29.96  )
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



On 4/2/2026 1:14 PM, Roopni Devanathan wrote:
> In single-wiphy design, when more than one radio is registered as a
> single-wiphy in the mac80211 layer, the following warnings are seen:
> 
> 1. debugfs: File 'ath12k' in directory 'phy0' already present!
> 2. debugfs: File 'simulate_fw_crash' in directory 'pci-0000:57:00.0' already present!
>    debugfs: File 'device_dp_stats' in directory 'pci-01777777777777777777777:57:00.0' already present!
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
>  drivers/net/wireless/ath/ath12k/core.c    |  4 ++--
>  drivers/net/wireless/ath/ath12k/core.h    |  2 ++
>  drivers/net/wireless/ath/ath12k/debugfs.c | 29 +++++++++++++++++++----
>  drivers/net/wireless/ath/ath12k/mac.c     |  2 +-
>  4 files changed, 29 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index c31c47fb5a73..2519e2400d58 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -835,8 +835,6 @@ static int ath12k_core_soc_create(struct ath12k_base *ab)
>  		goto err_qmi_deinit;
>  	}
>  
> -	ath12k_debugfs_pdev_create(ab);
> -
>  	return 0;
>  
>  err_qmi_deinit:
> @@ -869,6 +867,8 @@ static int ath12k_core_pdev_create(struct ath12k_base *ab)
>  		goto err_dp_pdev_free;
>  	}
>  
> +	ath12k_debugfs_pdev_create(ab);
> +
>  	return 0;
>  
>  err_dp_pdev_free:
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index 59c193b24764..046249c8763e 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -588,6 +588,7 @@ struct ath12k_dbg_htt_stats {
>  struct ath12k_debug {
>  	struct dentry *debugfs_pdev;
>  	struct dentry *debugfs_pdev_symlink;
> +	struct dentry *debugfs_pdev_symlink_default;
>  	struct ath12k_dbg_htt_stats htt_stats;
>  	enum wmi_halphy_ctrl_path_stats_id tpc_stats_type;
>  	bool tpc_request;
> @@ -673,6 +674,7 @@ struct ath12k {
>  	u8 pdev_idx;
>  	u8 lmac_id;
>  	u8 hw_link_id;
> +	u8 radio_idx;
>  
>  	struct completion peer_assoc_done;
>  	struct completion peer_delete_done;
> diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
> index 358031fa14eb..8c81a1c22449 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs.c
> +++ b/drivers/net/wireless/ath/ath12k/debugfs.c
> @@ -1473,18 +1473,35 @@ void ath12k_debugfs_register(struct ath12k *ar)
>  {
>  	struct ath12k_base *ab = ar->ab;
>  	struct ieee80211_hw *hw = ar->ah->hw;
> -	char pdev_name[5];
> +	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
> +	struct dentry *ath12k_fs;
>  	char buf[100] = {};
> +	char pdev_name[5];
>  
>  	scnprintf(pdev_name, sizeof(pdev_name), "%s%d", "mac", ar->pdev_idx);
>  
>  	ar->debug.debugfs_pdev = debugfs_create_dir(pdev_name, ab->debugfs_soc);
>  
>  	/* Create a symlink under ieee80211/phy* */
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
>  	if (ar->mac.sbands[NL80211_BAND_5GHZ].channels) {
>  		debugfs_create_file("dfs_simulate_radar", 0200,
> @@ -1513,7 +1530,9 @@ void ath12k_debugfs_unregister(struct ath12k *ar)
>  
>  	/* Remove symlink under ieee80211/phy* */
>  	debugfs_remove(ar->debug.debugfs_pdev_symlink);
> +	debugfs_remove(ar->debug.debugfs_pdev_symlink_default);
>  	debugfs_remove_recursive(ar->debug.debugfs_pdev);
>  	ar->debug.debugfs_pdev_symlink = NULL;
> +	ar->debug.debugfs_pdev_symlink_default = NULL;
>  	ar->debug.debugfs_pdev = NULL;
>  }
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 553ec28b6aaa..c2b747f1b9f5 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -15065,6 +15065,7 @@ static struct ath12k_hw *ath12k_mac_hw_allocate(struct ath12k_hw_group *ag,
>  		ar->hw_link_id = pdev->hw_link_id;
>  		ar->pdev = pdev;
>  		ar->pdev_idx = pdev_idx;
> +		ar->radio_idx = i;
>  		pdev->ar = ar;
>  
>  		ag->hw_links[ar->hw_link_id].device_id = ab->device_id;
> @@ -15132,7 +15133,6 @@ int ath12k_mac_allocate(struct ath12k_hw_group *ag)
>  		if (!ab)
>  			continue;
>  
> -		ath12k_debugfs_pdev_create(ab);
>  		ath12k_mac_set_device_defaults(ab);
>  		total_radio += ab->num_radios;
>  	}
> 
> base-commit: 15551ababf6d4e857f2101366a0c3eaa86dd822c

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


