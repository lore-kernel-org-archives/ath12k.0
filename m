Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3535D1714B
	for <ath12k@archiver.kernel.org>; Tue, 22 Oct 2024 00:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6WM7Ott1G6v7WRCxJzN5NLSNfN64lKptPUJSvoYiAnY=; b=CDzYNA13Rx6bV+e+dgdT4gcmXr
	YFA9nkmcdqd52nrp9KiBolB4wVsZvZm3nldKS7wVlK0kfLFsFYWp1nuXzPGWIaAHmOIfIpHV/+SRy
	iVfTBaRiQsBHmxStLH/35OadguISen0OKbVnvB9pV/fzM4lZUyJBZkdPKt4WvUSrOb7+LmvZK3QEm
	jWPVDLrvsIV3MzEdfIH38dMx0nmmgwJwGrOV+q10MkLR/foW+a/bEGkhrY4FhoDSc8DVMMHAOnwSc
	pYUyHeiKpZEd3tCr27i1CXmoqyRy3cfYYmBJm9SB2qHDSV+Zm7kVfKwGSDn0fprUCuG/+sFcMie97
	dfaP0qwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t32NM-000000090av-1RMx
	for ath12k@archiver.kernel.org;
	Tue, 22 Oct 2024 00:03:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t32NK-000000090aQ-0SSD
	for ath12k@lists.infradead.org;
	Tue, 22 Oct 2024 00:03:51 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LNGOBC019303;
	Tue, 22 Oct 2024 00:03:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6WM7Ott1G6v7WRCxJzN5NLSNfN64lKptPUJSvoYiAnY=; b=M2jKoMSkxeNVv/Tx
	cTLDFq9+lIsQjTGy3+3mO6ajMQmNHRaRroS6nG+O3iTe6uh/BWyk2qO2FT9G1+gm
	oAlFHMj5j3frWYjbX1Vierj7dyTLK4cwWoSizJmnBFxWWkga0zU3j8lOdLOzHD2W
	jq2qmxhXKhOUlW9aReqRiQtB/mNGqNujdAaPiRrX1Jvg71y7R3WaRg/zFWteq8L2
	TXcLHaYhPfvC7DVESaXZf3FBVf3NQm+TBFq4LZe0l7ihOBGFNIRKIQkZLkLuM1k7
	QRqQLK+cl3v+dFB6r+2b7YS8KpOQHIDrxm0ceJvVI4r18W/hGrGWeHZU6OGT7+hn
	9SHMzA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6tsp987-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 00:03:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49M03fm1018799
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 00:03:41 GMT
Received: from [10.48.242.6] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 21 Oct
 2024 17:03:40 -0700
Message-ID: <08767ff7-f764-473d-a44b-c3c3b1695008@quicinc.com>
Date: Mon, 21 Oct 2024 17:03:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: Fix for out-of bound access error
To: Karol Przybylski <karprzy7@gmail.com>, <kvalo@kernel.org>,
        <jjohnson@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <skhan@linuxfoundation.org>
References: <20241021204814.728090-1-karprzy7@gmail.com>
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20241021204814.728090-1-karprzy7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: t92Cu2D_BIIKJ-HhCGNFxRK1kDKhwOGQ
X-Proofpoint-ORIG-GUID: t92Cu2D_BIIKJ-HhCGNFxRK1kDKhwOGQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 spamscore=0 mlxlogscore=719 phishscore=0 adultscore=0
 mlxscore=0 clxscore=1011 bulkscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410210168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_170350_191576_F41899FF 
X-CRM114-Status: GOOD (  17.28  )
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

On 10/21/2024 1:48 PM, Karol Przybylski wrote:
> Size of array passed to print_array_to_buf_index is decremented by 1

This is not a clear commit message.
Please follow the order normally used in the kernel:
1) describe the current code
2) describe the problem with the current code
3) describe how to fix the code (in imperative voice)

> 
> Discovered in coverity scan, CID 1600742
> ---
> Changes in v2:
> - Code style: added spaces before and after '-'
> - Link to v1: https://lore.kernel.org/all/8734kpq0wo.fsf@kernel.org/
> ---
> 
> Signed-off-by: Karol Przybylski <karprzy7@gmail.com>

SOB needs to be before the first "---"

> ---
>  drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> index 799b865b89e5..8371df570c42 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> +++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> @@ -1590,7 +1590,7 @@ ath12k_htt_print_tx_selfgen_ax_stats_tlv(const void *tag_buf, u16 tag_len,
>  			 le32_to_cpu(htt_stats_buf->ax_mu_mimo_ndp));
>  	len += print_array_to_buf_index(buf, len, "ax_mu_mimo_brpollX_tried = ", 1,
>  					htt_stats_buf->ax_mu_mimo_brpoll,
> -					ATH12K_HTT_TX_NUM_AX_MUMIMO_USER_STATS, "\n");
> +					ATH12K_HTT_TX_NUM_AX_MUMIMO_USER_STATS - 1, "\n");
>  	len += scnprintf(buf + len, buf_len - len, "ax_basic_trigger = %u\n",
>  			 le32_to_cpu(htt_stats_buf->ax_basic_trigger));
>  	len += scnprintf(buf + len, buf_len - len, "ax_ulmumimo_total_trigger = %u\n",

Aren't there more than this one? This also looks suspect:

	len += print_array_to_buf_index(buf, len, "ac_mu_mimo_brpollX_tried = ", 1,
					htt_stats_buf->ac_mu_mimo_brpoll,
					ATH12K_HTT_TX_NUM_AC_MUMIMO_USER_STATS, "\n\n");




