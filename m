Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9E2E7719E
	for <ath12k@archiver.kernel.org>; Mon, 13 Jan 2025 08:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TCTqp6m6EAkwZNgFziYUSpvKhex9BIWNLVER16ZCCFM=; b=Kg7KBECM8LuwHxWHXTVb9LuRx6
	+gTTShUNcReeiDaOQIjP2X22WFTfBVyBBXc6IFZWEzpCDZPvQ7eZ1Sb7Rll1yYqm6FZmdGdHMvEqj
	oJwzYjgJtxjRlE+I/pR6zLectuSns22Ztjcy7N3ZUVIiiyRG+KZ2/nvQvJeGeMpuUWtt+gI42+S61
	TGXlJp8RLyx+qE8DR6Mvsi0y6UM932TMeoED2NpfiBQPyEQ7Qnkqi58ggVxaRPsqM8AgO6po1/nIT
	1w59mGEqKI+upgdK68Fw24GLfhfENJyM/Vz93/3NByfQa2okkbzV35P47jMsDMUJf1F0XtUsVmkD6
	HYZ+yF1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXFcP-00000004M50-0Ke2
	for ath12k@archiver.kernel.org;
	Mon, 13 Jan 2025 08:16:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXFcM-00000004M4T-2wud
	for ath12k@lists.infradead.org;
	Mon, 13 Jan 2025 08:16:16 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D2Hd3g021702;
	Mon, 13 Jan 2025 08:16:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TCTqp6m6EAkwZNgFziYUSpvKhex9BIWNLVER16ZCCFM=; b=dKtBFjvRPObR19LG
	4y+V0inXlR4+BVCluNWwLSNxyfLbIceluKO4DCsElubo2a6XD+nlh8QgeN8gDjhi
	yJBhpxnWx7PE7k460VZGyoUZyBopn9ITr2XFyhwko1GYdYmIh4GeB22N0+H/ax7x
	tYzbnD/wSg8woHhP5uY8rk6nESrqtxQ3cMQL/MadlBbww+NiMs9F+wSrvUoEJ9F1
	1eQCj9KsF5a3Od3AzrC2L+0XA88iB/GMCAo6YyA+qZtl6q7AYVedLDm0IPbUAj4L
	eoypbvq6VJWRvpDIgMT8t2Ea+Ec2ZaERLEDwpJ922bWm8eIfg0c4Cv+mPQkYDYPb
	hWXeEQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 444swy8q3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 08:16:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50D8G4GU004609
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 08:16:04 GMT
Received: from [10.152.202.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 Jan
 2025 00:16:02 -0800
Message-ID: <bd0de726-4eeb-43b9-a8d3-53162b5833f1@quicinc.com>
Date: Mon, 13 Jan 2025 13:45:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] wifi: ath12k: Support Sounding Stats
To: Roopni Devanathan <quic_rdevanat@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Dinesh Karthikeyan
	<quic_dinek@quicinc.com>
References: <20250113071144.3397293-1-quic_rdevanat@quicinc.com>
 <20250113071144.3397293-2-quic_rdevanat@quicinc.com>
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
Content-Language: en-US
In-Reply-To: <20250113071144.3397293-2-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tswo2owf3ikHnOvHWlON03HjlaxMI_FW
X-Proofpoint-ORIG-GUID: tswo2owf3ikHnOvHWlON03HjlaxMI_FW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 clxscore=1015 mlxscore=0 bulkscore=0 mlxlogscore=999 impostorscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_001614_750538_7F9B8026 
X-CRM114-Status: UNSURE (   6.85  )
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

On 1/13/25 12:41, Roopni Devanathan wrote:
> From: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> 
> Add support to request sounding stats from firmware through HTT stats
> type 22. These stats give sounding information of different Wi-Fi
> standards, channel vector upload status and correlation details.
> 
> Sample output:
> -------------
> echo 22 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
> HTT_TX_AC_SOUNDING_STATS_TLV:
> ac_cbf_20 = IBF: 0, SU_SIFS: 0, SU_RBO: 0, MU_SIFS: 0, MU_RBO: 0
> ac_cbf_40 = IBF: 0, SU_SIFS: 0, SU_RBO: 0, MU_SIFS: 0, MU_RBO: 0
> .....
> Sounding User_0 = 20MHz: 0, 40MHz: 0, 80MHz: 0, 160MHz: 0
> Sounding User_1 = 20MHz: 0, 40MHz: 0, 80MHz: 0, 160MHz: 0
> .....
> 
> HTT_TX_AX_SOUNDING_STATS_TLV:
> ax_cbf_20 = IBF: 0, SU_SIFS: 0, SU_RBO: 0, MU_SIFS: 0, MU_RBO: 0
> ax_cbf_40 = IBF: 0, SU_SIFS: 0, SU_RBO: 0, MU_SIFS: 0, MU_RBO: 0
> .....
> Sounding User_0 = 20MHz: 0, 40MHz: 0, 80MHz: 0, 160MHz: 0
> Sounding User_1 = 20MHz: 0, 40MHz: 0, 80MHz: 0, 160MHz: 0
> .....
> 
> HTT_TX_BE_SOUNDING_STATS_TLV:
> be_cbf_20 = IBF: 0, SU_SIFS: 0, SU_RBO: 0, MU_SIFS: 0, MU_RBO: 0
> be_cbf_40 = IBF: 0, SU_SIFS: 0, SU_RBO: 0, MU_SIFS: 0, MU_RBO: 0
> .....
> Sounding User_0 = 20MHz: 0, 40MHz: 0, 80MHz: 0, 160MHz: 0, 320MHz: 0
> Sounding User_1 = 20MHz: 0, 40MHz: 0, 80MHz: 0, 160MHz: 0, 320MHz: 0
> .....
> 
> CV UPLOAD HANDLER STATS:
> cv_nc_mismatch_err = 0
> cv_fcs_err = 0
> cv_frag_idx_mismatch = 0
> cv_invalid_peer_id = 0
> .....
> 
> CV QUERY STATS:
> cv_total_query = 0
> cv_total_pattern_query = 0
> cv_total_bw_query = 0
> cv_invalid_bw_coding = 0
> .....
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
> ---
>   .../wireless/ath/ath12k/debugfs_htt_stats.c   | 265 ++++++++++++++++++
>   .../wireless/ath/ath12k/debugfs_htt_stats.h   |  78 ++++++

* drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c: 2025 copyright 
missing
* drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h: 2025 copyright 
missing

No need to respin just because of this.

-- 
Aditya

