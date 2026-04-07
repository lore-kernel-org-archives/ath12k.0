Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C97EFB5180
	for <ath12k@archiver.kernel.org>; Tue,  7 Apr 2026 03:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ZPIEdea3QaePrtU5LQ0oU/DerRtsXtjj2lfv6TYp9c=; b=p6MX7mmF95qpJ5yp1PmtKWGsYr
	h8uDuSYxU6Nq4FbJCmbqxvvjSowp9cq/6KXGsSFH94lvpQnV1dQja7Uf/Z6q3698gszeOHOwen5nc
	x4h3xUYOK7tQL0CO9MgOrjW7DFs6uic0+Y+AKqazgqHDbOLAE7LyVNu2+Nj/WTBI6ALjPCbdEKncB
	XqQL98wA60VUsH9LnWKZUJu6g/fOVxADt1QSJIAFSHlO2qttCh1X/+4FRgsGFeSipluf5zCesba8j
	AJ02E6snkIrAtYixa4B2PIFEEZSXqABHG0tcXdmFTOxQLQSRtO2e8RXpzrQnoyextca7Sdr2WgD03
	ST/WVvIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9x25-00000005p40-13Pc;
	Tue, 07 Apr 2026 03:23:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9x22-00000005p3X-1OKr
	for ath12k@lists.infradead.org;
	Tue, 07 Apr 2026 03:23:15 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQ0WO1403547
	for <ath12k@lists.infradead.org>; Tue, 7 Apr 2026 03:23:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5ZPIEdea3QaePrtU5LQ0oU/DerRtsXtjj2lfv6TYp9c=; b=ffmNw9Vlq5ZmLDyg
	C46K/ppTFLwFciBWmTMXqAl+9vkSeK00X1hgyo+j6biPaJHcZdSTY/C6H+4zvO6y
	2Fz/IOQvuQ2D5bG4PlVkdbG7oE5nbrRp253J4Ni5nxiJW2BQqrZ3r+MqGZlqmrVL
	wM3I/X4o9e2Qd7uR8L/4eqBIv5iol6KQ81GSDh+VTbMEFJeEjjYtC+K2l801HBY0
	Y9QsVezURzmyox1F/3oAU8ghDFFVs9kc+Js2NcaKfOOM7svkYnTD5gxe3htFmRUY
	jmKph/It35i3O6EMzHfffEu+jnCuizyHtH80BreiezqC/q1MwMC/FQ8ZeTjVCnDW
	0aExqg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr88ssx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 07 Apr 2026 03:23:13 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c76bd4feb9fso1747860a12.0
        for <ath12k@lists.infradead.org>; Mon, 06 Apr 2026 20:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775532192; x=1776136992; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5ZPIEdea3QaePrtU5LQ0oU/DerRtsXtjj2lfv6TYp9c=;
        b=KkAc5jKxw7kfxViaSyGO3ctflaKyJh3rAkg9awRBnb/ExwrbORx9YZ2uRvtjO/Im4p
         rCRjNUyeX8/YsAm0bfbmzQOZZG2/OnFErcKQP34xOFJiL6X28zI1dW1T8T3U19xPbnIl
         Y5DmSMrO6r6KePO6o8MxnkHBZMh3DCFxVflyHnbYm9iIi8Sfb5dAmMGA0LuAqTg/7LGQ
         /TBwSaJQl/OwS0H0ezBHgw2ZQO3ieFRN3aO2tccIw1hHOkAkQeXTSZvZW4hucVMCgTWU
         TIJiD0xVDraZlWInIq8oZ001fw1VGVjzSFLVnymK1++zxqegYBUHMd/mNAMIwNXc2VAl
         Qb3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775532192; x=1776136992;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ZPIEdea3QaePrtU5LQ0oU/DerRtsXtjj2lfv6TYp9c=;
        b=hPvKp9hBCyGsEIurwj4hznIY4c62MdP3ONIpHFd5+DbVdDxRacYL7MYlziEUooLBnl
         J7/fDQ7/z2KZ2jRsVPd7c2SwrzR/iH1dRDECEMHToUIZjIIcv0pPbBJSg7nQWEL86Mmp
         gujgRlTImvyLRYgnscay/5a4EEfeHzUeVHMnKoYBjIOVsHK5jc9UVIIkrnmOyrdH2XuR
         JsXG7XwYDRXoPYqdO34z+iNZ7IhSKr6h+IxUpamz0X3zfZNtIaHA7+v8HhRCaydI0Xdp
         e/qjY4zSdcW51AI49rD6ag3gBkpoKqA3jN0WoKNLz3WaacFSzf5CTDSR1dxF8Ha8YKh9
         P5Hw==
X-Forwarded-Encrypted: i=1; AJvYcCWlAdfoGCdKuhlMIb2nXHjcdezvDB0zo81wRDVayAnLk/NiN1b+r9S9wIc1TDsc6eViKSXUj9c=@lists.infradead.org
X-Gm-Message-State: AOJu0YyT8/50lOGwhTIwGQO/GfHL4yeLIGXLAJ/dlW760xeJRk3mhWaP
	jgwYHU1ta8vEmFJWBfRL5VJRvkxwVi3qShJiUgcYKOwJjRUkHzxD6F1DuqbcG8rfrpfyEw3pfOi
	i/GEi2hY3E/OYvmisfxO5esx3yvXP9uyx/tuwK8Bib7m+S5CZoBxl75eaICLWtvTm
X-Gm-Gg: AeBDieuS3/3yv+Rqw09jEl4zQXNpfeJGvTIgnFLfMgS4E9GAp1zzYqqrHO4Au0aVC5m
	muYXEqBTBjahMrZovQdb43QgrhAWoF6kLtNoyRufhSE4gytOaj4o0Z94swUw4wkoUy60R1isCCJ
	IogC1hHBAX6sjq+58u3frh92k35BFWwXOXQvfyhNoWoV50kcxGEzJiNRTEOOgT7iEqDzU4Tnp6g
	ea0Rh2rOW129vLocRmKNd4tJAShovHXEWLIKY+r/EhpbFrr3oF3dXxJa0IV6jZG40+FR8PXRruo
	mD9SW3fEGeKXKZZcSbpRCVIJMbhXGrhYlxZTrTzh5YAjxsnoq4nU1LajfN+begeYWflVn8xlkc/
	+sxus5VzPk1Jtbg/prA6wvANR1JGHpzI16lLtKUzQwZQAD3bSMO6vHwP7HMy5Mx7sh6ISQ8zx9f
	JAJVn38+JRXeLj0T7fqxY=
X-Received: by 2002:a05:6a20:3942:b0:39c:113:14a4 with SMTP id adf61e73a8af0-39f2f26892cmr14189465637.50.1775532191932;
        Mon, 06 Apr 2026 20:23:11 -0700 (PDT)
X-Received: by 2002:a05:6a20:3942:b0:39c:113:14a4 with SMTP id adf61e73a8af0-39f2f26892cmr14189443637.50.1775532191375;
        Mon, 06 Apr 2026 20:23:11 -0700 (PDT)
Received: from [10.133.33.204] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c6562018sm14074850a12.18.2026.04.06.20.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 20:23:11 -0700 (PDT)
Message-ID: <63acfa83-753c-4b45-8f11-8e18e760cbf2@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 11:23:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Support channel change stats
To: Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Harish Rachakonda <quic_rachakon@quicinc.com>
References: <20260326050641.3066562-1-roopni.devanathan@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260326050641.3066562-1-roopni.devanathan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TalYHzGGXALWkhsspaYbeGThYI3mgDL5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDAyOSBTYWx0ZWRfX9hrR8K3wnkeZ
 z2xPk92E9IE6H5nL7+Df+F/vEwpcFOb/qMU0sD33pxkHq+TkueLtsWvCpI+TwqHNVoHS+ZgORYI
 eavXCxVGi8SvRTJdqirDP4CfpHczlk/mop1SfQFY414OqJ4AM+y1n9EzuflN6RmjxU8JaZWPL2O
 Lp4FJAiBvosFPYhQzyTv9s2r6+6WHh/ibX7OJ0/8KglouGIHoiqSTV7aGQuYyAVganEvq1LnzT3
 8pzmicJcuXq2fQTuh4QAWblw8xn203v8T14Hj+NHg6dtNxZ23weauvTYa3P962cNS0r6p7AiaaR
 rxTqM7Q9BWqKAjUoZuHOV77l3W2EpmQ0Oz5x4BwYTSyHAKTpdLZtWrot/ibkuTTle+vBz8tOE7U
 g9TttXoUb9l+kNx+DgrwuXcuWUc8kJt1yphPt4XQ8Ol/4Ymx9zsE6AsmbTZi7xc4wdKiZoE9Vfw
 10qM3cPrbu7JoF1iUtQ==
X-Proofpoint-GUID: TalYHzGGXALWkhsspaYbeGThYI3mgDL5
X-Authority-Analysis: v=2.4 cv=A/hc+aWG c=1 sm=1 tr=0 ts=69d478a1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ygHbHArRDiDl1jTHKCoA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_202314_504422_BDD891C4 
X-CRM114-Status: GOOD (  23.98  )
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



On 3/26/2026 1:06 PM, Roopni Devanathan wrote:
> From: Harish Rachakonda <quic_rachakon@quicinc.com>
> 
> Add support to request channel change stats from the firmware through
> HTT stats type 76. These stats give channel switch details like the
> channel that the radio changed to, its center frequency, time taken
> for the switch, chainmask details, etc.
> 
> Sample output:
> echo 76 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
> Channel Change Timings:
> |PRIMARY CHANNEL FREQ|BANDWIDTH CENTER FREQ|PHYMODE|TX_CHAINMASK|RX_CHAINMASK|SWITCH TIME(us)|INI(us)|TPC+CTL(us)|CAL(us)|MISC(us)|CTL(us)|SW PROFILE|
> |                5200|                 5200|     24|          15|          15|         448850|   2410|      10546| 434593|    1071|   1100|         4|
> |                5240|                 5240|     24|          15|          15|         450730|   4106|      10524| 434528|    1306|   1150|         4|
> |                5180|                 5210|     26|          15|          15|         467894|   4764|      10438| 451101|    1337|   1508|         4|
> |                5200|                 5200|      0|          15|          15|          13838|   2692|       1736|   8558|     686|    802|         6|
> |                5180|                 5180|      0|          15|          15|          13465|   3207|        855|   8579|     578|    760|         6|
> |                5200|                 5200|     24|          15|          15|         570321|   2441|      10439| 555661|    1574|    949|         4|
> 
> Note: WCN7850 firmware does not support HTT stats type 76.

this note also applies to QCC2072.

> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01181-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Harish Rachakonda <quic_rachakon@quicinc.com>
> Signed-off-by: Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>
> ---
>  .../wireless/ath/ath12k/debugfs_htt_stats.c   | 72 +++++++++++++++++++
>  .../wireless/ath/ath12k/debugfs_htt_stats.h   | 26 +++++++
>  2 files changed, 98 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> index 7f6ca07fb335..b772181a496e 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> +++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> @@ -5722,6 +5722,75 @@ ath12k_htt_print_tx_hwq_stats_cmn_tlv(const void *tag_buf, u16 tag_len,
>  	stats_req->buf_len = len;
>  }
>  
> +static void
> +ath12k_htt_print_chan_switch_stats_tlv(const void *tag_buf, u16 tag_len,
> +				       struct debug_htt_stats_req *stats_req)
> +{
> +	const struct ath12k_htt_chan_switch_stats_tlv *sbuf = tag_buf;
> +	u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
> +	u32 switch_freq, switch_profile;
> +	u32 len = stats_req->buf_len;
> +	u8 *buf = stats_req->buf;
> +	u8 i;
> +
> +	if (tag_len < sizeof(*sbuf))
> +		return;
> +
> +	i = min(le32_to_cpu(sbuf->switch_count), ATH12K_HTT_CHAN_SWITCH_STATS_BUF_LEN);
> +	if (!i)
> +		return;
> +
> +	len += scnprintf(buf + len, buf_len - len, "Channel Change Timings:\n");
> +	len += scnprintf(buf + len, buf_len - len,
> +			 "|%-20s|%-21s|%-7s|%-12s|%-12s|%-15s|",
> +			 "PRIMARY CHANNEL FREQ", "BANDWIDTH CENTER FREQ", "PHYMODE",
> +			 "TX_CHAINMASK", "RX_CHAINMASK", "SWITCH TIME(us)");
> +	len += scnprintf(buf + len, buf_len - len,
> +			 "%-7s|%-11s|%-7s|%-8s|%-7s|%-10s|\n",
> +			 "INI(us)", "TPC+CTL(us)", "CAL(us)", "MISC(us)", "CTL(us)",
> +			 "SW PROFILE");
> +
> +	/*
> +	 * sbuf->switch_count has the number of successful channel changes. The firmware
> +	 * sends the record of channel change in such a way that sbuf->chan_stats[0] will
> +	 * point to the channel change that occurred first and the recent channel change
> +	 * records will be stored in sbuf->chan_stats[9]. As and when new channel change
> +	 * occurs, sbuf->chan_stats[0] will be replaced by records from the next index,
> +	 * sbuf->chan_stats[1]. While printing the records, reverse chronological order
> +	 * is followed, i.e., the most recent channel change records are printed first
> +	 * and the oldest one, last.
> +	 */
> +	while (i--) {
> +		switch_freq = le32_to_cpu(sbuf->chan_stats[i].chan_switch_freq);
> +		switch_profile = le32_to_cpu(sbuf->chan_stats[i].chan_switch_profile);
> +
> +		len += scnprintf(buf + len, buf_len - len,
> +				 "|%20u|%21u|%7u|%12u|%12u|%15u|",
> +				 u32_get_bits(switch_freq,
> +					      ATH12K_HTT_STATS_CHAN_SWITCH_BW_MHZ),
> +				 u32_get_bits(switch_freq,
> +					      ATH12K_HTT_STATS_CHAN_SWITCH_BAND_FREQ),
> +				 u32_get_bits(switch_profile,
> +					      ATH12K_HTT_STATS_CHAN_SWITCH_PHY_MODE),
> +				 u32_get_bits(switch_profile,
> +					      ATH12K_HTT_STATS_CHAN_SWITCH_TX_CHAINMASK),
> +				 u32_get_bits(switch_profile,
> +					      ATH12K_HTT_STATS_CHAN_SWITCH_RX_CHAINMASK),
> +				 le32_to_cpu(sbuf->chan_stats[i].chan_switch_time));
> +		len += scnprintf(buf + len, buf_len - len,
> +				 "%7u|%11u|%7u|%8u|%7u|%10u|\n",
> +				 le32_to_cpu(sbuf->chan_stats[i].ini_module_time),
> +				 le32_to_cpu(sbuf->chan_stats[i].tpc_module_time),
> +				 le32_to_cpu(sbuf->chan_stats[i].cal_module_time),
> +				 le32_to_cpu(sbuf->chan_stats[i].misc_module_time),
> +				 le32_to_cpu(sbuf->chan_stats[i].ctl_module_time),
> +				 u32_get_bits(switch_profile,
> +					      ATH12K_HTT_STATS_CHAN_SWITCH_SW_PROFILE));
> +	}
> +
> +	stats_req->buf_len = len;
> +}
> +
>  static int ath12k_dbg_htt_ext_stats_parse(struct ath12k_base *ab,
>  					  u16 tag, u16 len, const void *tag_buf,
>  					  void *user_data)
> @@ -6024,6 +6093,9 @@ static int ath12k_dbg_htt_ext_stats_parse(struct ath12k_base *ab,
>  	case HTT_STATS_TX_HWQ_CMN_TAG:
>  		ath12k_htt_print_tx_hwq_stats_cmn_tlv(tag_buf, len, stats_req);
>  		break;
> +	case HTT_STATS_CHAN_SWITCH_STATS_TAG:
> +		ath12k_htt_print_chan_switch_stats_tlv(tag_buf, len, stats_req);
> +		break;
>  	default:
>  		break;
>  	}
> diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
> index bfabe6500d44..82ab7b9e4db9 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
> +++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
> @@ -164,6 +164,7 @@ enum ath12k_dbg_htt_ext_stats_type {
>  	ATH12K_DBG_HTT_PDEV_MLO_IPC_STATS			= 64,
>  	ATH12K_DBG_HTT_EXT_PDEV_RTT_RESP_STATS			= 65,
>  	ATH12K_DBG_HTT_EXT_PDEV_RTT_INITIATOR_STATS		= 66,
> +	ATH12K_DBG_HTT_EXT_CHAN_SWITCH_STATS			= 76,
>  
>  	/* keep this last */
>  	ATH12K_DBG_HTT_NUM_EXT_STATS,
> @@ -267,6 +268,7 @@ enum ath12k_dbg_htt_tlv_tag {
>  	HTT_STATS_PDEV_RTT_HW_STATS_TAG			= 196,
>  	HTT_STATS_PDEV_RTT_TBR_SELFGEN_QUEUED_STATS_TAG	= 197,
>  	HTT_STATS_PDEV_RTT_TBR_CMD_RESULT_STATS_TAG	= 198,
> +	HTT_STATS_CHAN_SWITCH_STATS_TAG			= 213,
>  
>  	HTT_STATS_MAX_TAG,
>  };
> @@ -2156,4 +2158,28 @@ struct htt_tx_hwq_stats_cmn_tlv {
>  	__le32 txq_timeout;
>  } __packed;
>  
> +#define ATH12K_HTT_CHAN_SWITCH_STATS_BUF_LEN	10
> +
> +#define ATH12K_HTT_STATS_CHAN_SWITCH_BW_MHZ		GENMASK(15, 0)
> +#define ATH12K_HTT_STATS_CHAN_SWITCH_BAND_FREQ		GENMASK(31, 16)
> +#define ATH12K_HTT_STATS_CHAN_SWITCH_PHY_MODE		GENMASK(7, 0)
> +#define ATH12K_HTT_STATS_CHAN_SWITCH_TX_CHAINMASK	GENMASK(15, 8)
> +#define ATH12K_HTT_STATS_CHAN_SWITCH_RX_CHAINMASK	GENMASK(23, 16)
> +#define ATH12K_HTT_STATS_CHAN_SWITCH_SW_PROFILE		GENMASK(31, 24)
> +
> +struct ath12k_htt_chan_switch_stats_tlv {
> +	struct {
> +		__le32 chan_switch_freq;
> +		__le32 chan_switch_profile;
> +		__le32 chan_switch_time;
> +		__le32 cal_module_time;
> +		__le32 ini_module_time;
> +		__le32 tpc_module_time;
> +		__le32 misc_module_time;
> +		__le32 ctl_module_time;
> +		__le32 reserved;
> +	} chan_stats[ATH12K_HTT_CHAN_SWITCH_STATS_BUF_LEN];
> +	__le32 switch_count; /* shows how many channel changes have occurred */
> +} __packed;
> +
>  #endif
> 
> base-commit: 37538641dac955f6690372f0ebb94e5e14a23418

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


