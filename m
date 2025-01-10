Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD2DE77188
	for <ath12k@archiver.kernel.org>; Fri, 10 Jan 2025 18:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kN9QRH9qFSDNO2eSXpfLzeU/qRkMiCwkexdJNo7voPU=; b=fQ2uY1gCvUlBPmp4T5qBF7okLd
	BP8d1otFqY3GEcMPrabZM3ogV33ZZDQzwYs277ymQaAoPFtkSFPe6JQFdWsPaE4QuN6xd9lNGRBRU
	4cs1NzZWSJWBD1Nsj2BKIPIdYIuHq1JWgDRQU8sLhLwQzvTQBLT7eNSXMjFq20zAWwtHCxAU9+9Ob
	+OXZabaD7NeBR1JgJ+2J2lq6i1nh7ncstfYR5hoqUngLbUYapUS6WIG8RVCU9MjCXImwD4NPzz+a/
	1bEeEZtXaEfb8BpPlwGAaZ1eiF0Nk0kY3PTnsQB/uG97FJ9c9dbJkoHxaOTG7GpDS0Wm0lC+2ZgNs
	jBrT40ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWKEZ-0000000GgXo-34vg
	for ath12k@archiver.kernel.org;
	Fri, 10 Jan 2025 18:59:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWKEW-0000000GgVU-49fx
	for ath12k@lists.infradead.org;
	Fri, 10 Jan 2025 18:59:50 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50AE5gvE011094;
	Fri, 10 Jan 2025 18:59:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kN9QRH9qFSDNO2eSXpfLzeU/qRkMiCwkexdJNo7voPU=; b=ccsZ+JTDmQRcseYH
	SxzeyjduQBkJ1ZdAV0eGqwgTYBzrlLtuqf2Xsp28P293C0CSKs64HChgR9FSMe8s
	gOlaiSaM/sN7sUFonD7ZJRFDM+SfFx3NKN+/lfTD/GRcCxonlJiKNHh+YBfB9hSA
	akdhqMJOwTZSW08mfF/dPgA6yO9/i032YNWpOPCAWsSa6+1J18mM0WQ+FJMfD3Dk
	GM6TzrXlyv2YZklTXobZtjYNjEGPjeBqQl1v1kjb1MshlxcRUYQOwrHmocNSYhDk
	DUcY5VWNnwORVcKcRRSrGporMVZq/oyTFoU81We4dKvOOJ7Pq/pU3z7syhydQcoV
	S8yQEw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44350srrax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 18:59:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50AIxk6E009142
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 18:59:46 GMT
Received: from [10.111.179.128] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 10 Jan
 2025 10:59:45 -0800
Message-ID: <881914e8-1d71-4457-8a03-3dd96fbd1972@quicinc.com>
Date: Fri, 10 Jan 2025 10:59:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: Add WMI control path stats infra
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: Ramya Gnanasekar <quic_rgnanase@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Rajat Soni <quic_rajson@quicinc.com>
References: <20240701162616.2762256-1-quic_rgnanase@quicinc.com>
 <fc6c5ab0-f5cc-480b-a812-5106f99087f0@quicinc.com>
Content-Language: en-US
In-Reply-To: <fc6c5ab0-f5cc-480b-a812-5106f99087f0@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: eNjLPQ9XBwhFC0TxwhbUrFdUuX-kznem
X-Proofpoint-GUID: eNjLPQ9XBwhFC0TxwhbUrFdUuX-kznem
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 mlxlogscore=982
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_105949_171500_60BCEE68 
X-CRM114-Status: UNSURE (   9.23  )
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

On 7/3/2024 9:51 AM, Jeff Johnson wrote:
> On 7/1/2024 9:26 AM, Ramya Gnanasekar wrote:
>> From: Rajat Soni <quic_rajson@quicinc.com>
>>
>> Currently, firmware stats is requested by host through HTT interface.
>> Since HTT interface is already overloaded for data path stats,
>> leveraging control path to request other stats through WMI interface.
>>
>> Add debugfs to request the stats and dump the stats forwarded by firmware.
>>
>> ath12k
>> `-- pci-0000:06:00.0
>>     |-- mac0
>>         `-- wmi_ctrl_stats
>>
>> This patch also adds support to request PDEV Tx stats, parse and dump
>> the data sent from firmware.
>>
>> Usage:
>> echo <stats id> <action> > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/wmi_ctrl_stats
>>
>> Sample:
>> echo 1 1 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/wmi_ctrl_stats
>> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/wmi_ctrl_stats
>> WMI_CTRL_PATH_PDEV_TX_STATS:
>> fw_tx_mgmt_subtype =  0:0, 1:2, 2:0, 3:0, 4:0, 5:37, 6:0, 7:0, 8:908, 9:0, 10:0, 11:18, 12:2, 13:3, 14:0, 15:0,
>> fw_rx_mgmt_subtype =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0, 14:0, 15:0,
>> scan_fail_dfs_violation_time_ms = 0
>> nol_chk_fail_last_chan_freq = 0
>> nol_chk_fail_time_stamp_ms = 0
>> tot_peer_create_cnt = 7
>> tot_peer_del_cnt = 7
>> tot_peer_del_resp_cnt = 7
>> vdev_pause_fail_rt_to_sched_algo_fifo_full_cnt = 0
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>
>> Signed-off-by: Rajat Soni <quic_rajson@quicinc.com>
>> Co-developed-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
>> Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Now NAK, please rebase to current main and update locking to use wiphy lock
where now needed



