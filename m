Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A1B7D58E43
	for <ath12k@archiver.kernel.org>; Mon,  2 Mar 2026 01:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4/WFT3zlJhnisnMBi0gqxfNP77w2FhuxBt4m1pdVZ6Q=; b=c/XrMlGR4/tT2U6gLuAFp3/e1Y
	v9TePS8870YKtD5m4AlJuj5qw/PTQZv0agRdKQn8+2ys67RExLD9IeyLKAvEbQKaFZd6ViMEAJF4b
	KMoHlfqdP6W5IGRrRATWohfpqD6aeeZopTn03TnvTlQnz5mKwuq+pKicQZN1VJmdLmpH7uKbNtWeb
	/+d8MiG9jrVKsqMQf/13xnxiCMFGiB70ubnbHxccskqfllld7Wr8W1ib0gP0vhOXqcKhf6wfz1M5A
	b8DU87icgrAc2656k9yxwcmMN8L8Xsa7pqusYO7NSX+eIiEpw/yV2TuJzS1NpbXjkxn2VdM3Afsyb
	QdGNlaOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vws9y-0000000C4Mi-11BP;
	Mon, 02 Mar 2026 01:33:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vws9u-0000000C4Lx-3gFA
	for ath12k@lists.infradead.org;
	Mon, 02 Mar 2026 01:33:20 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 621Lssls2185340
	for <ath12k@lists.infradead.org>; Mon, 2 Mar 2026 01:33:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4/WFT3zlJhnisnMBi0gqxfNP77w2FhuxBt4m1pdVZ6Q=; b=cilhWxmhe5psCHLT
	BFAMEXSBgPFEWsfMC82w1J2YL9jlcdatb8SUH7TZLWlxDDdR1n1rehE9NFkJ7pGG
	R3x1CURf5/nii810piOsAVX0rjBk9LSQk53Z0ZpRDRucvit+t6eg5HleNlMGjbm7
	GRnmf4FSWl1gigaSCJ1YQ4i/FElzvS/Hw30/Ewd6CoNj0PCUTdpcB/u0LoIbeI9N
	Pkgh1zDwngZqdj2PD8uIpkk7JZ6aXiNftZ9rqWrZcRwx2G4cBwrIyzAXl0c2x7mC
	2lbnDdF3AVro7HFHuBvYT4TORcyr9au0ndxTWKdccqzwbwlWuk6ZnDYoR9JTxzTq
	KgDKlw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksg73gtn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 02 Mar 2026 01:33:17 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c70b6a624bfso2325537a12.1
        for <ath12k@lists.infradead.org>; Sun, 01 Mar 2026 17:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772415197; x=1773019997; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4/WFT3zlJhnisnMBi0gqxfNP77w2FhuxBt4m1pdVZ6Q=;
        b=WVYcCHhwBfZFW/EXkDgKQlxad8/eoyV5vpRskn9bHy1WWQoeB4bA5c3Q2phbQcKY2y
         HR08TEiTh7kCSLz5oFgSR7hfsbZRqqXcafTBeMOHMuhc1j6cKktGcY6c0t5A5TO52WWN
         KLkvIvG8xkhMD7NPNMuqg/TvfXfafwtkYIgOoRrGZCKO/gkrD66bTqlhXWIbzwBhf/yU
         UETinfVyhMKf9sxWxbs1V7mzFVvqP8fAeWKrlPY8eCfJUEnnyUKlYXQ+y6nwJoh+gAkK
         8D3XPPxdD2+6ICrxOnqiUUmDe1jv0RLxPh9aX5njS3AClgRDr09qMKZUtpJmnv8IulGF
         wZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772415197; x=1773019997;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4/WFT3zlJhnisnMBi0gqxfNP77w2FhuxBt4m1pdVZ6Q=;
        b=KRZXExco9WIaimZyK4ITemaFlldsiDKZ5I/zpBWdpd5kW2+Xx8MSvtp4QybxQMHopw
         gEm2PIZgrba0+jHpbDkUlvP6GOO4MsjmQONEUyQ44KO8v/PCmJek0lJnueB52egjJ9bS
         BnUGDgS5UFu7bkH2ryed1ZZry1+I0G+d0Zl64AltrgYEwz/lVf6NuXMbQynGMxQdgwKI
         YJXBewoqqkbM3oF9KcEJowbS+9H+IIw7lfB9XJOEYqLTaeYrX+5q192gclSo2NE3Pimc
         tO6Cilx6ZU5pCuzkRXAhDp6C3lOqwBgKiOFfH410B2edAdc/Vp5Xu8nsAmYv4FEd4e5j
         JYNA==
X-Forwarded-Encrypted: i=1; AJvYcCWJsSGd7BrPaMWA2gULZy9L/JcCex+BwxUQkB8bs6xdWhqBmKz/+O1ZJNI4QMna0o7LEra/XdA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8+neAf6DVPNbI6ZJvIK8wTLsuy0bgAs4I5qe4+fc1pd5GMSxY
	d4dftUADCXtpZYN6A0PjLhp7FLZcVCOb47h/C87e/QViBgPvuRyy1+yHyrbOtUK5UVAVOSVAets
	03RLWzuc5C29J9Rb9xsFTgWO2cRGC9FCaDeWAg0d1B5JKR29BM3QZEIz80+NWIEiu
X-Gm-Gg: ATEYQzwoeoo4JzsDcKoFJMjXXvuJDh5Ga4JF+Qf9HcHL0nypX6Iav8ckMndIeE/0b2L
	vfC7+aCjFOB6DeKBu2ur2cJ2rI1oZZKDy+vIWo4Tdge/f5+9DLj5ML3NTCXFJKD1yLmA2LeAMbR
	FCMh21zAz7fG6HeEKIfvCBm0xrhW/ELje4acZ6qWLdx2k7KWyjHZUBF+ALvglTSTlffdZOfQ8BC
	JOhBrFydLHXRGNqYaz7FehosgqF9fXQDqhAuVnHJmIWelb/UqTWl0PMVCJrJzFfk9jPza0lNpSo
	PjG4JjVVahjUh808U6AJKOU3dOJ4rEA8BhHa9svrB99hYZv9/vYOZIw+2zZeVZQmFXbxtEi8TNX
	V969jNfsLNgwslqMPbvfeTgmwZnRBn63IlTcRlpkfmCQMO7D7iDPxcdTV+auuCWmf7aEQAKVmcH
	jazJlUUGq1bpdiAdpOpg0=
X-Received: by 2002:a05:6a21:7d0c:b0:394:4d99:ff56 with SMTP id adf61e73a8af0-395c460060cmr9434624637.11.1772415196658;
        Sun, 01 Mar 2026 17:33:16 -0800 (PST)
X-Received: by 2002:a05:6a21:7d0c:b0:394:4d99:ff56 with SMTP id adf61e73a8af0-395c460060cmr9434590637.11.1772415196090;
        Sun, 01 Mar 2026 17:33:16 -0800 (PST)
Received: from [10.133.33.249] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69fa4fsm121259915ad.45.2026.03.01.17.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 17:33:15 -0800 (PST)
Message-ID: <cac1f367-2652-4dc5-b569-983d456ffede@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 09:33:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Remove the unused argument from
 the Rx data path
To: Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260227042128.3494167-1-karthikeyan.periyasamy@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260227042128.3494167-1-karthikeyan.periyasamy@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dl1KOT7HkkO58wpDP_gWQQCmO9PLgFWZ
X-Proofpoint-GUID: dl1KOT7HkkO58wpDP_gWQQCmO9PLgFWZ
X-Authority-Analysis: v=2.4 cv=FaA6BZ+6 c=1 sm=1 tr=0 ts=69a4e8dd cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=-IJwqUjvVoObTRxkB34A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDAxMSBTYWx0ZWRfX0FnW05kSX3bG
 NYJGg0+GHDLRiYSh/1ZeeOCF6eOoqwu1sFEv5SOxwiliXQrj4D18Ih3PF0uzozCgS1fBZpGq17e
 ZaI2I3i96FgLEkqJq55PRUpvt2+Cy/lMXEEyFnM1cuUn32gdfvKDQj63T1VWk3OfCuKqpgy7AeY
 ksu/+6zx7K+6Un8krP/fHAuR7oEbotUpARg9uG+nsb7M2YmmUn0eevId6Zx7BImTUlI+311bnO/
 Ng5u03TUikt7fBnYwDOmv77Ifm95kcAWHfOu4F8024TDgKiHVlgVqYus+tRh8tobxF3nk0Qo2KT
 wd7EQ3OqbteYoDMASj4BB0t8cdv4gGaSrFZIjp3+lVFAh8Sc1Ue8J0mIBA4mb3E+s0bqI6zARWx
 0GS+5rQh1zmmHQ/XnRXjs/ezWDO6gDctI4QZA0ncWCRPit2szPdo2NGeHaXUngLsAY+GVek6viM
 J0t4M4+6Sxm0fYjl5NQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_173319_066403_B17DCBF4 
X-CRM114-Status: GOOD (  17.31  )
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



On 2/27/2026 12:21 PM, Karthikeyan Periyasamy wrote:
> Currently, the Rx path uses new infrastructure to extract the required HAL
> parameters. Consequently, the HAL Rx descriptor argument is no longer
> needed in the following helper functions. Remove the unused argument from
> the following helper functions.
> 
> ath12k_dp_rx_h_undecap()
> ath12k_dp_rx_check_nwifi_hdr_len_valid()
> ath12k_wifi7_dp_rx_h_mpdu()
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/dp_rx.c       |  2 --
>  drivers/net/wireless/ath/ath12k/dp_rx.h       |  2 --
>  drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 25 ++++++++-----------
>  3 files changed, 11 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
> index a32ee9f8061a..c0e2b2c1a292 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
> @@ -1117,7 +1117,6 @@ static void ath12k_dp_rx_h_undecap_eth(struct ath12k_pdev_dp *dp_pdev,
>  }
>  
>  void ath12k_dp_rx_h_undecap(struct ath12k_pdev_dp *dp_pdev, struct sk_buff *msdu,
> -			    struct hal_rx_desc *rx_desc,
>  			    enum hal_encrypt_type enctype,
>  			    bool decrypted,
>  			    struct hal_rx_desc_data *rx_info)
> @@ -1393,7 +1392,6 @@ void ath12k_dp_rx_deliver_msdu(struct ath12k_pdev_dp *dp_pdev, struct napi_struc
>  EXPORT_SYMBOL(ath12k_dp_rx_deliver_msdu);
>  
>  bool ath12k_dp_rx_check_nwifi_hdr_len_valid(struct ath12k_dp *dp,
> -					    struct hal_rx_desc *rx_desc,
>  					    struct sk_buff *msdu,
>  					    struct hal_rx_desc_data *rx_info)
>  {
> diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.h b/drivers/net/wireless/ath/ath12k/dp_rx.h
> index 1ec5382f5995..bd62af0c80d4 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_rx.h
> +++ b/drivers/net/wireless/ath/ath12k/dp_rx.h
> @@ -189,7 +189,6 @@ void ath12k_dp_extract_rx_desc_data(struct ath12k_hal *hal,
>  }
>  
>  void ath12k_dp_rx_h_undecap(struct ath12k_pdev_dp *dp_pdev, struct sk_buff *msdu,
> -			    struct hal_rx_desc *rx_desc,
>  			    enum hal_encrypt_type enctype,
>  			    bool decrypted,
>  			    struct hal_rx_desc_data *rx_info);
> @@ -197,7 +196,6 @@ void ath12k_dp_rx_deliver_msdu(struct ath12k_pdev_dp *dp_pdev, struct napi_struc
>  			       struct sk_buff *msdu,
>  			       struct hal_rx_desc_data *rx_info);
>  bool ath12k_dp_rx_check_nwifi_hdr_len_valid(struct ath12k_dp *dp,
> -					    struct hal_rx_desc *rx_desc,
>  					    struct sk_buff *msdu,
>  					    struct hal_rx_desc_data *rx_info);
>  u64 ath12k_dp_rx_h_get_pn(struct ath12k_dp *dp, struct sk_buff *skb);
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
> index 7450938adf65..77a1679b41df 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
> @@ -325,7 +325,6 @@ static void ath12k_wifi7_dp_rx_h_csum_offload(struct sk_buff *msdu,
>  
>  static void ath12k_wifi7_dp_rx_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
>  				      struct sk_buff *msdu,
> -				      struct hal_rx_desc *rx_desc,
>  				      struct hal_rx_desc_data *rx_info)
>  {
>  	struct ath12k_skb_rxcb *rxcb;
> @@ -388,8 +387,7 @@ static void ath12k_wifi7_dp_rx_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
>  	}
>  
>  	ath12k_wifi7_dp_rx_h_csum_offload(msdu, rx_info);
> -	ath12k_dp_rx_h_undecap(dp_pdev, msdu, rx_desc,
> -			       enctype, is_decrypted, rx_info);
> +	ath12k_dp_rx_h_undecap(dp_pdev, msdu, enctype, is_decrypted, rx_info);
>  
>  	if (!is_decrypted || rx_info->is_mcbc)
>  		return;
> @@ -549,14 +547,14 @@ static int ath12k_wifi7_dp_rx_process_msdu(struct ath12k_pdev_dp *dp_pdev,
>  		}
>  	}
>  
> -	if (unlikely(!ath12k_dp_rx_check_nwifi_hdr_len_valid(dp, rx_desc, msdu,
> +	if (unlikely(!ath12k_dp_rx_check_nwifi_hdr_len_valid(dp, msdu,
>  							     rx_info))) {
>  		ret = -EINVAL;
>  		goto free_out;
>  	}
>  
>  	ath12k_dp_rx_h_ppdu(dp_pdev, rx_info);
> -	ath12k_wifi7_dp_rx_h_mpdu(dp_pdev, msdu, rx_desc, rx_info);
> +	ath12k_wifi7_dp_rx_h_mpdu(dp_pdev, msdu, rx_info);
>  
>  	rx_info->rx_status->flag |= RX_FLAG_SKIP_MONITOR | RX_FLAG_DUP_VALIDATED;
>  
> @@ -1030,13 +1028,13 @@ static int ath12k_wifi7_dp_rx_h_verify_tkip_mic(struct ath12k_pdev_dp *dp_pdev,
>  		    RX_FLAG_IV_STRIPPED | RX_FLAG_DECRYPTED;
>  	skb_pull(msdu, hal_rx_desc_sz);
>  
> -	if (unlikely(!ath12k_dp_rx_check_nwifi_hdr_len_valid(dp, rx_desc, msdu,
> +	if (unlikely(!ath12k_dp_rx_check_nwifi_hdr_len_valid(dp, msdu,
>  							     rx_info)))
>  		return -EINVAL;
>  
>  	ath12k_dp_rx_h_ppdu(dp_pdev, rx_info);
> -	ath12k_dp_rx_h_undecap(dp_pdev, msdu, rx_desc,
> -			       HAL_ENCRYPT_TYPE_TKIP_MIC, true, rx_info);
> +	ath12k_dp_rx_h_undecap(dp_pdev, msdu, HAL_ENCRYPT_TYPE_TKIP_MIC, true,
> +			       rx_info);
>  	ieee80211_rx(ath12k_pdev_dp_to_hw(dp_pdev), msdu);
>  	return -EINVAL;
>  }
> @@ -1588,7 +1586,6 @@ static int ath12k_wifi7_dp_rx_h_null_q_desc(struct ath12k_pdev_dp *dp_pdev,
>  	struct ath12k_dp *dp = dp_pdev->dp;
>  	struct ath12k_base *ab = dp->ab;
>  	u16 msdu_len = rx_info->msdu_len;
> -	struct hal_rx_desc *desc = (struct hal_rx_desc *)msdu->data;
>  	u8 l3pad_bytes = rx_info->l3_pad_bytes;
>  	struct ath12k_skb_rxcb *rxcb = ATH12K_SKB_RXCB(msdu);
>  	u32 hal_rx_desc_sz = dp->ab->hal.hal_desc_sz;
> @@ -1632,11 +1629,11 @@ static int ath12k_wifi7_dp_rx_h_null_q_desc(struct ath12k_pdev_dp *dp_pdev,
>  		skb_put(msdu, hal_rx_desc_sz + l3pad_bytes + msdu_len);
>  		skb_pull(msdu, hal_rx_desc_sz + l3pad_bytes);
>  	}
> -	if (unlikely(!ath12k_dp_rx_check_nwifi_hdr_len_valid(dp, desc, msdu, rx_info)))
> +	if (unlikely(!ath12k_dp_rx_check_nwifi_hdr_len_valid(dp, msdu, rx_info)))
>  		return -EINVAL;
>  
>  	ath12k_dp_rx_h_ppdu(dp_pdev, rx_info);
> -	ath12k_wifi7_dp_rx_h_mpdu(dp_pdev, msdu, desc, rx_info);
> +	ath12k_wifi7_dp_rx_h_mpdu(dp_pdev, msdu, rx_info);
>  
>  	rxcb->tid = rx_info->tid;
>  
> @@ -1673,7 +1670,7 @@ static bool ath12k_wifi7_dp_rx_h_tkip_mic_err(struct ath12k_pdev_dp *dp_pdev,
>  	skb_put(msdu, hal_rx_desc_sz + l3pad_bytes + msdu_len);
>  	skb_pull(msdu, hal_rx_desc_sz + l3pad_bytes);
>  
> -	if (unlikely(!ath12k_dp_rx_check_nwifi_hdr_len_valid(dp, desc, msdu, rx_info)))
> +	if (unlikely(!ath12k_dp_rx_check_nwifi_hdr_len_valid(dp, msdu, rx_info)))
>  		return true;
>  
>  	ath12k_dp_rx_h_ppdu(dp_pdev, rx_info);
> @@ -1681,8 +1678,8 @@ static bool ath12k_wifi7_dp_rx_h_tkip_mic_err(struct ath12k_pdev_dp *dp_pdev,
>  	rx_info->rx_status->flag |= (RX_FLAG_MMIC_STRIPPED | RX_FLAG_MMIC_ERROR |
>  				     RX_FLAG_DECRYPTED);
>  
> -	ath12k_dp_rx_h_undecap(dp_pdev, msdu, desc,
> -			       HAL_ENCRYPT_TYPE_TKIP_MIC, false, rx_info);
> +	ath12k_dp_rx_h_undecap(dp_pdev, msdu, HAL_ENCRYPT_TYPE_TKIP_MIC, false,
> +			       rx_info);
>  	return false;
>  }
>  
> 
> base-commit: ff49eba595df500e4ddccc593088c8a4ab5f2c27

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

