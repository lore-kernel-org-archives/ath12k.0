Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA99C3DA5D
	for <ath12k@archiver.kernel.org>; Fri, 19 Jul 2024 23:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EyKmHv6DgPfM8GkovqEyR/xI1FsVZOMudVvuW6mxyqE=; b=fhEy+XaOtcOVUiiQJOsrydFU5X
	SydRibjYkrldljx2/VOab5Xvx8FvKzacBt/HHY3dY92JOkpp+poxCx8tn9hTGwHhOxm/4IrCOXc7j
	RXVUVjwlKXAINkwO6jIO6y7zxOq/Uc1J3b4UWzulzMJuERI66qAbLu8Jok494YQ7AtA91Tk+kzDZj
	Tio6u4+iHLRzPHjWNG9+p1WTbMKGjkJDTpbLAJTT+kNkcSpv55kOILxUwxhWQZm/2ZqsCDkQY//FI
	GY7Px4gnmYR4+WCDIVJ6mCTnItZx7MONRxaMCzZZ2FxelBOp8DzP2VAdayzrz2x864D12b5jb2ttE
	QilOn1pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUxUG-000000043YF-00sP
	for ath12k@archiver.kernel.org;
	Fri, 19 Jul 2024 23:58:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUxUC-000000043XO-0K3X
	for ath12k@lists.infradead.org;
	Fri, 19 Jul 2024 23:58:05 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46JBnbqT026644;
	Fri, 19 Jul 2024 23:58:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EyKmHv6DgPfM8GkovqEyR/xI1FsVZOMudVvuW6mxyqE=; b=Q4hx50cpJn3pjLMj
	SJPr3Nype4Cn0yvB7Wrxe13QPOFK+21kJe3/LZ7wCHCD6JHcV5cnXSN8eAHlbrw3
	1uSTMaj5aFxaMSuLEqFbMQTrGmudK/HHS4RNLJL0739i7vLrrEDXBVuvKFlWdiEw
	l95ptsJ1Nfuhzy5D8wvIlhX8vNwRHUtnvQfBK0Q4rHNEwkxMgsEi++3IIyLK2Jr1
	EnPoX/A5vAvtmDEvBCoOvOAqKOXJwXiZzarxgg2Fs2FznvqNSnUipfTrel4TvG0P
	Ji23aFjicqRrCVwlZmgPYWK/Kh9vF+ERqCegi6/xeYuoLW22TqUxM4p4m1ANyJRZ
	iRGtww==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40fe2utpxe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jul 2024 23:58:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46JNw2UT030431
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jul 2024 23:58:02 GMT
Received: from [10.48.244.127] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 19 Jul
 2024 16:58:02 -0700
Message-ID: <3413e113-91c2-420f-83f8-5d610aeac877@quicinc.com>
Date: Fri, 19 Jul 2024 16:58:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] wifi: ath12k: report station mode stats
Content-Language: en-US
To: Lingbo Kong <quic_lingbok@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240718120725.130265-1-quic_lingbok@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240718120725.130265-1-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 415wasvYwyuyPUfrmaM9MVF2jfDLRBGM
X-Proofpoint-GUID: 415wasvYwyuyPUfrmaM9MVF2jfDLRBGM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-19_09,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407190177
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_165804_261208_5E0D77F0 
X-CRM114-Status: GOOD (  13.82  )
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

On 7/18/2024 5:07 AM, Lingbo Kong wrote:
> Currently, the transmit rate, the receive rate and signal strength of "iw
> dev xxx station dump" always show an invalid value. 
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
> v5:
> 1.use ieee80211_find_sta_by_ifaddr() to avoid using base_lock
> 
> v4:
> 1.rebase ath-pending-202404181533
> 2.change ATH12K_EHT_MCS_MAX from 13 to 15
> 
> v3:
> 1.change wmi_vdev_stats_event to wmi_vdev_stats_params
> 
> v2:
> 1.change copyright
> 2.change name according Naming conventions for structures
> 
> Lingbo Kong (3):
>   wifi: ath12k: report station mode transmit rate
>   wifi: ath12k: report station mode receive rate for IEEE 802.11be
>   wifi: ath12k: report station mode signal strength
> 
>  drivers/net/wireless/ath/ath12k/core.h    |   5 +
>  drivers/net/wireless/ath/ath12k/dp_rx.c   |  20 ++-
>  drivers/net/wireless/ath/ath12k/dp_rx.h   |   3 +
>  drivers/net/wireless/ath/ath12k/dp_tx.c   | 117 +++++++++++++++++-
>  drivers/net/wireless/ath/ath12k/hal_rx.h  |   3 +
>  drivers/net/wireless/ath/ath12k/hal_tx.h  |   7 +-
>  drivers/net/wireless/ath/ath12k/mac.c     | 141 +++++++++++++++++++++-
>  drivers/net/wireless/ath/ath12k/mac.h     |   4 +-
>  drivers/net/wireless/ath/ath12k/rx_desc.h |   3 +
>  drivers/net/wireless/ath/ath12k/wmi.c     | 130 ++++++++++++++++++++
>  drivers/net/wireless/ath/ath12k/wmi.h     |  49 +++++++-
>  11 files changed, 472 insertions(+), 10 deletions(-)
> 
> 
> base-commit: db1ce56e6e1d395dd42a3cd6332a871d9be59c45

FYI this series does not apply cleanly on top of:
4c1cf2d8e5dd ("wifi: ath12k: prepare sta data structure for MLO handling")

And I currently have that as my basis of work since it is high priority to be
merged since the MLO feature is dependent upon it.

Can you rebase against that series?

/jeff

