Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22542C25B75
	for <ath12k@archiver.kernel.org>; Wed, 29 May 2024 19:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MFM8CqFxIyuOBnGz94bCXh+vZIc4PV364ikCyTcMhkU=; b=I0c2iQTvVAZ5YbBkcwgHqvNekm
	3tqHVMYE+Cmp5HmBH0G9mUQlm1EAoGx6Z5yk1Jge0N8SGdCCANPN8IdmDFV1LOuhIDxdZOVPZ11uW
	tlcdyENmdeBnGFIy3Iz9HUF1uqU6zMQ2T8m4F8fFNpnzU+bIjhM6v9oUcRMe5MKy8MOoWfAk7q4LD
	ksEEEfm6iRMpoT04zlJ+se89BrPcDojTAxLmxJLNlnfZGKwNpCcCqoJBpWVvD+uTZDgtYmwk0j2Rq
	HuCaaS4RfCmDw+NOKiItM2Np49SvH/n3/AH1cgfvhs7ChoyWk43oNseKXaTfiQDGR4saGAb3H4yUa
	IJtDF+1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCPIT-00000005NKh-3Ud7
	for ath12k@archiver.kernel.org;
	Wed, 29 May 2024 19:49:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCPIR-00000005NK6-3lj1
	for ath12k@lists.infradead.org;
	Wed, 29 May 2024 19:49:17 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44TBIFng023663;
	Wed, 29 May 2024 19:49:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MFM8CqFxIyuOBnGz94bCXh+vZIc4PV364ikCyTcMhkU=; b=iR1qrBZfttXkm5pK
	6Hg26U5qikur1NBtZkDzOfeBtKZA3yDvp4NTGMgWTifioajpy11MUhUwQP22hqTR
	UzhcL9hcZJ+Tv1AbLcSzdAc1GBXkXrjOqoEoy7Xo7CGqzFxyvL556ZcK/OdjgFzv
	iqJe8d11/yFKqSdhbKmRk2IZJLqBrkhZRr0wMmy5DtY3FXmcO+SNsvHz6DR24nVb
	iT3PpYwxZDHUhqoLjpc9TERqp9gtWRTskMKDoliksFzpst6Swat7A+qvcNHlU8EP
	THOWHL1ZB6MqADgO7/eNO+hI5kOMaCy5lokuvJ9xe2PQIp0WSFgALIFj/3O0ynJ3
	G/8lxA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2pt8x2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 19:49:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44TJnCOs025587
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 19:49:12 GMT
Received: from [10.110.109.163] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 29 May
 2024 12:49:11 -0700
Message-ID: <35652b57-2447-483e-8b8f-bc42a575602e@quicinc.com>
Date: Wed, 29 May 2024 12:49:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Add WMI control path stats infra
Content-Language: en-US
To: Ramya Gnanasekar <quic_rgnanase@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Rajat Soni <quic_rajson@quicinc.com>
References: <20240529180920.1472003-1-quic_rgnanase@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240529180920.1472003-1-quic_rgnanase@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: maPOG8LXEyDpzSDXBCThuqrHKKUe7Ici
X-Proofpoint-ORIG-GUID: maPOG8LXEyDpzSDXBCThuqrHKKUe7Ici
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_15,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 phishscore=0 mlxlogscore=996
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_124915_986207_9B58C87B 
X-CRM114-Status: GOOD (  10.76  )
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

On 5/29/2024 11:09 AM, Ramya Gnanasekar wrote:
> From: Rajat Soni <quic_rajson@quicinc.com>
> 
> Currently, firmware stats is requested by host through HTT interface.
> Since HTT interface is already overloaded for data path stats,
> leveraging control path to request other stats through WMI interface.
> 
> Add debugfs to request the stats and dump the stats forwarded by firmware.
> 
> ath12k
> `-- pci-0000:06:00.0
>     |-- mac0
>         `-- wmi_ctrl_stats
> 
> This patch also adds support to request PDEV Tx stats, parse and dump
> the data sent from firmware.
> 
> Usage:
> echo <stats id> <action> > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/wmi_ctrl_stats
> 
> Sample:
> echo 1 1 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/wmi_ctrl_stats
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/wmi_ctrl_stats
> WMI_CTRL_PATH_PDEV_TX_STATS:
> fw_tx_mgmt_subtype =  0:0, 1:2, 2:0, 3:0, 4:0, 5:37, 6:0, 7:0, 8:908, 9:0, 10:0, 11:18, 12:2, 13:3, 14:0, 15:0,
> fw_rx_mgmt_subtype =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0, 14:0, 15:0,
> scan_fail_dfs_violation_time_ms = 0
> nol_chk_fail_last_chan_freq = 0
> nol_chk_fail_time_stamp_ms = 0
> tot_peer_create_cnt = 7
> tot_peer_del_cnt = 7
> tot_peer_del_resp_cnt = 7
> vdev_pause_fail_rt_to_sched_algo_fifo_full_cnt = 0
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Rajat Soni <quic_rajson@quicinc.com>
> Co-developed-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
> Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
> ---
> Depends-On: [PATCH v2 3/5] wifi: ath12k: Fix Pdev id in HTT stats request for WCN7850
> Link: https://lore.kernel.org/linux-wireless/20240510050806.514126-1-quic_rgnanase@quicinc.com
> ---
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


