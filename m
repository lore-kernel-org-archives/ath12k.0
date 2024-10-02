Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4992CF6D2C
	for <ath12k@archiver.kernel.org>; Wed,  2 Oct 2024 15:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b796VRuUd0ikaRYqE2w6NKc6LfGxxVyDJMU8x28zz38=; b=nBTLFSUdbcQ1iAH7MIsOMDJDqA
	v4DMwzywYLaNfiXHUA/OyCOVrQSWsb5d+Km7n4VuaMwqSWWnVelsxxPel3HYGHFyj167wChfEzK/s
	hOwi6gfrOZnL9+Wv5xzKycZXOM5SlA/xh7oXYIwYXIC9E/FHl42bDIkVE7h57cyTdO2PoB0L5RCX9
	37Z6kA32DhRBqqtMpgACWuNj/PrPqQllYe5qWTrcW5NHdto+TQtHhBNxTNtkmxP4b30jJ+PD2ujTQ
	nko3IzST6mnKB5tEtkFx2jnTpSFUcpPfL4raR9sU++kQoUe5e2Vjtyr4oUyOg4hedjnVWqjOMLg6k
	XMhFY5bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sw0uR-00000006X9X-1dII
	for ath12k@archiver.kernel.org;
	Wed, 02 Oct 2024 15:04:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sw0uO-00000006X8e-3QcC
	for ath12k@lists.infradead.org;
	Wed, 02 Oct 2024 15:04:58 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 492E4hXX024421;
	Wed, 2 Oct 2024 15:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b796VRuUd0ikaRYqE2w6NKc6LfGxxVyDJMU8x28zz38=; b=bDjRV9J6PY9YP48+
	faDSHomLZQzSMVSNyCgSWFL22BQpIaIhN9kJhfjoSlQds+8WGFTkXQ1tIJsmNoc/
	cZe3ke5e373dECFzxbrLm3iLinP8523fUJ5WuhA0FDtQLMPpW2kYP9uVVJPjObyt
	8WwnMZPvw1OMAJ3icufu2j+ifXPTJtD0vI/JxsRAuKD66dUC3L988pSdAOOrbkLi
	/Gwp2szwov8tth8lYN1UZwVV/TNa3aNZYZYU79bGfCTem3Ql+KNaJKZ6dMjDdWC8
	wfLPxdBwleGMHARExk1hZ1L+CeMkioAoI/arBxS6hZW5N2AkjuUsLnSO+WRnYn7B
	biBsfw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41x9cykvhr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Oct 2024 15:04:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 492F4qcU012597
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Oct 2024 15:04:52 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 2 Oct 2024
 08:04:52 -0700
Message-ID: <57a03cdf-462b-4fc6-ad4b-0863dab9a755@quicinc.com>
Date: Wed, 2 Oct 2024 08:04:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath12k: Support Pdev Scheduled Algorithm Stats
To: Roopni Devanathan <quic_rdevanat@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Sidhanta Sahu
	<quic_sidhanta@quicinc.com>
References: <20240930171705.596703-1-quic_rdevanat@quicinc.com>
 <20240930171705.596703-2-quic_rdevanat@quicinc.com>
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240930171705.596703-2-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1NQwv6DYXy24TXJzOrOAHnejdapZ2Ocx
X-Proofpoint-ORIG-GUID: 1NQwv6DYXy24TXJzOrOAHnejdapZ2Ocx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=869 impostorscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2410020110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_080457_005853_FCF482EA 
X-CRM114-Status: GOOD (  10.43  )
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

On 9/30/2024 10:17 AM, Roopni Devanathan wrote:
> From: Sidhanta Sahu <quic_sidhanta@quicinc.com>
> 
> Add support to request scheduled algorithm stats from firmware
> through HTT stats type 49. These stats give information such
> as count of DLOFDMA enabled, disabled, probed and monitored
> based on rate and latency, consecutive number of MPDUs tried
> and succeeded, etc.
> 
> Note: WCN7850 firmware version -
> WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> does not support HTT stats type 49.
> 
> Sample output:
> -------------
> echo 49 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
> HTT_PDEV_SCHED_ALGO_TLV:
> mac_id = 0
> rate_based_dlofdma_enabled_count =  0:0, 1:0, 2:0, 3:0
> rate_based_dlofdma_disabled_count =  0:0, 1:0, 2:0, 3:0
> rate_based_dlofdma_probing_count =  0:0, 1:0, 2:0, 3:0
> rate_based_dlofdma_monitoring_count =  0:0, 1:0, 2:0, 3:0
> chan_acc_lat_based_dlofdma_enabled_count =  0:0, 1:0, 2:0, 3:0
> chan_acc_lat_based_dlofdma_disabled_count =  0:0, 1:0, 2:0, 3:0
> chan_acc_lat_based_dlofdma_monitoring_count =  0:0, 1:0, 2:0, 3:0
> downgrade_to_dl_su_ru_alloc_fail =  0:0, 1:0, 2:0, 3:0
> candidate_list_single_user_disable_ofdma =  0:0, 1:0, 2:0, 3:0
> dl_cand_list_dropped_high_ul_qos_weight =  0:0, 1:0, 2:0, 3:0
> ax_dlofdma_disabled_due_to_pipelining =  0:0, 1:0, 2:0, 3:0
> dlofdma_disabled_su_only_eligible =  0:0, 1:0, 2:0, 3:0
> dlofdma_disabled_consec_no_mpdus_tried =  0:0, 1:0, 2:0, 3:0
> dlofdma_disabled_consec_no_mpdus_success =  0:0, 1:0, 2:0, 3:0
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00214-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sidhanta Sahu <quic_sidhanta@quicinc.com>
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


