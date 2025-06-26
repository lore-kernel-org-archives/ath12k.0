Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C811C7EE31
	for <ath12k@archiver.kernel.org>; Thu, 26 Jun 2025 17:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jggvEgShZvAn4Cqf9psRUvQ3PIp0OoDumXSKGW91EpY=; b=At1fZjHU8io6d/K63MhDFFhSd9
	E9C3UPzGpb0/B/2bA568SV5O2EKAaie1ohoan9pYcdILm1x+fBX1jWt+s1dhnbqIhkSVvVr8OpQcf
	UJ6CedK1ef3vo7uX6fKJFd6Bar8HIB1r7ehWxYjzdTtoBnbIZzFgsrIWRI5GMKcA6/01TtfcSMDx8
	v8vAbo+xSAmM4iS1HPejUyGGz0X/GdnILpdTMi9SJ5dOzjSBZH/5LFYQXonoqxrfxa+4yBgNkjgtf
	Yfmk+N1iHmQS+SfiecMlNe+s4qkbmE1FpVicV7QHrxKNu06wQB+0oVF3HlwK5j2kPB5dqZSNIezvw
	yri59GGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUqGu-0000000CMQR-0hHq;
	Thu, 26 Jun 2025 17:20:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUqGr-0000000CMQ6-1eB3
	for ath12k@lists.infradead.org;
	Thu, 26 Jun 2025 17:20:22 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9N1o4018610
	for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 17:20:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jggvEgShZvAn4Cqf9psRUvQ3PIp0OoDumXSKGW91EpY=; b=mIRHNqraNfzYkw9y
	hipHivzgbFIQmR+d/0WzOeg/3Ka2aAID5ZYudGMd3QFe38mVp9aY2SWnQPMEYzjd
	yo9s7iuu9CrIenkNZnpITOa7LgIj0EML7SlC9k+8ha4A0R3S4q/PAx27F5pvd3hc
	23e1iGSOkp3HPW246J3mVEuLqw0/2X8I9Vx5hbh1TVXSOkgHfWkfZBeJqdke592f
	oT1h3O97PAOm49CLxGgB8fi4WG1cCbOFlzb+FooPo13vUEZ/MVzIwFZWQOPJDzSF
	yMiMI56vHxrEMSWiTtAxqCSpNUZ9p2mAZ7tZAH5AZuHvws2OaoPLnj+SDtGD4Bqk
	zr1CQw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26efec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 17:20:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-31327b2f8e4so1138304a91.1
        for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 10:20:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750958420; x=1751563220;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jggvEgShZvAn4Cqf9psRUvQ3PIp0OoDumXSKGW91EpY=;
        b=c2nZMTIJ46buxruTZrD6b5PZsEltoKZzewicGK1q2toMRimnkC+Jpw2brShIBaWDny
         gN2PRKgyZLwNFvTzdrVVJkl0W7tZLNCBxk+mDhzMmL3PyE0+LrWl2/nu8BvzQslyQ5gq
         PYSzyFA0gX6F6yJ3HY9tWjcSNFG0BQkWUrqof3f8gLlAWDbQyqq3FVKrCFyc4A60126n
         HOJIon5dzRKMYTHrXKAUd9zzLS6exXXfbeG9tMy/0lNlZbDAor9SGUwIWwcUTwegptYh
         ZBYmubbaX5yywviHemF5chW7Nczusfy5511STFwA2C1kt9zgmGBL/FdotyYzbr8tlHV5
         C7bA==
X-Forwarded-Encrypted: i=1; AJvYcCWYa7td7847c0/qeiaEvOsP6EoQSqV3hopBjWe/zyuPKdePF5kyw2e+j2RCluTYYtosQrYWDbo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yytq1BqGcYjHy9OXQvLJ3WCn+fEKDAKOMqZXxRwsF51zSoTo5AS
	OxnQqiROvsxdeLx5qts4jWhiNTJRSH6TYoQ0NL3WLbvNmDzugxTkaWJL6JcjLTztsetELXrNWWn
	Ld91HoIv/B3eQamteeHAGyowF5UgH7qrNylcGQ9hBW4N88NyLPZRXSp9wHB2uGvly
X-Gm-Gg: ASbGnctAh5ES9CP0DzDUZFRtSKtrWkBj0UNyCQnNWnH6Epk5D/VMTi7MaSpRfsLUTJb
	4STuereYGZscttJ7n0LgI/VLXAquLUpgGJfEJJpN2LSDcV0Vsn0KZNtaMuxrNWbyP1VsLIQAlO6
	LKkPXfU5La6KxCGuLAAYEsLdr3ra+I4kIDQu3KaXXhRFyPo9G6j7Sw2cAD5eYBFR/OEVOvmD2FT
	5rA0pWZihrEsUe9x1GM+Yf0vtpDp86JaKsLnL8Vxo5+b9pJS92F9gCjDn1l+9jeSmxFKa7QoXen
	2cTgx2Nd9TrYXHg/A5t60o5VsWXKwhfqt/Asy0KVl2+m+Ts9DFezWTzJehv72iaur9G2pUo=
X-Received: by 2002:a17:90a:e7c5:b0:312:1ae9:1525 with SMTP id 98e67ed59e1d1-315f2618a33mr11268615a91.8.1750958419545;
        Thu, 26 Jun 2025 10:20:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3eHVSMgHc2c7xL29VM30acVIpsENwZIoithz9s6fOc8gnX2qHmSZt/Ved6xEHjnhTvaEj5w==
X-Received: by 2002:a17:90a:e7c5:b0:312:1ae9:1525 with SMTP id 98e67ed59e1d1-315f2618a33mr11268578a91.8.1750958419038;
        Thu, 26 Jun 2025 10:20:19 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.255.122])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c1392241sm295257a91.7.2025.06.26.10.20.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 10:20:18 -0700 (PDT)
Message-ID: <6b32c871-0d18-4cdd-e097-97fc2e7bdf28@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 22:50:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v2] wifi: ath12k: Add support for transmit
 histogram stats
Content-Language: en-US
To: Roopni Devanathan <quic_rdevanat@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Saleemuddin Shaik <quic_saleemud@quicinc.com>
References: <20250617112139.865788-1-quic_rdevanat@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250617112139.865788-1-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDE0NyBTYWx0ZWRfX0UYcvHheJ0uy
 7lV6uiwQ0KOyWJ1X6mAzb+oOfpe6GiEmD2vufbAZ+8lnXkgc/DmtdJMvpSEubt4aw5BJOm5m329
 hCU/5xZGAOBibdepUlsZDjRxS1yEdMrcpyoUic4gvRq/JToaVJkAMGQOYF17NXAc4Z/e8/ff62R
 9wwYuiYuWrM4Ezm2/XcbjggUbdWCS0sWPsmNbiKffq8GRetSLSLvlFb4ixsCmawX6nFy+DVpSmq
 0qPaeYkPActl696QY8EpyOB/Ry1/HdeW93AWuz0KaCHUEaFgqz+CL6vpS3EQOmyyxn9wcpoYLWm
 NNOW/Lt2qrsw/hamSyfX0ZwVjFszyoOzoXTToFEtPB76F1WbmUP76z/vvXc0m1S9acPraw3TOzc
 0N907u7odL3M+Fs1TBEMSWAnKGzNKRu70DklH+qQ6f2pfEq1oE/AqIpEqIrH5dn8b0thoIZi
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685d8154 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=/xG1ZwzdjF5UbGEDupzz2A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=RlH2pxoSYRL9L7z1OqAA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: AtKzI4Z-kuimCBMfPSGyBbRVgq9LNWfp
X-Proofpoint-ORIG-GUID: AtKzI4Z-kuimCBMfPSGyBbRVgq9LNWfp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_102021_439666_8EF83E66 
X-CRM114-Status: GOOD (  21.95  )
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



On 6/17/2025 4:51 PM, Roopni Devanathan wrote:
> From: Saleemuddin Shaik <quic_saleemud@quicinc.com>
> 
> Add support for transmit histogram stats under HTT stats type 9. These
> stats give information about drop count, MCS drop rate, histogram
> count, etc.
> 
> Note: WCN7850 firmware version -
> WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3 does not support tag
> HTT_STATS_TX_PDEV_HISTOGRAM_STATS_TAG(144), currently.
> 
> Sample output:
> echo 9 > /sys/kernel/debug/ath12k/pci-0000\:58\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:58\:00.0/mac0/htt_stats
> ...
> low_latency_rate_cnt =  0
> su_burst_rate_drop_cnt = 0
> su_burst_rate_drop_fail_cnt = 0
> rate_retry_mcs_drop_cnt = 0
> 
> PER_HISTOGRAM_STATS
> mcs_drop_rate =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0, 14:0, 15:0
> per_histogram_count =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0,
> 11:0, 12:0, 13:0, 14:0, 15:0, 16:0, 17:0, 18:0, 19:0, 20:0,
> 21:0, 22:0, 23:0, 24:0, 25:0, 26:0, 27:0, 28:0, 29:0, 30:0,
> 31:0, 32:0, 33:0, 34:0, 35:0, 36:0, 37:0, 38:0, 39:0, 40:0,
> 41:0, 42:0, 43:0, 44:0, 45:0, 46:0, 47:0, 48:0, 49:0, 50:0,
> 51:0, 52:0, 53:0, 54:0, 55:0, 56:0, 57:0, 58:0, 59:0, 60:0,
> 61:0, 62:0, 63:0, 64:0, 65:0, 66:0, 67:0, 68:0, 69:0, 70:0,
> 71:0, 72:0, 73:0, 74:0, 75:0, 76:0, 77:0, 78:0, 79:0, 80:0,
> 81:0, 82:0, 83:0, 84:0, 85:0, 86:0, 87:0, 88:0, 89:0, 90:0,
> 91:0, 92:0, 93:0, 94:0, 95:0, 96:0, 97:0, 98:0, 99:0, 100:0
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Saleemuddin Shaik <quic_saleemud@quicinc.com>
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
> ---
> v2:
>   - Removed 'inline' keyword from function definition to resolve wifibot
>     error.
> ---
>   .../wireless/ath/ath12k/debugfs_htt_stats.c   | 36 ++++++++++++++++++-
>   .../wireless/ath/ath12k/debugfs_htt_stats.h   | 16 +++++++++
>   2 files changed, 51 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> index aeaf970339d4..0da6c91dd314 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> +++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> @@ -4720,7 +4720,38 @@ ath12k_htt_print_tx_pdev_rate_stats_tlv(const void *tag_buf, u16 tag_len,
>   	len += print_array_to_buf(buf, len, "tx_pream", htt_stats_buf->tx_pream,
>   				  ATH12K_HTT_TX_PDEV_STATS_NUM_PREAMBLE_TYPES, "\n");
>   	len += print_array_to_buf(buf, len, "tx_dcm", htt_stats_buf->tx_dcm,
> -				  ATH12K_HTT_TX_PDEV_STATS_NUM_DCM_COUNTERS, "\n");
> +				  ATH12K_HTT_TX_PDEV_STATS_NUM_DCM_COUNTERS, "\n\n");
> +
> +	stats_req->buf_len = len;
> +}
> +
> +static void
> +ath12k_htt_print_histogram_stats_tlv(const void *tag_buf, u16 tag_len,
> +				     struct debug_htt_stats_req *stats_req)
> +{
> +	const struct ath12k_htt_tx_histogram_stats_tlv *stats_buf = tag_buf;
> +	u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
> +	u32 len = stats_req->buf_len;
> +	u8 *buf = stats_req->buf;
> +
> +	if (tag_len < sizeof(*stats_buf))
> +		return;
> +
> +	len += scnprintf(buf + len, buf_len - len, "low_latency_rate_cnt =  %u\n",
> +			 le32_to_cpu(stats_buf->low_latency_rate_cnt));
> +	len += scnprintf(buf + len, buf_len - len, "su_burst_rate_drop_cnt = %u\n",
> +			 le32_to_cpu(stats_buf->su_burst_rate_drop_cnt));
> +	len += scnprintf(buf + len, buf_len - len, "su_burst_rate_drop_fail_cnt = %u\n",
> +			 le32_to_cpu(stats_buf->su_burst_rate_drop_fail_cnt));
> +	len += scnprintf(buf + len, buf_len - len, "rate_retry_mcs_drop_cnt = %u\n",
> +			 le32_to_cpu(stats_buf->rate_retry_mcs_drop_cnt));
> +
> +	len += scnprintf(buf + len, buf_len - len, "\nPER_HISTOGRAM_STATS\n");
> +	len += print_array_to_buf(buf, len, "mcs_drop_rate", stats_buf->mcs_drop_rate,
> +				  ATH12K_HTT_TX_PDEV_STATS_NUM_MCS_DROP_COUNTERS, "\n");
> +	len += print_array_to_buf(buf, len, "per_histogram_count",
> +				  stats_buf->per_histogram_cnt,
> +				  ATH12K_HTT_TX_PDEV_STATS_NUM_PER_COUNTERS, "\n\n");
>   
>   	stats_req->buf_len = len;
>   }
> @@ -5277,6 +5308,9 @@ static int ath12k_dbg_htt_ext_stats_parse(struct ath12k_base *ab,
>   	case HTT_STATS_TX_PDEV_RATE_STATS_TAG:
>   		ath12k_htt_print_tx_pdev_rate_stats_tlv(tag_buf, len, stats_req);
>   		break;
> +	case HTT_STATS_TX_PDEV_HISTOGRAM_STATS_TAG:
> +		ath12k_htt_print_histogram_stats_tlv(tag_buf, len, stats_req);
> +		break;
>   	case HTT_STATS_RX_PDEV_RATE_STATS_TAG:
>   		ath12k_htt_print_rx_pdev_rate_stats_tlv(tag_buf, len, stats_req);
>   		break;
> diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
> index c2a02cf8a38b..5fc5d8c00355 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
> +++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
> @@ -237,6 +237,7 @@ enum ath12k_dbg_htt_tlv_tag {
>   	HTT_STATS_TX_SELFGEN_BE_ERR_STATS_TAG		= 137,
>   	HTT_STATS_TX_SELFGEN_BE_STATS_TAG		= 138,
>   	HTT_STATS_TX_SELFGEN_BE_SCHED_STATUS_STATS_TAG	= 139,
> +	HTT_STATS_TX_PDEV_HISTOGRAM_STATS_TAG		= 144,
>   	HTT_STATS_TXBF_OFDMA_AX_NDPA_STATS_TAG		= 147,
>   	HTT_STATS_TXBF_OFDMA_AX_NDP_STATS_TAG		= 148,
>   	HTT_STATS_TXBF_OFDMA_AX_BRP_STATS_TAG		= 149,
> @@ -418,6 +419,12 @@ struct ath12k_htt_tx_pdev_mu_ppdu_dist_stats_tlv {
>   #define ATH12K_HTT_TX_PDEV_STATS_NUM_EXTRA_MCS_COUNTERS   2
>   #define ATH12K_HTT_TX_PDEV_STATS_NUM_EXTRA2_MCS_COUNTERS  2
>   #define ATH12K_HTT_TX_PDEV_STATS_NUM_11AX_TRIGGER_TYPES   6
> +#define ATH12K_HTT_TX_PDEV_STATS_NUM_PER_COUNTERS	  101
> +
> +#define ATH12K_HTT_TX_PDEV_STATS_NUM_MCS_DROP_COUNTERS \
> +	(ATH12K_HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS + \
> +	 ATH12K_HTT_TX_PDEV_STATS_NUM_EXTRA_MCS_COUNTERS + \
> +	 ATH12K_HTT_TX_PDEV_STATS_NUM_EXTRA2_MCS_COUNTERS)
>   
>   struct ath12k_htt_tx_pdev_rate_stats_tlv {
>   	__le32 mac_id_word;
> @@ -472,6 +479,15 @@ struct ath12k_htt_tx_pdev_rate_stats_tlv {
>   	__le32 tx_bw_320mhz;
>   };
>   
> +struct ath12k_htt_tx_histogram_stats_tlv {
> +	__le32 rate_retry_mcs_drop_cnt;
> +	__le32 mcs_drop_rate[ATH12K_HTT_TX_PDEV_STATS_NUM_MCS_DROP_COUNTERS];
> +	__le32 per_histogram_cnt[ATH12K_HTT_TX_PDEV_STATS_NUM_PER_COUNTERS];
> +	__le32 low_latency_rate_cnt;
> +	__le32 su_burst_rate_drop_cnt;
> +	__le32 su_burst_rate_drop_fail_cnt;
> +};

Since this strcuture represents the message format used between host and firmware, pls add 
__packed annotation even though it may not have any effect in this case.

Vasanth

Vasanth

