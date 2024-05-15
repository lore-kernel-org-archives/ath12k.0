Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C52C25B78
	for <ath12k@archiver.kernel.org>; Wed, 15 May 2024 22:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J8SPinwZZR3nZ+KHLyX3CJD5HrH9koLN+T4VCyaaH7w=; b=OG1tmGlDaIZbKRKqYLc1vF81cD
	YwgEfu4TqCXFNfScwiA7T9fOMhWRcGuWpzg/vJUBQbbQ2r1IYZn/jOhqFbjRrDF3cDASi/t06/12m
	1sdYzVQpOwp2GC8JnLE5JNda5eqU2ki3YBVjU953ZY0t/A7TKy2quTz9qgtyvLeD14tj339K5cAOb
	8qbwx7YLd5LcT57Yv+StRRSKLynOJB8/IzPio7bLoUh/gNZjtPdYzTtRB3MTAXzyEgzOFNOdTjtjk
	2cdF3VMxNzK1iAzXPPi6ycykSle+HH3czcx2OTTxt/wXuIXiJONorWNPSCBJGKWSDQFhHQuBqLLG+
	bMiQd4xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7NJz-000000034RW-3P1y
	for ath12k@archiver.kernel.org;
	Wed, 15 May 2024 22:42:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7NJv-000000034Qm-3922
	for ath12k@lists.infradead.org;
	Wed, 15 May 2024 22:42:02 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44FJCg9t027381;
	Wed, 15 May 2024 22:41:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=J8SPinwZZR3nZ+KHLyX3CJD5HrH9koLN+T4VCyaaH7w=; b=RD
	uE6weqWxzTdwLj79QPvSV+T6jTV1wqV3y6tSFK7qaOlQzhG/bOZQl+9TzBFvzsN7
	NDdzyTs3wM41o30e6nr/5Jy/6vq5riPE2IhZr2kC6aYhaE7g+WaCxPuei3XYhCrs
	zGbaIUrwkMM9X3Dwrgv7XWBHnry3IiVrwQPIPT2mx5pcbBHrw3bmykTAWNwZiURz
	0e+fBQqJ7zfD5l1BW3NcSB9VMAI2i+u7Yy/HDsspGK+deK5LSi56Np/QQM2M3s8m
	/8h4dkrIG7yAXw3iKORZqihvDbJD1qctDF0IQ2JPLLq3YPON/TnIunSpEfLaMQ2v
	XaJdTnyxN7R8Ehr01iJQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y42kvvryk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 22:41:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44FMfsfm027406
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 22:41:54 GMT
Received: from [10.110.0.4] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 15 May
 2024 15:41:53 -0700
Message-ID: <71285d54-4685-436e-98e3-e8c2bd7b8b0f@quicinc.com>
Date: Wed, 15 May 2024 15:41:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: Add Dynamic VLAN support
Content-Language: en-US
To: Muna Sinada <quic_msinada@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240515192830.995013-1-quic_msinada@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240515192830.995013-1-quic_msinada@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qi_nxVfgmEt5mt53Kj7xNHYo3FsNmfS9
X-Proofpoint-ORIG-GUID: qi_nxVfgmEt5mt53Kj7xNHYo3FsNmfS9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-15_14,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 mlxlogscore=831 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405150161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_154159_970552_A01BD054 
X-CRM114-Status: UNSURE (   9.15  )
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

On 5/15/2024 12:28 PM, Muna Sinada wrote:
> Add support for dynamic VLAN. VLAN group traffic is encapsulated and
> encrypted in mac80211 and driver needs to set flags for the VLAN group
> traffic to skip hardware encapsulation and encryption.
> 
> VLAN group traffic utilizes ext MSDU and HTT Metadata to set
> encapsulation type to RAW and encryption type to OPEN in order to
> inform firmware to skip hardware encapsulation and encryption.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Muna Sinada <quic_msinada@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

(you should have carried this forward yourself from v1)


