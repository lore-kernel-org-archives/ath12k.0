Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7838DEDB7D8
	for <ath12k@archiver.kernel.org>; Tue,  7 Apr 2026 09:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FlMN1zYTip17TcOkPr1kOdTAgk+GGVLiyPaqUC8VoaM=; b=ZqqZ+aqc8j3ZZA0+64zsJeps8G
	IlD+q3bRT/LcfJpIT9uL7krCUsr+o3CtkpMoWM46RaxxWkzn9bzRL4b94omIDAhkzW1Im/soYnLXf
	DjP7KEmhleIczEVQ3gsV3AKYnS/lvE457v3iSOnptIjWOXPU8CrcF5eHIMaLVrCv7dX87a/KUa7E5
	2JxezCTb9s+9+TkmvcCo5hXNVbDTCmFEtgUPBVEXe+45WQMsbHLNMJcsswGGYwE2rh4/DiwDkP2Yu
	wi1n27n6dYg+P9EJ+t6S3e0WEdv4E+QgTsg94GqjvTWqY/cr8swH7VbIVPmOIpvxq5yGqQu3ixUaV
	bQH4atog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA2aA-00000006DLg-0R9B;
	Tue, 07 Apr 2026 09:18:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA2a7-00000006DLa-2wjY
	for ath12k@bombadil.infradead.org;
	Tue, 07 Apr 2026 09:18:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FlMN1zYTip17TcOkPr1kOdTAgk+GGVLiyPaqUC8VoaM=; b=hOMeBSYCSs/V43f818LL7STYEs
	QAn2NsSKSzJPAhUZNFM5bDpwhx+9QdDxSmx3wBKdkJYzOnSHFd845yumtaxrM2DWDVuOmDKndV7pg
	OwnBzp3l4kVVcFqqJnhG+d4DfAS5VM8n54qHO1ykzSYL+IRablGKV01VdVKSDVgtjDjqkMgYweZrr
	PBdf1V0iSf6skMlH+UGwGujQKA5oIiqLFVcr0sdGHvOMHxKqvbRsu0owBPaUYutuURpYJY5i1fUXN
	H4F9cNjHJh10CsFUMno52sfEaC5vFS8c4FlQd3pN/rV0zsv7g36mfjARnNhGkNpCaoLANww0rl83R
	xI1nJ7pg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA2Zy-00000007v2r-1MQ3
	for ath12k@lists.infradead.org;
	Tue, 07 Apr 2026 09:18:45 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376tmKw2009900
	for <ath12k@lists.infradead.org>; Tue, 7 Apr 2026 09:18:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FlMN1zYTip17TcOkPr1kOdTAgk+GGVLiyPaqUC8VoaM=; b=pCNaob2X2tCsBeL4
	mtPpqdTVqd71K8h+1S86I0JEo876TW20yPfcXBm0p0I6qleAKbxVABAp85W1pC+f
	iITHthTLBiPlvZ3j47zWCpXra+FyGdKUJg9WwSvqmAslKn8Yu8dY9Z8fB5FgdRo4
	FlYQh34H3bxMP7jF/ddNIQ3WJpGoBVwTItFCS6rSX3cNQB9hoFZLe9Q2hNvqr9B+
	P5p5N22gQ5aeAH6cWVbNPxZHtRnwhlR0pSSr3x2xLVSh3wRIu+Z4BWeZCoJh5CYa
	A+xPKa40sxgnZMsFali2atI7cTYUK1dQ48Rc3vYvECALd3BgcVPADhN/j5zBWIMu
	C4nfJg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrrt0sd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 07 Apr 2026 09:18:31 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82a6906e35fso5121634b3a.0
        for <ath12k@lists.infradead.org>; Tue, 07 Apr 2026 02:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775553511; x=1776158311; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FlMN1zYTip17TcOkPr1kOdTAgk+GGVLiyPaqUC8VoaM=;
        b=ZCsSk7GaKktP1jwacms8RG55J1aCXtHEdtAL1xSbfrNqJ0flMo/5VVUNsx6ipJWsok
         VJyvXs4LjzeydM1nx6y7Ccbe9no2p5FfYyc33sl+fpP36FHmkWN9kE8OZI4OzWtGa3Z2
         /BtiyAEV8rsoomD8wVxvws0fnDB4mxgb15KtHfXMdjAAJUdCq6KI35wZTFWw29x7DJ6J
         5CRurXmL7/KZt47Xs4D7ZtrxmXBHWKp8V9BHkYtGqbCwXygNwemUz/bmub3wl8MGPcz0
         7m367xGTVvXKMcjh755A4gui6EW/KyQvYtCqd1p4bfIKK1wq+jtkqVNxEUdSamo5dpCh
         /vFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775553511; x=1776158311;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FlMN1zYTip17TcOkPr1kOdTAgk+GGVLiyPaqUC8VoaM=;
        b=KBUk9AGpOA10IUYGLzYhEBYmHBN14X3QGrSXYgzjJxCpm/0kL8wV00cA6bePGZnbME
         h6QxmvQT0RmFwlve7Ha9hsFBAizBLU+Pcj0U8e7JHmvFO6ZB5OBPdfDTmQazBqqLsUss
         ECCH3N/8W8dqWV+BsRApR3/kpf6ViUn4dlJiXWAo/SptpRqVcSPxA03fgxgNBpaGa5Dw
         /+mFVETeFay27yaG917oq60bXBnm/bFba2GOHcr5OhPdVccNbhCwQkm7De08G0s40kgn
         k+0FcwVgLr4t3byvI9hJe+37HmtCWyOuBHc50wxjJZKM+kXE2emzsQ9Ju8ecXmdMkRdh
         3Gng==
X-Forwarded-Encrypted: i=1; AJvYcCXkBgGInJ9KOQUHEEN+HfzKhT9A5QNnOhRds6VPY5oPJVR72LTNJCgnEwGE2OgyDbNozNEdGCA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/3vXpXGhX4b2Sp7ZMiKT5ljtV4npgenyXpG6exVRqCfZPpGOe
	dxpounI48ebBmYJ2BKhbvXtsB3hsEHGa3to3LgVIChORro3FQQx6axMwv9hiW/UD9MZLG9Acw3h
	2JDln0/VK95KiGcYANZDnrzNaaheVD4cZPb1mPOjeYypq6uvZuYFmiSn5D8IrFOuL
X-Gm-Gg: AeBDiete2Nt2S86+pAvcvxTX7rqN6qcDI53xqTqoFvqf1Id+DWtsPvbro6KQrCYPAcv
	89rcHv+wbnJZZlK1IO5DFBRLX9Syu614XA08R4n3mCPL4H8OHmrLr6ERe6eu1ofor8sAZQ0vW03
	dLD6Ldk3fuTbGg5FDQvFZ0Qq+HzNVAp799tM/CV6NCDm2JidD30xlUZiqVmBT0PwFvK7Z0OsWGq
	YFLkhbL0BnZJiZgR6yrWR3osqouGdyLWXdjsn/K9VxnCh3WtFV899vHtEiD4ssTSet0AQs/64Uo
	MZUTLqs5hZMMKUfwIhj0Mhkw+xipzx0VHVuOgtiV3HDBj4YMv+wRZATB8qMCC+7xNulXenvcXi4
	+7T6+E3E23SZldbywqOazg6Kt1ig5Ln+fAhD3VqzX0J/iVDjzRCA3rp1ba5W+Nw==
X-Received: by 2002:a05:6a00:2790:b0:82c:20c2:81d4 with SMTP id d2e1a72fcca58-82d003ab2fdmr15556780b3a.30.1775553510945;
        Tue, 07 Apr 2026 02:18:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:2790:b0:82c:20c2:81d4 with SMTP id d2e1a72fcca58-82d003ab2fdmr15556753b3a.30.1775553510287;
        Tue, 07 Apr 2026 02:18:30 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c3ce13sm17566518b3a.38.2026.04.07.02.18.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 02:18:29 -0700 (PDT)
Message-ID: <a5d079c9-e60e-4bc7-82c1-c62d1001d476@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 14:48:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Support channel change stats
To: Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Harish Rachakonda <quic_rachakon@quicinc.com>
References: <20260326050641.3066562-1-roopni.devanathan@oss.qualcomm.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260326050641.3066562-1-roopni.devanathan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA4NSBTYWx0ZWRfX54QDngOpnKfI
 GTtudhLaIaIy8CakFusSsER4Ly06IFVio3xfL4qY9TCoeOePhw3gawNWgNM9T8JVsCO1V1Ii5Fa
 G66U+vGtItDVUkuqBxILS3qvbqmAF4Sd9RgVdxaAuaaaFK3dGS7G/m/hU5/8KOFjeBq/z6XF8Nk
 38N/JzwJAoSLx+39AjAhJRrznG3MYVOvXi9+7Ii34tIKe7CdNjBdCkJfmnAGEGxyjPx7blT15LO
 hh68Ekf7BZh712TlTVHlJx9uaHBv9ypIiDVCKkTOSg5jOXT55cdrxLmqjVHiqNc9trlikP6Lfaf
 RezeKKg9hyN13GEOBkf6e+6xSAYlXgHxN21oAOGiJEYKuzagJ1/3AmnB62GKHAULmw7cdP3/Mi0
 yqHbViNUcj/ZnSr2mQ90bOi0bKyuRpnLcwzEdXSWCf4t9Amli+XMdhBTsGQitVVV7I3OjV9RTxC
 kF2/uCSUjH5PhjoWSKg==
X-Proofpoint-GUID: tv8qzX-vHn0VJCvyObmOfgdfc-2wADT6
X-Proofpoint-ORIG-GUID: tv8qzX-vHn0VJCvyObmOfgdfc-2wADT6
X-Authority-Analysis: v=2.4 cv=LquiDHdc c=1 sm=1 tr=0 ts=69d4cbe8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ygHbHArRDiDl1jTHKCoA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_101841_952562_B3F5CCED 
X-CRM114-Status: GOOD (  24.19  )
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



On 3/26/2026 10:36 AM, Roopni Devanathan wrote:
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
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01181-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Harish Rachakonda <quic_rachakon@quicinc.com>
> Signed-off-by: Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>
> ---
>   .../wireless/ath/ath12k/debugfs_htt_stats.c   | 72 +++++++++++++++++++
>   .../wireless/ath/ath12k/debugfs_htt_stats.h   | 26 +++++++
>   2 files changed, 98 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> index 7f6ca07fb335..b772181a496e 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> +++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> @@ -5722,6 +5722,75 @@ ath12k_htt_print_tx_hwq_stats_cmn_tlv(const void *tag_buf, u16 tag_len,
>   	stats_req->buf_len = len;
>   }
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
>   static int ath12k_dbg_htt_ext_stats_parse(struct ath12k_base *ab,
>   					  u16 tag, u16 len, const void *tag_buf,
>   					  void *user_data)
> @@ -6024,6 +6093,9 @@ static int ath12k_dbg_htt_ext_stats_parse(struct ath12k_base *ab,
>   	case HTT_STATS_TX_HWQ_CMN_TAG:
>   		ath12k_htt_print_tx_hwq_stats_cmn_tlv(tag_buf, len, stats_req);
>   		break;
> +	case HTT_STATS_CHAN_SWITCH_STATS_TAG:
> +		ath12k_htt_print_chan_switch_stats_tlv(tag_buf, len, stats_req);
> +		break;
>   	default:
>   		break;
>   	}
> diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
> index bfabe6500d44..82ab7b9e4db9 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
> +++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
> @@ -164,6 +164,7 @@ enum ath12k_dbg_htt_ext_stats_type {
>   	ATH12K_DBG_HTT_PDEV_MLO_IPC_STATS			= 64,
>   	ATH12K_DBG_HTT_EXT_PDEV_RTT_RESP_STATS			= 65,
>   	ATH12K_DBG_HTT_EXT_PDEV_RTT_INITIATOR_STATS		= 66,
> +	ATH12K_DBG_HTT_EXT_CHAN_SWITCH_STATS			= 76,
>   
>   	/* keep this last */
>   	ATH12K_DBG_HTT_NUM_EXT_STATS,
> @@ -267,6 +268,7 @@ enum ath12k_dbg_htt_tlv_tag {
>   	HTT_STATS_PDEV_RTT_HW_STATS_TAG			= 196,
>   	HTT_STATS_PDEV_RTT_TBR_SELFGEN_QUEUED_STATS_TAG	= 197,
>   	HTT_STATS_PDEV_RTT_TBR_CMD_RESULT_STATS_TAG	= 198,
> +	HTT_STATS_CHAN_SWITCH_STATS_TAG			= 213,
>   
>   	HTT_STATS_MAX_TAG,
>   };
> @@ -2156,4 +2158,28 @@ struct htt_tx_hwq_stats_cmn_tlv {
>   	__le32 txq_timeout;
>   } __packed;
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
>   #endif
> 
> base-commit: 37538641dac955f6690372f0ebb94e5e14a23418

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>



