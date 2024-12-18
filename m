Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C97EE77183
	for <ath12k@archiver.kernel.org>; Wed, 18 Dec 2024 03:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lPkb315wUC1h3VyCTdtP63P7dpCN8Lx4HKs8EyJM/m4=; b=VpFXn3sxV7n6cTZ34BzF8C+oNR
	awB+KpBaj3L2kr7ZuHzdiJmSXhlEXpNB2VaJumZUsPr5DbS/Dl4fPjRi+Z/t5QU5bV80Os6FR5A+5
	4NkZH2rDpbqEAyrlFM/oA88RTALnN2mbFxxqcjgCcVg0+LAAlH1CncBcJ7Jzk1Zhjnymp4D7Oyj3U
	8HN7D4Kbgl87PYIt6MDxjG62f6Bhr/Stgja63MBsudd7CGmEOprYX36xvU+5pdLtKXHMSk1ihNpMN
	EqN11J5ypHB56Wah/7R69eo2/3F1JfvPMmwbsD+HgfJVVUP6N7ttUPkNABHyEUXjY6pqnSG7kV9eD
	DxdVwLvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNlCL-0000000FWCo-1776
	for ath12k@archiver.kernel.org;
	Wed, 18 Dec 2024 03:58:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNlCI-0000000FWCQ-1xkr
	for ath12k@lists.infradead.org;
	Wed, 18 Dec 2024 03:58:07 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHGkiuJ001203;
	Wed, 18 Dec 2024 03:58:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lPkb315wUC1h3VyCTdtP63P7dpCN8Lx4HKs8EyJM/m4=; b=MpIBZPgvs8MgiitM
	5QmNQJf3pT+tcc7r+bRBFAmkMhmDwB6uTPgjjBSL7/Xzsijt+9N4fz56BVSTGOnF
	HQvP546xyvqRxA9c9myMALqFkDgsRHkWmZPoZrJyzKLw4RwygIXK5V0WqN50onbT
	RzBV28/PN7tTt677VwQX166q1iBrbSlifgGXrBD0fy6UQHYOZsmfjQ7HcoG/jpyw
	QfeFEOi3J7+rgamoy9pactM49GB627PZKcAkTnX+WRM09gWBONE8orex+fx/4+/T
	0EWfzB+uaqdxcCM8GSH72jzRXGM4o7uAjfbXUlIzuXLX+2w1p2K2sTTwR1FyPW8c
	r29dLQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43kd4asb4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 03:58:03 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BI3w23Q009692
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 03:58:02 GMT
Received: from [10.152.206.29] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Dec
 2024 19:58:00 -0800
Message-ID: <10c22e95-77ca-4690-a48e-ce93d8d33696@quicinc.com>
Date: Wed, 18 Dec 2024 09:27:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] wifi: ath12k: Support pdev Puncture Stats
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        Rajat Soni
	<quic_rajson@quicinc.com>
References: <20241217055408.1293764-1-quic_rdevanat@quicinc.com>
 <20241217055408.1293764-3-quic_rdevanat@quicinc.com>
 <87ttb2l49a.fsf@kernel.org>
Content-Language: en-US
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
In-Reply-To: <87ttb2l49a.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gJTKZRPmDGs2NqlLwozuGw0QaeZ671_N
X-Proofpoint-GUID: gJTKZRPmDGs2NqlLwozuGw0QaeZ671_N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 mlxscore=0 clxscore=1011 priorityscore=1501 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412180028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_195806_652229_43E04AEE 
X-CRM114-Status: GOOD (  13.98  )
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



On 12/17/2024 8:56 PM, Kalle Valo wrote:
> Roopni Devanathan <quic_rdevanat@quicinc.com> writes:
> 
>> From: Rajat Soni <quic_rajson@quicinc.com>
>>
>> Add support to request pdev puncture stats from firmware through
>> HTT stats type 46. These stats give the count of number of
>> subbands used in different wifi standards.
>>
>> Sample output:
>> -------------
>> echo 46 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
>> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
>> HTT_PDEV_PUNCTURE_STATS_TLV:
>> mac_id = 0
>> tx_ofdm_su_last_used_pattern_mask = 0x00000001
>> tx_ofdm_su_num_subbands_used_cnt_01 = 217
>> tx_ofdm_su_num_subbands_used_cnt_02 = 0
>> tx_ofdm_su_num_subbands_used_cnt_03 = 0
>> .....
>>
>> HTT_PDEV_PUNCTURE_STATS_TLV:
>> mac_id = 0
>> tx_ax_dl_mu_ofdma_last_used_pattern_mask = 0x00000000
>> tx_ax_dl_mu_ofdma_num_subbands_used_cnt_01 = 0
>> tx_ax_dl_mu_ofdma_num_subbands_used_cnt_02 = 0
>> tx_ax_dl_mu_ofdma_num_subbands_used_cnt_03 = 0
>> .....
>>
>> HTT_PDEV_PUNCTURE_STATS_TLV:
>> mac_id = 0
>> tx_be_dl_mu_ofdma_last_used_pattern_mask = 0x00000000
>> tx_be_dl_mu_ofdma_num_subbands_used_cnt_01 = 0
>> tx_be_dl_mu_ofdma_num_subbands_used_cnt_02 = 0
>> tx_be_dl_mu_ofdma_num_subbands_used_cnt_03 = 0
>> .....
>>
>> HTT_PDEV_PUNCTURE_STATS_TLV:
>> mac_id = 0
>> rx_ax_ul_mu_ofdma_last_used_pattern_mask = 0x00000000
>> rx_ax_ul_mu_ofdma_num_subbands_used_cnt_01 = 0
>> rx_ax_ul_mu_ofdma_num_subbands_used_cnt_02 = 0
>> rx_ax_ul_mu_ofdma_num_subbands_used_cnt_03 = 0
>> .....
>>
>> HTT_PDEV_PUNCTURE_STATS_TLV:
>> mac_id = 0
>> rx_be_ul_mu_ofdma_last_used_pattern_mask = 0x00000000
>> rx_be_ul_mu_ofdma_num_subbands_used_cnt_01 = 0
>> rx_be_ul_mu_ofdma_num_subbands_used_cnt_02 = 0
>> rx_be_ul_mu_ofdma_num_subbands_used_cnt_03 = 0
>> .....
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
>>
>> Signed-off-by: Rajat Soni <quic_rajson@quicinc.com>
>> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
> 
> [...]
> 
>> +static const char*
>> +ath12k_htt_get_punct_ppdu_type_str(enum ath12k_htt_stats_ppdu_type ppdu_type,
>> +				   struct debug_htt_stats_req *stats_req)
>> +{
>> +	const char *ppdu_type_str = "unknown";
>> +	u32 len = stats_req->buf_len;
>> +
>> +	switch (ppdu_type) {
>> +	case ATH12K_HTT_STATS_PPDU_TYPE_MODE_SU:
>> +		ppdu_type_str = "su";
>> +		break;
>> +	case ATH12K_HTT_STATS_PPDU_TYPE_DL_MU_MIMO:
>> +		ppdu_type_str = "dl_mu_mimo";
>> +		break;
>> +	case ATH12K_HTT_STATS_PPDU_TYPE_UL_MU_MIMO:
>> +		ppdu_type_str = "ul_mu_mimo";
>> +		break;
>> +	case ATH12K_HTT_STATS_PPDU_TYPE_DL_MU_OFDMA:
>> +		ppdu_type_str = "dl_mu_ofdma";
>> +		break;
>> +	case ATH12K_HTT_STATS_PPDU_TYPE_UL_MU_OFDMA:
>> +		ppdu_type_str = "ul_mu_ofdma";
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +
>> +	stats_req->buf_len = len;
>> +	return ppdu_type_str;
>> +}
> 
> Also here I don't get why the len variable is needed. I would just
> simplify this and the previous function to:
> 
> static const char*
> ath12k_htt_get_punct_ppdu_type_str(enum ath12k_htt_stats_ppdu_type ppdu_type,
> 				   struct debug_htt_stats_req *stats_req)
> {
> 	switch (ppdu_type) {
> 	case ATH12K_HTT_STATS_PPDU_TYPE_MODE_SU:
> 		return "su";
> 	case ATH12K_HTT_STATS_PPDU_TYPE_DL_MU_MIMO:
> 		return "dl_mu_mimo";
> 	case ATH12K_HTT_STATS_PPDU_TYPE_UL_MU_MIMO:
> 		return "ul_mu_mimo";
> 	case ATH12K_HTT_STATS_PPDU_TYPE_DL_MU_OFDMA:
> 		return "dl_mu_ofdma";
> 	case ATH12K_HTT_STATS_PPDU_TYPE_UL_MU_OFDMA:
> 		return "ul_mu_ofdma";
> 	default:
> 		return "unknown";
> 	}
> 

Sure, Kalle. I'll simplify the function definitions and re-spin the next version.

