Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DB1E77197
	for <ath12k@archiver.kernel.org>; Thu,  9 Jan 2025 04:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3BPs/ssqcpRqE8kyJ4PV8dQrNUZbGS/yXkWxK4wcjbc=; b=ujKycSUk3UkwqJmYvU0ZYyeMO5
	m0h0eatDV5HlSz1l7IU3I0HePLpIhRUf6fDUSgfmBf0GM95EuRSIxk2hQtgVIRZeZxwdEqHplvGpg
	EhI8zsYtg54Jv0yW2HB26YkWoDY1vW3eGJPTTSqYTeyKeNH2eu4TkkfvhRIxk+fIT5H7bnO5P0D/i
	HqmbcS9ojcj1Fdj88dsbg4L/+S4IJNCzQ3xGIqVNr5CeAxGbkejiCEXo/kUiuGg1/BCL0aEI/1Vf7
	itvZPCuEr5h/O7ciXJyC0X63+VKpep1Ui7FPiPjcILssIcgZ4tKvc+ftFf6M6z5GsE3eIS/TyiqG2
	rvYWVC3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVkOh-0000000AkBv-3sj7
	for ath12k@archiver.kernel.org;
	Thu, 09 Jan 2025 04:43:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVkOf-0000000AkBX-3qtN
	for ath12k@lists.infradead.org;
	Thu, 09 Jan 2025 04:43:55 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5094CUrc019308;
	Thu, 9 Jan 2025 04:43:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3BPs/ssqcpRqE8kyJ4PV8dQrNUZbGS/yXkWxK4wcjbc=; b=fEN1QODpk/jyBGyg
	7ABedorFkthkP9UelTXlaydFU1H1XkVZtyOtb/0l7lwkAUkkapYhBQI8jZttuqUd
	gBAhn9jG3yWUmWGqBJwWUMoL1Wp0VQA1F9K14/oQuYk0XZGYhMrNpWHJs9Tvf/Kv
	TTT87EkRMnC333x9YDED6TrxZ+nesLlq2eKozeW7C4DW9R+n/MgtznaKokrf/17i
	pCDzwQNJ7XQsI82tldb3o4b2WvhwgoOdvk0M4KWe0Fkniy//5oSSBI6qaUDWnNyv
	6ITfKZPUXRuaskuNMj7Y/vT2BykBdvKeedOAtZpu0/rEccIN1BGaQ0hWWFCFczHI
	Jvg/zQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44277e01vu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 04:43:50 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5094hncr004971
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 04:43:49 GMT
Received: from [10.152.193.243] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 20:43:48 -0800
Message-ID: <d38ac7f6-3596-4336-bd9d-61e99f3b070c@quicinc.com>
Date: Thu, 9 Jan 2025 10:13:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] wifi: ath12k: Factory test mode support
To: <ath12k@lists.infradead.org>, Kalle Valo <kvalo@kernel.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240624095305.37189-1-quic_aarasahu@quicinc.com>
Content-Language: en-US
From: Aaradhana Sahu <quic_aarasahu@quicinc.com>
In-Reply-To: <20240624095305.37189-1-quic_aarasahu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Mciaf7xTobIxttOzdFnHifHw16TXD9BT
X-Proofpoint-GUID: Mciaf7xTobIxttOzdFnHifHw16TXD9BT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 impostorscore=0 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501090035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_204354_017318_5F72DC5B 
X-CRM114-Status: GOOD (  13.05  )
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



On 6/24/2024 3:23 PM, Aaradhana Sahu wrote:
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
>   wifi: ath: create common testmode_i.h file for ath drivers
>   wifi: ath12k: export ath12k_wmi_tlv_hdr for testmode
>   wifi: ath12k: add factory test mode support
> 
> Rajat Soni (1):
>   wifi: ath12k: Fill pdev id for fw test cmd
> 
> ---
> v5:
>   -Updated copyright
>   -Fixed line length within 90 char
> v4:
>   -Rebased on latest ToT
> v3:
>   -Rebased on latest ToT
>   -Updated Tested-on Tag
>   -Removed second parameter of ath12k_core_start()
>   -Updated copyright
> v2:
>   -Rebased on latest ath ToT
> ---
> 
>  drivers/net/wireless/ath/ath11k/testmode.c    |  78 ++--
>  drivers/net/wireless/ath/ath12k/Makefile      |   1 +
>  drivers/net/wireless/ath/ath12k/core.c        |  22 +-
>  drivers/net/wireless/ath/ath12k/core.h        |  13 +
>  drivers/net/wireless/ath/ath12k/debug.h       |   1 +
>  drivers/net/wireless/ath/ath12k/dp.c          |   3 +
>  drivers/net/wireless/ath/ath12k/mac.c         |  15 +-
>  drivers/net/wireless/ath/ath12k/pci.c         |   1 +
>  drivers/net/wireless/ath/ath12k/testmode.c    | 423 ++++++++++++++++++
>  drivers/net/wireless/ath/ath12k/testmode.h    |  40 ++
>  drivers/net/wireless/ath/ath12k/wmi.c         |  39 +-
>  drivers/net/wireless/ath/ath12k/wmi.h         |  21 +
>  .../wireless/ath/{ath11k => }/testmode_i.h    |  54 +--
>  13 files changed, 636 insertions(+), 75 deletions(-)
>  create mode 100644 drivers/net/wireless/ath/ath12k/testmode.c
>  create mode 100644 drivers/net/wireless/ath/ath12k/testmode.h
>  rename drivers/net/wireless/ath/{ath11k => }/testmode_i.h (50%)
> 
> 
> base-commit: cac9bfd02678adbcca9a7dce770609b9f7434d37

Hi Kalle,

Please let me know, if any thing is pending from the developer side, to merge this series into ath.git tree.

Thanks,
Aaradhana Sahu


