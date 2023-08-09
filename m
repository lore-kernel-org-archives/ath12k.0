Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD6A9C001E0
	for <ath12k@archiver.kernel.org>; Wed,  9 Aug 2023 18:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ORALq1TFknDXrRlKMAvNgobhsbji21AE5CMUmKSrwM=; b=C/ka4PzWf3qv/O
	R6YQozMalxh/eK+nZJsPXVtAarl9YYE/+dpbS3fPBEGpiqp3nGirYy4EnIxQyZL6kAw8c81FDRzW+
	uIoSQWoZbeeYL9owpjkR1VDDJtgtmney43Is3GudUMqi6+Y5Mpli3p2Ks7E1i4U6Meik/LGYQE1Il
	HQLO6FxFU7pkok397OrPeme3Qavy4PWnfxmFcHHY3syVZzjXYscPyTtCKECXjudU11fdrcyNtEurz
	DdAMMOJ/p1oOb7RWoBTwJQM7v4+uHzlILlUaIMlxg+yvwBk5OPAP/vFJjABK7T5Nx8K5B9lNrYgmt
	8wXk6i6XpPDBnIYvHthQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTneb-005akO-13
	for ath12k@archiver.kernel.org;
	Wed, 09 Aug 2023 18:11:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTneZ-005ajQ-04
	for ath12k@lists.infradead.org;
	Wed, 09 Aug 2023 18:11:28 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 379HkfZo019808;
	Wed, 9 Aug 2023 18:11:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=KICgTAJeFWfXDSRWXBQf28sWnVUJTLNR4TtYP4eudYs=;
 b=Av6MipalIVxC2/KZ2i9JQq1iaDN5DXMMcqGgYl2zAj5z00upai7SpxLb5NcpPZQKBPWG
 w4F9gQvQd7/UA/aZCM+qJJ1ZWg1vZ7fY/S2caK4WL79C57V+AYBoSeMR6UFfjJYFCENn
 b2nZ3pRb6SU6XcFz6uPilWBwFlsSvWmwV6O+EW9uTMkzdM1DXdMHdTJOgqMWuYUbFBvs
 ngNmJjDu4AYvUEIMdUxhkndH+pxVB779GjjiWPfMYtuD+jw9W6+b7e/xyHgFPq5MB5KI
 Whk0db49raYwTBONbE1p9IdnGaRyOGk6RqbXAjV4in+9ExdjW+GJP8N6xJ7QOYquJtlg dQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sc1ny1ym6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Aug 2023 18:11:25 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 379IBPHS021765
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Aug 2023 18:11:25 GMT
Received: from [10.111.180.219] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 9 Aug
 2023 11:11:24 -0700
Message-ID: <00af8b1a-40d4-469c-8646-d542db77b937@quicinc.com>
Date: Wed, 9 Aug 2023 11:11:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath12k: Ignore fragments from uninitialized
 peer in dp
Content-Language: en-US
To: Harshitha Prem <quic_hprem@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230809042738.13394-1-quic_hprem@quicinc.com>
 <20230809042738.13394-2-quic_hprem@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230809042738.13394-2-quic_hprem@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hG_xNb4oFhvNAYQIGM6AuzcH56iOev9a
X-Proofpoint-ORIG-GUID: hG_xNb4oFhvNAYQIGM6AuzcH56iOev9a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-09_16,2023-08-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=856 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308090159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_111127_091268_2B1AD278 
X-CRM114-Status: GOOD (  14.60  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 8/8/2023 9:27 PM, Harshitha Prem wrote:
> When max virtual ap interfaces are configured in all the bands
> with ACS and hostapd restart is done every 60s,
> a crash is observed at random times.

nit: please fill the paragraph to 70+ columns

> 
> In the above scenario, a fragmented packet is received for self peer,
> for which rx_tid and rx_frags are not initialized in datapath.
> While handling this fragment, crash is observed as the rx_frag list
> is uninitialised and when we walk in ath12k_dp_rx_h_sort_frags,

nit: s/uninitialised /uninitialized/

> skb null leads to exception.
> 
> To address this, before processing received fragments we check
> dp_setup_done flag is set to ensure that peer has completed its
> dp peer setup for fragment queue, else ignore processing the
> fragments.
> 
> Call trace:
>      PC points to "ath12k_dp_process_rx_err+0x4e8/0xfcc [ath12k]"
>      LR points to "ath12k_dp_process_rx_err+0x480/0xfcc [ath12k]".
>      The Backtrace obtained is as follows:
>      ath12k_dp_process_rx_err+0x4e8/0xfcc [ath12k]
>      ath12k_dp_service_srng+0x78/0x260 [ath12k]
>      ath12k_pci_write32+0x990/0xb0c [ath12k]
>      __napi_poll+0x30/0xa4
>      net_rx_action+0x118/0x270
>      __do_softirq+0x10c/0x244
>      irq_exit+0x64/0xb4
>      __handle_domain_irq+0x88/0xac
>      gic_handle_irq+0x74/0xbc
>      el1_irq+0xf0/0x1c0
>      arch_cpu_idle+0x10/0x18
>      do_idle+0x104/0x248
>      cpu_startup_entry+0x20/0x64
>      rest_init+0xd0/0xdc
>      arch_call_rest_init+0xc/0x14
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
> ---

actual code patch LGTM


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
