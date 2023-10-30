Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A2CC4332F
	for <ath12k@archiver.kernel.org>; Mon, 30 Oct 2023 15:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Xs5BcjW3d017yRw1B12wnLXhzcBGq1bhdGqIVRQlk8=; b=haXLmbQ5lvDH5H
	jhRZ49yWMvzpeyKkIp3Fma6M/AbReBAqbBL7yLPzbvcrttHcggOEnMcTMfuLNw3InDqHn8K1DRRz8
	iAKiRI/h6c0bUYsJqeC5KGeHy1nU2ClXKVCCGmwxxNdPGKE3gZNuGbr8MObUaUukw5Tkyw2GPDNt+
	sI7yE711S33ErHxozmCQYya9vbTBdErIfsruE4S1ZLyDVo73gdEvhrixLicK3hlHmeXxI6Asva4Ow
	vZe129t7RlSvvviMA9JIsh2Tec6QqyeKSYKnIX9I+RCRVD3V6811dP3Z6sg0ZihBIb1EhB8fY5Zll
	JSzFcGASWgdHUBDRx1Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxU4t-003YFL-07
	for ath12k@archiver.kernel.org;
	Mon, 30 Oct 2023 15:21:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxU4q-003YEb-1L
	for ath12k@lists.infradead.org;
	Mon, 30 Oct 2023 15:21:18 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39UEjY5t026097;
	Mon, 30 Oct 2023 15:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=E7VXTweBTjFRGjzdzmSFzaXO7Tpr1NwxGwtvrC4I/ZE=;
 b=p8reeQ/UTG4KLl7DvVXfQjI7v8sLdlFmOUhRcCYx30QDKedZuZ6uDuAlAWtpKxUnpGcd
 EJMfcYTc8WfHFLe6rTyendEO60dXtp+QORMkXdPVEQHRBtsR1zALjhMN4YCXKnfk6qTY
 Eeu31RQkIXZpHXvOXkLSzXFqcgOWMKudfDsancLlMp43R6aAQtHaXz3Rw7vegbzaeQuV
 tOaxNcJA5E9uuzsyW78mV/Jj8jOKjabrw61BWME/6D7JXOviyvmzn4xaHSxIkzj8pSEd
 AuLTIxxMRgSutmMYJfx4QaUTryRv1hXKuxD6aUz0u427NHKX6wud14dyL3P/MTVn7wXn 6Q== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u0sw7v6g5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Oct 2023 15:21:13 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39UFLC18032594
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Oct 2023 15:21:12 GMT
Received: from [10.48.245.206] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 30 Oct
 2023 08:21:11 -0700
Message-ID: <37452ae3-3006-41ca-9b31-f0d4bed75e35@quicinc.com>
Date: Mon, 30 Oct 2023 08:21:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] ath12k: Factory test mode support
Content-Language: en-US
To: Aaradhana Sahu <quic_aarasahu@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231030082749.17855-1-quic_aarasahu@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231030082749.17855-1-quic_aarasahu@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Lty-8jUdwIdU3R1GEM_-wN4m7hbuAo5r
X-Proofpoint-GUID: Lty-8jUdwIdU3R1GEM_-wN4m7hbuAo5r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_10,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2310300118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_082116_594474_8BE0DCDE 
X-CRM114-Status: GOOD (  14.13  )
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

On 10/30/2023 1:27 AM, Aaradhana Sahu wrote:
> Device is booted in factory test mode for calibration.
> The commands are sent from userspace application, which
> is sent to firmware using wmi commands. Firmware sends
> the response to driver as wmi events and driver sends
> these events to the application via netlink message.
> 
> Also added changes related to correct pdev id access for
> fw test cmd.
> 
> Aaradhana Sahu (3):
>    wifi: ath: create common testmode_i.h file for ath drivers
>    wifi: ath12k: export ath12k_wmi_tlv_hdr for testmode
>    wifi: ath12k: add factory test mode support
> 
> Rajat Soni (1):
>    wifi: ath12k: Fill pdev id for fw test cmd
> 
>   drivers/net/wireless/ath/ath11k/testmode.c    |  78 ++--
>   drivers/net/wireless/ath/ath12k/Makefile      |   1 +
>   drivers/net/wireless/ath/ath12k/core.c        |  19 +-
>   drivers/net/wireless/ath/ath12k/core.h        |  13 +
>   drivers/net/wireless/ath/ath12k/debug.h       |   1 +
>   drivers/net/wireless/ath/ath12k/dp.c          |   3 +
>   drivers/net/wireless/ath/ath12k/mac.c         |  13 +-
>   drivers/net/wireless/ath/ath12k/pci.c         |   1 +
>   drivers/net/wireless/ath/ath12k/testmode.c    | 413 ++++++++++++++++++
>   drivers/net/wireless/ath/ath12k/testmode.h    |  42 ++
>   drivers/net/wireless/ath/ath12k/wmi.c         |  38 +-
>   drivers/net/wireless/ath/ath12k/wmi.h         |  22 +-
>   .../wireless/ath/{ath11k => }/testmode_i.h    |  52 +--
>   13 files changed, 624 insertions(+), 72 deletions(-)
>   create mode 100644 drivers/net/wireless/ath/ath12k/testmode.c
>   create mode 100644 drivers/net/wireless/ath/ath12k/testmode.h
>   rename drivers/net/wireless/ath/{ath11k => }/testmode_i.h (53%)
> 
> 
> base-commit: 0263687f4441d5a5eab8074d56b4693c8f0acf85

That base-commit is pretty old (tag: ath-202309051328) and your series 
fails to apply to current ath-next, please rebase:
Applying: wifi: ath: create common testmode_i.h file for ath drivers
Applying: wifi: ath12k: export ath12k_wmi_tlv_hdr for testmode
Applying: wifi: ath12k: add factory test mode support
Patch failed at 0003 wifi: ath12k: add factory test mode support

In addition, please use

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
