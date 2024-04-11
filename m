Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A3FC001CC
	for <ath12k@archiver.kernel.org>; Thu, 11 Apr 2024 21:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tBm2jiJY3rEEe5r+/MkrFmr4jpv2JBIlBCacTGs5T5M=; b=HtMUhE0Fv8e5QaSYJcrQi305Ut
	s+izeiqssORQtdh4CsXa9Z8fwiH5IE1nGCgLdlq9WoZ3hXaxD42+uMwB0PFkXq+mHI/Rhm6DPEldk
	yZf6bIrncmDO8WPqRzb3cOgYUfhQTA0tzyGYpVfFAlOKqk/4/gYwwn2xrTR9W/NSt3AYg0IzEBeAs
	70wfb/3kElph3LM0p12TEoDUsbPCx5x37pXdWK+iMI6K0veIlZMm2g59GNIKqPP+vme6r5C3fdCEE
	rIR6VpXpCQHIzFDgVvTTEMPUVOTQysSy9WNDHOqX4htCf5+r5Cfq5FI+iwqoCnI+Mby38OWur4i7i
	aRwcA13Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv28q-0000000EDQR-0boD
	for ath12k@archiver.kernel.org;
	Thu, 11 Apr 2024 21:39:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv28n-0000000EDPt-1Njr
	for ath12k@lists.infradead.org;
	Thu, 11 Apr 2024 21:39:30 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43BLHSnv028729;
	Thu, 11 Apr 2024 21:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=tBm2jiJY3rEEe5r+/MkrFmr4jpv2JBIlBCacTGs5T5M=; b=pV
	0xLs9qvZ2QwOFug1bKZYc5ON2d8cRf1UnxayZg+u+vE/Fljn5ZLFmS09OL/2+Sn8
	rhZu5aX+EWWz5kvESpCiStszqyvci4jEi5jcsa1IG7pKworuqpxv37wi3EdyMGJo
	pzizHYFL5Tj+VGFeLhlTlJSu1VpVIU1XqB6KGAPT8dQdhHmSbr6MuOb6ob29R9Qk
	S5Icni84eLOwNoVVnoPYwFBBO9sccCPOsdQTdjFd8se7EhkZbsk7wzYJXaESlXIr
	rg+yxnldYtH9X38DWJb6Xc2Nq0wnESD4UISTZ30meuya25vdl0h6/49iq0UfSY/S
	tnBMBmOi45/ddHRzfOjw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xec6dj9aa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 21:39:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43BLdRGq018072
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 21:39:27 GMT
Received: from [10.110.37.144] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 11 Apr
 2024 14:39:27 -0700
Message-ID: <77ae34e0-c647-41fd-a40d-5ade63ab8765@quicinc.com>
Date: Thu, 11 Apr 2024 14:39:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] wifi: ath12k: report station mode stats
Content-Language: en-US
To: Lingbo Kong <quic_lingbok@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240411025322.33888-1-quic_lingbok@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240411025322.33888-1-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9nQHuL_bTcmsxGhx_qF2hsSQYB9VRAFF
X-Proofpoint-ORIG-GUID: 9nQHuL_bTcmsxGhx_qF2hsSQYB9VRAFF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_10,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404110156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_143929_512639_067FB7A2 
X-CRM114-Status: GOOD (  12.65  )
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

On 4/10/2024 7:53 PM, Lingbo Kong wrote:
> Currently, the transmit rate, the receive rate and signal strength of
> “iw dev xxx station dump” always show an invalid value.
> 
> This is because ath12k has no logic to handle this relevant information.
> 
> To solve this issue, ath12k parses the information passed by the firmware
> and passes it to mac80211.
> 
> After that, "iw dev xxx station dump" show the correct value.
> Such as:
> 
> Station 00:03:7f:12:03:03 (on wlo1)
>         inactive time:  600 ms
>         rx bytes:       4642228
>         rx packets:     23796
>         tx bytes:       933967
>         tx packets:     8761
>         tx retries:     66
>         tx failed:      0
>         beacon loss:    0
>         beacon rx:      8925
>         rx drop misc:   191
>         signal:         -20 dBm
>         beacon signal avg:      -18 dBm
>         tx bitrate:     1441.1 MBit/s 80MHz EHT-MCS 13 EHT-NSS 2 EHT-GI 0
>         tx duration:    0 us
>         rx bitrate:     1801.4 MBit/s 80MHz EHT-MCS 11 EHT-NSS 3 EHT-GI 0
>         rx duration:    0 us
> 
> Lingbo Kong (3):
>   wifi: ath12k: report station mode transmit rate
>   wifi: ath12k: report station mode receive rate for IEEE 802.11be
>   wifi: ath12k: report station mode signal strength
> 
>  drivers/net/wireless/ath/ath12k/core.h    |   4 +
>  drivers/net/wireless/ath/ath12k/dp_rx.c   |  20 ++-
>  drivers/net/wireless/ath/ath12k/dp_rx.h   |   3 +
>  drivers/net/wireless/ath/ath12k/dp_tx.c   | 147 +++++++++++++++++-
>  drivers/net/wireless/ath/ath12k/hal_tx.h  |   9 +-
>  drivers/net/wireless/ath/ath12k/mac.c     | 180 +++++++++++++++++++++-
>  drivers/net/wireless/ath/ath12k/mac.h     |   3 +
>  drivers/net/wireless/ath/ath12k/rx_desc.h |   2 +
>  drivers/net/wireless/ath/ath12k/wmi.c     | 130 ++++++++++++++++
>  drivers/net/wireless/ath/ath12k/wmi.h     |  48 ++++++
>  10 files changed, 537 insertions(+), 9 deletions(-)
> 
> 
> base-commit: dc410c4accd2fe64479a1f4ebc47ec9cd3928f4a

FYI I'm not able to verify this series since it conflicts with the pending branch.

Patch failed at 0003 wifi: ath12k: report station mode signal strength
error: patch failed: drivers/net/wireless/ath/ath12k/core.h:607
error: drivers/net/wireless/ath/ath12k/core.h: patch does not apply
error: patch failed: drivers/net/wireless/ath/ath12k/mac.c:7561
error: drivers/net/wireless/ath/ath12k/mac.c: patch does not apply

Note that wireless-testing doesn't have the following series which conflicts:
wifi: ath12k: Add single wiphy support

Can you rebase against either ath-next or pending, both of which have that series?


