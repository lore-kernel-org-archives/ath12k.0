Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE9AC3DA5D
	for <ath12k@archiver.kernel.org>; Fri, 19 Jul 2024 23:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M1wPQSMK1/R4Y/tnTVlEXZn5wtI3Wg5xGFEFrehCtLg=; b=Y9mrSHpGl2RpHXzPSpzDEQRCNC
	V6GetdpzgA9y/3kp7+S2HWD/nYdZeyTZKYbCQswtGpIvqU61hE6tc7dFBn6JdsR/VKjchwy/ELsVN
	qHGMOmLiDUkazSN72zfPk8iIRNTThyVK25pZwMCa8z0loo8b+fBLMARrQi8vIn6eQzWM9DKcwAMB+
	bs5LlRnTpPEYSt+kjBhpg22txV/kcgo3fg940NIK9UNbVgR3+pWghKYYQVmzs3z9UlUl/ojpv3Uhv
	3OCEcadcewxgDI/7F9zOjTsNA2PIseXSj8ZiOs//SRK3xWjHvPL5QVdyO+SnWUO9nY3Is/sR/3dyw
	n1Z6XceQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUx7F-000000040lg-2JIm
	for ath12k@archiver.kernel.org;
	Fri, 19 Jul 2024 23:34:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUx7C-000000040kd-1Wmt
	for ath12k@lists.infradead.org;
	Fri, 19 Jul 2024 23:34:20 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46JCaK5X018986;
	Fri, 19 Jul 2024 23:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M1wPQSMK1/R4Y/tnTVlEXZn5wtI3Wg5xGFEFrehCtLg=; b=gsRoDe20tQOQH6TI
	Xri1qO7RWx5zbnYNnFfVMXZ5kkz/8TZUKLAIg0tdvxA7P2+hkcV3cWQrug4JWniH
	P/aAR82W78h+8v+nR/B+aX5H7q9lfd6ZSloVI5v5NiQWwaQr4mJgi8CdgST4CwaT
	8AfXNYrVA1fxIML4mzz+2oNI/c1GfUC5nOqxLjScds6UrS8W5s/CT1zkysq4Wl/7
	D2Xsx5EFD3UqGOj/ItiEUgLNjCcBdZgQ5lQ7cauSkim90kUsRS9BN3BXItuTn/GF
	5KfNZ4JPn/Ome378qFMnaAwcefLs0g69H9Enzofv8yjb2nzR0XOdPGxTEgS+nl3o
	90xq/A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40fe352m72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jul 2024 23:34:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46JNYFSN002691
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jul 2024 23:34:15 GMT
Received: from [10.48.244.127] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 19 Jul
 2024 16:34:15 -0700
Message-ID: <90b0db09-16ea-4d70-a1c0-01ea81eb3406@quicinc.com>
Date: Fri, 19 Jul 2024 16:34:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] wifi: ath12k: Dump PDEV receive rate HTT stats
Content-Language: en-US
To: Lingbo Kong <quic_lingbok@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240718064659.109893-1-quic_lingbok@quicinc.com>
 <20240718064659.109893-3-quic_lingbok@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240718064659.109893-3-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 969q-Z_FYJg7-E6NOUSd9n0c8If3JvNg
X-Proofpoint-ORIG-GUID: 969q-Z_FYJg7-E6NOUSd9n0c8If3JvNg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-19_09,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=638 clxscore=1015
 mlxscore=0 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2407190174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_163418_571247_855ADB8B 
X-CRM114-Status: UNSURE (   6.48  )
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

On 7/17/2024 11:46 PM, Lingbo Kong wrote:
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
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



