Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AD7C25B78
	for <ath12k@archiver.kernel.org>; Tue, 14 May 2024 00:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0p+3L3wuKLgo0Zg9c+NoQ8x9UGkQvWYzBrSdRn4wVtw=; b=3n/YtQK7jCkEBX5mjeIdiRP04F
	aQ/odXthSNSkGp3apBYhB5MXb38PtmJEezGxNVfC9vmcfNquxM2T7CSnbYTbMQFflKXxWCrw6bGRs
	D8u5YHQfJHdQiKHqEfbHjDqc1hHtKDl1GX4TxmQlMsBOg+4h587/D7cT0QEI+LgmHvBu8Q2bCz2GB
	q2ZGHYQ2N3Tgewtcgi4jgQsobkHvuoSGutrbVuHYySTEEX44CXn1tnb4uWmMBD0irlqW0mY14B7jp
	JaxwZ97FwBQWJFt/d2OTt+Q7m5IMj2taomw137ihc1+28cMOWpN2/3S0K3KCGIQJ61S9g7GY80Gpm
	B54fbaGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6fcE-0000000EZH2-3ZsF
	for ath12k@archiver.kernel.org;
	Tue, 14 May 2024 00:01:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6fcB-0000000EZG8-3OB3
	for ath12k@lists.infradead.org;
	Tue, 14 May 2024 00:01:57 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44DJ8dj4028184;
	Tue, 14 May 2024 00:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=0p+3L3wuKLgo0Zg9c+NoQ8x9UGkQvWYzBrSdRn4wVtw=; b=fU
	0f6hobg1Dfu4SLH53UyR+WF2QNkQE7lt14sjVR2HldNFGtwPUCH3e529fnXLXqzM
	NiHVctjW5kPJws6fVDzfEK5l6GuAG0KGTOCEPhdbo7cnTri1Ql8gaHP9yTkcgrBo
	BsIdz8jDmkiqGx0xJU0awwWZZkzxAss6Aws8F10Yn1XHjltDh2NH659erJC5aB+p
	FsDYRlw37bdiHQk5V/YD5kh1Jy8gFbyB/+NOUiKmrpt4nk+M78aeJGwrlGvEzMYC
	rYWRN4g/QWN572uJTfJ1iUpSzDwtHEW9tFRQ7NdyNmeHTnmtCwwMhjMmE2UopCCc
	dHzVZasohTuxChG1ACgA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y1yp5cusx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 00:01:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44E01nhk028044
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 00:01:50 GMT
Received: from [10.110.0.4] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 May
 2024 17:01:49 -0700
Message-ID: <41dd47b4-a1cc-48f5-a91a-1d64150d8c98@quicinc.com>
Date: Mon, 13 May 2024 17:01:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix the issue that calculation of ack
 signal strength
Content-Language: en-US
To: Lingbo Kong <quic_lingbok@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240511030917.65811-1-quic_lingbok@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240511030917.65811-1-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: r-CuHeEwXgR3_csFCe2Yj6cDOOKU46OC
X-Proofpoint-ORIG-GUID: r-CuHeEwXgR3_csFCe2Yj6cDOOKU46OC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_17,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405130165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_170156_030387_0E89533A 
X-CRM114-Status: GOOD (  10.05  )
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

On 5/10/2024 8:09 PM, Lingbo Kong wrote:

Your subject doesn't quite make sense.

Perhaps something like: fix ack signal strength calculation

> Currently, the calculation of ack signal strength is incorrect.
> 
> This is because before calculating the ack signal strength, ath12k need
> to determine whether the hardware and firmware support db2dbm, if the

please split this run-on sentence, s/, if/. If/

> hardware and firmware support db2dbm, do not need to add noise floor,
> otherwise, need to add noise floor.
> 
> Besides, the value of ack_rssi passed by firmware to ath12k should be a
> signed number, so change its type to s8.
> 
> This patch affects QCN9274 and WCN7850 because they have the same issue.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>

Code LGTM & Kalle can fix my comments in pending so don't respin unless there
are additional comments.

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


