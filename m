Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290E6C3DA4A
	for <ath12k@archiver.kernel.org>; Fri,  2 Aug 2024 14:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BZBI2HUmMwEuCy9Fw+NCi5mEDYXwZxhcquXiWYycqUM=; b=DIslkgweDXul0w/2RKdaoolHV1
	12ODMHTcet8S+xA3yahGxP/sA21AlYcZ7DNe4YEpDqgQVx2HyvlKtld3Egzpq2EKCJbDxseQHAiA8
	tNWcJHWCp5CxUXzY6IXfCuFzDDIBch3TpVjxGUnfqCXsqaNj+sYaERSygmYk3dwE4xyZstu9VhGW3
	aq2AMECZmTerQLqP15Fc3KFe+fVQtn4Z7YGDEVjaKMeB6iyrP5c6KxgIzYtJkk+P8Ey4NnXVSflEz
	GSo5WMejZr2iTz4xYS6LDOOQvGTLkvR40yE5mQApqxYcrZS8dEylC533XqWUq2/SBjxhzuQLypdDF
	e1GKRLtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZtTG-000000097TC-3cQz
	for ath12k@archiver.kernel.org;
	Fri, 02 Aug 2024 14:41:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZtTE-000000097SL-0O3D
	for ath12k@lists.infradead.org;
	Fri, 02 Aug 2024 14:41:29 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4723vXZn025235;
	Fri, 2 Aug 2024 14:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BZBI2HUmMwEuCy9Fw+NCi5mEDYXwZxhcquXiWYycqUM=; b=ZbFAe87WZhML/rM+
	tdzpGiTJkCMuB5ru4Gv8gsVvi7GVajUtLBG7AjOfpyjIRCouij7QLdCRlYguEFcr
	SXtLxV8EV6H48SWcVbvNMhr66hjEcfFGUwOskcGJq6qXAKWEBYpsjESAA9hOzclK
	r3bCrCMesu7oj+C1RDcgE3j8a+8GS1KIv8mv4+ZsaTshE7A/8NNiXnQxMe1QyIdN
	8I3bUljKcW/3i9iW3HXiBk68btmrikkh4s3f14A1HU0myOaoXkX56W66EQLu4gqK
	pco1224/DJErEZ1W0sJdxOCEaS0Zo0WYR8rsQ8B+dARlfPcpr+SAowlHFhszZrWy
	dB5ouA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40rje31w30-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Aug 2024 14:41:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 472EfRpm022632
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 2 Aug 2024 14:41:27 GMT
Received: from [10.111.177.74] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 2 Aug 2024
 07:41:26 -0700
Message-ID: <02612131-8172-49eb-ab07-fdcaa4d05e40@quicinc.com>
Date: Fri, 2 Aug 2024 07:41:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] wifi: ath12k: report station mode receive rate for
 IEEE 802.11be
Content-Language: en-US
To: Lingbo Kong <quic_lingbok@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240801112853.85508-1-quic_lingbok@quicinc.com>
 <20240801112853.85508-3-quic_lingbok@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240801112853.85508-3-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DzK6tT-R6WLo4A-Qa-4dmwx2Z665be-I
X-Proofpoint-ORIG-GUID: DzK6tT-R6WLo4A-Qa-4dmwx2Z665be-I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-02_10,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=976
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408020101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_074128_170222_70853044 
X-CRM114-Status: UNSURE (   9.31  )
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

On 8/1/2024 4:28 AM, Lingbo Kong wrote:
> Currently, the receive rate of EHT of "iw dev xxx station dump" command
> always show an invalid value.
> 
> This is because ath12k does not pass information about the rx_status of EHT
> to mac80211. So, mac80211 not calculate the receive rate.
> 
> To address this issue, add logic for handling rx_status of EHT to the
> ath12k_dp_rx_h_rate() function.
> 
> After that, "iw dev xxx station dump" show the correct receive rate.
> Such as:
> 
> Station 00:03:7f:12:03:03 (on wlo1)
>         inactive time:  48 ms
>         rx bytes:       59226
>         rx packets:     320
>         tx bytes:       26556
>         tx packets:     191
>         tx retries:     99
>         tx failed:      0
>         beacon loss:    0
>         beacon rx:      79
>         rx drop misc:   68
>         signal:         -95 dBm
>         beacon signal avg:      -20 dBm
>         tx bitrate:     688.2 MBit/s 40MHz EHT-MCS 13 EHT-NSS 2 EHT-GI 0
>         tx duration:    0 us
>         rx bitrate:     619.5 MBit/s 40MHz EHT-MCS 8 EHT-NSS 3 EHT-GI 0
> 
> This patch affects the station mode of WCN7850 and QCN9274.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.2.1-00201-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



