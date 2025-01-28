Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4F0C02190
	for <ath12k@archiver.kernel.org>; Tue, 28 Jan 2025 04:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XHvNkDqjZCrz9kfzAbAzz4NEpnRiJwgy1SkFRz5kXpc=; b=ETZgEE7Oq8oGAeRTvQQm17sKYg
	P5V39RmIC5CMqUvN2Nzn8BowdCv2rVyOLcblmZGYwFeKinctn50LLIP6J1Xf86fNeSfWik4QY/aV5
	Sw5wnG6/N0VSP3ozYbQ9Fr5C9sJqKqdk6k8kXyHMxwbC0a6DBvY+XIyKDspiaMTjZsQmQTcZvU4zP
	iGtaUslgLFNc/MtTKdi23WXMcU8UGYzmh7MJL6O0me7SG/pC9ook3wlXG62efWOSznS3nMrpqctdA
	7I4I5INblZTnjmz/fudlMoSa8DyulIAOV6hwFPTgK8DRcRf7pSnrfiLBEw7iNgv6avr5+NgpNFCHd
	W8zrnXRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdTG-000000043Xk-0yZo
	for ath12k@archiver.kernel.org;
	Tue, 28 Jan 2025 04:45:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdTE-000000043XB-1UfW
	for ath12k@lists.infradead.org;
	Tue, 28 Jan 2025 04:45:05 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S1rX1D030333
	for <ath12k@lists.infradead.org>; Tue, 28 Jan 2025 04:45:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XHvNkDqjZCrz9kfzAbAzz4NEpnRiJwgy1SkFRz5kXpc=; b=lvMcTsncO+ko3VgL
	gewSnk0aCnn4QpuKevBiK645+a7C3A/5FjjEyfP0v1o/lNmFtdUFwDrmHxuzEqQT
	enk2OemuzbcE2ni7Nv696p/8dBfpqdaI/UnEkZGD/Bt1lQZBhlQFIc82ZixIBOhn
	RCdbFBjFWw0P2JxbnhPnYaZl91VuGHLAXkrdvtIRh4He/gtQ2T3LnLWe/ofHPLn9
	b4Gt0Bs+/F9xnYlaQ8OT+d3Hovn/zxJra7P67Vh3ErY4iE5DyLpmj8IJHSM666TT
	DVvGfvmQ4qpPURGK79XzT6VQTp06CEfFWPFZ+aFCJcEXL5blIsCASmCiGRfk9acD
	B0J93w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44enyq0768-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 28 Jan 2025 04:45:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21dcc9f3c8aso8201885ad.3
        for <ath12k@lists.infradead.org>; Mon, 27 Jan 2025 20:45:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738039500; x=1738644300;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XHvNkDqjZCrz9kfzAbAzz4NEpnRiJwgy1SkFRz5kXpc=;
        b=qq19qvPBPesVPze/O2vFzmXedsU+/FMxCumBB6AqE4Zrnw0nFNCDvabPLcXFAb4Psi
         7Reqc1nCK5l+EVtYTEQwhGqicmtMyiwlj9b7MdQuucq8vmOKyZ5RQHxz1F8cQmGx9UEX
         4jBFVvMGdJjyZpo/oAbj5mLEMCKxi1Zu6EEjHpQ8IaYpc22XbmkFa5GuUc/hfm5NlJVX
         uYT+5BuYYD16U5ZdnqDm/3JWiNahvMHe5RLE9Dy51zk/1g3X5QF4KVvJ5mxxtzMAXIQD
         0qwRXfYqZkbLP3v0JGzdnh+K1y3g0xQTbCrpeGRLucZVeaBW0tmwzaTgRG+txNzRM6dU
         OZXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVdYxyi2r3IGF3T/d1oSKHX6TGWfplRYEezbyYdu8YcGwx8eWaUNLtFyvdERhOakj4fHMmUzc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzYfpLJ3YBjnJbGmebFmwJ1sU46CTZ+SfodFgQHxCMEkxsB8zYA
	oTJIbed6yVEkPbQLpgMk/VXeUCOrXoMr1Yn1JBRBrI/sXLBYv1GF1MhEgp/f5Vutl9gZ9d6A8l8
	I4FR5uo77jy4krM7BQ/ZYLJlPTYpva6x3EFJnWYui+87wSgGLmoTdHjcJhAf4
X-Gm-Gg: ASbGncsL3C1i9hYM0+cz58wz4Sbss4bAvHqR3xYqz1NoT98tUDgejR086DNHDFbmJ+v
	pV0deYWknFGFzSoXCz0VucwFWAOEEwkyJOKvwLQ10H3Nhh9Csbu3m2oJW4w7T8BFN6Gv9fET+Do
	x06Vv4R650HPrtmI7qVa5p4+n/KR7FG7/YFhWfRZIVlLH3Iqlt7N+F3ENOoHpQJHbmAVwhvwk34
	Yb1i4WlJcDS91eKUc8+WAaafhiyjVeH/EE2rsFkms4BMg9Dn7hT8cJiA7MLRinjCs4uJUN4KIoI
	Y/jKxTwAknJsdcVq4HNkfI/Lp7EliTBmuotyR8o=
X-Received: by 2002:a05:6a20:7349:b0:1e1:afa9:d38b with SMTP id adf61e73a8af0-1eb2145ccd8mr66197566637.8.1738039500489;
        Mon, 27 Jan 2025 20:45:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGaTFAD0E8nKrDiDsQhtizA2nj6BdBpdks4DapPR3CbaQzgrnQv0lkI+28Q4b8NU4GEsoA1vg==
X-Received: by 2002:a05:6a20:7349:b0:1e1:afa9:d38b with SMTP id adf61e73a8af0-1eb2145ccd8mr66197537637.8.1738039500037;
        Mon, 27 Jan 2025 20:45:00 -0800 (PST)
Received: from [10.152.202.18] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a76150csm8129438b3a.87.2025.01.27.20.44.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 20:44:59 -0800 (PST)
Message-ID: <c51499f4-dc6b-4d54-a6a3-fd0d81505ec8@oss.qualcomm.com>
Date: Tue, 28 Jan 2025 10:14:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] wifi: ath12k: Add Support to Parse TPC Event from
 Firmware
To: Roopni Devanathan <quic_rdevanat@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>
References: <20250127073255.3374341-1-quic_rdevanat@quicinc.com>
 <20250127073255.3374341-2-quic_rdevanat@quicinc.com>
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250127073255.3374341-2-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: H86tBRozXtFS36co3NFIO4JKFzVXz9BM
X-Proofpoint-GUID: H86tBRozXtFS36co3NFIO4JKFzVXz9BM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_01,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501280033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_204504_419134_FB7A5FCF 
X-CRM114-Status: GOOD (  20.70  )
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

On 1/27/25 13:02, Roopni Devanathan wrote:
> Parse various events and save it in local structures. Create tpc_stats
> file using debugfs to store these local structures. Create function to
> handle TPC stats read to relay the information to the user.
> 
> Command usage:
> echo 1 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/tpc_stats_type

This patch is adding tpc_stats alone. So usage of this file should be 
mentioned here instead of tpc_stats_type which is added in next patch?

[..]

> +static int ath12k_wmi_tpc_stats_subtlv_parser(struct ath12k_base *ab,
> +					      u16 tag, u16 len,
> +					      const void *ptr, void *data)
> +{
> +	struct wmi_tpc_rates_array_fixed_params *tpc_rates_array;
> +	struct wmi_max_reg_power_fixed_params *tpc_reg_pwr;
> +	struct wmi_tpc_ctl_pwr_fixed_params *tpc_ctl_pwr;
> +	struct wmi_tpc_stats_info *tpc_stats = data;
> +	struct wmi_tpc_config_params *tpc_config;
> +	int ret = 0;
> +
> +	if (!tpc_stats) {
> +		ath12k_warn(ab, "tpc stats memory unavailable\n");
> +		return -EINVAL;
> +	}
> +
> +	switch (tag) {
> +	case WMI_TAG_TPC_STATS_CONFIG_EVENT:
> +		tpc_config = (struct wmi_tpc_config_params *)ptr;
> +		memcpy(&tpc_stats->tpc_config, tpc_config,
> +		       sizeof(struct wmi_tpc_config_params));
> +		break;
> +

extra line break not needed?

> +	case WMI_TAG_TPC_STATS_REG_PWR_ALLOWED:
> +		tpc_reg_pwr = (struct wmi_max_reg_power_fixed_params *)ptr;
> +		ret = ath12k_tpc_get_reg_pwr(ab, tpc_stats, tpc_reg_pwr);
> +		break;
> +	case WMI_TAG_TPC_STATS_RATES_ARRAY:
> +		tpc_rates_array = (struct wmi_tpc_rates_array_fixed_params *)ptr;
> +		ret = ath12k_tpc_get_rate_array(ab, tpc_stats, tpc_rates_array);
> +		break;
> +

same here

> +	case WMI_TAG_TPC_STATS_CTL_PWR_TABLE_EVENT:
> +		tpc_ctl_pwr = (struct wmi_tpc_ctl_pwr_fixed_params *)ptr;
> +		ret = ath12k_tpc_get_ctl_pwr_tbl(ab, tpc_stats, tpc_ctl_pwr);
> +		break;
> +

same here

> +	default:
> +		ath12k_warn(ab,
> +			    "Received invalid tag for tpc stats in subtlvs\n");
> +		return -EINVAL;
> +	}
> +	return ret;
> +}

[..]

> +static void ath12k_process_tpc_stats(struct ath12k_base *ab,
> +				     struct sk_buff *skb)

Since this is WMI event processing function, name should have _wmi_ in it?

> +{
> +	struct ath12k_wmi_pdev_tpc_stats_event_fixed_params *fixed_param;
> +	struct wmi_tpc_stats_info *tpc_stats;

[..]

>   static void ath12k_wmi_op_rx(struct ath12k_base *ab, struct sk_buff *skb)
>   {
>   	struct wmi_cmd_hdr *cmd_hdr;
> @@ -8236,6 +8619,9 @@ static void ath12k_wmi_op_rx(struct ath12k_base *ab, struct sk_buff *skb)
>   		else
>   			ath12k_tm_wmi_event_unsegmented(ab, id, skb);
>   		break;
> +	case WMI_HALPHY_STATS_CTRL_PATH_EVENTID:
> +		ath12k_process_tpc_stats(ab, skb);
> +		break;

Can we add this above unsupported events comment? I see FTM elated event 
got missed and merged after it but okay, we can fix that later.

>   	default:
>   		ath12k_dbg(ab, ATH12K_DBG_WMI, "Unknown eventid: 0x%x\n", id);
>   		break;
> @@ -8372,6 +8758,78 @@ int ath12k_wmi_simulate_radar(struct ath12k *ar)
>   	return ath12k_wmi_send_unit_test_cmd(ar, wmi_ut, dfs_args);
>   }
>   
> +int ath12k_wmi_send_tpc_stats_request(struct ath12k *ar,
> +				      enum wmi_halphy_ctrl_path_stats_id tpc_stats_type)
> +{
> +	struct wmi_request_halphy_ctrl_path_stats_cmd_fixed_params *cmd;
> +	struct ath12k_wmi_pdev *wmi = ar->wmi;
> +	struct sk_buff *skb;
> +	struct wmi_tlv *tlv;
> +	__le32 *pdev_id;
> +	u32 buf_len;
> +	void *ptr;
> +	int ret;
> +
> +	buf_len = sizeof(*cmd) +
> +		  TLV_HDR_SIZE +
> +		  sizeof(u32) +
> +		  TLV_HDR_SIZE +
> +		  TLV_HDR_SIZE;
> +

Any specific reason each of these are split into multiple lines?

> +	skb = ath12k_wmi_alloc_skb(wmi->wmi_ab, buf_len);

[..]

> diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
> index 2934d9589007..f88f6a6bb15e 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.h
> +++ b/drivers/net/wireless/ath/ath12k/wmi.h

[..]

> @@ -5896,7 +6031,9 @@ int ath12k_wmi_set_bios_geo_cmd(struct ath12k_base *ab, const u8 *pgeo_table);
>   int ath12k_wmi_send_stats_request_cmd(struct ath12k *ar, u32 stats_id,
>   				      u32 vdev_id, u32 pdev_id);
>   __le32 ath12k_wmi_tlv_hdr(u32 cmd, u32 len);
> -

keep this empty line for better code readibility?

> +int ath12k_wmi_send_tpc_stats_request(struct ath12k *ar,
> +				      enum wmi_halphy_ctrl_path_stats_id tpc_stats_type);
> +void ath12k_wmi_free_tpc_stats_mem(struct ath12k *ar);
>   static inline u32
>   ath12k_wmi_caps_ext_get_pdev_id(const struct ath12k_wmi_caps_ext_params *param)
>   {


-- 
Aditya

