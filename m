Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F480D3C530
	for <ath12k@archiver.kernel.org>; Thu, 17 Oct 2024 20:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kYkIDUGLCRV+wwPKXj3Vr5/KThaJDLYa7aP08VMjQf0=; b=XpBytKRf8+sUQ33s6Az5iK/YbR
	LnEFVjSAGd8OwdEhUKzsPb+Y98JlNv58e+H2NkL+xJWMOkwUNTc3MsYQgLt2rogXEUm5Z88NJUInZ
	hEV1YXIbpPBrVGwc/yR/f9LLJUebUhSS+Zjb24iXdE2ka+DPJxRTalhF2uUR1s5agAAs3RTHX+SJB
	p8lV0MofunrTQuIIQ38uMpFGcnIixgU+JbD+1A9bugPiECHM3uPPo/10srgsSTKz177zaMzG/Eby0
	mqKENEGfeoccEKg9WfbUuw/k22nLn0LMl2QbmdFKoEpwlYPK3cxg17KpAQK/xIr+KZm2244JKmOf2
	eNJgusVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1XLh-0000000G9Bk-3YIp
	for ath12k@archiver.kernel.org;
	Thu, 17 Oct 2024 20:43:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1XLc-0000000G9AS-0eES
	for ath12k@lists.infradead.org;
	Thu, 17 Oct 2024 20:43:56 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49HIqHk2012503;
	Thu, 17 Oct 2024 20:43:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kYkIDUGLCRV+wwPKXj3Vr5/KThaJDLYa7aP08VMjQf0=; b=POSQkDCW9AxUlbi9
	FHZnRg5NBEJ4UKgYwmSQGBhqZsoAZ7DQURARXwZOSIWxScSj/C72xP9LAQ7qM8mI
	Guw3/6sJa1juPnB8OcDZxRPcxDkOeegESQESPlOdlZ6ypdziPPCcyuYWkJ2EGP6V
	Yec6x/2cPnvyQ/4SNp+Ez84NdA5rvon1SQICq0D7z2/hf5s3T+FeeFKuTvnJeFbo
	xT8Tlw/3ZITUe6pMANHJx3jtI7jbZ7+MHPWsbZQZuPKnubIS7eBK2wcMvPD/+oZ0
	vPxftvLQurRDki9lSdBW2KEZ0GfFNG64xT/TqZWZnDuoWveGXuRQEBFUXqlsDNij
	fqpkHw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42abbxwf9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 20:43:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49HKhnTx018949
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 20:43:49 GMT
Received: from [10.48.241.64] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 17 Oct
 2024 13:43:48 -0700
Message-ID: <9a928610-aa89-40e6-b5fd-0dd8cf5a3a3d@quicinc.com>
Date: Thu, 17 Oct 2024 13:43:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/11] wifi: ath12k: some fixes and clean up for
 monitor mode
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241017031056.1714-1-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241017031056.1714-1-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: XQVKD1tvfbIZLlLB5pvP-fQJDvk01e56
X-Proofpoint-GUID: XQVKD1tvfbIZLlLB5pvP-fQJDvk01e56
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410170139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_134352_343805_1E9C76D3 
X-CRM114-Status: GOOD (  11.12  )
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

On 10/16/2024 8:10 PM, Kang Yang wrote:
> This patch set does some fixes and clean up for monitor mode.
> 
> v4: rebase on tag: ath/main(ath-202410161539).
> v3: rebase on tag: ath/main(ath-202410111606).
> v2: rebase on tag: ath-202410072115.
> 
> Kang Yang (11):
>   wifi: ath12k: remove unused variable monitor_present
>   wifi: ath12k: optimize storage size for struct ath12k
>   wifi: ath12k: fix struct hal_rx_ppdu_end_user_stats
>   wifi: ath12k: fix struct hal_rx_ppdu_start
>   wifi: ath12k: fix struct hal_rx_phyrx_rssi_legacy_info
>   wifi: ath12k: fix struct hal_rx_mpdu_start
>   wifi: ath12k: properly handling the state variables of monitor mode
>   wifi: ath12k: delete NSS and TX power setting for monitor vdev
>   wifi: ath12k: use tail MSDU to get MSDU information
>   wifi: ath12k: fix A-MSDU indication in monitor mode
>   wifi: ath12k: delete mon reap timer
> 
>  drivers/net/wireless/ath/ath12k/core.c   |   5 ++
>  drivers/net/wireless/ath/ath12k/core.h   |  23 +++--
>  drivers/net/wireless/ath/ath12k/dp.c     |  25 ------
>  drivers/net/wireless/ath/ath12k/dp_mon.c | 107 +++++++++++++----------
>  drivers/net/wireless/ath/ath12k/hal_rx.h |  53 ++++++-----
>  drivers/net/wireless/ath/ath12k/mac.c    |  24 +++--
>  6 files changed, 115 insertions(+), 122 deletions(-)
> 
> 
> base-commit: fa934bf3e0a825ee09f035c6580af513187d59a2

This series looks ok to me, but it conflicts with the MLO branch so I'll defer
this until the MLO branch is merged. Note that some of these fixes may not
conflict, so feel free to submit ones that don't conflict as individual patches.

