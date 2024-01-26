Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 462CCC47258
	for <ath12k@archiver.kernel.org>; Fri, 26 Jan 2024 00:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Xv+o0s5fOAuXamrRBja4CjRuHhxmpvitV9OXxVdR1g=; b=jp8YXfcHfr7ZSK7B3g2ann2ppJ
	W2I9mLXWk63xbkGZoRYOa8EuzoFl4UiynRoyCXCTGt52AmmywNuMBG+qr4e4PTFtmAcLM8AykowYy
	Uub0rhs+xG6cvrPsoVvPaAoVPPgBnhn2wiR8x0P/aaLs0X3XnPhNjBoXAUBVh3oSgCA9mcrk/Icf4
	tRZ80r7heXXR1WBS366Wx1qvPqcrkeQ1IxNDAXXjgilBajC1sPrFYGq2b8wCER2kviNqCEQTWGIit
	aQLuYZEFOfELYYpUNg51wWZS5Oz4MYLoYM/pGuwy09fzFrDB3g4PDcO12ebNsHsUdPUxYghbwJg8V
	R9LaPNGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTAZ8-00000002gHW-4BR8
	for ath12k@archiver.kernel.org;
	Fri, 26 Jan 2024 00:59:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTAZ6-00000002gH1-0t0k
	for ath12k@lists.infradead.org;
	Fri, 26 Jan 2024 00:59:29 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40Q0eIpr023251;
	Fri, 26 Jan 2024 00:59:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=8Xv+o0s5fOAuXamrRBja4CjRuHhxmpvitV9OXxVdR1g=; b=Xw
	Io/eUv7eTY118RTJtZMH/i0KdobxviLpSJVKrwzRQ01DTNHsQheBbywNDBpJw9FT
	WUYJkfs8ll4wSo4INGRi7UpNvFlsMJJTZt2vTTxD9dtt3LuFQ2NOhM/g79SOAmj5
	VxxFUp6c74ABzcYia8kDcqAfJbmnXqpvdTdrQLNlWN81x8fwygIgdq4vlt6LzRhP
	27C0DNGFWi4VYkpxGRKxRSW50S+IcH3XkG6lv56lSYkyoG5r78uWAjFEL9nT5XyH
	lMdqFLb3TQZku1Wa+Up2L2Lmi0mEySX+1dIeJ9ieD8qxPJ8h5ZstfohOzLNzi+Hz
	UCCOyOmO17H32GiCn4tw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vuqra1nd7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 00:59:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40Q0xO6L032227
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 00:59:24 GMT
Received: from [10.110.0.209] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 25 Jan
 2024 16:59:23 -0800
Message-ID: <28a76ce7-7950-47b3-a5f2-292c353ae548@quicinc.com>
Date: Thu, 25 Jan 2024 16:59:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: refactor the rfkill worker
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240125154555.3169706-1-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240125154555.3169706-1-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 34tn6Zozpzhb3oo7q3-h5kX4Fdsx_Qtr
X-Proofpoint-ORIG-GUID: 34tn6Zozpzhb3oo7q3-h5kX4Fdsx_Qtr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxlogscore=528 phishscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 malwarescore=0 mlxscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401260006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_165928_312994_B64A2868 
X-CRM114-Status: UNSURE (   7.00  )
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

On 1/25/2024 7:45 AM, Karthikeyan Periyasamy wrote:
> Currently, the rfkill worker handler access mac80211 HW from the radio/link
> structure. This is will be incorrect for single wiphy model, as they will
> hold multiple link/radio structures. To fix this, access mac80211 HW based
> on the number of hardware in the SoC/chip. This approach makes the rfkill
> worker handler compatible with both multi wiphy and single wiphy models.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


