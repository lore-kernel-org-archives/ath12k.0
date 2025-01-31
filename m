Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C308CC02190
	for <ath12k@archiver.kernel.org>; Fri, 31 Jan 2025 05:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6nYM4iGsabj4RzjxcF3/G5Fxi2u0AgZY1uOEusJtmM=; b=NLDiaPBMvurqgYSjR15xMEMLE/
	p6gWH3tKn6NTcJ2bqr7ven+7JJqzFdlicg2ZcUclNhhZIGCq6ia+jvZzuelchvISjdc842QyEcQoc
	Kgx4JzlLFERxemuGIncReNuXgl24DbYkqJjiX4T7mAJHkIK5dpan2hcW+3EqwTM5OYg0YLqrS2ToV
	LfqDAIcfJ2KexL2beBQoLn1DmC8B1jYIzGYGlj6H3y60ARHkb0GKbDw2WJiWA8UXMRhn3Z4i8BwQu
	yH/Nh2X8X7lybFwuPHmUPqwWQ5+KHPh9Yz3V2Qg0rDlrCJ0VONX0rPRoQxuMnUo+tCirJKpXEUXnd
	w5VWMZNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdjER-0000000A0jl-2F0O
	for ath12k@archiver.kernel.org;
	Fri, 31 Jan 2025 05:06:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdjEP-0000000A0jS-2WZv
	for ath12k@lists.infradead.org;
	Fri, 31 Jan 2025 05:06:18 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UJ1mCf003976;
	Fri, 31 Jan 2025 05:06:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z6nYM4iGsabj4RzjxcF3/G5Fxi2u0AgZY1uOEusJtmM=; b=SVft8gSkSkQJtpn5
	/HJesM+pcA4kCs4YUFY4m3b5H1mvU3YI/AA7Pbj51WvJhqMI4aeTi0sxiQ75h6WH
	32akKMPYs6jTdNwAGqxAU6wPoavZQxW4WJ6tfpFzrC1LrHwLWqopVDdzmlL5X5Dm
	bSofbb+zqeUspchxpq4hvVunD/bI+1mw7d7fYUMOUuHN9k0+J3h6OM6C8ZFZr/2k
	CQ8sUAYj0qQzy0/VfvADYaNXPEyXomHTqdWY+4CDnyb+mQd8PLqR5O/n8gwH4Ym2
	IbugBeLy9Vl1fvH0gcnPbIoWzB9UF31WAUL2GnWoqBSWNzD9rG4syo5Q24FFLbTI
	R1prpg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44gf7j8ypd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jan 2025 05:06:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50V56FJT009378
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jan 2025 05:06:16 GMT
Received: from [10.216.47.244] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 30 Jan
 2025 21:06:14 -0800
Message-ID: <4704d8c3-d472-4fd3-b437-27a44abb9e82@quicinc.com>
Date: Fri, 31 Jan 2025 10:36:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] wifi: ath12k: Dump PDEV receive rate HTT stats
To: Lingbo Kong <quic_lingbok@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250113071758.19589-1-quic_lingbok@quicinc.com>
 <20250113071758.19589-3-quic_lingbok@quicinc.com>
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
Content-Language: en-US
In-Reply-To: <20250113071758.19589-3-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: G8Kp8xn5p1FHfvj-Zcg79iKfsJkrwDpv
X-Proofpoint-GUID: G8Kp8xn5p1FHfvj-Zcg79iKfsJkrwDpv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_01,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 mlxscore=0
 mlxlogscore=703 spamscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2501310034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_210617_656382_2B4EEDB2 
X-CRM114-Status: UNSURE (   5.69  )
X-CRM114-Notice: Please train this message.
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

On 1/13/25 12:47, Lingbo Kong wrote:
> Support to dump PDEV receive rate stats through HTT debugfs stats type 10.
> 
> Sample output:
> -----------------
> echo 10 > /sys/kernel/debug/ath12k/pci-0000\:03\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:03\:00.0/mac0/htt_stats
> HTT_RX_PDEV_RATE_STATS_TLV:
> mac_id = 0
> nsts = 0
> rx_ldpc = 96
> rts_cnt = 0
> rssi_mgmt = 4294967240
> rssi_data = 4294967250
> rssi_comb = 4294967239
> rssi_in_dbm = -46
> rx_evm_nss_count = 0
> rx_evm_pilot_count = 0
> rx_11ax_su_ext = 0
> rx_11ac_mumimo = 0
> rx_11ax_mumimo = 0
> rx_11ax_ofdma = 0
> txbf = 0
> rx_su_ndpa = 0
> rx_mu_ndpa = 0
> rx_br_poll = 0
> rx_active_dur_us_low = 1000106
> rx_active_dur_us_high = 0
> rx_11ax_ul_ofdma = 0
> ul_ofdma_rx_stbc = 0
> ul_ofdma_rx_ldpc = 0
> per_chain_rssi_pkt_type = 0x88
> rx_nss =  0:40, 1:56, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0
> rx_dcm =  0:0, 1:0, 2:0, 3:0, 4:0
> rx_stbc =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0
> rx_bw =  0:1175, 1:0, 2:0, 3:0
> rx_pream =  0:435, 1:644, 2:0, 3:0, 4:96, 5:0, 6:0
> rx_11ax_su_txbf_mcs =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0
> rx_11ax_mu_txbf_mcs =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0
> rx_legacy_cck_rate =  0:641, 1:0, 2:3, 3:0
> rx_legacy_ofdm_rate =  0:267, 1:0, 2:72, 3:0, 4:96, 5:0, 6:0, 7:0
> ul_ofdma_rx_mcs =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0
> ul_ofdma_rx_nss =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0
> ul_ofdma_rx_bw =  0:0, 1:0, 2:0, 3:0
> rx_ulofdma_non_data_ppdu =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0
> rx_ulofdma_data_ppdu =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0
> rx_ulofdma_mpdu_ok =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0
> rx_ulofdma_mpdu_fail =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0
> rx_ulofdma_non_data_nusers =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0
> rx_ulofdma_data_nusers =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0
> rx_11ax_dl_ofdma_mcs =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0
> rx_11ax_dl_ofdma_ru =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0
> rx_ulmumimo_non_data_ppdu =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0
> rx_ulmumimo_data_ppdu =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0
> rx_ulmumimo_mpdu_ok =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0
> rx_ulmumimo_mpdu_fail =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0
> rx_mcs =  0:0, 1:0, 2:0, 3:0, 4:28, 5:8, 6:37, 7:21, 8:2, 9:0, 10:0, 11:0, 12:0, 13:0
> pilot_evm_db[0] = 0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0, 14:0, 15:0
> pilot_evm_db[1] = 0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0, 14:0, 15:0
> pilot_evm_db[2] = 0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0, 14:0, 15:0
> pilot_evm_db[3] = 0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0, 14:0, 15:0
> pilot_evm_db[4] = 0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0, 14:0, 15:0
> pilot_evm_db[5] = 0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0, 14:0, 15:0
> pilot_evm_db[6] = 0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0, 14:0, 15:0
> pilot_evm_db[7] = 0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0, 14:0, 15:0
> pilot_evm_db_mean = 0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0
> rssi_chain_in_db[0] =  0: 196, 1: 29, 2: 29, 3: 29
> rssi_chain_in_db[1] =  0: 196, 1: 29, 2: 29, 3: 29
> rssi_chain_in_db[2] =  0: 128, 1: 128, 2: 128, 3: 128
> rssi_chain_in_db[3] =  0: 128, 1: 128, 2: 128, 3: 128
> rssi_chain_in_db[4] =  0: 128, 1: 128, 2: 128, 3: 128
> rssi_chain_in_db[5] =  0: 128, 1: 128, 2: 128, 3: 128
> rssi_chain_in_db[6] =  0: 128, 1: 128, 2: 128, 3: 128
> rssi_chain_in_db[7] =  0: 128, 1: 128, 2: 128, 3: 128
> rx_gi[0] =  0:0, 1:0, 2:0, 3:0, 4:28, 5:8, 6:37, 7:21, 8:2, 9:0, 10:0, 11:0
> rx_gi[1] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0
> rx_gi[2] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0
> rx_gi[3] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0
> ul_ofdma_rx_gi[0] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0
> ul_ofdma_rx_gi[1] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0
> ul_ofdma_rx_gi[2] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0
> ul_ofdma_rx_gi[3] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0
> rx_ul_fd_rssi: nss[0] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0
> rx_ul_fd_rssi: nss[1] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0
> rx_ul_fd_rssi: nss[2] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0
> rx_ul_fd_rssi: nss[3] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0
> rx_ul_fd_rssi: nss[4] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0
> rx_ul_fd_rssi: nss[5] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0
> rx_ul_fd_rssi: nss[6] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0
> rx_ul_fd_rssi: nss[7] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0
> rx_per_chain_rssi_in_dbm[0] = 0:-60, 1:29, 2:29, 3:29
> rx_per_chain_rssi_in_dbm[1] = 0:-60, 1:29, 2:29, 3:29
> rx_per_chain_rssi_in_dbm[2] = 0:-128, 1:-128, 2:-128, 3:-128
> rx_per_chain_rssi_in_dbm[3] = 0:-128, 1:-128, 2:-128, 3:-128
> rx_per_chain_rssi_in_dbm[4] = 0:-128, 1:-128, 2:-128, 3:-128
> rx_per_chain_rssi_in_dbm[5] = 0:-128, 1:-128, 2:-128, 3:-128
> rx_per_chain_rssi_in_dbm[6] = 0:-128, 1:-128, 2:-128, 3:-128
> rx_per_chain_rssi_in_dbm[7] = 0:-128, 1:-128, 2:-128, 3:-128
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Lingbo Kong<quic_lingbok@quicinc.com>
> ---

Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>


-- 
Aditya

