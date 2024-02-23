Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38184C5478C
	for <ath12k@archiver.kernel.org>; Fri, 23 Feb 2024 18:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4veztuq0nbr+6eP96SMUiNpeVsWoA09x4TohJonoSk0=; b=FFNMwar/ToXjmBQSUtvTg07QG0
	kvnjE5071dCtFqYHqwd71Y8uiUQhUNk/MWr0iNWR9I2pyedFc1ql5089iZir6YOpVYBRmlEOdGpTc
	Z+bpeIcU0oOy9urk+ByyqdA5ApTuMzThJbdXx5QtiDoYUXtthWKY+rKb40KXOYkyH5cBiiIxRfQvC
	TC9nb8/uKn277NFWdWiwPR9Lo1f2r6fFUngRM16xfxnkTQnrPNklrlvmVtZ9UyO8u2xyy5mr0fwlO
	tSIcNERzL8fG9vdOqDe9+BkNEDFfrMaozOr+0lb4vLfPToO8K4c5LJhSkQwhRIKWz9XpRLvop1N4c
	+NO4Sm7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rda0r-0000000AlZ4-3czr
	for ath12k@archiver.kernel.org;
	Fri, 23 Feb 2024 18:11:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rda0m-0000000AlXO-47VV
	for ath12k@lists.infradead.org;
	Fri, 23 Feb 2024 18:11:09 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41N6wkl4025091;
	Fri, 23 Feb 2024 18:11:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=4veztuq0nbr+6eP96SMUiNpeVsWoA09x4TohJonoSk0=; b=dG
	8KTtsUFoXFErX2VODxchl6CO0DB2mPZA89Nl6rxtyIlXmYE26ONDklIp4vOA/3zH
	FHHxPt30xMt+JvZzRDgqUQje9xqI4/4Vwf2KErK25+eBfAVU2T7GO7i7qpscMhLR
	ozcNhPPrLB6eR5/rt9WllwefDX2bxWipaPn4odEfc1llnXFqXbgXKJ4rZLf0Xnm1
	tyj82rdeup7jJlOwmgMjRxVxXYDXS8EWJyvHSEbVruXmO9ak4KGpRF/sRTOnPfOe
	LoOndOd3SrTUuvbhgGktkGxED5mKqqoj/m99dHFMHLJVKemlqwJS4wqMWIvFtRhN
	g9FTfAI3Dkpp8+52q9vQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3weg88t7jd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Feb 2024 18:11:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41NIB0LH012195
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Feb 2024 18:11:00 GMT
Received: from [10.110.104.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 23 Feb
 2024 10:11:00 -0800
Message-ID: <f9e4b895-cf77-49a9-951b-05118ff5f633@quicinc.com>
Date: Fri, 23 Feb 2024 10:10:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: add rcu lock for ath12k_wmi_p2p_noa_event()
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240223054505.438839-1-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240223054505.438839-1-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vazHD-7QDz4mfzOlSwSNqtvoJZOyeMch
X-Proofpoint-GUID: vazHD-7QDz4mfzOlSwSNqtvoJZOyeMch
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-23_04,2024-02-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=696
 malwarescore=0 suspectscore=0 impostorscore=0 clxscore=1015 adultscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402230133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_101107_730307_E06D83E7 
X-CRM114-Status: UNSURE (   8.96  )
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

On 2/22/2024 9:45 PM, Kang Yang wrote:
> Warning will appear when running P2P GO:
> 
> WARNING: suspicious RCU usage
> drivers/net/wireless/ath/ath12k/mac.c:583 suspicious rcu_dereference_check() usage!
> other info that might help us debug this:
> rcu_scheduler_active = 2, debug_locks = 1
> no locks held by swapper/0/0.
> stack backtrace:
> CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.8.0-rc4-wt-ath+ #4
> Call Trace:
>  <IRQ>
>  dump_stack_lvl+0x82/0xa0
>  dump_stack+0x14/0x20
>  lockdep_rcu_suspicious+0x214/0x3b0
>  ath12k_mac_get_ar_by_vdev_id+0x192/0x220 [ath12k]
>  ath12k_wmi_op_rx+0x2d7/0x1b40 [ath12k]
> 
> ath12k_mac_get_ar_by_vdev_id() requires its callers to have called
> rcu_read_lock(), but in ath12k_wmi_p2p_noa_event() it is called without
> doing so, and hence the warning was triggered.
> 
> Add rcu_read_lock() and rcu_read_unlock() to avoid warning.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Fixes: 9411eecb60cb ("wifi: ath12k: implement handling of P2P NoA event")
> Reported-by: Kalle Valo <quic_kvalo@quicinc.com>
> Closes: https://lore.kernel.org/linux-wireless/87o7cusyvw.fsf@kernel.org/
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


