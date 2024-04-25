Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0B7C19F4E
	for <ath12k@archiver.kernel.org>; Thu, 25 Apr 2024 17:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=glA5mBnxDW3mPsmPjRsO5HXkPcBbEBpIEBumchDdjJU=; b=N5XkfWR1QQIzk9JaHnJKkvvJsF
	xpCSiEyuNTeBbJcmo4vtuK3ijPJGKfZqKBYUJWix4hKlxiZgoE/Lo+QJygptt+hIS0OPEOBk7ruPA
	PZqRmKRAtBPFADbpYbzcRd3Yj5h7pDL9w/QPt5mrjjpQNB+caROge8X7LbHx8HLWvWocYtOBGOs9S
	r16ivgYw39z0SWQmouZ6CPlNDBkaGWkbsNDOgCuPsDn2tVX+Q9nhzMyol6tt+CaG2mmIqgkyTKHNg
	/VUPhLrqGsAPu7l9jQ5I57h0BP0L6C5OChSQpL3M3zb2fuGXRpQ9nCSIKFagzRbhz/C7fH7OIQRn5
	L1H2UEwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s03B6-00000009cty-1evc
	for ath12k@archiver.kernel.org;
	Thu, 25 Apr 2024 17:46:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s03B3-00000009ctV-1QDf
	for ath12k@lists.infradead.org;
	Thu, 25 Apr 2024 17:46:34 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43P5fQC1017549;
	Thu, 25 Apr 2024 17:46:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=glA5mBnxDW3mPsmPjRsO5HXkPcBbEBpIEBumchDdjJU=; b=eG
	sfaDCki10LsLbcHA3kYrUecIBm8eS2adBDWd1TffwCI427Ecg0PGD4fMUBW6vCdj
	5kUJe21efs3QWoY8O1lgdgg7LiFU8aJhcY0SIo4Va1c2MHDra0jtoEdsHxhi5Wb9
	6TwuUjC6ZHUtUYcM1W9Pg//mN5cX50ZuHpTsYgDVHZoL2+PxzjC88X122X0JSrp6
	4NldxagUIydzi69I9mdJ80GEAmCSfVcTB4dU2PvV+TrkiHGSFvXZwv2sdmflBvLJ
	uZi2fn8IAmsP6HNs8oZpa0u1C6kpBTEdtgRhWfKHKhRacyo2gG+cX+FcDG298bRm
	3ZdS29Km9m1HSCV25GQg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xqenhuby8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 17:46:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43PHkVWZ027585
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 17:46:31 GMT
Received: from [10.110.61.159] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 25 Apr
 2024 10:46:31 -0700
Message-ID: <b1a18103-5663-4ff0-9a3a-498a2220e2c5@quicinc.com>
Date: Thu, 25 Apr 2024 10:46:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 3/6] wifi: ath12k: fix survey dump collection in 6 GHz
Content-Language: en-US
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240424191141.32549-1-quic_pradeepc@quicinc.com>
 <20240424191141.32549-4-quic_pradeepc@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240424191141.32549-4-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4hWd1J3aj1hkJX_s3H1q2EmI19r0sIEM
X-Proofpoint-GUID: 4hWd1J3aj1hkJX_s3H1q2EmI19r0sIEM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_17,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 mlxlogscore=811 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404250128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_104633_493057_B15C6571 
X-CRM114-Status: UNSURE (   6.39  )
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

On 4/24/2024 12:11 PM, Pradeep Kumar Chitrapu wrote:
> When ath12k receives survey request, choose the 6 GHz band
> when enabled. Without this, survey requests do not include
> any 6 GHz band results, leading to failures in auto channel
> selection.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>

again not propagated from v2
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


