Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8879EE3F0D
	for <ath12k@archiver.kernel.org>; Tue, 12 Sep 2023 19:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sqR6TfPpzIGtP53Qu6jy7jG8jm5yASWZqtb0bzw2w3s=; b=UWcwRsiwb/zcpc
	DYV2K5qI/MQ+Kkp9Ebs3EW4xCnbEa+a74H2pZMQ8gJ5ES8tzQyE/E0T7W7fY7gwvNaALvybj27nDz
	Ci9yF48yh2jHmCeT+Sl0BS0Uxp66cchK07Dg0K3tbnM2Duav1EENwCimyUhtsICgniHqk8ZIDMDre
	5/0paBDNMJoWZQic6zJwh5bMG+V29UNc2mvVUDVBiVmRdoz2GiQcGU4R92uVmmQyLHQ8LeP0GLygj
	iHfBKeQ9/avgl3k1D+7PoeXLkH1i0N3HUuqOM6pERd2eq3pP5vYrAc8klt1OaoPu+sTgPldx9A+1L
	grfIgFCOtV7EpnKDyTlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg8ml-0041xh-1i
	for ath12k@archiver.kernel.org;
	Tue, 12 Sep 2023 19:10:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg8mj-0041x9-2G
	for ath12k@lists.infradead.org;
	Tue, 12 Sep 2023 19:10:55 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38CIvJ7w004967;
	Tue, 12 Sep 2023 19:10:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=/ViKI81sMDZ9CnC4/RwnDeLcn4YCJ55f9/RuhH5LDYc=;
 b=l+KK4s2Kr1nPlztdl2FS0iGJ7sKaacZC7Z0PI5akAmK4h3kLcNwmcwc+HkXEEEBjRfo4
 4uLpPDeVsW67eiJQKKnhSzI84ftmyXtzLey/r9B75XG0G//pq9ovCL/13rFfnJFDVJ5a
 3D7dyBIfqU1s2Vf5o7pe4tQl5ZVVfHxfJkStlS1/kTB410LI7n6B/ltdNHouvr1JZOBj
 iSQxIY/uvLuwmQZmuHzbjnPoaeAAEEYWwfrG54XXCr1+kZC7UYhQuV7ofZ/KWesf1UFo
 5piGylbm3U/1LUJU4DYtGUQD2xq37cmS2lQwzXiQUxOjQpLCsAQrqdiWHiYfuKia16Tt BA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t268fkk8w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 19:10:46 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38CJAjbl026913
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 19:10:45 GMT
Received: from [10.111.183.71] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 12 Sep
 2023 12:10:45 -0700
Message-ID: <4f4cc727-4210-47d7-a635-a8cd14a04064@quicinc.com>
Date: Tue, 12 Sep 2023 12:10:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] wifi: ath12k: implement some functionalities
 through reading ACPI Table
Content-Language: en-US
To: Lingbo Kong <quic_lingbok@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230910082802.9198-1-quic_lingbok@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230910082802.9198-1-quic_lingbok@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lC_YGj8nbD-kivQqHw70mGdGmQVHVAUt
X-Proofpoint-ORIG-GUID: lC_YGj8nbD-kivQqHw70mGdGmQVHVAUt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_18,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0 bulkscore=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 mlxlogscore=727 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2308100000 definitions=main-2309120161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_121053_760239_9A47A61A 
X-CRM114-Status: GOOD (  13.93  )
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

On 9/10/2023 1:27 AM, Lingbo Kong wrote:
> Through reading ACPI table, implement Time-Average-SAR(TAS), BIOS SAR,
> configuration of CCA threshold and band edge channel power functionalities.
> 
> v4:
> 1.revise commit log using imperative voice
> 2.delete guid_is_null()
> 
> v3:
> 1.remove unnecessary cpu_to_le32()
> 2.adjust the order of the macros
> 3.apply jeff's advice
> 
> v2:
> 1.put <linux/acpi.h> in the include guard
> 
> Lingbo Kong (4):
>    wifi: ath12k: add TAS capability for WCN7850
>    wifi: ath12k: add BIOS SAR capability for WCN7850
>    wifi: ath12k: add adjust configuration of CCA threshold value for
>      WCN7850
>    wifi: ath12k: add set band edge channel power for WCN7850
> 
>   drivers/net/wireless/ath/ath12k/Makefile |   3 +-
>   drivers/net/wireless/ath/ath12k/acpi.c   | 365 +++++++++++++++++++++++
>   drivers/net/wireless/ath/ath12k/acpi.h   |  60 ++++
>   drivers/net/wireless/ath/ath12k/core.c   |   6 +
>   drivers/net/wireless/ath/ath12k/core.h   |  13 +
>   drivers/net/wireless/ath/ath12k/hw.c     |  10 +
>   drivers/net/wireless/ath/ath12k/hw.h     |   4 +-
>   drivers/net/wireless/ath/ath12k/pci.c    |   6 +
>   drivers/net/wireless/ath/ath12k/wmi.c    | 252 ++++++++++++++++
>   drivers/net/wireless/ath/ath12k/wmi.h    |  47 ++-
>   10 files changed, 763 insertions(+), 3 deletions(-)
>   create mode 100644 drivers/net/wireless/ath/ath12k/acpi.c
>   create mode 100644 drivers/net/wireless/ath/ath12k/acpi.h
> 
> 
> base-commit: 1b5b69a51bb4909844e4003920af09ca1cc6bb0e
For the series

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
