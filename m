Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3C8C25B75
	for <ath12k@archiver.kernel.org>; Mon,  3 Jun 2024 22:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=57hx5xxbGNwdYJAOiks37N+7/+V3KpL0gHklVMBpCRk=; b=vvUXPHeWlIOxj+UiveQ6s/S6yq
	L8QGo2ItklvnVnStTSvi41xwar3bx103VVnWqzsM3VjHvNPzLcz4FUk181CdOoGtSSQ1fwk0uoMcq
	JR0zWwD8ECEbIkObU/Ucjve5hpi/j2GFJvgx7p1lAAcWmdi8nfzk0SLJ1D0MyeQhQEZ1O91mqT90m
	YQKwB+vV2Jdg8jeRi2lUn/PhTpKtXC1vJGW0jMV8YtnBNO3nr7JRdbqqlt84jJgdFnAIyQ2U0dD0J
	odLhVFhUP9PNAzLRlQ3R6c7+6eDXUQ7O3B+5OvY3krqZZ/27emNvY7AwiIJULJeW+k7SW1g0F37pF
	wuBj6PIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEG9C-00000000UDU-0406
	for ath12k@archiver.kernel.org;
	Mon, 03 Jun 2024 22:27:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEG98-00000000UD7-1G8O
	for ath12k@lists.infradead.org;
	Mon, 03 Jun 2024 22:27:19 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 453DENNi000456;
	Mon, 3 Jun 2024 22:27:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	57hx5xxbGNwdYJAOiks37N+7/+V3KpL0gHklVMBpCRk=; b=XiwhIORcSZpiBmSr
	l/xNTy6jfmJzjeLdvyAAhciPMLJAVr8oDHCNoAij4gxYvkNIhyTjF1neByXVOQ/F
	mu7L+ZwIOidgMUeqhWMehU9k7PjhMvjlGTvLpVH2DSWZXqrZiJEKdfsUoge1zLv0
	CRJS44ANGOq3P0Cw+zEwkcyrJM2l4ElczWh5W/ArGFMdVsR/LjD0EsPEdOqWB60u
	yZXWJiDQmKrJZTMxgw7Ok2KoynRfnOaB+bg/vk8w63UbLkTCaQOVjre5ZUM0EJcZ
	19CRQ5Ng6uoL6oIzDU7eKR6W0iy+suqknH5o9WNRAiazdjBTslvo60FLl3BYxSPH
	htTTxg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw59mxae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 22:27:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 453MRFrC006640
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Jun 2024 22:27:15 GMT
Received: from [10.48.241.139] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Jun 2024
 15:27:15 -0700
Message-ID: <0554a6c5-bb82-4295-adaa-80c130dd13d3@quicinc.com>
Date: Mon, 3 Jun 2024 15:27:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] wifi: ath12k: Dump additional Tx PDEV HTT stats
Content-Language: en-US
To: Ramya Gnanasekar <quic_rgnanase@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240603044214.960261-1-quic_rgnanase@quicinc.com>
 <20240603044214.960261-6-quic_rgnanase@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240603044214.960261-6-quic_rgnanase@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3bmAxzJWgcRKztO4E3bYDqysjIXDzq67
X-Proofpoint-ORIG-GUID: 3bmAxzJWgcRKztO4E3bYDqysjIXDzq67
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_17,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 mlxlogscore=868 bulkscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406030182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_152718_407293_EB9E9613 
X-CRM114-Status: UNSURE (   7.07  )
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

On 6/2/2024 9:42 PM, Ramya Gnanasekar wrote:
> Support to dump additional Tx PDEV stats through HTT stats debugfs.
> Following stats dump are supported:
>         1. PDEV control path stat to dump Tx management frame count
>         2. Tx PDEV SIFS histogram stats
>         3. Tx MU MIMO PPDU stats for 802.11ac, 802.11ax and 802.11be
> 
> Sample Output:
> ---------------
> echo 1 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
> HTT_TX_PDEV_STATS_CMN_TLV:
> mac_id = 0
> comp_delivered = 0
> self_triggers = 13
> ......
> ......
> HTT_TX_PDEV_STATS_CTRL_PATH_TX_STATS:
> fw_tx_mgmt_subtype =  0:1, 1:0, 2:0, 3:0, 4:38, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:1, 12:0, 13:7, 14:0, 15:0,
> 
> HTT_TX_PDEV_STATS_SIFS_HIST_TLV:
> sifs_hist_status =  0:237, 1:185, 2:1, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0,
> 
> HTT_TX_PDEV_AC_MU_PPDU_DISTRIBUTION_STATS:
> ac_mu_mimo_num_seq_posted_nr4 = 0
> ac_mu_mimo_num_ppdu_posted_per_burst_nr4 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0,
> ac_mu_mimo_num_ppdu_completed_per_burst_nr4 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0,
> ac_mu_mimo_num_seq_term_status_nr4 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0,
> 
> ac_mu_mimo_num_seq_posted_nr8 = 0
> ac_mu_mimo_num_ppdu_posted_per_burst_nr8 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0,
> ac_mu_mimo_num_ppdu_completed_per_burst_nr8 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0,
> ac_mu_mimo_num_seq_term_status_nr8 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0,
> 
> HTT_TX_PDEV_AX_MU_PPDU_DISTRIBUTION_STATS:
> ax_mu_mimo_num_seq_posted_nr4 = 0
> ax_mu_mimo_num_ppdu_posted_per_burst_nr4 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0,
> ax_mu_mimo_num_ppdu_completed_per_burst_nr4 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0,
> ax_mu_mimo_num_seq_term_status_nr4 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0,
> 
> ax_mu_mimo_num_seq_posted_nr8 = 0
> ax_mu_mimo_num_ppdu_posted_per_burst_nr8 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0,
> ax_mu_mimo_num_ppdu_completed_per_burst_nr8 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0,
> ax_mu_mimo_num_seq_term_status_nr8 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0,
> 
> HTT_TX_PDEV_BE_MU_PPDU_DISTRIBUTION_STATS:
> be_mu_mimo_num_seq_posted_nr4 = 0
> be_mu_mimo_num_ppdu_posted_per_burst_nr4 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0,
> be_mu_mimo_num_ppdu_completed_per_burst_nr4 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0,
> be_mu_mimo_num_seq_term_status_nr4 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0,
> 
> be_mu_mimo_num_seq_posted_nr8 = 0
> be_mu_mimo_num_ppdu_posted_per_burst_nr8 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0,
> be_mu_mimo_num_ppdu_completed_per_burst_nr8 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0,
> be_mu_mimo_num_seq_term_status_nr8 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0,
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



