Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A024C3ABBE
	for <ath12k@archiver.kernel.org>; Tue,  6 May 2025 18:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pNSHOTQLjdwTA/W/nykcMJ8n05qI50/8o1zJqPAqh5k=; b=THeDsFeGghSf3VVERjeQiPaOoi
	h88l95K0iHzpSyOWnLRKkXXmshDXSV9Ja8BftEam0LTBbU7yHpcVJiPN6ds35/305uy92u4IODlLd
	DFIRdTnONsN813y73jfKXrGB9Z4IFgr1Q3/1tdqHRanNt/kIZLkwr4jWCAdvuArfMdIgg0Fbemz45
	/pTEsjiFYNPUInk8slhl4jYYRBlVaE4ZRiDOJ3Mj4MXx8hLQAIdc0ebVatfctv0LutV+YmHu5FzYk
	GKNX6DmSc39KjFBc7P50ArVtj5wjNqUkitHJHMccibDpkFkTNDhmuIypNjlYOriGVEXQ4gjSI2K4F
	csV3wMoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCNCs-0000000D8RW-0t9b;
	Tue, 06 May 2025 18:39:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCJcp-0000000COAo-0kLN
	for ath12k@lists.infradead.org;
	Tue, 06 May 2025 14:50:28 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54686vXb020658;
	Tue, 6 May 2025 14:50:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pNSHOTQLjdwTA/W/nykcMJ8n05qI50/8o1zJqPAqh5k=; b=XxjhvK+1t/dNUYSG
	fxum3DTrbBsPRuWJ6fuvOf1VAMV5EwmUGgl1O8xLeIQl6egACFdD/1Gx88AMo5UZ
	a6MwboRntWhfBgTlvczPHlE6iaCxsDEtJJu8Mw/z3B+v73ShX03C7Sq1v9KsYw9g
	xumX+lWH8UV+t4jhxnJqjYTG4HotHvsR56tFn1gs1v8UCv3VHnc82ElSNDixXAeA
	FztiqUqoPUsbBiPLArtcFUlPFDx40rrEsEn1nMjFdv6AZlpHeTFkJpUkWjdNojdn
	DoZrWL2vA9QJVnqM4sW02rjSUJzlgNRH2QPvIAJcWVg8/n+UY04YYxyRtDpKkhaV
	nw8QiQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbwfqv9v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 14:50:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 546EoPvw011112
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 May 2025 14:50:25 GMT
Received: from [10.216.13.49] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 6 May 2025
 07:50:23 -0700
Message-ID: <2006c77c-8e29-61f4-c988-cfbc921adc02@quicinc.com>
Date: Tue, 6 May 2025 20:20:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v2] wifi: ath12k: combine channel list for
 split-phy devices in single-wiphy
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250506105624.466019-1-rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <20250506105624.466019-1-rameshkumar.sundaram@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: g_7cq_Kiq6pgFu6fhj8NChS4TzblTFI6
X-Proofpoint-GUID: g_7cq_Kiq6pgFu6fhj8NChS4TzblTFI6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDE0MyBTYWx0ZWRfX5JFchGmpyO6p
 xmzBf2SJeoVcAp098ByPyN2FBuG2Q1WrpaRvP0QIbJNlgGcPn4Nvj12H6u8R10y7uSBePtO2LXJ
 FiaeFVFETqTtfVTW47XxrTz/gPTee7AYgu/vs/KBma8Pk5/eXcd9GXUSU1bIirrpnoolTaGuW2+
 z8+BRLdlnS6sYIoNuTgQCXCZnXP0f0YVMkBOyuLNNgSqnuy+os5ru2Q1Rg5OxuCfoi4aX/k7mMU
 DVNK1nWkrRuGG0bQ3eRAaLfhf+5fkUKjq/5jgk+n5R0vyBrMk08SDGo+fmcyZ+Eh8gpWeBeTfnL
 bOcZBJvaWAyy2fC164ey+Rmh775ZdB9ZyE2BkMWvIJROjP5D+Zw2xZIvUasaytCJ3BhdXuknhed
 5E+a95PUdDqRv8CQjqpjZFHwQEW4J9cL0VYFJw9ZYUY/bhaE8l31TggVnCVRh6z31WKMxYjE
X-Authority-Analysis: v=2.4 cv=AfqxH2XG c=1 sm=1 tr=0 ts=681a21b2 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8
 a=2LzJI_1lXDcI7TO63KoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=835
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_075027_241892_57A10439 
X-CRM114-Status: GOOD (  12.26  )
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



On 5/6/2025 4:26 PM, Rameshkumar Sundaram wrote:
> When two split-phy devices that support overlapping frequency ranges within
> the same band are grouped into an ath12k hardware (HW) setup, they share a
> common wiphy instance. Consequently, the channel list (wiphy->bands[])
> becomes unified across all associated radios (ar).
> 
> For reference, the devices are:
> 2.4 GHz + 5 GHz Low Band
> 5 GHz High Band + 6 GHz
> 
> The first radio probed within the 5 GHz range (say 5 GHz Low Band) updates
> its sband reference (&ar->mac.sbands[NL80211_BAND_5GHZ]) within
> wiphy->bands[]. However, when the second 5 GHz radio (5 GHz High Band) is
> probed, it replaces the existing wiphy->bands[] entry with its own sub-band
> reference. As a result, wiphy->bands[] always reflects the channel list
> from the most recently probed radio in that band, restricting supported
> channels to those within its specific range for upper-layer.
> 
> Fix this by updating the wiphy->bands[] to just enable the channels of
> current radio when there exist a radio which already has set it.
> This will make sure wiphy->bands[] holds reference of first radio which
> got probed in 5 GHz band and subsequent radio just updates the channel list
> in the same address space.
> 
> Since same sband memory space is shared between radios of a band, while
> determining the allowed frequency range of radio, its frequency limits
> (ar->freq_range.start_freq, end_freq) should be used.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

