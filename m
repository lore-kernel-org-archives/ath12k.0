Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B678E77188
	for <ath12k@archiver.kernel.org>; Thu,  9 Jan 2025 00:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ba7HI/jM8rZpmkbPTrPg6SIPkRARvnf8AKvi7+JEDdU=; b=iBorj3pf/SyC9PZ7MNckhS2IHW
	6TRzzWyZHJKr/SU6wqAJjvTDY7sc9cWsNnP0LFXoQtnuwwAO8beO9U6/+JfUM0QpCxfGR40jrfprd
	uAajq17gaCHj7pBTkfv0n0ZdqRFyB5RC3ub1f7Z2Gl4rpPCKQZGsTkNyOY+KXA8lsbt2zCr4UtOvt
	+rAPWNGmIlcjMoMDCWzUORfg2LAEPSFoafL5Wc5F/5SzxmxtyBLsFP2BjQu0HskQEwVU/f4J6UmfY
	PasyvOBYADNQVvS6tAZ4OhICvGTw71gOuj1a09er9T6SrZkzvcFxRGNDDD1NoLcAwqhaJZkpFg/4k
	Nq50/Snw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVg95-0000000ADIR-1fRR
	for ath12k@archiver.kernel.org;
	Thu, 09 Jan 2025 00:11:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVg8r-0000000ADFT-0Rhx
	for ath12k@lists.infradead.org;
	Thu, 09 Jan 2025 00:11:18 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508GcarH002433
	for <ath12k@lists.infradead.org>; Thu, 9 Jan 2025 00:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ba7HI/jM8rZpmkbPTrPg6SIPkRARvnf8AKvi7+JEDdU=; b=ke4RvN0sQiFn+ott
	qnU3l8peF5b7jKKFOXa7kZL+zyzlnOIvqGY4Y0siA9ljl4fxg2yPPkXYoz4qwgaa
	NoRDviqAc8QsgPxyHqunTn+jq8SGU7DUv+eZ2IPgZ8SIY98u2YEMxuL4/Hglvrxp
	MMfHgHHs+xb2Ko9HKrPftMv85eeHvXK7Tbe61zUHEIt2pc655h41BVsM+rfbPgjn
	2FQEcR/HPArGUDEJDpFv4Yfg7jhuWGwLIC+JrTWbj6zuJ0UU8X1CJDNUD5yjLpyH
	YTb/kYUkakfc3Nx3YuhuM7uB+vBB8XHVBTn+kDqV+EEhxk/WZzzKp6oxvz/LT8P9
	AibZuw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441w2j8xwc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 09 Jan 2025 00:10:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2efc3292021so866148a91.1
        for <ath12k@lists.infradead.org>; Wed, 08 Jan 2025 16:10:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736381427; x=1736986227;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ba7HI/jM8rZpmkbPTrPg6SIPkRARvnf8AKvi7+JEDdU=;
        b=VXxBhgjm5ws2AVBhL3InJpXbs175k9vXw9xi6cilv8FMQRs1A0HWQIQK3c+GnBiNCd
         MpKFgzon9zkZ4CEDqsPQ/8FkM3fUl/F4WXbNQATFLiZbpRoV1SHrS/bhnSqM5aWb3XnY
         ut9udklIq1LD/PqWjYRsqLTnwELaA8jajHGRfqucqA7bkSDaXDRvbtBk2mgOaeOcociY
         o/Tm5ccLUpb66XVZmj3Ua9WiX0lYSxNEu3jyGPYK7gpoVYlgSTpREUcOyyAptip2yqyY
         mCCsEs8+/TooalD4TJOdlR+UAeRIeJSV58lUsYKFPOdlpnlON+9o4dAxu10y5xEn2j5t
         MY1A==
X-Forwarded-Encrypted: i=1; AJvYcCUWDAQs+kYY9KBblmrhTHvYpD+We9ZdlVNJwp/YqrAYPMhVvzHrtUrNw1N3Uymg1mnfEkFD7ZE=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywi8DF3lsF2z1RXTalWsaxgW7a3EQ/I8DLkHF366OQWwkMAW0ML
	XZOx8FCYcNI3Y/0QZIXlFjL/MZYwvg86WVhVZGZI+wwQG9b/zPx7A3tszc8G7+/RtXI823GvCAn
	y3dXmoD3j9M203P8RTt4VS52xzHv9tvjNOKHeIIQmGcdFJNOMfkgzD14/CgRy
X-Gm-Gg: ASbGncv9Nqe1IOc3q0vMOf5mRKzZiFNaABGvxiwt+YP4figh/eStQwc4H0eS5Ef7LyY
	PTZIGN+61KCFKjsjTGK/a2oST7o2D+LFSYE9K9LslRRRZiJILBGoQ8wPTEhMQpeozvf7O+ylMtn
	XlvIWvun1FpGu2Zc3ti72EHqXe7ZgvKlPW9SsSi2VZh7s5/+RXGmiSoR2/BIHIwYjGwunC0EM1i
	E8s8gjRFu8dxjL9kOlzd1/wX2oWVKFSJjMHDYc4pcd6J6bZaXGqfhk9Y9kPoMdsSnDH3SBP/wo/
	mF1sqA1WHpSZl85MY30X/AOhkpAtXDh4NPeiOhxFeJQ42xzblg==
X-Received: by 2002:a17:90b:2d43:b0:2ee:fdf3:390d with SMTP id 98e67ed59e1d1-2f5490ed82dmr6093931a91.31.1736381426970;
        Wed, 08 Jan 2025 16:10:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG257rW6woA0u5VA9WO8H9R1W8kuwA4htpYgI6PBYgyMAsBt0qQtS6PoWpZZVLCaf9p4zXbmg==
X-Received: by 2002:a17:90b:2d43:b0:2ee:fdf3:390d with SMTP id 98e67ed59e1d1-2f5490ed82dmr6093903a91.31.1736381426557;
        Wed, 08 Jan 2025 16:10:26 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f559412d2esm6077a91.20.2025.01.08.16.10.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 16:10:26 -0800 (PST)
Message-ID: <9ef1c2ee-beae-423c-8e48-59227b78beee@oss.qualcomm.com>
Date: Wed, 8 Jan 2025 16:10:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath12k: Add Support to Parse TPC Event from
 Firmware
To: Roopni Devanathan <quic_rdevanat@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>
References: <20241220203638.2082002-1-quic_rdevanat@quicinc.com>
 <20241220203638.2082002-2-quic_rdevanat@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20241220203638.2082002-2-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: m5poClympl7zyfajleYuD2ZpfSlQZqgu
X-Proofpoint-ORIG-GUID: m5poClympl7zyfajleYuD2ZpfSlQZqgu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080198
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_161117_290776_0E199F8A 
X-CRM114-Status: GOOD (  13.69  )
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

On 12/20/2024 12:36 PM, Roopni Devanathan wrote:
...
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index 562b0615ed06..93c4c2344b44 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -7404,6 +7404,382 @@ static void ath12k_wmi_event_teardown_complete(struct ath12k_base *ab,
>  	kfree(tb);
>  }
>  
> +static int ath12k_wmi_tpc_stats_copy_buffer(struct ath12k_base *ab,
> +					    const void *ptr, u16 tag, u16 len,
> +					    struct wmi_tpc_stats_info *tpc_stats)
> +{
> +	u32 len1, len2, len3, len4;
> +	s16 *dst_ptr;
> +	s8 *dst_ptr_ctl;
> +
> +	len1 = le32_to_cpu(tpc_stats->max_reg_allowed_power.tpc_reg_pwr.reg_array_len);
> +	len2 = le32_to_cpu(tpc_stats->rates_array1.tpc_rates_array.rate_array_len);
> +	len3 = le32_to_cpu(tpc_stats->rates_array2.tpc_rates_array.rate_array_len);
> +	len4 = le32_to_cpu(tpc_stats->ctl_array.tpc_ctl_pwr.ctl_array_len);
> +
> +	switch (le32_to_cpu(tpc_stats->event_count)) {

drivers/net/wireless/ath/ath12k/wmi.c:7434:17: warning: cast to restricted __le32

note the tpc_stats event_count is defined as u32, not __le32

...

> +static void ath12k_process_tpc_stats(struct ath12k_base *ab,
> +				     struct sk_buff *skb)
> +{
> +	struct ath12k_wmi_pdev_tpc_stats_event_fixed_params *fixed_param;
> +	struct wmi_tpc_stats_info *tpc_stats;
> +	const struct wmi_tlv *tlv;
> +	void *ptr = skb->data;
> +	struct ath12k *ar;
> +	u16 tlv_tag;
> +	u32 event_count;
> +	int ret;
> +

...

> +	}
> +	tpc_stats->pdev_id = fixed_param->pdev_id;
> +	tpc_stats->end_of_event = fixed_param->end_of_event;
> +	tpc_stats->event_count = fixed_param->event_count;

drivers/net/wireless/ath/ath12k/wmi.c:7773:28: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath12k/wmi.c:7773:28:    expected unsigned int [usertype] pdev_id
drivers/net/wireless/ath/ath12k/wmi.c:7773:28:    got restricted __le32 [usertype] pdev_id
drivers/net/wireless/ath/ath12k/wmi.c:7774:33: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath12k/wmi.c:7774:33:    expected unsigned int [usertype] end_of_event
drivers/net/wireless/ath/ath12k/wmi.c:7774:33:    got restricted __le32 [usertype] end_of_event
drivers/net/wireless/ath/ath12k/wmi.c:7775:32: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath12k/wmi.c:7775:32:    expected unsigned int [usertype] event_count
drivers/net/wireless/ath/ath12k/wmi.c:7775:32:    got restricted __le32 [usertype] event_count

These all need le32_to_cpu()

...

> diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
> index b6a197389277..5193f4a7fed1 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.h
> +++ b/drivers/net/wireless/ath/ath12k/wmi.h

...

> +struct wmi_tpc_stats_info {
> +	u32 pdev_id;
> +	u32 event_count;
> +	u32 end_of_event;
> +	u32 tlvs_rcvd;
> +	struct wmi_max_reg_power_allowed_params max_reg_allowed_power;
> +	struct wmi_tpc_rates_array_params rates_array1;
> +	struct wmi_tpc_rates_array_params rates_array2;
> +	struct wmi_tpc_config_params tpc_config;
> +	struct wmi_tpc_ctl_pwr_table_params ctl_array;
> +};


