Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9804C7EE31
	for <ath12k@archiver.kernel.org>; Thu, 26 Jun 2025 18:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0GSpMgeE3CrxHJUlRnvSMLafLO50jP5VR+WYCZAD/Lo=; b=NYDGqBP91ZOeBM5bRWBGbsZPAr
	BS1gzaflGfD2kkunCHjrz6w2n7HDc19KMfxQnnKu2Cl6nm48yw6H7VuxbzeKXePk0LxQhxExBDC4F
	r01eq+Vt7ctHR+M8jEylEGACWzOIZqsPSsVKAgHGaZkHxauvVP/Q1hwiz3K4FxfHm20FykrqB3Gye
	F1zBbOENnjR5gbXOfBBgbNIW36kvDoqSRhqMzjdg5tyS1rr0+TqV3YVLB8jLf1UU9+9EAQOeurZfP
	xiyj9lKUL/1QOvaz0/1LqN0JWB0yWDuTs3NQ5N/wrb8Yp/BziSAyuY7l9PLQbZ2XAzKf0/USgl85W
	BQoilGug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUrBS-0000000CRSh-2AgY;
	Thu, 26 Jun 2025 18:18:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUrBP-0000000CRSN-47EA
	for ath12k@lists.infradead.org;
	Thu, 26 Jun 2025 18:18:49 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9uHp6027655
	for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 18:18:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0GSpMgeE3CrxHJUlRnvSMLafLO50jP5VR+WYCZAD/Lo=; b=Z4ht0K6uwHAhX2JS
	pqzuc/A2Ds2+oifbZbLbMugu2HeCfYH1k8GG+fSPU9BHaNgnTI/lbpyMe5duNi7L
	wQR8uIQhAh+W+c9zaIMMz1oOv05CoVmYjY/0/7TOS7gnQkiVgbTL+TxFrom8iC9f
	RBpRV8BVnsFaskET6z82vzaMHPIAWuz+lEvGN9/+qmOa9V+i4oSctm7Ce5EBV59Y
	7NMQKQM5stjizO/KOu4guz0jmE8QcKDxPgCBwLv0/OiIgXPXXwrR4SxluKfDH4kS
	QGVfzaxKsvIqgO08W2cNGK65VP5jiIERoD+kAlG55uc1a5RgRmNrsxZ02qckGPe9
	+h2QjA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5weyy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 18:18:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2356ce55d33so19144965ad.0
        for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 11:18:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750961926; x=1751566726;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0GSpMgeE3CrxHJUlRnvSMLafLO50jP5VR+WYCZAD/Lo=;
        b=o+SmTUyCrRCEwLwc102iz5p/kVbCSo5m1KrNu88kcXC/CuhU4EEemNjw97jChf0Rff
         02mXBmeKl3cpe6KqabxxqN8rsQiRKsDGTRcAiOcCFSC1q7ZN5soVc2DxLAf4lGlNvVpx
         EdJhnhFCwWgMtQLDtK0Weaz5rUQD8qdf8qQBJJe720kK8Ueqn5fe2G3/6tYh7ZYfjeh7
         Z5vknYkxC1KCFo2vk0XJW0em4AacH9IyfwOv/lw/VX8W3NPYbqbTDe/eo2AvNcCTqj1b
         zPCPLfvWIrLFC97iUzYNHJK/cQ6ottVzxVeFxGvuoZ+25MLD2q3bpt4VNTPBRxFsCCFX
         4Weg==
X-Forwarded-Encrypted: i=1; AJvYcCXuNRvyONyBih5Oa9nZ3bIUDckrbZbTrKVmwgghyARv3ghTSHRAdaxc7AKjWjcuQ43jOgUAcNA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxIFsK3ARqBZ6I0Eko932KbI2hn/pu8Mg+SVTIrvucWzMT5BhJv
	L7GNYgu2w+4t6Y2SoaPXdtsE9a40PkjQ1bTz/757fvyx1bduNHpb3yO9ZayYSHLOBB/wXLWFRbz
	hyVpMDqVWSIxp4pby5G57htqCuowIAHfbuK4PCIYslordyM1k25ll3R6yC7nsA+Gr
X-Gm-Gg: ASbGnctmfNmb2LaUzAk7xezD+TXkrNF0gU6WxwiMFrCCxi2XyL71PtN+fXCK5nmAud5
	6MLP1uJ8C+j1YCxwHA0ptTTO0EKbRLHXVXIdjx01UGIEyH+QLecaBq7vyrifdbgYGaA/ieo9Mb0
	ekaMEXJFJX0Xc7CceuLd9AaraQb2zBm4z83drjnkSH0W+D2gDXA3zjg0cf25B9oU4OPp7Adtxjn
	5k+6CS+BzyWhYlhhvdH3fkG3y/hXhHOkgtXxd1lEtSlGOejWukLxvg4Nv3XkNBwvYKU9xRuOx0q
	Y0Q+jWacQ2913ppf9twbGevFXps+jvpr+J+3e/77q+wWOTsKBqulE55gAC13n/6x1NQYDzIoVSH
	5EuVEo9x4V3ZoRn4=
X-Received: by 2002:a17:903:1a70:b0:234:cb4a:bc48 with SMTP id d9443c01a7336-23ac462442bmr4064395ad.31.1750961926193;
        Thu, 26 Jun 2025 11:18:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFdYkyaMR441byTsbcu2QOkb9X82k+U4Yk+XzZSj4yoesQRfVAhLCeqgdW4LayiAjG6coLCQ==
X-Received: by 2002:a17:903:1a70:b0:234:cb4a:bc48 with SMTP id d9443c01a7336-23ac462442bmr4064115ad.31.1750961925724;
        Thu, 26 Jun 2025 11:18:45 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23abe4424e0sm3538515ad.240.2025.06.26.11.18.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 11:18:44 -0700 (PDT)
Message-ID: <cab5daaf-bafb-4df3-9e44-1d0e6dda0341@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 11:18:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath12k: Add support for transmit
 histogram stats
To: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Roopni Devanathan <quic_rdevanat@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Saleemuddin Shaik <quic_saleemud@quicinc.com>
References: <20250617112139.865788-1-quic_rdevanat@quicinc.com>
 <6b32c871-0d18-4cdd-e097-97fc2e7bdf28@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <6b32c871-0d18-4cdd-e097-97fc2e7bdf28@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5a_3Ucb1maTWx6u8FW3BW2F7ZGLP9Ln2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDE1NSBTYWx0ZWRfX5sbb8l/oqjZ8
 jEv0UrKlX28sUkHqQwPGajbXDBj0Cbx5cC4NaAWiy0O/bEWzADMg0aKfBRxzXvH5aqFEwm4Esyg
 021gQV/wjUSrXVZTh3Tu7DgkXiMvasgthiMZw7bMXN+QkxdtI3PBGvqYvPHQe4Eq2AOG6g/1odS
 7i9VZyl99rVo964AwHBB6rU83u/cBghtxsJ8gtbfK+DgsmTWitQbTME6OkEsVcO06tdek8gxKVy
 xUfh20xSiWNKRE1wN0Kg94sKQQAm0ipTbG2666hklZu9oczZRuLOHfeU9yDBFP0sZoSd5k1oHIa
 MIAQy1asDH+DVf4rAdvKWsI1de5cUlRIIaLOwTs9zLES1LhCtme+zCb7ARwZcZzYXc50Y5z0mRk
 Hp4T3ttRlNCn2I4J8aY5LP9DNyhncE20usACw0RWuCeIUQ4b5n07z7pzww39EuUk7s1VAURI
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685d8f07 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=KVw8lbOMMick5z-GlrIA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 5a_3Ucb1maTWx6u8FW3BW2F7ZGLP9Ln2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_111848_103713_4EDF7F8C 
X-CRM114-Status: GOOD (  21.36  )
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

On 6/26/2025 10:20 AM, Vasanthakumar Thiagarajan wrote:
> 
> 
> On 6/17/2025 4:51 PM, Roopni Devanathan wrote:
>> From: Saleemuddin Shaik <quic_saleemud@quicinc.com>
>>
>> Add support for transmit histogram stats under HTT stats type 9. These
>> stats give information about drop count, MCS drop rate, histogram
>> count, etc.
>>
>> Note: WCN7850 firmware version -
>> WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3 does not support tag
>> HTT_STATS_TX_PDEV_HISTOGRAM_STATS_TAG(144), currently.
>>
>> Sample output:
>> echo 9 > /sys/kernel/debug/ath12k/pci-0000\:58\:00.0/mac0/htt_stats_type
>> cat /sys/kernel/debug/ath12k/pci-0000\:58\:00.0/mac0/htt_stats
>> ...
>> low_latency_rate_cnt =  0
>> su_burst_rate_drop_cnt = 0
>> su_burst_rate_drop_fail_cnt = 0
>> rate_retry_mcs_drop_cnt = 0
>>
>> PER_HISTOGRAM_STATS
>> mcs_drop_rate =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0, 14:0, 15:0
>> per_histogram_count =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0,
>> 11:0, 12:0, 13:0, 14:0, 15:0, 16:0, 17:0, 18:0, 19:0, 20:0,
>> 21:0, 22:0, 23:0, 24:0, 25:0, 26:0, 27:0, 28:0, 29:0, 30:0,
>> 31:0, 32:0, 33:0, 34:0, 35:0, 36:0, 37:0, 38:0, 39:0, 40:0,
>> 41:0, 42:0, 43:0, 44:0, 45:0, 46:0, 47:0, 48:0, 49:0, 50:0,
>> 51:0, 52:0, 53:0, 54:0, 55:0, 56:0, 57:0, 58:0, 59:0, 60:0,
>> 61:0, 62:0, 63:0, 64:0, 65:0, 66:0, 67:0, 68:0, 69:0, 70:0,
>> 71:0, 72:0, 73:0, 74:0, 75:0, 76:0, 77:0, 78:0, 79:0, 80:0,
>> 81:0, 82:0, 83:0, 84:0, 85:0, 86:0, 87:0, 88:0, 89:0, 90:0,
>> 91:0, 92:0, 93:0, 94:0, 95:0, 96:0, 97:0, 98:0, 99:0, 100:0
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Saleemuddin Shaik <quic_saleemud@quicinc.com>
>> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
>> ---
>> v2:
>>   - Removed 'inline' keyword from function definition to resolve wifibot
>>     error.
>> ---
>>   .../wireless/ath/ath12k/debugfs_htt_stats.c   | 36 ++++++++++++++++++-
>>   .../wireless/ath/ath12k/debugfs_htt_stats.h   | 16 +++++++++
>>   2 files changed, 51 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
>> index aeaf970339d4..0da6c91dd314 100644
>> --- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
>> +++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
>> @@ -4720,7 +4720,38 @@ ath12k_htt_print_tx_pdev_rate_stats_tlv(const void *tag_buf, u16 tag_len,
>>   	len += print_array_to_buf(buf, len, "tx_pream", htt_stats_buf->tx_pream,
>>   				  ATH12K_HTT_TX_PDEV_STATS_NUM_PREAMBLE_TYPES, "\n");
>>   	len += print_array_to_buf(buf, len, "tx_dcm", htt_stats_buf->tx_dcm,
>> -				  ATH12K_HTT_TX_PDEV_STATS_NUM_DCM_COUNTERS, "\n");
>> +				  ATH12K_HTT_TX_PDEV_STATS_NUM_DCM_COUNTERS, "\n\n");
>> +
>> +	stats_req->buf_len = len;
>> +}
>> +
>> +static void
>> +ath12k_htt_print_histogram_stats_tlv(const void *tag_buf, u16 tag_len,
>> +				     struct debug_htt_stats_req *stats_req)
>> +{
>> +	const struct ath12k_htt_tx_histogram_stats_tlv *stats_buf = tag_buf;
>> +	u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
>> +	u32 len = stats_req->buf_len;
>> +	u8 *buf = stats_req->buf;
>> +
>> +	if (tag_len < sizeof(*stats_buf))
>> +		return;
>> +
>> +	len += scnprintf(buf + len, buf_len - len, "low_latency_rate_cnt =  %u\n",
>> +			 le32_to_cpu(stats_buf->low_latency_rate_cnt));
>> +	len += scnprintf(buf + len, buf_len - len, "su_burst_rate_drop_cnt = %u\n",
>> +			 le32_to_cpu(stats_buf->su_burst_rate_drop_cnt));
>> +	len += scnprintf(buf + len, buf_len - len, "su_burst_rate_drop_fail_cnt = %u\n",
>> +			 le32_to_cpu(stats_buf->su_burst_rate_drop_fail_cnt));
>> +	len += scnprintf(buf + len, buf_len - len, "rate_retry_mcs_drop_cnt = %u\n",
>> +			 le32_to_cpu(stats_buf->rate_retry_mcs_drop_cnt));
>> +
>> +	len += scnprintf(buf + len, buf_len - len, "\nPER_HISTOGRAM_STATS\n");
>> +	len += print_array_to_buf(buf, len, "mcs_drop_rate", stats_buf->mcs_drop_rate,
>> +				  ATH12K_HTT_TX_PDEV_STATS_NUM_MCS_DROP_COUNTERS, "\n");
>> +	len += print_array_to_buf(buf, len, "per_histogram_count",
>> +				  stats_buf->per_histogram_cnt,
>> +				  ATH12K_HTT_TX_PDEV_STATS_NUM_PER_COUNTERS, "\n\n");
>>   
>>   	stats_req->buf_len = len;
>>   }
>> @@ -5277,6 +5308,9 @@ static int ath12k_dbg_htt_ext_stats_parse(struct ath12k_base *ab,
>>   	case HTT_STATS_TX_PDEV_RATE_STATS_TAG:
>>   		ath12k_htt_print_tx_pdev_rate_stats_tlv(tag_buf, len, stats_req);
>>   		break;
>> +	case HTT_STATS_TX_PDEV_HISTOGRAM_STATS_TAG:
>> +		ath12k_htt_print_histogram_stats_tlv(tag_buf, len, stats_req);
>> +		break;
>>   	case HTT_STATS_RX_PDEV_RATE_STATS_TAG:
>>   		ath12k_htt_print_rx_pdev_rate_stats_tlv(tag_buf, len, stats_req);
>>   		break;
>> diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
>> index c2a02cf8a38b..5fc5d8c00355 100644
>> --- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
>> +++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
>> @@ -237,6 +237,7 @@ enum ath12k_dbg_htt_tlv_tag {
>>   	HTT_STATS_TX_SELFGEN_BE_ERR_STATS_TAG		= 137,
>>   	HTT_STATS_TX_SELFGEN_BE_STATS_TAG		= 138,
>>   	HTT_STATS_TX_SELFGEN_BE_SCHED_STATUS_STATS_TAG	= 139,
>> +	HTT_STATS_TX_PDEV_HISTOGRAM_STATS_TAG		= 144,
>>   	HTT_STATS_TXBF_OFDMA_AX_NDPA_STATS_TAG		= 147,
>>   	HTT_STATS_TXBF_OFDMA_AX_NDP_STATS_TAG		= 148,
>>   	HTT_STATS_TXBF_OFDMA_AX_BRP_STATS_TAG		= 149,
>> @@ -418,6 +419,12 @@ struct ath12k_htt_tx_pdev_mu_ppdu_dist_stats_tlv {
>>   #define ATH12K_HTT_TX_PDEV_STATS_NUM_EXTRA_MCS_COUNTERS   2
>>   #define ATH12K_HTT_TX_PDEV_STATS_NUM_EXTRA2_MCS_COUNTERS  2
>>   #define ATH12K_HTT_TX_PDEV_STATS_NUM_11AX_TRIGGER_TYPES   6
>> +#define ATH12K_HTT_TX_PDEV_STATS_NUM_PER_COUNTERS	  101
>> +
>> +#define ATH12K_HTT_TX_PDEV_STATS_NUM_MCS_DROP_COUNTERS \
>> +	(ATH12K_HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS + \
>> +	 ATH12K_HTT_TX_PDEV_STATS_NUM_EXTRA_MCS_COUNTERS + \
>> +	 ATH12K_HTT_TX_PDEV_STATS_NUM_EXTRA2_MCS_COUNTERS)
>>   
>>   struct ath12k_htt_tx_pdev_rate_stats_tlv {
>>   	__le32 mac_id_word;
>> @@ -472,6 +479,15 @@ struct ath12k_htt_tx_pdev_rate_stats_tlv {
>>   	__le32 tx_bw_320mhz;
>>   };
>>   
>> +struct ath12k_htt_tx_histogram_stats_tlv {
>> +	__le32 rate_retry_mcs_drop_cnt;
>> +	__le32 mcs_drop_rate[ATH12K_HTT_TX_PDEV_STATS_NUM_MCS_DROP_COUNTERS];
>> +	__le32 per_histogram_cnt[ATH12K_HTT_TX_PDEV_STATS_NUM_PER_COUNTERS];
>> +	__le32 low_latency_rate_cnt;
>> +	__le32 su_burst_rate_drop_cnt;
>> +	__le32 su_burst_rate_drop_fail_cnt;
>> +};
> 
> Since this strcuture represents the message format used between host and firmware, pls add 
> __packed annotation even though it may not have any effect in this case.

looks like I missed this in a few other structs as well, at least:
ath12k_htt_tx_pdev_rate_stats_tlv
ath12k_htt_rx_pdev_rate_ext_stats_tlv

perhaps i'll take this as-is and then have another patch that adds __packed to
all _tlv structs that are missing it?

/jeff


