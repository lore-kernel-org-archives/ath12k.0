Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81EC9D68BD7
	for <ath12k@archiver.kernel.org>; Fri, 15 Nov 2024 21:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eanNcV4f2Cug1pdblOpiQtL0P1PI9AUtq8WWXzuiHyI=; b=VH97MdXCX28sDICW8yAasEKYgI
	xDpqa8jGpfp+m2CWZW6uVieysF1wg+28TkmEYKtVB33FTW9TlvidGIUv/mv8Ng5milEbb6vfMeEr7
	oe04woe4s11punXfdF5Iao55X2So08WAJSrow4cj9skFzYWjCXtN45qffCESQGoXKjFV6J1siGWMM
	s/tLHNqqdAbVJ0YRenMfifsaGyKREFgmU4V7Qg1FWQC5FjrxyMf25vkfQqOXx/Dr35bZ+GQWq5Bqp
	5HP8zfVp54FXGrzDpmy3OVj7BF6o7qo3nEH/9PtgTYejjn3ofF0OriquBovJq+hfp7LzZWSfmRXJI
	suXJn7iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC3gR-000000049Si-19uf
	for ath12k@archiver.kernel.org;
	Fri, 15 Nov 2024 21:16:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC3g5-000000049Pq-3TVV
	for ath12k@lists.infradead.org;
	Fri, 15 Nov 2024 21:16:30 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AFK9090024008;
	Fri, 15 Nov 2024 21:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eanNcV4f2Cug1pdblOpiQtL0P1PI9AUtq8WWXzuiHyI=; b=aCenDRq0l/n7gKVA
	xtYESQdiodWHC65tlF6/74IN+GgOqosWdz6N1T9nThi6sr6Y63SsvBe8BlDhtkwQ
	VfKqt8A3tC2IUgKzUFTcDX5G/Ec2z0c6grjlfz38hplneP+egJ6UbN1/ltj2r9cE
	fRXp2kwNUTGpEj03/wcmmcnVBSAgbg9mvjfuBTZd/GRA3HfFNxoMl2veQMPVaMHw
	fn5ejzWKnMP8p8cdYo6n710nW+Y0BH2VW66/rBaunA5JpKvUwtFkT2VlgLA0VCuO
	3aFiiRa0KjujiK7mw/nDwMQfi/EELQXw7R1jsdLBRdC2mTGd1UDhmbrJWZFHiwHF
	u5mkCg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42x3achuxv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 21:16:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AFLGRpj011503
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 21:16:27 GMT
Received: from [10.111.176.23] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 15 Nov
 2024 13:16:27 -0800
Message-ID: <13d6d7a6-5073-4dc0-b229-c9b4365756d1@quicinc.com>
Date: Fri, 15 Nov 2024 13:16:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] wifi: ath12k: Support phy counter and TPC stats
To: Roopni Devanathan <quic_rdevanat@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Dinesh Karthikeyan
	<quic_dinek@quicinc.com>
References: <20241115062854.1919672-1-quic_rdevanat@quicinc.com>
 <20241115062854.1919672-3-quic_rdevanat@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241115062854.1919672-3-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: M-0itLfGD0zBi58Y4P-Tl77HdcCH37Yp
X-Proofpoint-ORIG-GUID: M-0itLfGD0zBi58Y4P-Tl77HdcCH37Yp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411150179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_131629_984000_1B2527C0 
X-CRM114-Status: GOOD (  12.76  )
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

On 11/14/2024 10:28 PM, Roopni Devanathan wrote:
> From: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> 
> Add support to request counters and Transmission Power Control
> (TPC) stats through HTT stats type 37. These stats give
> information about counters like received packet count, CRC pass
> count, error count, transmit abort count, etc., about counter reset
> like reset cause, channel frequency, number and mode, channel flags,
> etc., about TPC like transmit power scale, maximum transmit power,
> gain cap, EIRP, etc.
> 
> Note: MCC firmware version -
> WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4 does not
> support HTT stats type 37, i.e., the firmware does not respond to the
> command requesting stats.
> 
> Sample output:
> -------------
> echo 37 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
> HTT_PHY_STATS_TLV:
> bdf_nf_chain[0] = -92
> bdf_nf_chain[1] = -94
> bdf_nf_chain[2] = -94
> bdf_nf_chain[3] = -93
> .....
> 
> HTT_PHY_COUNTERS_TLV:
> rx_ofdma_timing_err_cnt = 18068
> rx_cck_fail_cnt = 0
> mactx_abort_cnt = 2612
> macrx_abort_cnt = 0
> .....
> 
> HTT_PHY_RESET_STATS_TLV:
> pdev_id = 0
> chan_mhz = 0
> chan_band_center_freq1 = 0
> chan_band_center_freq2 = 0
> .....
> 
> HTT_PHY_RESET_COUNTERS_TLV:
> pdev_id = 0
> cf_active_low_fail_cnt = 0
> cf_active_low_pass_cnt = 0
> phy_off_through_vreg_cnt = 0
> .....
> 
> HTT_PHY_TPC_STATS_TLV:
> pdev_id = 0
> tx_power_scale = 0
> tx_power_scale_db = 0
> min_negative_tx_power = 0
> .....
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

> +struct ath12k_htt_phy_stats_tlv {
> +	a_sle32 nf_chain[ATH12K_HTT_STATS_MAX_CHAINS];
> +	__le32 false_radar_cnt;
> +	__le32 radar_cs_cnt;
> +	a_sle32 ani_level;
> +	__le32 fw_run_time;
> +	a_sle32 runtime_nf_chain[ATH12K_HTT_STATS_MAX_CHAINS];
> +} __packed;

it just occurred to me that these structs are actually misnamed.
these represent the payload of the tlv, not the actual tlv.
Kalle, as a future cleanup I suggest that we either rename these or modify
them plus the parsing code such that the TLV header is included in the struct.

I have a hunch that in order to support future firmware that extends these
structs that we'll actually want the tlv header so that handler code will have
the length and then know what version of the struct is present.




