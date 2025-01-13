Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2EC8E7719F
	for <ath12k@archiver.kernel.org>; Mon, 13 Jan 2025 08:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TiSVq6vsAjU/Q5LI/ww3idU0nznsZ12WrbEFhTwKU9s=; b=IMdMMLlPW4rtQpvOLH5EykaVFV
	VFUWXrzhHT3cJmuEkNgiu626+Jo6Igwl4Lb8y1QSR1S/LtyViHi1rSDSidCXhhSVyDfWzP7vift0e
	9KDa3zlrLeZvMGX4ViZWdsQLkCRvFVfp6k5E3d6Y6i3VysECTHTvM2dIiru/TRWYoyBfpUDezQvFX
	NzXUKKv19AY22VxblIx0eqEmgRviy4q+px1dKkwd70gyMyhvMDaKGOW5aijqFI2q8Esk3qLxUJURl
	0L3apwRPXoSUhIfeOcgdHOrDBHr248Nar0T8OZhXuoJwE2uDKsOYL0rtjLPpggTGouQv+DvBbjqMH
	ZMazPgyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXFgP-00000004MvT-249m
	for ath12k@archiver.kernel.org;
	Mon, 13 Jan 2025 08:20:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXFgM-00000004MuD-3zgX
	for ath12k@lists.infradead.org;
	Mon, 13 Jan 2025 08:20:24 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D7Mfdx019858;
	Mon, 13 Jan 2025 08:20:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TiSVq6vsAjU/Q5LI/ww3idU0nznsZ12WrbEFhTwKU9s=; b=PNvoNLtKGe/nEXKy
	cHLASobPtnvN2GyQ7UgmF3vCazhngmhv2t7gKpVYbrT0JaW7fGeT48ElAYu0MOHb
	ws4iF2YPrGDGDAiYqqCXt6cuZutXJrgtkW/jVtVxnqrULZgn1mKsynYZAi/xWUzn
	XFNwBT1FwmEawn2FQDLQMvA0ToA2myE54q+3Z103D6vPoSWhuYo5kSJOP4sA8DiQ
	DFUnsS5sfio7dlB4D2motOkx9OF9IXIJvIhSnr9CbnqXGo9M2j0A62G02odpS4HQ
	7RiRW3s+j5HK9s1BWntmRERdefUF/IMpx4pDSc5USK/Dq4nLeQnu9bk2zs/mPmh5
	rWhIIg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 444xcxr4cu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 08:20:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50D8KJw3010721
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 08:20:19 GMT
Received: from [10.152.202.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 Jan
 2025 00:20:17 -0800
Message-ID: <1e1b5159-3f4f-4876-9e31-11a1f5b3584c@quicinc.com>
Date: Mon, 13 Jan 2025 13:50:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] wifi: ath12k: Add API to print s8 arrays in HTT
 stats
To: Roopni Devanathan <quic_rdevanat@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250113071144.3397293-1-quic_rdevanat@quicinc.com>
 <20250113071144.3397293-5-quic_rdevanat@quicinc.com>
Content-Language: en-US
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
In-Reply-To: <20250113071144.3397293-5-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Zm5Tz-mIyKWo4jbRv0PdfqXbKlLaEc_G
X-Proofpoint-GUID: Zm5Tz-mIyKWo4jbRv0PdfqXbKlLaEc_G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=861
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_002023_122539_A128C140 
X-CRM114-Status: GOOD (  14.27  )
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

On 1/13/25 12:41, Roopni Devanathan wrote:
> Currently, print_array_to_buf() is used to print arrays to HTT
> stats buffer. This function supports printing only arrays with
> 32-bit unsigned integers. Add print_array_to_buf_s8(), which
> implements print_array_to_buf()'s functionality to all the
> arrays with 8-bit signed integers.
> 
> Sample output:
> rx_ul_mumimo_target_rssi: user_0  =  0:-128, 1:-128, 2:-128, 3:-128
> rx_ul_mumimo_target_rssi: user_1  =  0:-128, 1:-128, 2:-128, 3:-128
> rx_ul_mumimo_target_rssi: user_2  =  0:-128, 1:-128, 2:-128, 3:-128
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
> ---
>   .../wireless/ath/ath12k/debugfs_htt_stats.c   | 28 +++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> index 77c51269669f..92935134735a 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> +++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> @@ -48,6 +48,34 @@ print_array_to_buf(u8 *buf, u32 offset, const char *header,
>   					footer);
>   }
>   
> +static u32
> +print_array_to_buf_s8(u8 *buf, u32 offset, const char *header, u32 stats_index,
> +		      const s8 *array, u32 array_len, const char *footer)


Who is the user of this new function? I don't see it called from
anywhere. At least have 1 caller to it in this patch?

Or else this patch fails to compile with W=1

drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:52:1: error: 'print_array_to_buf_s8' defined but not used [-Werror=unused-function]
52 | print_array_to_buf_s8(u8 *buf, u32 offset, const char *header, u32 stats_index,
| ^~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

-- 
Aditya

