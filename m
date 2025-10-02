Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BE0CCA470
	for <ath12k@archiver.kernel.org>; Thu,  2 Oct 2025 01:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AiL66kauMPMVWPXmFSeQSWxeq5FUUwcmFuKC2oRp9Gs=; b=1Y0gx5yzABxVbfCG/xQPcbHnRp
	1GjULJ6Z+dGQkJicHCfX+R5suboAJButaxhjzlsJXtYOZVAv1co/DCt5SFUezwL5KjA7dOnGxiK/1
	XiXtSkgkp70EVlKITum9E9/+1bvAFyZms0pNFjn277wetIKmy1cQjS7Rnx6/MESPjbrYlrG84QZYs
	W8aKRbaBtf6XRisDwUEWXLQavsl1ma+r7+O/dzcQJrx1dSxW6u51ihZ60FqcYv7hQHwH0w1pjyO+o
	5zl5t5DqLGg8Rba8VfTKdVzBP8QrAWYmLxwOItSvZIjPdaJ/O6kaKPkY8AIPpqH/MR4yhl93fszcd
	6Emk2uZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v48AI-00000009Pve-23gq;
	Thu, 02 Oct 2025 01:31:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v48AG-00000009PuP-2lvP
	for ath12k@lists.infradead.org;
	Thu, 02 Oct 2025 01:31:26 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IbsvR023323
	for <ath12k@lists.infradead.org>; Thu, 2 Oct 2025 01:31:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AiL66kauMPMVWPXmFSeQSWxeq5FUUwcmFuKC2oRp9Gs=; b=ZjEqmjeWplSPcul2
	F9EUVb00t7Hj0vW4ENP7ebzsvtOZHUbSB4gr6nYqrY/X+i5kh4H+xDHwKFHdEDR/
	ZbHj2n2DkIg9xP38PREGm20r5Yw1zo9ZhM2+Z2SicEK/UCAOlhegXcF2grPBLXBf
	kitnILvyaoOlvraGDuqCJL1cNU/5pSg4qAg6/6mMMaHfUfYpR7H9tarWKmhibRqt
	4di1PxpNfm7qZ+LpzcbHg1S15pGuKIaK6FE/Lpm6WihRjg7u024rYeY2yfuMB/LE
	akNeaEtOPDWFbJ6RnmR6/KX5Ez5C2OrHMPcrs4QtQ+tSzA51UJWjROZm10eOe18s
	48RaXw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a66cgp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 02 Oct 2025 01:31:23 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-78117b8e49fso910761b3a.3
        for <ath12k@lists.infradead.org>; Wed, 01 Oct 2025 18:31:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759368682; x=1759973482;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AiL66kauMPMVWPXmFSeQSWxeq5FUUwcmFuKC2oRp9Gs=;
        b=mJFaGOxLknqN7Kj7ATCSllx0WqceAIp+Yngssx0tlt3U8Iupz0uG8a2ZIjvxH1tAEQ
         GRO/V6xfpj7FgClIEqX1qeTm6Yd4+CwZrl2BT9Dt8BHifIJx2NTRtn5cqrjpFEDY6+Ok
         yt3n0dY49DmCPu4xQ5ZDQBgRYJG/wfBxIamOwh3wxTt+y7QcnsdLg6ov/N8f+FUTV3Ed
         trrfIHySn0Y0lz/laSA173BtXo8eDDXD29gn58pnQgSXVp7Pb09NfNv9+YIGfjuarPyi
         ZDpitssRfejhsGpAB4TseocnKT8QmgwqecAgLUnKwNNSVYQjJxMzBSp+5PKWbCZXwOpv
         qA7g==
X-Forwarded-Encrypted: i=1; AJvYcCXiB48boNzCvtBL6nyekuxCOmpqXrc1VoUa5Tgxzzp2aOAxKLEgeekro1/2NTpcgg65aWkantI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3dqk3AaNiZy11Emy2zRo34SkgPV17F/x2KclevscXlZm7ikAH
	92AeXziu7mWfkMREZYmodA+5mOVJo5hCW2JqUag8bWPf46/f/UgRBbSpuehRbYFWg+eS8fPUbu1
	QLA2XTmTr7Gw5PekH5DsvzAtB9rfYCsgNUCdbFEjGFlSvacHx2aCVybEkb3krK4+M
X-Gm-Gg: ASbGnctfCa6kLthJnPbtJrDc+YQjMBnVun5l1A+wkxHF6Yy4ZOAPC1PoySbG24tvMfy
	VCEb4cnPTRKgjJNzK1l567bUIQAi6gJHaR4nHPwvIIfcZk0T6U52JyG7DxpOovAHi3nM0+3hbBt
	N+XQEasAhzThNLXXAzqlWTYFwlBviA8A39RPunzQe9xxc7DuE9l5YSrFdzbX/ZZ7O8L4cFu12+i
	pSiFQcJf6vRpyXwbz55TqHiWj842gUDyRWGHGW22HTQm1AQW9jNAvZ8KnMSUow1a4Yuqbp6KqZl
	5RMsR6sQVZDol5yeCYp166FCodeyeTITqEHXxV0iJ7bkXW8+QHJMLu7wa3gIZ2nbcbWnnndK61N
	Owg+mORICHKxa+diy7DCHc4WPMGcBab6HZQC+yzo6wA==
X-Received: by 2002:a05:6a00:2394:b0:781:189:ae43 with SMTP id d2e1a72fcca58-78af41f0cafmr5412421b3a.20.1759368682144;
        Wed, 01 Oct 2025 18:31:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTVzJY67RACi0TodPLYA1YjzMfML7zyChxCiuFn84v3wTsFYFyOBxf3coDpYkVbO7jP+P6lA==
X-Received: by 2002:a05:6a00:2394:b0:781:189:ae43 with SMTP id d2e1a72fcca58-78af41f0cafmr5412395b3a.20.1759368681533;
        Wed, 01 Oct 2025 18:31:21 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b0206e814sm928930b3a.68.2025.10.01.18.31.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 18:31:21 -0700 (PDT)
Message-ID: <4bb3de8a-92dd-444e-bed0-13ec2419cd34@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 18:31:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next V16 1/2] wifi: ath12k: fix VHT MCS assignment
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Baochen Qiang <quic_bqiang@quicinc.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
References: <20251002000732.1916364-1-quic_pradeepc@quicinc.com>
 <20251002000732.1916364-2-quic_pradeepc@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251002000732.1916364-2-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68ddd5eb cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=m5BbQQhsH88fZy18W4kA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: b7SjE_-5y6QDakzgmM6YgdLSO7E30PbK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfX7h4n+He3n5P/
 G/SWmk13yhGvOClF524dJ7fgImKL0U26MaoVpvUMFn4/m8R8IlzE90vROIssKYljS/6OYQdN609
 ZYTNdR0/jmI30kkJc2kc/B9XCB8l2a8FihIy/XlRf2nPrPk62627HXWim9ypEPSe51Ln24DQTp0
 fPFsnFlE6OGGvV8/U+YSIGsjQcm12/Hez5DnOTp/l5kqQpzU2JTILDWH4agi+lLG3PAsXWQEd4S
 5R6R/Lp/aifUsyJxv7/YSnMuvjz9A5xVGApRKDYX14RjhRkcF+LnKwOKwb2/8JECJy+1J/JngTB
 KskjxCjfL09e6ytwEsAZzQ1gt0mBHoK9pU3wBaNCV856/56X9SGPJgoj8dppxrB9q+aw1bbsiRL
 eU/96HKVSV/IUbmf6aME89FJT8J0Tg==
X-Proofpoint-ORIG-GUID: b7SjE_-5y6QDakzgmM6YgdLSO7E30PbK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_183124_822659_6FF63435 
X-CRM114-Status: GOOD (  23.31  )
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

On 10/1/2025 5:07 PM, Pradeep Kumar Chitrapu wrote:
> From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> 
> While associating, firmware needs the peer's receive capability
> to calculate its own VHT transmit MCS. Currently, the host
> sends this information via mcs->rx_mcs_set field, but firmware
> actually reads it from mcs->tx_mcs_set field. Thjis mismatch is

s/Thjis/This/

> incorrect.
> 
> This issue has not caused failures so far because most peers
> advertise identical TX and RX capabilities. Fix this by
> assigning the value to tx_mcs_set as expected.
> 
> Additionally, the rate control mask is intended to limit our
> transmit MCS, so it should also apply to the peer's receive
> capability. Update the logic accordingly.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c |  7 +++----
>  drivers/net/wireless/ath/ath12k/wmi.c | 11 +++++++----
>  drivers/net/wireless/ath/ath12k/wmi.h |  2 ++

wmi.c and wmi.h need copyright updates to match current guidance.

>  3 files changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 1d7b60aa5cb0..0d425a1bc0ab 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -2249,7 +2249,6 @@ static void ath12k_peer_assoc_h_vht(struct ath12k *ar,
>  	struct cfg80211_chan_def def;
>  	enum nl80211_band band;
>  	u16 *vht_mcs_mask;
> -	u16 tx_mcs_map;
>  	u8 ampdu_factor;
>  	u8 max_nss, vht_mcs;
>  	int i, vht_nss, nss_idx;
> @@ -2340,10 +2339,10 @@ static void ath12k_peer_assoc_h_vht(struct ath12k *ar,
>  	arg->peer_nss = min(link_sta->rx_nss, max_nss);
>  	arg->rx_max_rate = __le16_to_cpu(vht_cap->vht_mcs.rx_highest);
>  	arg->rx_mcs_set = __le16_to_cpu(vht_cap->vht_mcs.rx_mcs_map);
> -	arg->tx_max_rate = __le16_to_cpu(vht_cap->vht_mcs.tx_highest);
> +	arg->rx_mcs_set = ath12k_peer_assoc_h_vht_limit(arg->rx_mcs_set, vht_mcs_mask);
>  
> -	tx_mcs_map = __le16_to_cpu(vht_cap->vht_mcs.tx_mcs_map);
> -	arg->tx_mcs_set = ath12k_peer_assoc_h_vht_limit(tx_mcs_map, vht_mcs_mask);
> +	arg->tx_max_rate = __le16_to_cpu(vht_cap->vht_mcs.tx_highest);
> +	arg->tx_mcs_set = __le16_to_cpu(vht_cap->vht_mcs.tx_mcs_map);
>  
>  	/* In QCN9274 platform, VHT MCS rate 10 and 11 is enabled by default.
>  	 * VHT MCS rate 10 and 11 is not supported in 11ac standard.
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index ff6b3d4ea820..2682d89afd44 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -2367,10 +2367,13 @@ int ath12k_wmi_send_peer_assoc_cmd(struct ath12k *ar,
>  	cmd->peer_bw_rxnss_override |= cpu_to_le32(arg->peer_bw_rxnss_override);
>  
>  	if (arg->vht_capable) {
> -		mcs->rx_max_rate = cpu_to_le32(arg->rx_max_rate);
> -		mcs->rx_mcs_set = cpu_to_le32(arg->rx_mcs_set);
> -		mcs->tx_max_rate = cpu_to_le32(arg->tx_max_rate);
> -		mcs->tx_mcs_set = cpu_to_le32(arg->tx_mcs_set);
> +		/* Firmware interprets mcs->tx_mcs_set field as peer's
> +		 * RX capability
> +		 */
> +		mcs->rx_max_rate = cpu_to_le32(arg->tx_max_rate);
> +		mcs->rx_mcs_set = cpu_to_le32(arg->tx_mcs_set);
> +		mcs->tx_max_rate = cpu_to_le32(arg->rx_max_rate);
> +		mcs->tx_mcs_set = cpu_to_le32(arg->rx_mcs_set);
>  	}
>  
>  	/* HE Rates */
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
> index a8c3190e8ad9..6d9c645e3d5d 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.h
> +++ b/drivers/net/wireless/ath/ath12k/wmi.h
> @@ -4218,8 +4218,10 @@ struct wmi_unit_test_cmd {
>  struct ath12k_wmi_vht_rate_set_params {
>  	__le32 tlv_header;
>  	__le32 rx_max_rate;
> +	/* MCS at which the peer can transmit */
>  	__le32 rx_mcs_set;
>  	__le32 tx_max_rate;
> +	/* MCS at which the peer can receive */
>  	__le32 tx_mcs_set;
>  	__le32 tx_max_mcs_nss;
>  } __packed;
I can apply my two comments when I process this series if there are no other
changes required.

/jeff

