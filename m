Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9AEBCAC592
	for <ath12k@archiver.kernel.org>; Wed, 17 Sep 2025 02:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y6PXnaCKircHqE0zpOy6rcGb6NhFU+uxlmOaqFcHnIY=; b=3OKh81tliAUzjbPZ2tnC8w/dBb
	Q9yx8LihBMrug69jEUfOQWFuQw1dhzcIUDtBfRk+O7zHtQhnISQicIVMe0FcjwgQwE5wyfRNoAY5j
	sYVNq+veLYtZPMEfSikEsfvCteV9GzXJTVTONNImutGa8H/kzf4a8T9VqHRxgsgFDd4UVY+KcM49u
	pMeY6Hwz3sFSx2FE+9gPPrQzAnnY9nVnbvex6MbVyMl0tsPgxQbOcPFio+kC3mL3yjAT+8GnTEVco
	8DXaOy5SeJWMvdZg5HLAYuFh3UadsSf3ktg2qxCIbaJ147WH9H6yUT5WH2KfhtB2eL3vEae7kZBhR
	u1nUcfnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyhgV-00000009vvy-0idY;
	Wed, 17 Sep 2025 02:14:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyhgS-00000009vvb-3jEk
	for ath12k@lists.infradead.org;
	Wed, 17 Sep 2025 02:14:14 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GLaGao019262
	for <ath12k@lists.infradead.org>; Wed, 17 Sep 2025 02:14:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y6PXnaCKircHqE0zpOy6rcGb6NhFU+uxlmOaqFcHnIY=; b=CHCW0yG5L+UF9wRy
	89NolCtVZ/UIsL/kDLS6n8VXr2C4s/gNn8MjVQo6Aw7Aiuse6PMmSbks9/8ABzg1
	tE0Ur0dw1ZkFEMJQH0u7/7wtVNVGdCc7J9+9w+JbZYFheqH40DpiCHYHJpwObwot
	Vqmq+wzEV/0XjPpa/+mGlvID5n9j20TEFHrdB3uMigztMiekZloiSrG+uphfw7cW
	iI04I2TQPfeKjLcazjRTYIF+d+MvJfpsADzAw9mzw8bw+0EHiB9utzkL6gJDAbAu
	fvL4XkMWmh5xBNGomDSumbwfsN0Y7EgOeOh83TEYmd39QSfiN/l6Kwf7Urk3MrIv
	Bkki9g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxwgjau-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 17 Sep 2025 02:14:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-265e92cc3aeso31960205ad.3
        for <ath12k@lists.infradead.org>; Tue, 16 Sep 2025 19:14:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758075249; x=1758680049;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y6PXnaCKircHqE0zpOy6rcGb6NhFU+uxlmOaqFcHnIY=;
        b=wW+oi5CnnpmFBAfkDH78xUK+/zngGBpHd/z39JNil/Ets2uOfrj7930BcdFcTqi5Ri
         vYHzAlWYg7erviJV49m3Tc+mLN5z1Vzy/qPsZum54vfoH8IOGuujGKp7XU414WcDeRDn
         fUsdUj9sM/3vPFvUPtjs6SeOTwT/rEK+hvE0oG7Bm+wBAYnc8KvS67aENgKVydx7T112
         YaKGqVEfyvmS68uk7tvkmBaam5X1msChK156Ad3I//is1xPxLrDByRt5yxjw1k6HNOBx
         Fl20xoBSTUPVStT+O//RBDBrU1oc8yFapglpnEK1+vVOgScLrIis0IDpyiWV7QfKZNrE
         E4ZA==
X-Forwarded-Encrypted: i=1; AJvYcCU11b8d9CkCQIQz6nGGFUGXfiqpNa/mXoCaNTsDrbmAbff2DjMnFQmy+zcLU/eOgkBs88n7WH4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzrs+ILQcbgSJzlaeXNt5JxS99SkyeC/OcTTAKQZnytZbGK7A8/
	kYlxCslWQwsbmWODZVlZx/7hhfMEmoiFcIiAHGgjNy1nU1KIWG25W1XkFofMs6OzcRzfLlroRTM
	SL0IKvROr47FY4vpC0CCJze1k/TjdxSIwwWhokXfQ/8OzzZ6KJRqYubw1xmEY8B0b
X-Gm-Gg: ASbGncuWNTbqiKhTFh2uQHny1n/DevcQ1FsG2XWDid4Rxi7oZu3/bHSoZAezQGV6vjY
	BYGVJM7RqZNv4CwIjcoo30q47uYfOnIfqpBeHi30wUm+Dbg4UaoXFcidUYKvPDy1drGQkSEhHOu
	DzA9nvWqegybYwH4EXgg04w+yp7VRn60SX78hU7EVi4d2A7re0inyyfjEfHSdipNoPMvQ1t1Kv1
	nEVIrMUThWTfmhvSuYTwR/6AbH3oleAn32I10i8YhBYMMoHfzra1TCg2S8nD9wVuw3Xfxfa1eW8
	0x048S6jBYRIYOqN5a+XNlhnQ2RojkpBoezq8xYG1buWMNeRDYDGZ4L+Q371+UGitfR3jtxVVNd
	zrnWPScuOizvsmsPFObVmLK2Qp9AtwWBZSe6ygg==
X-Received: by 2002:a17:903:174e:b0:262:79a:9405 with SMTP id d9443c01a7336-268118b93e8mr4650495ad.3.1758075248673;
        Tue, 16 Sep 2025 19:14:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFv/sCoZBfDtNsTK8AEI0QIhh1SGDUDrsrq4iG0nzF6cZu5QWu9IpxONwtvoKsCch7JgstOPg==
X-Received: by 2002:a17:903:174e:b0:262:79a:9405 with SMTP id d9443c01a7336-268118b93e8mr4650245ad.3.1758075248175;
        Tue, 16 Sep 2025 19:14:08 -0700 (PDT)
Received: from [10.133.33.224] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2638eb9e75bsm96412485ad.3.2025.09.16.19.14.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 19:14:07 -0700 (PDT)
Message-ID: <97ed8dfb-9abe-45e1-9545-ffafd8f98ffc@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 10:14:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Add support to set per-radio RTS
 threshold
To: Roopni Devanathan <quic_rdevanat@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250826105714.1188131-1-quic_rdevanat@quicinc.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250826105714.1188131-1-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX8l3CcwkjVZkh
 1d4TLTcW2v+FtvRxktImesN8E1CyIdKs93kyeE5AkzNz30XebdHhDUKVMpIHJn7x9pCyctX9eC7
 b0nOc1QfQO6/zzI/6sY0bZwvwPhKmpaH1yyCcqRJ8+uuEpxNTFAq5hT/7Jk8LLVu+K/FXIT2uYd
 S9vZJ196f98iepnoJgpmdLX57QFjzn3nKucXhDUQ/nTZJ0xIhXs463j6kTkZfDLDSTEx+yn+4f2
 EOR+AmDC0SJLPrvlJML0U9ah+AKuI1N80hWgP1/0vktHtgSqK/jSnVFALImB8Jr1qMHTtT/EbLZ
 a04Avys50+WXLtsO5jdsLtcuBaKakjl9CwR99VdLYgsnQ8oRnx7PjyDSkZbixQ48tye0ja3b7ul
 eT6nltWS
X-Proofpoint-GUID: YVY6PDpT4f29vqLzhiBYht978GzJa24L
X-Authority-Analysis: v=2.4 cv=ROezH5i+ c=1 sm=1 tr=0 ts=68ca1971 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=VItAEOD5pU9O0TDtwIoA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: YVY6PDpT4f29vqLzhiBYht978GzJa24L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_191413_054389_391B2900 
X-CRM114-Status: GOOD (  31.92  )
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



On 8/26/2025 6:57 PM, Roopni Devanathan wrote:
> Currently, command to set RTS threshold makes changes to the threshold of
> all radios in the multi-radio wiphy. But each radio in a multi-radio wiphy
> can have different RTS threshold requirements.
> 
> To support this requirement, use the index of radio for which the RTS
> threshold needs to be changed from mac80211 - radio_idx. Based on the value
> passed, set the RTS threshold value for the corresponding radios. Following
> are the possible values of radio_idx and the corresponding behavior in
> multi-radio wiphys:
>  1. radio_idx is -1: consider RTS threshold as a global parameter, i.e.,
>     make changes to all the radios in a wiphy. If setting RTS threshold
>     fails for any radio, then the previous RTS threshold values of
>     respective radios will be restored.
>  2. radio_idx denotes a specific radio: make changes in RTS threshold to
>     that radio alone.
>  3. radio_idx is any other number: report it as an invalid number.
> 
> In case of single-radio wiphys, continue with the existing behavior, i.e.,
> set the passed RTS threshold value to the radio present.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/core.h |  3 +-
>  drivers/net/wireless/ath/ath12k/mac.c  | 50 ++++++++++++++++++++++----
>  2 files changed, 45 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index 519f826f56c8..da7e99f2ca0b 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -1,7 +1,7 @@
>  /* SPDX-License-Identifier: BSD-3-Clause-Clear */
>  /*
>   * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>   */
>  
>  #ifndef ATH12K_CORE_H
> @@ -730,6 +730,7 @@ struct ath12k {
>  	u32 txpower_scale;
>  	u32 power_scale;
>  	u32 chan_tx_pwr;
> +	u32 rts_threshold;
>  	u32 num_stations;
>  	u32 max_num_stations;
>  
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index bd1ec3b2c084..c0e0423464e3 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: BSD-3-Clause-Clear
>  /*
>   * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>   */
>  
>  #include <net/mac80211.h>
> @@ -9848,6 +9848,7 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
>  
>  	param_id = WMI_VDEV_PARAM_RTS_THRESHOLD;
>  	param_value = hw->wiphy->rts_threshold;
> +	ar->rts_threshold = param_value;
>  	ret = ath12k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
>  					    param_id, param_value);
>  	if (ret) {
> @@ -11675,16 +11676,32 @@ static int ath12k_mac_op_set_rts_threshold(struct ieee80211_hw *hw,
>  					   int radio_idx, u32 value)
>  {
>  	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
> +	struct wiphy *wiphy = hw->wiphy;
>  	struct ath12k *ar;
> -	int param_id = WMI_VDEV_PARAM_RTS_THRESHOLD, ret = 0, i;
> +	int param_id = WMI_VDEV_PARAM_RTS_THRESHOLD;
> +	int ret = 0, ret_err, i;
>  
>  	lockdep_assert_wiphy(hw->wiphy);
>  
> -	/* Currently we set the rts threshold value to all the vifs across
> -	 * all radios of the single wiphy.
> -	 * TODO Once support for vif specific RTS threshold in mac80211 is
> -	 * available, ath12k can make use of it.
> -	 */
> +	if (radio_idx >= wiphy->n_radio || radio_idx < -1)
> +		return -EINVAL;
> +
> +	if (radio_idx != -1) {
> +		/* Update RTS threshold in specified radio */
> +		ar = ath12k_ah_to_ar(ah, radio_idx);
> +		ret = ath12k_set_vdev_param_to_all_vifs(ar, param_id, value);
> +		if (ret) {
> +			ath12k_warn(ar->ab,
> +				    "failed to set RTS config for all vdevs of pdev %d",
> +				    ar->pdev->pdev_id);
> +			return ret;
> +		}
> +
> +		ar->rts_threshold = value;
> +		return 0;
> +	}
> +
> +	/* Radio_index passed is -1, so set RTS threshold for all radios. */
>  	for_each_ar(ah, ar, i) {
>  		ret = ath12k_set_vdev_param_to_all_vifs(ar, param_id, value);
>  		if (ret) {
> @@ -11693,6 +11710,25 @@ static int ath12k_mac_op_set_rts_threshold(struct ieee80211_hw *hw,
>  			break;
>  		}
>  	}
> +	if (!ret) {
> +		/* Setting new RTS threshold for vdevs of all radios passed, so update
> +		 * the RTS threshold value for all radios
> +		 */
> +		for_each_ar(ah, ar, i)
> +			ar->rts_threshold = value;
> +		return 0;
> +	}
> +
> +	/* RTS threshold config failed, revert to the previous RTS threshold */
> +	for (i = i - 1; i >= 0; i--) {
> +		ar = ath12k_ah_to_ar(ah, i);
> +		ret_err = ath12k_set_vdev_param_to_all_vifs(ar, param_id,
> +							    ar->rts_threshold);
> +		if (ret_err)
> +			ath12k_warn(ar->ab,
> +				    "failed to restore RTS threshold for all vdevs of pdev %d",
> +				    ar->pdev->pdev_id);
> +	}
>  
>  	return ret;
>  }
> 
> base-commit: 95bf875b89b48a95a82aca922eeaf19d52543028

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>



